package com.photo.bean.mapper;

public class DeliverLog {
    private String id;

    private String deliverId;

    private Integer changestatus;

    private String createDay;

    private String createTime;

    private String createTimeLong;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDeliverId() {
        return deliverId;
    }

    public void setDeliverId(String deliverId) {
        this.deliverId = deliverId;
    }

    public Integer getChangestatus() {
        return changestatus;
    }

    public void setChangestatus(Integer changestatus) {
        this.changestatus = changestatus;
    }

    public String getCreateDay() {
        return createDay;
    }

    public void setCreateDay(String createDay) {
        this.createDay = createDay;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getCreateTimeLong() {
        return createTimeLong;
    }

    public void setCreateTimeLong(String createTimeLong) {
        this.createTimeLong = createTimeLong;
    }
}