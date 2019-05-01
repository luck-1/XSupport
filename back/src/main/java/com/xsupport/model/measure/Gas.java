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
 * @date 2019/4/30
 * @description 有毒气体
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
@Table(name="gas")
public class Gas implements Serializable {
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

    @ApiModelProperty(value="类型")
    @Column(name = "type")
    private Integer type;

    @ApiModelProperty(value="大类型")
    @Column(name = "bigType")
    private Integer bigType;

    @ApiModelProperty(value="子序号")
    @Column(name = "subIndex")
    private Integer subIndex;

    @ApiModelProperty(value="采集值")
    @Column(name = "value")
    private Float value;

    @ApiModelProperty(value="阈值")
    @Column(name = "limitValue")
    private Float limitValue;

    @ApiModelProperty(value="状态")
    @Column(name = "state")
    private Integer state;

    @ApiModelProperty(value="备注")
    @Column(name = "remark")
    private String remark;

    public Gas() {
    }

    public Gas(Integer bigType,Integer subIndex,Float value, Float limitValue) {

        this.bigType = bigType;
        this.subIndex = subIndex;
        this.value = value;
        this.limitValue = limitValue;

        this.state = limitValue > value ? 0 : 1;
    }
}