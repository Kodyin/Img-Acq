package com.springmvc.entity;

public class Task {
    private Long 业务序号;

    private String 业务类型;

    private String 机器编号;

    private String 办理人;

    private String 材料人;

    private String 是否本人;

    private String 材料人身份证号;

    private String 办理人联系方式;

    private String 办理地址;

    private String 头像图;

    private String 材料图;

    private String 时间;

    private String 办理人身份证号;

    private String 材料人联系方式;

    public Long get业务序号() {
        return 业务序号;
    }

    public void set业务序号(Long 业务序号) {
        this.业务序号 = 业务序号;
    }

    public String get业务类型() {
        return 业务类型;
    }

    public void set业务类型(String 业务类型) {
        this.业务类型 = 业务类型;
    }

    public String get机器编号() {
        return 机器编号;
    }

    public void set机器编号(String 机器编号) {
        this.机器编号 = 机器编号;
    }

    public String get办理人() {
        return 办理人;
    }

    public void set办理人(String 办理人) {
        this.办理人 = 办理人;
    }

    public String get材料人() {
        return 材料人;
    }

    public void set材料人(String 材料人) {
        this.材料人 = 材料人;
    }

    public String get是否本人() {
        return 是否本人;
    }

    public void set是否本人(String 是否本人) {
        this.是否本人 = 是否本人;
    }

    public String get材料人身份证号() {
        return 材料人身份证号;
    }

    public void set材料人身份证号(String 材料人身份证号) {
        this.材料人身份证号 = 材料人身份证号;
    }

    public String get办理人联系方式() {
        return 办理人联系方式;
    }

    public void set办理人联系方式(String 办理人联系方式) {
        this.办理人联系方式 = 办理人联系方式;
    }

    public String get办理地址() {
        return 办理地址;
    }

    public void set办理地址(String 办理地址) {
        this.办理地址 = 办理地址;
    }

    public String get头像图() {
        return 头像图;
    }

    public void set头像图(String 头像图) {
        this.头像图 = 头像图;
    }

    public String get材料图() {
        return 材料图;
    }

    public void set材料图(String 材料图) {
        this.材料图 = 材料图;
    }

    public String get时间() {
        return 时间;
    }

    public void set时间(String 时间) {
        this.时间 = 时间;
    }

    public String get办理人身份证号() {
        return 办理人身份证号;
    }

    public void set办理人身份证号(String 办理人身份证号) {
        this.办理人身份证号 = 办理人身份证号;
    }

    public String get材料人联系方式() {
        return 材料人联系方式;
    }

    public void set材料人联系方式(String 材料人联系方式) {
        this.材料人联系方式 = 材料人联系方式;
    }

    @Override
    public String toString() {
        return "Task{" +
                "业务序号='" + 业务序号 +
                ", 业务类型=" + 业务类型 + '\'' +
                ", 机器编号=" + 机器编号 + '\'' +
                ", 办理人='" + 办理人 + '\'' +
                ", 材料人='" + 材料人 + '\'' +
                ", 是否本人=" + 是否本人 + '\'' +
                ", 材料人身份证号='" + 材料人身份证号 + '\'' +
                ", 办理人联系方式='" + 办理人联系方式 + '\'' +
                ", 办理地址='" + 办理地址 + '\'' +
                ", 头像图='" + 头像图 + '\'' +
                ", 材料图='" + 材料图 + '\'' +
                ", 时间='" + 时间 + '\'' +
                ", 办理人身份证号='" + 办理人身份证号 + '\'' +
                ", 材料人联系方式='" + 材料人联系方式 + '\'' +
                '}';
    }
}