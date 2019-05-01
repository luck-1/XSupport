package com.xsupport.model.base;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 阈值
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
@Table(name="limit_value")
public class LimitValue implements Serializable {
    private static final long serialVersionUID = 42L;

    @NotBlank(message = "ID不能为空")
    @Id
    @GeneratedValue(generator = "JDBC")
    @GenericGenerator(name = "JDBC", strategy = "uuid")
    @ApiModelProperty(value="id")
    @Column(name = "id")
    private String id;

    @ApiModelProperty(value="创建时间")
    @Column(name = "createTime")
    private Date createTime;

    @ApiModelProperty(value="更新时间")
    @Column(name = "updateTime")
    private Date updateTime;

    @ApiModelProperty(value="类型")
    @Column(name = "type")
    private Integer type;

    @ApiModelProperty(value="测量单位")
    @Column(name = "unit")
    private Integer unit;

    @ApiModelProperty(value="子类型")
    @Column(name = "subType")
    private Integer subType;

    @NotNull(message = "阈值不能为空")
    @ApiModelProperty(value="最大值")
    @Column(name = "limitValue")
    private Integer limitValue;

    @ApiModelProperty(value="备注")
    @Column(name = "remark")
    private String remark;
}