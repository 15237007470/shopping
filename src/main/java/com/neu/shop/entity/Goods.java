package com.neu.shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * @Description  
 * @Author  Hunter
 * @Date 2020-07-28 
 */

@Entity
@Table ( name ="goods" )
public class Goods  implements Serializable {

	private static final long serialVersionUID =  5970446280431598737L;

   	@Column(name = "goodsId" )
	private Long goodsId;

   	@Column(name = "goodsName" )
	private String goodsName;

   	@Column(name = "price" )
	private Long price;

   	@Column(name = "num" )
	private Long num;

   	@Column(name = "upTime" )
	private Date upTime;

   	@Column(name = "category" )
	private Long category;

   	@Column(name = "detailCate" )
	private String detailCate;

   	@Column(name = "description" )
	private String description;

   	@Column(name = "activityId" )
	private Long activityId;

}
