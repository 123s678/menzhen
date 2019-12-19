package com.xm.entity.dtt;

public class FaYaoDtt implements java.io.Serializable {
    private Integer id;
    private Integer medicineamount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMedicineamount() {
        return medicineamount;
    }

    public void setMedicineamount(Integer medicineamount) {
        this.medicineamount = medicineamount;
    }

    @Override
    public String toString() {
        return "FaYaoDtt{" +
                "id=" + id +
                ", medicineamount=" + medicineamount +
                '}';
    }
}
