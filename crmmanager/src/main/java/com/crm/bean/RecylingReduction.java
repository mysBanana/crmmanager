package com.crm.bean;

/**
 * 回收站还原实体类
 */
public class RecylingReduction {
    private String tableName;//删除的表名
    private String nameColumn;//删除的名称列名
    private String nameValue;//删除的名称值
    private String id;//删除的id
    private String recyclingId;//回收站id

    public String getRecyclingId() {
        return recyclingId;
    }

    public void setRecyclingId(String recyclingId) {
        this.recyclingId = recyclingId;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getNameColumn() {
        return nameColumn;
    }

    public void setNameColumn(String nameColumn) {
        this.nameColumn = nameColumn;
    }

    public String getNameValue() {
        return nameValue;
    }

    public void setNameValue(String nameValue) {
        this.nameValue = nameValue;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
