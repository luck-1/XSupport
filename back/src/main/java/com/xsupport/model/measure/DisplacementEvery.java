package com.xsupport.model.measure;

import java.io.Serializable;

import lombok.Data;

import javax.persistence.*;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集单个记录
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
@Table(name = "displacement_every")
public class DisplacementEvery implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "JDBC")
    @GenericGenerator(name = "JDBC", strategy = "uuid")
    @ApiModelProperty(value = "id")
    @Column(name = "id")
    private String id;

    @ApiModelProperty(value = "组ID")
    @Column(name = "groupId")
    private String groupId;

    @ApiModelProperty(value = "测量点")
    @Column(name = "point")
    private Integer point;

    @ApiModelProperty(value = "本次测值")
    @Column(name = "thisValue")
    private String thisValue;

    @ApiModelProperty(value = "上次测值")
    @Column(name = "beforeValue")
    private String beforeValue;

    @Transient
    private String pointName;

    @Transient
    private DisplacementValue thisValueData;

    @Transient
    private DisplacementValue beforeValueData;

    public DisplacementEvery() {
    }

    public DisplacementEvery(DisplacementValue beforeValueData) {
        this.thisValue = "0";
        this.thisValueData = beforeValueData;
    }

    public DisplacementEvery(String groupId, Integer point, String thisValue, String beforeValue) {
        this.groupId = groupId;
        this.point = point;
        this.thisValue = thisValue;
        this.beforeValue = beforeValue;
    }
}