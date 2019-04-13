package com.xsupport.model.base;

import java.io.Serializable;
import lombok.Data;
import javax.persistence.*;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author lxc
 * @date 2019/4/13
 * @description temp
 */
@Data
@Entity
@DynamicUpdate
@Table(name="temp")
public class Temp implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @ApiModelProperty(value="id")
    @Column(name = "id")
    private int id;

    @ApiModelProperty(value="name")
    @Column(name = "name")
    private String name;

    @ApiModelProperty(value="count")
    @Column(name = "count")
    private int count;
}