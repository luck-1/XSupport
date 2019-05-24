package com.xsupport.model.manage;

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
 * @description 类型
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
@Table(name="big_type")
public class BigType implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "JDBC")
    @GenericGenerator(name = "JDBC", strategy = "uuid")
    @ApiModelProperty(value="id")
    @Column(name = "id",length = 32)
    private String id;

    @ApiModelProperty(value="类型")
    @Column(name = "type",length = 2)
    private Integer type;

    @ApiModelProperty(value="单位")
    @Column(name = "unit",length = 10)
    private String unit;

    @ApiModelProperty(value="异常定位显示")
    @Column(name = "exceptionLocationName",length = 20)
    private String exceptionLocationName;

    @ApiModelProperty(value="备注")
    @Column(name = "remark")
    private String remark;
}