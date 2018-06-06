package com.crm.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

public class RecyclingQuery {
    private String tableName;//表名
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp createTimeStart; //创建时间开始
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp createTimeEnd;//创建时间结束
    private int page,offsex,rows;//页数 偏移量 条数

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
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
}
