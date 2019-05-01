package com.xsupport.model.base;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import javax.persistence.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author lxc
 * @date 2019/4/29
 * @description 湿度监控
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
@Table(name="humidity")
public class Humidity implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "JDBC")
    @GenericGenerator(name = "JDBC", strategy = "uuid")
    @ApiModelProperty(value="id")
    @Column(name = "id")
    private String id;

    @ApiModelProperty(value="创建时间")
    @Column(name = "createTime")
    private Date createTime;

    @ApiModelProperty(value="湿度值")
    @Column(name = "value")
    private Integer value;

    @ApiModelProperty(value="阈值")
    @Column(name = "limitValue")
    private Float limitValue;

    @ApiModelProperty(value="状态(0：正常，1：异常，2：已处理)")
    @Column(name = "state")
    private Integer state;

    @ApiModelProperty(value="备注")
    @Column(name = "remark")
    private String remark;

    public Humidity() {
    }

    public Humidity(Integer value, Float limitValue) {

        this.value = value;
        this.limitValue = limitValue;

        this.state = limitValue > value ? 0 : 1;
    }
}