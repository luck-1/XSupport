package com.xsupport.model.measure;

import java.util.Date;
import java.io.Serializable;
import java.util.List;

import lombok.Data;

import javax.persistence.*;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集汇总记录
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
@Table(name = "displacement_group")
public class DisplacementGroup implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "JDBC")
    @GenericGenerator(name = "JDBC", strategy = "uuid")
    @ApiModelProperty(value = "id")
    @Column(name = "id")
    private String id;

    @ApiModelProperty(value = "采集时间")
    @Column(name = "createTime")
    private Date createTime;

    @ApiModelProperty(value = "备注")
    @Column(name = "remark")
    private String remark;

    @Transient
    private List<DisplacementEvery> every;

    public DisplacementGroup() {
    }

    public DisplacementGroup(String id) {
        this.id = id;
    }
}