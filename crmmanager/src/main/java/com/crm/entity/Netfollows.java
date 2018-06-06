package com.crm.entity;


import com.crm.annotation.ExcelField;
import com.crm.config.CustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Netfollows {

  @ExcelField(value = "标识",showDisplay = true)
  private long id;
  @ExcelField(value = "学生id",showDisplay = true)
  private long studentId;
  @ExcelField(value = "学生姓名")
  private String studentName;
  @JsonSerialize(using=CustomDateSerializer.class)
  @ExcelField(value = "跟踪时间")
  private java.sql.Timestamp followTime;
  @JsonSerialize(using=CustomDateSerializer.class)
  @ExcelField(value = "下次跟踪时间")
  private java.sql.Timestamp nextFollowTime;
  @ExcelField(value = "内容")
  private String content;
  @ExcelField(value = "用户id",showDisplay = true)
  private String userId;
  @ExcelField(value = "跟踪类型")
  private String followType;
  @JsonSerialize(using=CustomDateSerializer.class)
  @ExcelField(value = "创建时间")
  private java.sql.Timestamp createTime;
  @ExcelField(value = "跟踪状态")
  private String followState;
  @ExcelField(showDisplay = true,templaletDisplay = true)
  private String userName;

  @Override
  public String toString() {
    return "Netfollows{" +
            "id=" + id +
            ", studentId=" + studentId +
            ", studentName='" + studentName + '\'' +
            ", followTime=" + followTime +
            ", nextFollowTime=" + nextFollowTime +
            ", content='" + content + '\'' +
            ", userId='" + userId + '\'' +
            ", followType='" + followType + '\'' +
            ", createTime=" + createTime +
            ", followState='" + followState + '\'' +
            ", userName='" + userName + '\'' +
            '}';
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getStudentId() {
    return studentId;
  }

  public void setStudentId(long studentId) {
    this.studentId = studentId;
  }


  public String getStudentName() {
    return studentName;
  }

  public void setStudentName(String studentName) {
    this.studentName = studentName;
  }


  public java.sql.Timestamp getFollowTime() {
    return followTime;
  }

  public void setFollowTime(java.sql.Timestamp followTime) {
    this.followTime = followTime;
  }


  public java.sql.Timestamp getNextFollowTime() {
    return nextFollowTime;
  }

  public void setNextFollowTime(java.sql.Timestamp nextFollowTime) {
    this.nextFollowTime = nextFollowTime;
  }


  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public String getFollowType() {
    return followType;
  }

  public void setFollowType(String followType) {
    this.followType = followType;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }


  public String getFollowState() {
    return followState;
  }

  public void setFollowState(String followState) {
    this.followState = followState;
  }

}
