package com.crm.annotation;

/**
 * 过滤已经进入回收站的数据
 */
public @interface FifterMethodRecycling {
    String tableName() default "";//对应表名
    String columnIdEntity() default "";//返回的实体类id
    String columnId() default "";//对应主键列名
}
