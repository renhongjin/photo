package com.photo.bean.mapper;

public class UserImage {
    private String id;

    private String userId;

    private String imageUrl;

    private String createDay;

    private String createTime;

    private Integer deleteFlag;

    private String createTimeLong;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
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

    public Integer getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Integer deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public String getCreateTimeLong() {
        return createTimeLong;
    }

    public void setCreateTimeLong(String createTimeLong) {
        this.createTimeLong = createTimeLong;
    }
}