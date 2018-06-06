package com.crm.service;

import com.crm.util.Result;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public interface UtilService {
    /**
     * 批量导入excel表格
     * @param tableName 表明
     * @param clazz class
     * @param multipartFile 文件
     * @return  传值实体类
     */
    Result impoertExcel(String tableName,Class clazz, MultipartFile multipartFile,LinkedHashMap extend) throws IOException;

    /**
     * 下载模板时候选择所有属性
     * @param clazz class对象
     * @return  map集合  (label:字段名,name:字段名称)
     */
    List<Map>  CheckBoxClassMapper(Class clazz);
}
