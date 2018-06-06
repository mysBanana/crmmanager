package com.crm.entity;


import com.crm.config.CustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Dynamicmessages {

  private long id;
  private long studentId;
  private String studentName;
  private String messageContent;
  private String isOpen;
  @JsonSerialize(using=CustomDateSerializer.class)
  private java.sql.Timestamp createTime;

  @Override
  public String toString() {
    return "Dynamicmessages{" +
            "id=" + id +
            ", studentId=" + studentId +
            ", studentName='" + studentName + '\'' +
            ", messageContent='" + messageContent + '\'' +
            ", isOpen='" + isOpen + '\'' +
            ", createTime=" + createTime +
            '}';
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


  public String getMessageContent() {
    return messageContent;
  }

  public void setMessageContent(String messageContent) {
    this.messageContent = messageContent;
  }


  public String getIsOpen() {
    return isOpen;
  }

  public void setIsOpen(String isOpen) {
    this.isOpen = isOpen;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }

}
