package com.crm.entity;

import com.crm.annotation.ExcelField;
import com.crm.config.CustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.sql.Timestamp;

public class LogginPermission {
    @ExcelField(value = "标识",showDisplay = true)
    private String id;
    @ExcelField(value = "用户id",showDisplay = true)
    private String userid;
    @ExcelField(value = "内容")
    private String comment;
    @ExcelField(value = "创建时间")
    @JsonSerialize(using=CustomDateSerializer.class)
    private Timestamp createTime;
    @ExcelField(value = "是否成功")
    private String isSuccess;
    @ExcelField(value = "备注")
    private String string0;
    @ExcelField(value = "操作人")
    private String string1;
    public String getIsSuccess() {
        return isSuccess;
    }

    public void setIsSuccess(String isSuccess) {
        this.isSuccess = isSuccess;
    }

    public String getString0() {
        return string0;
    }

    public void setString0(String string0) {
        this.string0 = string0;
    }

    public String getString1() {
        return string1;
    }

    public void setString1(String string1) {
        this.string1 = string1;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}
