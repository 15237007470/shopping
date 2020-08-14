package com.neu.shop.entity;


public class Address {

  private long addressId;
  private long userId;
  private String province;
  private String city;
  private String county;
  private String detailAddr;
  private String conName;
  private String conTel;
  public Address(long userId,String city){
    this.userId = userId;
    this.city = city;
  }
  public Address(){}
  public String toString(){
    return "userID:"+userId+"city:"+city;
  }


  public long getAddressId() {
    return addressId;
  }

  public void setAddressId(long addressId) {
    this.addressId = addressId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getProvince() {
    return province;
  }

  public void setProvince(String province) {
    this.province = province;
  }


  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }


  public String getCounty() {
    return county;
  }

  public void setCounty(String county) {
    this.county = county;
  }


  public String getDetailAddr() {
    return detailAddr;
  }

  public void setDetailAddr(String detailAddr) {
    this.detailAddr = detailAddr;
  }


  public String getConName() {
    return conName;
  }

  public void setConName(String conName) {
    this.conName = conName;
  }


  public String getConTel() {
    return conTel;
  }

  public void setConTel(String conTel) {
    this.conTel = conTel;
  }

}
