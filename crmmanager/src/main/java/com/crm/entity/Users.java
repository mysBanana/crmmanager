package com.crm.entity;


import com.crm.annotation.ExcelField;
import com.crm.annotation.PrimaryField;
import com.crm.config.CustomDateSerializer;
import com.crm.enums.PrimaryKeyEnum;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Users {

  @ExcelField(value = "标识",showDisplay = true)
  @PrimaryField(identification = PrimaryKeyEnum.uuid)
  private String id;
  @ExcelField(value = "名称",notNull = true)
  private String loginName;
  @ExcelField(value = "密码",notNull = true)
  private String password;
  @ExcelField(value = "是否锁定",templaletDisplay = true)
  private String isLockout;
  @ExcelField(value = "最后登录时间",templaletDisplay = true)
  @JsonSerialize(using=CustomDateSerializer.class)
  private java.sql.Timestamp lastLoginTime;
  @ExcelField(value = "错误密码次数",templaletDisplay = true)
  private long psdWrongTime;
  @ExcelField(value = "锁定时间",templaletDisplay=true)
  @JsonSerialize(using=CustomDateSerializer.class)
  private java.sql.Timestamp lockTime;
  @ExcelField("邮箱")
  private String protectEMail;
  @ExcelField(value = "手机号")
  private String protectMTel;

  @ExcelField(value = "创建时间",templaletDisplay = true)
  @JsonSerialize(using=CustomDateSerializer.class)
  private java.sql.Timestamp createTime;

  public Users() {
  }

  public Users(String id, String loginName) {
    this.id = id;
    this.loginName = loginName;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getLoginName() {
    return loginName;
  }

  public void setLoginName(String loginName) {
    this.loginName = loginName;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getIsLockout() {
    return isLockout;
  }

  public void setIsLockout(String isLockout) {
    this.isLockout = isLockout;
  }


  public java.sql.Timestamp getLastLoginTime() {
    return lastLoginTime;
  }

  public void setLastLoginTime(java.sql.Timestamp lastLoginTime) {
    this.lastLoginTime = lastLoginTime;
  }


  public long getPsdWrongTime() {
    return psdWrongTime;
  }

  public void setPsdWrongTime(long psdWrongTime) {
    this.psdWrongTime = psdWrongTime;
  }


  public java.sql.Timestamp getLockTime() {
    return lockTime;
  }

  public void setLockTime(java.sql.Timestamp lockTime) {
    this.lockTime = lockTime;
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


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }

  @Override
  public String toString() {
    return "Users{" +
            "id='" + id + '\'' +
            ", loginName='" + loginName + '\'' +
            ", password='" + password + '\'' +
            ", isLockout='" + isLockout + '\'' +
            ", lastLoginTime=" + lastLoginTime +
            ", psdWrongTime=" + psdWrongTime +
            ", lockTime=" + lockTime +
            ", protectEMail='" + protectEMail + '\'' +
            ", protectMTel='" + protectMTel + '\'' +
            ", createTime=" + createTime +
            '}';
  }
}
