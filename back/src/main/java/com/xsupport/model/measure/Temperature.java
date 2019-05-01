package com.xsupport.model.base;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 温度监控
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
@Table(name = "temperature")
public class Temperature implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "JDBC")
    @GenericGenerator(name = "JDBC", strategy = "uuid")
    @ApiModelProperty(value = "id")
    @Column(name = "id")
    private String id;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    @ApiModelProperty(value = "创建时间")
    @Column(name = "createTime")
    private Date createTime;

    @ApiModelProperty(value = "温度值")
    @Column(name = "value")
    private Integer value;

    @ApiModelProperty(value = "状态(0：正常，1：异常，2：已处理)")
    @Column(name = "state")
    private Integer state;

    @ApiModelProperty(value = "最大值")
    @Column(name = "limitValue")
    private Float limitValue;

    @ApiModelProperty(value = "备注")
    @Column(name = "remark")
    private String remark;

    public Temperature() {
    }

    public Temperature(Integer value, Float limitValue) {

        this.value = value;
        this.limitValue = limitValue;

        this.state = limitValue > value ? 0 : 1;
    }
}