package com.crm.annotation;

import com.crm.enums.PrimaryKeyEnum;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 标识主键
 */
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface PrimaryField {
    PrimaryKeyEnum identification();//主键类型
}
