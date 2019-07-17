package com.xsupport.model.manage;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(SysWarn.class)
public abstract class SysWarn_ {

	public static volatile SingularAttribute<SysWarn, Float> limitValue;
	public static volatile SingularAttribute<SysWarn, Integer> exceptionDescription;
	public static volatile SingularAttribute<SysWarn, Date> createTime;
	public static volatile SingularAttribute<SysWarn, Float> exceptionValue;
	public static volatile SingularAttribute<SysWarn, Date> updateTime;
	public static volatile SingularAttribute<SysWarn, Integer> exceptionState;
	public static volatile SingularAttribute<SysWarn, String> remark;
	public static volatile SingularAttribute<SysWarn, String> id;
	public static volatile SingularAttribute<SysWarn, Integer> exceptionLocation;
	public static volatile SingularAttribute<SysWarn, String> optionUser;

	public static final String LIMIT_VALUE = "limitValue";
	public static final String EXCEPTION_DESCRIPTION = "exceptionDescription";
	public static final String CREATE_TIME = "createTime";
	public static final String EXCEPTION_VALUE = "exceptionValue";
	public static final String UPDATE_TIME = "updateTime";
	public static final String EXCEPTION_STATE = "exceptionState";
	public static final String REMARK = "remark";
	public static final String ID = "id";
	public static final String EXCEPTION_LOCATION = "exceptionLocation";
	public static final String OPTION_USER = "optionUser";

}

