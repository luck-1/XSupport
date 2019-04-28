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
    private String type;

    @ApiModelProperty(value="最大值")
    @Column(name = "limitValue")
    private String limitValue;

    @ApiModelProperty(value="数值单位")
    @Column(name = "suffixName")
    private String suffixName;

    @ApiModelProperty(value="备注")
    @Column(name = "remark")
    private String remark;
}