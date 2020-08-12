package com.kitri.jejusari.dto;

public class SalesDto {
	private int sales_number;
	private String member_id;
	private String sales_date;
	private String sales_title;
	private String sales_content;
	private String sales_category_type;		// 매매
	private String sales_category_rent;		// 전월세
	private int sales_deposit;
	private int sales_cost;					// 매매가 or 전월세
	private int sales_factor_total;
	private int sales_area;
	private String sales_address;
	private int sales_check_blind;
	private int sales_count;
	private String option;
	private int sales_build_year;
	private String sales_floor;
	
	public SalesDto() {
	}

	public SalesDto(int sales_number, String member_id, String sales_date, String sales_title, String sales_content,
			String sales_category_type, String sales_category_rent, int sales_deposit, int sales_cost, int sales_factor_total,
			int sales_area, String sales_address, int sales_check_blind, int sales_count, String option,
			int sales_build_year, String sales_floor) {
		super();
		this.sales_number = sales_number;
		this.member_id = member_id;
		this.sales_date = sales_date;
		this.sales_title = sales_title;
		this.sales_content = sales_content;
		this.sales_category_type = sales_category_type;
		this.sales_category_rent = sales_category_rent;
		this.sales_deposit = sales_deposit;
		this.sales_cost = sales_cost;
		this.sales_factor_total = sales_factor_total;
		this.sales_area = sales_area;
		this.sales_address = sales_address;
		this.sales_check_blind = sales_check_blind;
		this.sales_count = sales_count;
		this.option = option;
		this.sales_build_year = sales_build_year;
		this.sales_floor = sales_floor;
	}

	public int getSales_number() {
		return sales_number;
	}

	public void setSales_number(int sales_number) {
		this.sales_number = sales_number;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getSales_date() {
		return sales_date;
	}

	public void setSales_date(String sales_date) {
		this.sales_date = sales_date;
	}

	public String getSales_title() {
		return sales_title;
	}

	public void setSales_title(String sales_title) {
		this.sales_title = sales_title;
	}

	public String getSales_content() {
		return sales_content;
	}

	public void setSales_content(String sales_content) {
		this.sales_content = sales_content;
	}

	public String getSales_category_type() {
		return sales_category_type;
	}

	public void setSales_category_type(String sales_category_type) {
		this.sales_category_type = sales_category_type;
	}

	public String getSales_category_rent() {
		return sales_category_rent;
	}

	public void setSales_category_rent(String sales_category_rent) {
		this.sales_category_rent = sales_category_rent;
	}

	public int getSales_deposit() {
		return sales_deposit;
	}

	public void setSales_deposit(int sales_deposit) {
		this.sales_deposit = sales_deposit;
	}

	public int getSales_cost() {
		return sales_cost;
	}
	
	public void setSales_cost(int sales_cost) {
		this.sales_cost = sales_cost;
	}
	
	public int getSales_factor_total() {
		return sales_factor_total;
	}

	public void setSales_factor_total(int sales_factor_total) {
		this.sales_factor_total = sales_factor_total;
	}

	public int getSales_area() {
		return sales_area;
	}

	public void setSales_area(int sales_area) {
		this.sales_area = sales_area;
	}

	public String getSales_address() {
		return sales_address;
	}

	public void setSales_address(String sales_address) {
		this.sales_address = sales_address;
	}

	public int getSales_check_blind() {
		return sales_check_blind;
	}

	public void setSales_check_blind(int sales_check_blind) {
		this.sales_check_blind = sales_check_blind;
	}

	public int getSales_count() {
		return sales_count;
	}

	public void setSales_count(int sales_count) {
		this.sales_count = sales_count;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getSales_build_year() {
		return sales_build_year;
	}

	public void setSales_build_year(int sales_build_year) {
		this.sales_build_year = sales_build_year;
	}

	public String getSales_floor() {
		return sales_floor;
	}

	public void setSales_floor(String sales_floor) {
		this.sales_floor = sales_floor;
	}

	@Override
	public String toString() {
		return "SalesDto [sales_number=" + sales_number + ", member_id=" + member_id + ", sales_date=" + sales_date
				+ ", sales_title=" + sales_title + ", sales_content=" + sales_content + ", sales_category_type="
				+ sales_category_type + ", sales_category_rent=" + sales_category_rent + ", sales_deposit="
				+ sales_deposit + ", sales_cost=" + sales_cost + ", sales_factor_total=" + sales_factor_total
				+ ", sales_area=" + sales_area + ", sales_address=" + sales_address + ", sales_check_blind="
				+ sales_check_blind + ", sales_count=" + sales_count + ", option=" + option + ", sales_build_year="
				+ sales_build_year + ", sales_floor=" + sales_floor + "]";
	}
	
}
