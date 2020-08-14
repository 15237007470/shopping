package com.neu.shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.Date;

/**
 * @Description  
 * @Author  Hunter
 * @Date 2020-08-02 
 */

@Setter
@Getter
@ToString
@Entity
@Table ( name ="shopcart" )
public class Shopcart  implements Serializable {

	private static final long serialVersionUID =  6972319367492293344L;

   	@Column(name = "userId" )
	private Long userId;

   	@Column(name = "goodsid" )
	private Long goodsid;

   	@Column(name = "cateDate" )
	private Date cateDate;

   	@Column(name = "goodsNum" )
	private Long goodsNum;

}
