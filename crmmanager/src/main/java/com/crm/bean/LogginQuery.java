package com.crm.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

public class LogginQuery {
    private String name;
    private String comment;
    private String isSuccess;
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp createTimeStart;
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp createTimeEnd;
    private int page,offsex,rows; //页数 //偏移量 //条数

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
        if(rows!=0)
            offsex=(page-1)*rows;
    }

    public int getOffsex() {
        return offsex;
    }

    public void setOffsex(int offsex) {
        this.offsex = offsex;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
        if(page!=0)
            offsex=(page-1)*rows;
    }

    public String getIsSuccess() {
        return isSuccess;
    }

    public void setIsSuccess(String isSuccess) {
        this.isSuccess = isSuccess;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreateTimeStart() {
        return createTimeStart;
    }

    public void setCreateTimeStart(Timestamp createTimeStart) {
        this.createTimeStart = createTimeStart;
    }

    public Timestamp getCreateTimeEnd() {
        return createTimeEnd;
    }

    public void setCreateTimeEnd(Timestamp createTimeEnd) {
        this.createTimeEnd = createTimeEnd;
    }

    @Override
    public String toString() {
        return "LogginQuery{" +
                "name='" + name + '\'' +
                ", comment='" + comment + '\'' +
                ", isSuccess='" + isSuccess + '\'' +
                ", createTimeStart='" + createTimeStart + '\'' +
                ", createTimeEnd='" + createTimeEnd + '\'' +
                ", page=" + page +
                ", offsex=" + offsex +
                ", rows=" + rows +
                '}';
    }
}
