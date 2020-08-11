package com.kitri.jejusari.dto;

public class SalesImgDto {
	private int image_index;
	private String image_url;
	private int sales_number;
	
	public SalesImgDto() {
	}

	public SalesImgDto(int image_index, String image_url, int sales_number) {
		super();
		this.image_index = image_index;
		this.image_url = image_url;
		this.sales_number = sales_number;
	}

	public int getImage_index() {
		return image_index;
	}

	public void setImage_index(int image_index) {
		this.image_index = image_index;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public int getSales_number() {
		return sales_number;
	}

	public void setSales_number(int sales_number) {
		this.sales_number = sales_number;
	}

	@Override
	public String toString() {
		return "SalesImgDto [image_index=" + image_index + ", image_url=" + image_url + ", sales_number=" + sales_number
				+ "]";
	}
	
}
