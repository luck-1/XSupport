package com.xsupport.model.measure;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Humidity.class)
public abstract class Humidity_ {

	public static volatile SingularAttribute<Humidity, Float> limitValue;
	public static volatile SingularAttribute<Humidity, Date> createTime;
	public static volatile SingularAttribute<Humidity, String> remark;
	public static volatile SingularAttribute<Humidity, String> id;
	public static volatile SingularAttribute<Humidity, Integer> state;
	public static volatile SingularAttribute<Humidity, Float> value;

	public static final String LIMIT_VALUE = "limitValue";
	public static final String CREATE_TIME = "createTime";
	public static final String REMARK = "remark";
	public static final String ID = "id";
	public static final String STATE = "state";
	public static final String VALUE = "value";

}

