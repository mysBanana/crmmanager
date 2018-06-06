package com.crm.util;


import com.crm.annotation.ExcelField;
import com.crm.annotation.PrimaryField;
import com.crm.entity.Users;
import com.crm.enums.PrimaryKeyEnum;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;


import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedArrayType;
import java.lang.reflect.Field;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import static com.crm.enums.PrimaryKeyEnum.autoIncrease;
import static com.crm.enums.PrimaryKeyEnum.uuid;

@Repository
public class ExcelUtil {
    @Autowired
    private  JdbcTemplate jdbcTemplate;
    /**
     * 导出表格
     * @param response 响应流
     * @param fileName 文件名称
     * @param list 数据集合
     * @throws IOException
     * @throws IllegalAccessException
     */
    public static void exportExcel(HttpServletResponse response, String fileName, List list) throws IOException, IllegalAccessException {
        response.setContentType(".xlsx,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.addHeader("Content-Disposition", "attachment;filename="+new String(fileName.getBytes(),"iso-8859-1"));
        XSSFWorkbook workbook=new XSSFWorkbook();
        XSSFSheet sheet=workbook.createSheet(fileName);
        if(list==null||list.size()==0){
            XSSFFont font = workbook.createFont();
            font.setFontHeightInPoints((short) 30);
            font.setFontName("IMPACT");
            font.setItalic(true);
            font.setColor(HSSFColor.RED.index);
            XSSFCellStyle style = workbook.createCellStyle();
            style.setFont(font);
            style.setAlignment(XSSFCellStyle.VERTICAL_CENTER);
            style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
            sheet.addMergedRegion(new CellRangeAddress(0,5,0,5));//合并单元格
            XSSFRow  row=sheet.createRow(0);
            XSSFCell cell = row.createCell(0);
            cell.setCellValue("暂无数据");
            cell.setCellStyle(style);
        }else{
            XSSFRow  rowTop=sheet.createRow(0);
            for (int i=0;i<list.size();i++) {
                Object o=list.get(i);
                Class clazz=o.getClass();
                Field[] fields=clazz.getDeclaredFields();
                    XSSFRow row=sheet.createRow(i+1);
                int k=-1;
                    for (int j=0;j<fields.length;j++) {
                        Field f=fields[j];
                        k++;
                        f.setAccessible(true);
                        ExcelField annField=f.getDeclaredAnnotation(ExcelField.class);
                        if(annField!=null&&annField.showDisplay()==true){
                            k-=1;
                            continue;
                        }
                        if(i==0){
                            String fieldName="";
                            if(annField==null)
                              fieldName=f.getName();
                             else
                                 fieldName=annField.value();
                             sheet.setColumnWidth(k,fieldName.getBytes().length*2*256);//自适应宽度
                             XSSFCell cell=rowTop.createCell(k);
                             cell.setCellValue(fieldName);
                        }
                        Object fieldValue=f.get(o);
                        String fieldName=fieldValue!=null?fieldValue.toString():"";
                        XSSFCell cell=row.createCell(k);
                        cell.setCellValue(fieldName);
                    }



            }
        }
        ServletOutputStream outputStream=response.getOutputStream();
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }

    /**
     * 表格批量导入
     * @param tableName 表名
     * @param clazz    对应的类对象
     * @param inputStream  输入流对象
     * @param extend 扩展新增的列名和值
     */
    @Transactional(rollbackFor = Exception.class)
    public  Result importExcel(String tableName,Class clazz,InputStream inputStream,LinkedHashMap extend) throws IOException {
        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
        XSSFSheet sheet = workbook.getSheetAt(0);
        XSSFRow row;
        String cell;
        List<Field> fields= Arrays.asList(clazz.getDeclaredFields());

        List<String> fieldNames=new ArrayList<>();
        row = sheet.getRow(0);
        for (int j = row.getFirstCellNum(); j < row.getPhysicalNumberOfCells(); j++) {
            cell = row.getCell(j).toString();
            for (Field f:fields) {
                f.setAccessible(true);
                if(f.getName().equals(cell)){
                    fieldNames.add(f.getName());
                    break;
                }
                ExcelField excelField=f.getDeclaredAnnotation(ExcelField.class);
                if(excelField!=null && excelField.value().equals(cell)){
                    fieldNames.add(f.getName());
                    break;
                }
            }
        }
        if(fieldNames.size()==0){
            return new Result(false,"没有找到匹配字段");
        }

        PrimaryKeyEnum primaryType=null;
        for (Field f:fields) {
            PrimaryField primaryField=f.getDeclaredAnnotation(PrimaryField.class);
            if(primaryField!=null){
                primaryType=primaryField.identification();//主键类型
                if(primaryType==uuid)
                fieldNames.add(0,f.getName());//主键名称
                break;
            }
        }

        if(extend!=null){
                for (Object key : extend.keySet()) {
                    fieldNames.add((String) key);
                }
        }

        String sql="insert into `"+tableName+"`(";
        for (String fieldName:fieldNames) {
            sql+=fieldName+",";
        }
        sql=sql.substring(0,sql.length()-1)+") values(";
        for (String fieldName:fieldNames) {
            sql+="?,";
        }
        sql=sql.substring(0,sql.length()-1)+")";
        List<Object[]> paramsArr=new ArrayList();//参数集合
        row=sheet.getRow(1);
        for (int i = sheet.getFirstRowNum()+1; i < sheet.getPhysicalNumberOfRows(); i++) {
            row = sheet.getRow(i);
            Object[] par=null;
            boolean isAuto=true;//是自增
            if(primaryType!=null && primaryType==uuid){
                par=new Object[row.getPhysicalNumberOfCells()+1];
                par[0]= UUID.randomUUID().toString();
                isAuto=false;
            }else{
                par=new Object[row.getPhysicalNumberOfCells()];
            }
            for (int j = row.getFirstCellNum(); j < row.getPhysicalNumberOfCells(); j++) {
               int k=j;
               if(!isAuto)
                   k=j+1;
                XSSFCell xssfCell=row.getCell(j);

                if(xssfCell==null) {
                    par[k]=null;
                    continue;
                }
                cell = xssfCell.toString();
                if(cell.equals("")){
                    par[k]=null ;
                }
                else{
                    String result=parseExcel(xssfCell);
                    par[k]=result;

                }

            }
            if(extend!=null){
                List parList=Arrays.asList(par);
                List arrList = new ArrayList(parList);
                for(Object value:extend.values()){
                    arrList.add(value);
                }
                par=arrList.toArray();
            }
            int passwordIndex=fieldNames.indexOf("password");
            if(passwordIndex>=0){
                int nameIndex=fieldNames.indexOf("loginName");
                PasswordEncoder encoderMd5 = new PasswordEncoder(par[nameIndex], "MD5");
                par[passwordIndex]=encoderMd5.encode(par[passwordIndex].toString());
            }
            paramsArr.add(par);
        }
        try {
            jdbcTemplate.batchUpdate(sql,paramsArr);
            return new Result(true);
        }catch (Exception exception){
            exception.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return new Result(false,exception.getMessage());
        }

    }

    /**
     * 日期转换
     * @param cell
     * @return
     */
    private String parseExcel(Cell cell) {
        String result = new String();
        switch (cell.getCellType()) {
            case HSSFCell.CELL_TYPE_NUMERIC:// 数字类型
                if (HSSFDateUtil.isCellDateFormatted(cell)) {// 处理日期格式、时间格式
                    SimpleDateFormat sdf = null;
                    if (cell.getCellStyle().getDataFormat() == HSSFDataFormat
                            .getBuiltinFormat("h:mm")) {
                        sdf = new SimpleDateFormat("HH:mm");
                    } else {// 日期
                        sdf = new SimpleDateFormat("yyyy-MM-dd");
                    }
                    Date date = cell.getDateCellValue();
                    result = sdf.format(date);
                } else if (cell.getCellStyle().getDataFormat() == 58) {
                    // 处理自定义日期格式：m月d日(通过判断单元格的格式id解决，id的值是58)
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    double value = cell.getNumericCellValue();
                    Date date = org.apache.poi.ss.usermodel.DateUtil
                            .getJavaDate(value);
                    result = sdf.format(date);
                } else {
                    double value = cell.getNumericCellValue();
                    CellStyle style = cell.getCellStyle();
                    DecimalFormat format = new DecimalFormat();
                    String temp = style.getDataFormatString();
                    // 单元格设置成常规
                    if (temp.equals("General")) {
                        format.applyPattern("#");
                    }
                    result = format.format(value);
                }
                break;
            case HSSFCell.CELL_TYPE_STRING:// String类型
                result = cell.getRichStringCellValue().toString();
                break;
            case HSSFCell.CELL_TYPE_BLANK:
                result = "";
            default:
                result = "";
                break;
        }
        return result;
    }
    /**
     * 模板导出
     * @param response  响应流
     * @param fileName  导出文件名称
     * @param fields    需要导出的所有字段名称
     */
    public static void TemplateExprot(HttpServletResponse response,String fileName,List<String> fields) throws IOException {
        response.setContentType(".xlsx,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.addHeader("Content-Disposition", "attachment;filename="+new String(fileName.getBytes(),"iso-8859-1"));
        XSSFWorkbook workbook=new XSSFWorkbook();
        XSSFSheet sheet=workbook.createSheet(fileName);
        XSSFRow row=sheet.createRow(0);
        for (int i=0;i<fields.size();i++) {
            XSSFCell cell=row.createCell(i);
            cell.setCellValue(fields.get(i));
        }
        ServletOutputStream outputStream=response.getOutputStream();
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }
    public static void main(String[] args) throws IOException {
        String filePath="C:\\Users\\80795289\\Desktop\\用户.xlsx";
        InputStream is = new FileInputStream(filePath);
        XSSFWorkbook xwb = new XSSFWorkbook(is);
       // ExcelUtil.importExcel("a", Users.class,xwb);

    }

}
