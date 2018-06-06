package com.crm.entity;

import com.crm.annotation.ExcelField;
import com.crm.annotation.PrimaryField;
import com.crm.config.CustomDateSerializer;
import com.crm.enums.PrimaryKeyEnum;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Askers {
  @ExcelField(value = "咨询师id",showDisplay = true)
  @PrimaryField(identification = PrimaryKeyEnum.uuid)
  private String askerId;
  @ExcelField("名称")
  private String askerName;
  @ExcelField(value = "签到状态",templaletDisplay = true)
  private String checkState;
  @ExcelField(value = "签到时间",templaletDisplay = true)
  @JsonSerialize(using=CustomDateSerializer.class)
  private java.sql.Timestamp checkInTime;
  @ExcelField(value = "是否分配学生",templaletDisplay = true)
  private String changeState;
  @ExcelField(value = "权重",templaletDisplay = true)
  private long weight;
  @ExcelField(value = "角色名称",templaletDisplay = true)
  private String roleName;
  @ExcelField("备注")
  private String bakContent;

  public Askers(String askerId, String askerName, String checkState) {
    this.askerId = askerId;
    this.askerName = askerName;
    this.checkState = checkState;
  }

  @Override
  public String toString() {
    return "Askers{" +
            "askerId='" + askerId + '\'' +
            ", askerName='" + askerName + '\'' +
            ", checkState='" + checkState + '\'' +
            ", checkInTime=" + checkInTime +
            ", changeState='" + changeState + '\'' +
            ", weight=" + weight +
            ", roleName='" + roleName + '\'' +
            ", bakContent='" + bakContent + '\'' +
            '}';
  }

  public Askers() {
  }

  public String getAskerId() {
    return askerId;
  }

  public void setAskerId(String askerId) {
    this.askerId = askerId;
  }


  public String getAskerName() {
    return askerName;
  }

  public void setAskerName(String askerName) {
    this.askerName = askerName;
  }


  public String getCheckState() {
    return checkState;
  }

  public void setCheckState(String checkState) {
    this.checkState = checkState;
  }


  public java.sql.Timestamp getCheckInTime() {
    return checkInTime;
  }

  public void setCheckInTime(java.sql.Timestamp checkInTime) {
    this.checkInTime = checkInTime;
  }


  public String getChangeState() {
    return changeState;
  }

  public void setChangeState(String changeState) {
    this.changeState = changeState;
  }


  public long getWeight() {
    return weight;
  }

  public void setWeight(long weight) {
    this.weight = weight;
  }


  public String getRoleName() {
    return roleName;
  }

  public void setRoleName(String roleName) {
    this.roleName = roleName;
  }


  public String getBakContent() {
    return bakContent;
  }

  public void setBakContent(String bakContent) {
    this.bakContent = bakContent;
  }

}
