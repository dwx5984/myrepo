package cn.sise.ssm.po;

public class Category {
    private Integer ctgyId;

    private String ctgyName;

    public Integer getCtgyId() {
        return ctgyId;
    }

    public void setCtgyId(Integer ctgyId) {
        this.ctgyId = ctgyId;
    }

    public String getCtgyName() {
        return ctgyName;
    }

    public void setCtgyName(String ctgyName) {
        this.ctgyName = ctgyName == null ? null : ctgyName.trim();
    }
}