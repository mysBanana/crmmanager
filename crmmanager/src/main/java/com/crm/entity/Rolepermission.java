package com.crm.entity;


public class Rolepermission {

  private String rolePermissionId;
  private String roleId;
  private String permissionId;
  private java.sql.Timestamp rolePermissionLastUpdateTime;


  public String getRolePermissionId() {
    return rolePermissionId;
  }

  public void setRolePermissionId(String rolePermissionId) {
    this.rolePermissionId = rolePermissionId;
  }


  public String getRoleId() {
    return roleId;
  }

  public void setRoleId(String roleId) {
    this.roleId = roleId;
  }


  public String getPermissionId() {
    return permissionId;
  }

  public void setPermissionId(String permissionId) {
    this.permissionId = permissionId;
  }


  public java.sql.Timestamp getRolePermissionLastUpdateTime() {
    return rolePermissionLastUpdateTime;
  }

  public void setRolePermissionLastUpdateTime(java.sql.Timestamp rolePermissionLastUpdateTime) {
    this.rolePermissionLastUpdateTime = rolePermissionLastUpdateTime;
  }

  @Override
  public String toString() {
    return "Rolepermission{" +
            "rolePermissionId='" + rolePermissionId + '\'' +
            ", roleId='" + roleId + '\'' +
            ", permissionId='" + permissionId + '\'' +
            ", rolePermissionLastUpdateTime=" + rolePermissionLastUpdateTime +
            '}';
  }
}
