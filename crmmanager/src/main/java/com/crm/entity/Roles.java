package com.crm.entity;


import com.crm.annotation.ExcelField;
import com.crm.annotation.PrimaryField;
import com.crm.enums.PrimaryKeyEnum;

public class Roles {

  @PrimaryField(identification = PrimaryKeyEnum.uuid)
  @ExcelField(value = "标识",showDisplay = true)
  private String id;
  @ExcelField(value = "角色名称",notNull = true)
  private String name;
  @ExcelField(templaletDisplay = true,showDisplay = true)
  private long int0;
  @ExcelField(templaletDisplay = true,showDisplay = true)
  private String string0;


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public long getInt0() {
    return int0;
  }

  public void setInt0(long int0) {
    this.int0 = int0;
  }


  public String getString0() {
    return string0;
  }

  public void setString0(String string0) {
    this.string0 = string0;
  }

  @Override
  public String toString() {
    return "Roles{" +
            "id='" + id + '\'' +
            ", name='" + name + '\'' +
            ", int0=" + int0 +
            ", string0='" + string0 + '\'' +
            '}';
  }
}
