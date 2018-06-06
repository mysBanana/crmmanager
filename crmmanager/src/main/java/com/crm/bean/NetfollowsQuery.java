package com.crm.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

public class NetfollowsQuery {
    private String studentName; //学生姓名
    private String userName;  //用户id
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp followTimeStart;  //跟踪开始时间
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp followTimeEnd; //跟踪结束时间
    private String content; //内容
    private String followType;  //跟踪方式
    private String askerId;
    private int page;   //页数
    private int rows;   //条数
    private int offsex; //偏移量

    public String getAskerId() {
        return askerId;
    }

    public void setAskerId(String askerId) {
        this.askerId = askerId;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
        if(rows!=0)
            offsex=(page-1)*rows;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
        if(page!=0)
            offsex=(page-1)*rows;
    }

    public int getOffsex() {
        return offsex;
    }

    public void setOffsex(int offsex) {
        this.offsex = offsex;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Timestamp getFollowTimeStart() {
        return followTimeStart;
    }

    public void setFollowTimeStart(Timestamp followTimeStart) {
        this.followTimeStart = followTimeStart;
    }

    public Timestamp getFollowTimeEnd() {
        return followTimeEnd;
    }

    public void setFollowTimeEnd(Timestamp followTimeEnd) {
        this.followTimeEnd = followTimeEnd;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFollowType() {
        return followType;
    }

    public void setFollowType(String followType) {
        this.followType = followType;
    }
}
