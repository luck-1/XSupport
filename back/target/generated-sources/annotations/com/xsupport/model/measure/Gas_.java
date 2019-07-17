package com.xsupport.model.measure;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Gas.class)
public abstract class Gas_ {

	public static volatile SingularAttribute<Gas, Integer> subIndex;
	public static volatile SingularAttribute<Gas, Float> limitValue;
	public static volatile SingularAttribute<Gas, Date> createTime;
	public static volatile SingularAttribute<Gas, Integer> bigType;
	public static volatile SingularAttribute<Gas, String> remark;
	public static volatile SingularAttribute<Gas, String> id;
	public static volatile SingularAttribute<Gas, Integer> state;
	public static volatile SingularAttribute<Gas, Float> value;

	public static final String SUB_INDEX = "subIndex";
	public static final String LIMIT_VALUE = "limitValue";
	public static final String CREATE_TIME = "createTime";
	public static final String BIG_TYPE = "bigType";
	public static final String REMARK = "remark";
	public static final String ID = "id";
	public static final String STATE = "state";
	public static final String VALUE = "value";

}

