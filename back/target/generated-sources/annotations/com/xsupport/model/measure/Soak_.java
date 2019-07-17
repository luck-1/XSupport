package com.xsupport.model.measure;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Soak.class)
public abstract class Soak_ {

	public static volatile SingularAttribute<Soak, Float> limitValue;
	public static volatile SingularAttribute<Soak, Date> createTime;
	public static volatile SingularAttribute<Soak, String> remark;
	public static volatile SingularAttribute<Soak, String> id;
	public static volatile SingularAttribute<Soak, Integer> state;
	public static volatile SingularAttribute<Soak, Integer> type;
	public static volatile SingularAttribute<Soak, Float> value;

	public static final String LIMIT_VALUE = "limitValue";
	public static final String CREATE_TIME = "createTime";
	public static final String REMARK = "remark";
	public static final String ID = "id";
	public static final String STATE = "state";
	public static final String TYPE = "type";
	public static final String VALUE = "value";

}

