package com.ming.boot.reservation;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AirplaneDTO {
	@JsonProperty("항공사")
	private String company;
	@JsonProperty("운항편명")
	private String airplane_name;
	@JsonProperty("출발공항")
	private String depart_port;
	@JsonProperty("도착공항")
	private String arrive_port;
	@JsonProperty("출발시간")
	private String depart_time;
	@JsonProperty("도착시간")
	private String arrive_time;
	@JsonProperty("운항요일")
	private String airplane_day;
	@JsonProperty("시작일자")
	private String start_day;
	@JsonProperty("종료일자")
	private String end_day;
	@JsonProperty("국내_국제")
	private String di;
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getAirplane_name() {
		return airplane_name;
	}
	public void setAirplane_name(String airplane_name) {
		this.airplane_name = airplane_name;
	}
	public String getDepart_port() {
		return depart_port;
	}
	public void setDepart_port(String depart_port) {
		this.depart_port = depart_port;
	}
	public String getArrive_port() {
		return arrive_port;
	}
	public void setArrive_port(String arrive_port) {
		this.arrive_port = arrive_port;
	}
	public String getDepart_time() {
		return depart_time;
	}
	public void setDepart_time(String depart_time) {
		this.depart_time = depart_time;
	}
	public String getArrive_time() {
		return arrive_time;
	}
	public void setArrive_time(String arrive_time) {
		this.arrive_time = arrive_time;
	}
	public String getAirplane_day() {
		return airplane_day;
	}
	public void setAirplane_day(String airplane_day) {
		this.airplane_day = airplane_day;
	}
	public String getStart_day() {
		return start_day;
	}
	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}
	public String getEnd_day() {
		return end_day;
	}
	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}
	public String getDi() {
		return di;
	}
	public void setDi(String di) {
		this.di = di;
	}
}
