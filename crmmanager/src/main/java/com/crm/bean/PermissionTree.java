package com.crm.bean;

import com.crm.config.CustomDateSerializer;
import com.crm.entity.Permission;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.sql.Timestamp;
import java.util.List;

public class PermissionTree {
    private String permissionModule;
    private List<Permission> children;

    public String getPermissionModule() {
        return permissionModule;
    }

    public void setPermissionModule(String permissionModule) {
        this.permissionModule = permissionModule;
    }

    public List<Permission> getChildren() {
        return children;
    }

    public void setChildren(List<Permission> children) {
        this.children = children;
    }
}
