package com.crm.bean;

import java.util.List;

public class ChartTree {
    private String name;
    private String value;
    private String link;
    private List<ChartTree> children;

    @Override
    public String toString() {
        return "ChartTree{" +
                "name='" + name + '\'' +
                ", value='" + value + '\'' +
                ", link='" + link + '\'' +
                ", children=" + children +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public List<ChartTree> getChildren() {
        return children;
    }

    public void setChildren(List<ChartTree> children) {
        this.children = children;
    }
}
