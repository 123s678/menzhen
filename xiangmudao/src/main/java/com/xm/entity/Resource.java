package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Resource implements java.io.Serializable {

  private Integer id;
  private Integer resourcesuperiorid;
  private String resourcename;
  private String resourceurl;
  private String resourceicon;
  private Integer rank;
  private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getResourcesuperiorid() {
        return resourcesuperiorid;
    }

    public void setResourcesuperiorid(Integer resourcesuperiorid) {
        this.resourcesuperiorid = resourcesuperiorid;
    }

    public String getResourcename() {
        return resourcename;
    }

    public void setResourcename(String resourcename) {
        this.resourcename = resourcename;
    }

    public String getResourceurl() {
        return resourceurl;
    }

    public void setResourceurl(String resourceurl) {
        this.resourceurl = resourceurl;
    }

    public String getResourceicon() {
        return resourceicon;
    }

    public void setResourceicon(String resourceicon) {
        this.resourceicon = resourceicon;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", resourcesuperiorid=" + resourcesuperiorid +
                ", resourcename='" + resourcename + '\'' +
                ", resourceurl='" + resourceurl + '\'' +
                ", resourceicon='" + resourceicon + '\'' +
                ", rank=" + rank +
                ", isvalid=" + isvalid +
                '}';
    }
}
