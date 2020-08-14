package com.neu.shop.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * @Description  
 * @Author  xcy
 * @Date 2020-08-02 
 */

@Setter
@Getter
@ToString
@Entity
@Table ( name ="user" )
public class User  implements Serializable {

	private static final long serialVersionUID =  5947553305309970461L;

   	@Column(name = "userId" )
	private Long userId;

   	@Column(name = "username" )
	private String username;

   	@Column(name = "password" )
	private String password;

   	@Column(name = "regTime" )
	private Date regTime;

   	@Column(name = "email" )
	private String email;

   	@Column(name = "telephone" )
	private String telephone;

}
