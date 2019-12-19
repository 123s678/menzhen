package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Disease implements java.io.Serializable {

  private Integer id;
  private String diseasecode;
  private String diseasename;
  private String diseaseexplain;
  private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDiseasecode() {
        return diseasecode;
    }

    public void setDiseasecode(String diseasecode) {
        this.diseasecode = diseasecode;
    }

    public String getDiseasename() {
        return diseasename;
    }

    public void setDiseasename(String diseasename) {
        this.diseasename = diseasename;
    }

    public String getDiseaseexplain() {
        return diseaseexplain;
    }

    public void setDiseaseexplain(String diseaseexplain) {
        this.diseaseexplain = diseaseexplain;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    @Override
    public String toString() {
        return "Disease{" +
                "id=" + id +
                ", diseasecode='" + diseasecode + '\'' +
                ", diseasename='" + diseasename + '\'' +
                ", diseaseexplain='" + diseaseexplain + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
