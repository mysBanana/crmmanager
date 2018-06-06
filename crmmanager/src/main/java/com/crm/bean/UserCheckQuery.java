package com.crm.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

/**
 * 用户签到查询实体类
 */
public class UserCheckQuery {
    private String userName;//用户名称
    private String checkState;//签到状态
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp checkInTimeBegin;//签到开始时间
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp checkInTimeEnd;//签到结束时间
    private int page,offsex,rows;//页数,偏移量,条数

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

    @Override
    public String toString() {
        return "UserCheckQuery{" +
                "userName='" + userName + '\'' +
                ", checkState='" + checkState + '\'' +
                ", checkInTimeBegin=" + checkInTimeBegin +
                ", checkInTimeEnd=" + checkInTimeEnd +
                '}';
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCheckState() {
        return checkState;
    }

    public void setCheckState(String checkState) {
        this.checkState = checkState;
    }

    public Timestamp getCheckInTimeBegin() {
        return checkInTimeBegin;
    }

    public void setCheckInTimeBegin(Timestamp checkInTimeBegin) {
        this.checkInTimeBegin = checkInTimeBegin;
    }

    public Timestamp getCheckInTimeEnd() {
        return checkInTimeEnd;
    }

    public void setCheckInTimeEnd(Timestamp checkInTimeEnd) {
        this.checkInTimeEnd = checkInTimeEnd;
    }
}
