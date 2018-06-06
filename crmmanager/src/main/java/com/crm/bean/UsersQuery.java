package com.crm.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

/**
 * 用户查询实体类
 */
public class UsersQuery {
    private String userName; //用户姓名
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private java.sql.Timestamp beginCreateTime; //用户创建开始时间
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private java.sql.Timestamp endCreateTime; //用户开始结束时间
    private String isLockout;  //用户是否锁定
    private String order;   //排序字段
    private String protectEMail;//用户邮箱
    private String protectMTel; //用户手机号
    private int page,rows,offsex;//第几页 条数  偏移量

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
        if(this.rows!=0)
            this.offsex=(page-1)*rows;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
        if(this.page!=0)
            this.offsex=(page-1)*rows;
    }

    public String getProtectEMail() {
        return protectEMail;
    }

    public void setProtectEMail(String protectEMail) {
        this.protectEMail = protectEMail;
    }

    public String getProtectMTel() {
        return protectMTel;
    }

    public void setProtectMTel(String protectMTel) {
        this.protectMTel = protectMTel;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Timestamp getBeginCreateTime() {
        return beginCreateTime;
    }

    public void setBeginCreateTime(Timestamp beginCreateTime) {
        this.beginCreateTime = beginCreateTime;
    }

    public Timestamp getEndCreateTime() {
        return endCreateTime;
    }

    public void setEndCreateTime(Timestamp endCreateTime) {
        this.endCreateTime = endCreateTime;
    }

    public String getIsLockout() {
        return isLockout;
    }

    public void setIsLockout(String isLockout) {
        this.isLockout = isLockout;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public UsersQuery(String userName, Timestamp beginCreateTime, Timestamp endCreateTime, String isLockout, String order) {
        this.userName = userName;
        this.beginCreateTime = beginCreateTime;
        this.endCreateTime = endCreateTime;
        this.isLockout = isLockout;
        this.order = order;
    }

    public UsersQuery() {
    }

    @Override
    public String toString() {
        return "UsersQuery{" +
                "userName='" + userName + '\'' +
                ", beginCreateTime=" + beginCreateTime +
                ", endCreateTime=" + endCreateTime +
                ", isLockout=" + isLockout +
                ", order='" + order + '\'' +
                ", protectEMail='" + protectEMail + '\'' +
                ", protectMTel='" + protectMTel + '\'' +
                '}';
    }

    public UsersQuery(String userName) {
        this.userName = userName;
    }
}
