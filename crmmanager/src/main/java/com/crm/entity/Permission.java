package com.crm.entity;


import com.crm.annotation.ExcelField;
import com.crm.config.CustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Permission {

  @ExcelField(value = "标识",showDisplay = true)
  private String permissionId;
  @ExcelField(value = "权限value")
  private String permissionValue;
  @ExcelField(value = "权限模块名称")
  private String permissionModule;
  @ExcelField(value = "权限名称")
  private String permissionName;
  @JsonSerialize(using=CustomDateSerializer.class)
  private java.sql.Timestamp permissionLastUpdateTime;


  public String getPermissionId() {
    return permissionId;
  }

  public void setPermissionId(String permissionId) {
    this.permissionId = permissionId;
  }


  public String getPermissionValue() {
    return permissionValue;
  }

  public void setPermissionValue(String permissionValue) {
    this.permissionValue = permissionValue;
  }


  public String getPermissionModule() {
    return permissionModule;
  }

  public void setPermissionModule(String permissionModule) {
    this.permissionModule = permissionModule;
  }


  public String getPermissionName() {
    return permissionName;
  }

  public void setPermissionName(String permissionName) {
    this.permissionName = permissionName;
  }


  public java.sql.Timestamp getPermissionLastUpdateTime() {
    return permissionLastUpdateTime;
  }

  public void setPermissionLastUpdateTime(java.sql.Timestamp permissionLastUpdateTime) {
    this.permissionLastUpdateTime = permissionLastUpdateTime;
  }

  public Permission(String permissionId, String permissionValue, String permissionModule, String permissionName) {
    this.permissionId = permissionId;
    this.permissionValue = permissionValue;
    this.permissionModule = permissionModule;
    this.permissionName = permissionName;
  }

  public Permission() {
  }

  @Override
  public String toString() {
    return "Permission{" +
            "permissionId='" + permissionId + '\'' +
            ", permissionValue='" + permissionValue + '\'' +
            ", permissionModule='" + permissionModule + '\'' +
            ", permissionName='" + permissionName + '\'' +
            ", permissionLastUpdateTime=" + permissionLastUpdateTime +
            '}';
  }
}
