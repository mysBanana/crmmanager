package com.crm.entity;


import com.crm.annotation.ExcelField;
import com.crm.config.CustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Userchecks {

  @ExcelField(value = "标识",showDisplay = true)
  private long id;
  @ExcelField(value = "用户id",showDisplay = true)
  private String userId;
  @ExcelField(value = "用户名称")
  private String userName;
  @JsonSerialize(using=CustomDateSerializer.class)
  @ExcelField(value = "签到时间")
  private java.sql.Timestamp checkInTime;
  @ExcelField(value = "签到状态")
  private String checkState;
  @ExcelField(value = "是否权限取消签到")
  private String isCancel;
  @JsonSerialize(using=CustomDateSerializer.class)
  @ExcelField(value = "签退时间")
  private java.sql.Timestamp checkOutTime;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }


  public java.sql.Timestamp getCheckInTime() {
    return checkInTime;
  }

  public void setCheckInTime(java.sql.Timestamp checkInTime) {
    this.checkInTime = checkInTime;
  }


  public String getCheckState() {
    return checkState;
  }

  public void setCheckState(String checkState) {
    this.checkState = checkState;
  }


  public String getIsCancel() {
    return isCancel;
  }

  public void setIsCancel(String isCancel) {
    this.isCancel = isCancel;
  }


  public java.sql.Timestamp getCheckOutTime() {
    return checkOutTime;
  }

  public void setCheckOutTime(java.sql.Timestamp checkOutTime) {
    this.checkOutTime = checkOutTime;
  }

}
