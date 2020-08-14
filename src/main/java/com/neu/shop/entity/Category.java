package com.neu.shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * @Description  
 * @Author  Hunter
 * @Date 2020-07-28 
 */


@Entity
@Table ( name ="category" )
public class Category  implements Serializable {

	private static final long serialVersionUID =  2209329193567545824L;

   	@Column(name = "cateId" )
	private Long cateId;

   	@Column(name = "cateName" )
	private String cateName;

}
