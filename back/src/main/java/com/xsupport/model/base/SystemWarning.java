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
 * @date 2019/4/21
 * @description 系统异常
 */
@Data
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name="system_warning")
public class SystemWarning implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "JDBC")
    @GenericGenerator(name = "JDBC", strategy = "uuid")
    @ApiModelProperty(value="id")
    @Column(name = "id")
    private String id;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    @ApiModelProperty(value="创建时间")
    @Column(name = "createTime")
    private Date createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    @ApiModelProperty(value="更新时间")
    @Column(name = "updateTime")
    private String updateTime;

    @ApiModelProperty(value="操作人")
    @Column(name = "optionUser")
    private String optionUser;

    @ApiModelProperty(value="异常类型（0：温度异常，1：湿度异常，2：浸润异常，3：金气异常）")
    @Column(name = "exceptionLocation")
    private Integer exceptionLocation;

    @ApiModelProperty(value="异常描述")
    @Column(name = "exceptionDescription")
    private String exceptionDescription;

    @ApiModelProperty(value="异常状态（0：未处理，1：正在处理，1：已处理）")
    @Column(name = "exceptionState")
    private Integer exceptionState;

    @ApiModelProperty(value="备注")
    @Column(name = "remark")
    private String remark;
}