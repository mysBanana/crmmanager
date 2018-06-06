package com.crm.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

/**
 * 学生查询类
 */
public class StudentQuery {
    private String name;//学生姓名
    private String phone;//学生电话
    private String netPusherId;//网络咨询id
    private String askerId;//咨询师id
    private String isPay;//是否付钱
    private String isValid;//是否有效
    private String isReturnVist;//是否回访
    private String qq; //学生qq

    public String getNetPusherId() {
        return netPusherId;
    }

    public void setNetPusherId(String netPusherId) {
        this.netPusherId = netPusherId;
    }

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp createStart;//创建开始时间

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp createEnd;//创建结束时间

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp homeStart;//上门开始时间

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp homeEnd;//上门结束时间

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp returnVistStart;//回访开始时间

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp returnVistEnd;//回访结束时间

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp payStart;//付钱开始时间

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp payEnd;//付钱结束时间

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp inClassStart;//进班开始时间

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp inClassEnd;//进班结束时间

    private int page,offsex,rows;//页数,偏移量和查询条数

    @Override
    public String toString() {
        return "StudentQuery{" +
                "name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", askerId='" + askerId + '\'' +
                ", isPay='" + isPay + '\'' +
                ", isValid='" + isValid + '\'' +
                ", isReturnVist='" + isReturnVist + '\'' +
                ", qq='" + qq + '\'' +
                ", createStart=" + createStart +
                ", createEnd=" + createEnd +
                ", homeStart=" + homeStart +
                ", homeEnd=" + homeEnd +
                ", returnVistStart=" + returnVistStart +
                ", returnVistEnd=" + returnVistEnd +
                ", payStart=" + payStart +
                ", payEnd=" + payEnd +
                ", inClassStart=" + inClassStart +
                ", inClassEnd=" + inClassEnd +
                ", page=" + page +
                ", offsex=" + offsex +
                ", rows=" + rows +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAskerId() {
        return askerId;
    }

    public void setAskerId(String askerId) {
        this.askerId = askerId;
    }

    public String getIsPay() {
        return isPay;
    }

    public void setIsPay(String isPay) {
        this.isPay = isPay;
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid;
    }

    public String getIsReturnVist() {
        return isReturnVist;
    }

    public void setIsReturnVist(String isReturnVist) {
        this.isReturnVist = isReturnVist;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public Timestamp getCreateStart() {
        return createStart;
    }

    public void setCreateStart(Timestamp createStart) {
        this.createStart = createStart;
    }

    public Timestamp getCreateEnd() {
        return createEnd;
    }

    public void setCreateEnd(Timestamp createEnd) {
        this.createEnd = createEnd;
    }

    public Timestamp getHomeStart() {
        return homeStart;
    }

    public void setHomeStart(Timestamp homeStart) {
        this.homeStart = homeStart;
    }

    public Timestamp getHomeEnd() {
        return homeEnd;
    }

    public void setHomeEnd(Timestamp homeEnd) {
        this.homeEnd = homeEnd;
    }

    public Timestamp getReturnVistStart() {
        return returnVistStart;
    }

    public void setReturnVistStart(Timestamp returnVistStart) {
        this.returnVistStart = returnVistStart;
    }

    public Timestamp getReturnVistEnd() {
        return returnVistEnd;
    }

    public void setReturnVistEnd(Timestamp returnVistEnd) {
        this.returnVistEnd = returnVistEnd;
    }

    public Timestamp getPayStart() {
        return payStart;
    }

    public void setPayStart(Timestamp payStart) {
        this.payStart = payStart;
    }

    public Timestamp getPayEnd() {
        return payEnd;
    }

    public void setPayEnd(Timestamp payEnd) {
        this.payEnd = payEnd;
    }

    public Timestamp getInClassStart() {
        return inClassStart;
    }

    public void setInClassStart(Timestamp inClassStart) {
        this.inClassStart = inClassStart;
    }

    public Timestamp getInClassEnd() {
        return inClassEnd;
    }

    public void setInClassEnd(Timestamp inClassEnd) {
        this.inClassEnd = inClassEnd;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
        if(this.rows!=0)
            this.offsex=(page-1)*rows;
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
        if(this.page!=0)
            this.offsex=(page-1)*rows;
    }
}
