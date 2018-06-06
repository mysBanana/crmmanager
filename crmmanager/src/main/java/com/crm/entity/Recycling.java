package com.crm.entity;

import com.crm.annotation.ExcelField;
import com.crm.annotation.PrimaryField;
import com.crm.config.CustomDateSerializer;
import com.crm.enums.PrimaryKeyEnum;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.sql.Timestamp;

public class Recycling {
    @ExcelField(value = "标识",showDisplay = true)
    @PrimaryField(identification = PrimaryKeyEnum.uuid)
    private String recylingId;
    @ExcelField("对应删除表名称")
    private String deleteTable;
    @ExcelField("对应删除表id")
    private String deleteId;
    @ExcelField("创建时间")
    @JsonSerialize(using=CustomDateSerializer.class)
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp createTime;
    private String string0;
    private String string1;

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

    public String getRecylingId() {
        return recylingId;
    }

    public void setRecylingId(String recylingId) {
        this.recylingId = recylingId;
    }

    public String getDeleteTable() {
        return deleteTable;
    }

    public void setDeleteTable(String deleteTable) {
        this.deleteTable = deleteTable;
    }

    public String getDeleteId() {
        return deleteId;
    }

    public void setDeleteId(String deleteId) {
        this.deleteId = deleteId;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}
