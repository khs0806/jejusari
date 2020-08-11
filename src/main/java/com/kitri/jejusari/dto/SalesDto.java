package com.kitri.jejusari.dto;

public class SalesDto {
	private String room_type;
	private String rent_option;
	private String title;
	private String option;
	
	private int cost;
	private float area;
	private int build_year;
	
	private String road_address;
	private String jibun_address;
	private String detail_address;
	private String extra_address;
	
	public SalesDto() {
	}

	public SalesDto(String room_type, String rent_option, String title, String option, int cost, float area,
			int build_year, String road_address, String jibun_address, String detail_address, String extra_address) {
		this.room_type = room_type;
		this.rent_option = rent_option;
		this.title = title;
		this.option = option;
		this.cost = cost;
		this.area = area;
		this.build_year = build_year;
		this.road_address = road_address;
		this.jibun_address = jibun_address;
		this.detail_address = detail_address;
		this.extra_address = extra_address;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getRent_option() {
		return rent_option;
	}

	public void setRent_option(String rent_option) {
		this.rent_option = rent_option;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public float getArea() {
		return area;
	}

	public void setArea(float area) {
		this.area = area;
	}

	public int getBuild_year() {
		return build_year;
	}

	public void setBuild_year(int build_year) {
		this.build_year = build_year;
	}

	public String getRoad_address() {
		return road_address;
	}

	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}

	public String getJibun_address() {
		return jibun_address;
	}

	public void setJibun_address(String jibun_address) {
		this.jibun_address = jibun_address;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

	public String getExtra_address() {
		return extra_address;
	}

	public void setExtra_address(String extra_address) {
		this.extra_address = extra_address;
	}

	@Override
	public String toString() {
		return "SalesDto [room_type=" + room_type + ", rent_option=" + rent_option + ", title=" + title + ", option="
				+ option + ", cost=" + cost + ", area=" + area + ", build_year=" + build_year + ", road_address="
				+ road_address + ", jibun_address=" + jibun_address + ", detail_address=" + detail_address
				+ ", extra_address=" + extra_address + "]";
	}
	
	
}
