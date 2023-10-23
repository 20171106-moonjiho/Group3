package com.ming.boot.seat;

public class SeatDTO {

	private int airplane_no;
	private String seat_no;
	private String member_id;
	public int getAirplane_no() {
		return airplane_no;
	}
	public void setAirplane_no(int airplane_no) {
		this.airplane_no = airplane_no;
	}
	public String getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
