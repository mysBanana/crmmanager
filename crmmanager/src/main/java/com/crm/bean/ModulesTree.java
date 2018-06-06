package com.crm.bean;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class ModulesTree {
    private long id;
    @JsonProperty("title")
    private String name;
    private long parentId;
    private String path;
    private long weight;
    private String ops;
    private long int0;
    private String icon_class;
    private List<ModulesTree> children;

    @Override
    public String toString() {
        return "ModulesTree{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", path='" + path + '\'' +
                ", weight=" + weight +
                ", ops='" + ops + '\'' +
                ", int0=" + int0 +
                ", icon_class='" + icon_class + '\'' +
                ", children=" + children +
                '}';
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

    public String getIcon_class() {
        return icon_class;
    }

    public void setIcon_class(String icon_class) {
        this.icon_class = icon_class;
    }


    public List<ModulesTree> getChildren() {
        return children;
    }

    public void setChildren(List<ModulesTree> children) {
        this.children = children;
    }
}
