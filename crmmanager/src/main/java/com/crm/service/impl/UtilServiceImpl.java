package com.crm.service.impl;

import com.crm.annotation.ExcelField;
import com.crm.annotation.PrimaryField;
import com.crm.service.UtilService;
import com.crm.util.ExcelUtil;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.*;

@Service
public class UtilServiceImpl implements UtilService {
    @Autowired
    private ExcelUtil excelUtil;

    @Override
    public Result impoertExcel(String tableName, Class clazz, MultipartFile multipartFile,LinkedHashMap extend) throws IOException {
        if(!multipartFile.getContentType().equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")){
            return new Result(false,"必须为.xlsx类型");
        }
        return excelUtil.importExcel(tableName,clazz,multipartFile.getInputStream(),extend);
    }

    @Override
    public List<Map> CheckBoxClassMapper(Class clazz) {
        List<Map> mapList=new ArrayList<>();
        Field[] fields=clazz.getDeclaredFields();
        for (Field f : fields) {
            f.setAccessible(true);
            PrimaryField primaryField=f.getDeclaredAnnotation(PrimaryField.class);
            if(primaryField!=null){//主键跳过
                continue;
            }

            Map map=new HashMap();
            ExcelField excelField=f.getDeclaredAnnotation(ExcelField.class);
            map.put("label",f.getName());
            map.put("noNull",false);
            if(excelField==null){
                map.put("name",f.getName());
            }
            else{
                if(excelField.templaletDisplay()==true){//如果隐藏跳过
                    continue;
                }
                map.put("name",excelField.value());
                map.put("noNull",excelField.notNull());
            }
            mapList.add(map);
        }
        return mapList;
    }
}
