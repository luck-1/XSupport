package com.xsupport.model.http;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.xsupport.model.measure.Displacement;
import lombok.Data;

import java.util.Date;

/**
 * @author lxc
 * @date 2019/4/24
 * @description
 */
@Data
public class SendTextParam {

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date time;

    private Integer bigType;

    private Integer subIndex;

    private Float value;

    private Displacement displacement;

    public SendTextParam(Integer bigType, Integer subIndex, Float value) {

        this.time = new Date();
        this.bigType = bigType;
        this.subIndex = subIndex;
        this.value = value;
    }

    public SendTextParam(Integer bigType,Displacement displacement) {

        this.time = new Date();
        this.bigType = bigType;
        this.displacement = displacement;
    }
}