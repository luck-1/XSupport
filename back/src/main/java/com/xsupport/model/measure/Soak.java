package com.xsupport.model.measure;

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
 * @date 2019/4/30
 * @description 浸润测量
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
@Table(name="soak")
public class Soak implements Serializable {

    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "JDBC")
    @GenericGenerator(name = "JDBC", strategy = "uuid")
    @ApiModelProperty(value="id")
    @Column(name = "id")
    private String id;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    @ApiModelProperty(value="记录时间")
    @Column(name = "createTime")
    private Date createTime;

    @ApiModelProperty(value="类型")
    @Column(name = "type")
    private Integer type;

    @ApiModelProperty(value = "记录值(持久化)")
    @Column(name = "value")
    private Float value;

    @ApiModelProperty(value = "状态(持久化)")
    @Column(name = "state")
    private Integer state;

    @ApiModelProperty(value = "阈值(持久化)")
    @Column(name = "limitValue")
    private Float limitValue;

    @ApiModelProperty(value = "备注")
    @Column(name = "remark")
    private String remark;



    @Transient
    @ApiModelProperty(value = "记录值")
    private String exportValue;

    @Transient
    @ApiModelProperty(value = "状态")
    private String exportState;

    @Transient
    @ApiModelProperty(value = "阈值")
    private String exportLimitValue;

    public Soak() {
    }

    public Soak(Float value, Float limitValue) {

        this.value = value;
        this.limitValue = limitValue;

        this.state = limitValue > value ? 0 : 1;
    }
}