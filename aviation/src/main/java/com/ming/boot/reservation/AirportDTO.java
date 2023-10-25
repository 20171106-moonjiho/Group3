package com.ming.boot.reservation;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AirportDTO {
/*
create table airport_db(
airport_code varchar2(3) not null,
nation varchar2(30) not null,
airport_name varchar2(30) not null,
primary key(airport_code)
); 
*/	
	@JsonProperty("공항코드1(IATA)")
	private String airport_code;
	@JsonProperty("한글국가명")
	private String nation;
	@JsonProperty("한글공항명")
	private String airport_name;
	public String getAirport_name() {
		return airport_name;
	}
	public void setAirport_name(String airport_name) {
		this.airport_name = airport_name;
	}
	public String getAirport_code() {
		return airport_code;
	}
	public void setAirport_code(String airport_code) {
		this.airport_code = airport_code;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
}