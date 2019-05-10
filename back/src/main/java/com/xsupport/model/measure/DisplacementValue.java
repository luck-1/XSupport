package com.xsupport.model.measure;

import java.io.Serializable;
import lombok.Data;
import javax.persistence.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移值
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
@Table(name="displacement_value")
public class DisplacementValue implements Serializable {
    private static final long serialVersionUID = 42L;

    @Id
    @GeneratedValue(generator = "JDBC")
    @GenericGenerator(name = "JDBC", strategy = "uuid")
    @ApiModelProperty(value="id")
    @Column(name = "id")
    private String id;

    @ApiModelProperty(value="x值")
    @Column(name = "x")
    private Float x;

    @ApiModelProperty(value="y值")
    @Column(name = "y")
    private Float y;

    @ApiModelProperty(value="z值")
    @Column(name = "z")
    private Float z;

    public DisplacementValue(){
    }

    public DisplacementValue(String id,Float x,Float y,Float z){
        this.id = id;
        this.x = x;
        this.y = y;
        this.z = z;
    }
}