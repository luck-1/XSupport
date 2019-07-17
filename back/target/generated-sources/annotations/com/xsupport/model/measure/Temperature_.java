package com.xsupport.model.measure;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Temperature.class)
public abstract class Temperature_ {

	public static volatile SingularAttribute<Temperature, Float> limitValue;
	public static volatile SingularAttribute<Temperature, Date> createTime;
	public static volatile SingularAttribute<Temperature, String> remark;
	public static volatile SingularAttribute<Temperature, String> id;
	public static volatile SingularAttribute<Temperature, Integer> state;
	public static volatile SingularAttribute<Temperature, Float> value;

	public static final String LIMIT_VALUE = "limitValue";
	public static final String CREATE_TIME = "createTime";
	public static final String REMARK = "remark";
	public static final String ID = "id";
	public static final String STATE = "state";
	public static final String VALUE = "value";

}

