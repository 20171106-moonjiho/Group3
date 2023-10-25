package com.ming.boot.reservation;

public class ReservationDTO {
	private String seat_no;
	private int airplane_no;
	private String grade;
	private String id;
	public String getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}
	public int getAirplane_no() {
		return airplane_no;
	}
	public void setAirplane_no(int airplane_no) {
		this.airplane_no = airplane_no;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
