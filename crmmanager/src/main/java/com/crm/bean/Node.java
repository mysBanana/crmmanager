package com.crm.bean;

import java.util.List;

public class Node {
    private String id;
    private String title;
    private boolean checked;
    private List<Node> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String text) {
        this.title = text;
    }

    @Override
    public String toString() {
        return "Node{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", checked='" + checked + '\'' +
                ", children=" + children +
                '}';
    }

    public boolean getChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public List<Node> getChildren() {
        return children;
    }

    public void setChildren(List<Node> children) {
        this.children = children;
    }
}
