package com.crm.bean;

public class PermissionQuery {
    private String permissionName;
    private int page,offsex,rows;//当前页数,偏移量,条数

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
        if(rows!=0){
            offsex=(page-1)*rows;
        }
    }

    public int getOffsex() {
        return offsex;
    }

    public void setOffsex(int offsex) {
        this.offsex = offsex;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
        if(page!=0){
            offsex=(page-1)*rows;
        }
    }
}
