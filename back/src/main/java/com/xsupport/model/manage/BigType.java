package com.xsupport.model.base;

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
    @Column(name = "id")
    private String id;

    @ApiModelProperty(value="类型")
    @Column(name = "type")
    private Integer type;

    @ApiModelProperty(value="单位")
    @Column(name = "unit")
    private String unit;

    @ApiModelProperty(value="备注")
    @Column(name = "remark")
    private String remark;
}