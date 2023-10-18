package com.ming.boot.reservation;

public class ScheduleDTO {
	private int airplane_no;
	private String company;
	private String airplane_name;
	private String depart_port;
	private String arrive_port;
	private String depart_time;
	private String arrive_time;
	private String airplane_date;
	public int getAirplane_no() {
		return airplane_no;
	}
	public void setAirplane_no(int airplane_no) {
		this.airplane_no = airplane_no;
	}
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
	public String getAirplane_date() {
		return airplane_date;
	}
	public void setAirplane_date(String airplane_date) {
		this.airplane_date = airplane_date;
	}
}
