package com.crm.entity;


import com.crm.annotation.ExcelField;

public class Modules {
  @ExcelField(value = "标识")
  private long id;
  @ExcelField(value = "模块名称")
  private String name;
  @ExcelField(value = "父级标识")
  private long parentId;
  @ExcelField(value = "路径")
  private String path;
  @ExcelField(value = "权重")
  private long weight;
  @ExcelField(value = "预留",showDisplay = true)
  private String ops;
  @ExcelField(value = "预留",showDisplay = true)
  private long int0;
  @ExcelField(value = "图标名")
  private String icon_class;

  public String getIcon_class() {
    return icon_class;
  }

  public void setIcon_class(String icon_class) {
    this.icon_class = icon_class;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public long getParentId() {
    return parentId;
  }

  public void setParentId(long parentId) {
    this.parentId = parentId;
  }


  public String getPath() {
    return path;
  }

  public void setPath(String path) {
    this.path = path;
  }


  public long getWeight() {
    return weight;
  }

  public void setWeight(long weight) {
    this.weight = weight;
  }


  public String getOps() {
    return ops;
  }

  public void setOps(String ops) {
    this.ops = ops;
  }


  public long getInt0() {
    return int0;
  }

  public void setInt0(long int0) {
    this.int0 = int0;
  }

  @Override
  public String toString() {
    return "Modules{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", parentId=" + parentId +
            ", path='" + path + '\'' +
            ", weight=" + weight +
            ", ops='" + ops + '\'' +
            ", int0=" + int0 +
            ", icon_class='" + icon_class + '\'' +
            '}';
  }
}
