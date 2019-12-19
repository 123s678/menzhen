package com.xm.entity.dto;


/*
用于通过用户名和密码查询角色
*/
public class EmployeeDto implements java.io.Serializable {
    private Integer id;
    private String employeecode;
    private String psw;
    private Integer roleid;
    private String rolename;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmployeecode() {
        return employeecode;
    }

    public void setEmployeecode(String employeecode) {
        this.employeecode = employeecode;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    @Override
    public String toString() {
        return "EmployeeDto{" +
                "id=" + id +
                ", employeecode='" + employeecode + '\'' +
                ", psw='" + psw + '\'' +
                ", roleid=" + roleid +
                ", rolename='" + rolename + '\'' +
                '}';
    }
}
