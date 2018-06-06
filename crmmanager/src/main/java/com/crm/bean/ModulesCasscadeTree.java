package com.crm.bean;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class ModulesCasscadeTree {
    @JsonProperty("value")
    private long id;
    @JsonProperty("label")
    private String name;
    @JsonProperty("children")
    private List<ModulesCasscadeTree> children;

    public void setId(long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }


    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public List<ModulesCasscadeTree> getChildren() {
        return children;
    }

    public void setChildren(List<ModulesCasscadeTree> children) {
        this.children = children;
    }
}
