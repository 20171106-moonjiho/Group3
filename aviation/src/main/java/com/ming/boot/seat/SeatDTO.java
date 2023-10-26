package com.ming.boot.seat;

/*
create table seat_db(
airplane_no number not null,
seat_no varchar2(5) not null,
member_id varchar2(20) not null,
passenger_name varchar2(20) not null,
constraint seat_pk primary key(airplane_no, seat_no));

*/

public class SeatDTO {

	private int airplane_no;
	private String seat_no;
	private String member_id;
	private String passenger_name;
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
	public String getPassenger_name() {
		return passenger_name;
	}
	public void setPassenger_name(String passenger_name) {
		this.passenger_name = passenger_name;
	}
}
