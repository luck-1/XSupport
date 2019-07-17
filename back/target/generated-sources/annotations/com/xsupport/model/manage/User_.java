package com.xsupport.model.manage;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(User.class)
public abstract class User_ {

	public static volatile SingularAttribute<User, String> password;
	public static volatile SingularAttribute<User, String> address;
	public static volatile SingularAttribute<User, Boolean> isForbidden;
	public static volatile SingularAttribute<User, Date> createTime;
	public static volatile SingularAttribute<User, String> phone;
	public static volatile SingularAttribute<User, Integer> sex;
	public static volatile SingularAttribute<User, String> name;
	public static volatile SingularAttribute<User, String> remark;
	public static volatile SingularAttribute<User, String> id;
	public static volatile SingularAttribute<User, Integer> isAdmin;
	public static volatile SingularAttribute<User, Integer> age;
	public static volatile SingularAttribute<User, String> username;

	public static final String PASSWORD = "password";
	public static final String ADDRESS = "address";
	public static final String IS_FORBIDDEN = "isForbidden";
	public static final String CREATE_TIME = "createTime";
	public static final String PHONE = "phone";
	public static final String SEX = "sex";
	public static final String NAME = "name";
	public static final String REMARK = "remark";
	public static final String ID = "id";
	public static final String IS_ADMIN = "isAdmin";
	public static final String AGE = "age";
	public static final String USERNAME = "username";

}

