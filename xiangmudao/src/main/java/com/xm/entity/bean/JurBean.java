package com.xm.entity.bean;

import java.util.List;

public class JurBean implements java.io.Serializable {
    private int id;
    private String text;
    private List<JurBean> nodes;
    private StateBean state;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<JurBean> getNodes() {
        return nodes;
    }

    public void setNodes(List<JurBean> nodes) {
        this.nodes = nodes;
    }

    public StateBean getState() {
        return state;
    }

    public void setState(StateBean state) {
        this.state = state;
    }
}
