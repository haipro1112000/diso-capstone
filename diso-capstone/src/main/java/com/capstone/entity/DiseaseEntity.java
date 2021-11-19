package com.capstone.entity;

public class DiseaseEntity {
	private int id;
	private String name;
	private String image1;
	private String image2;
	private String image3;
	private String reason;
	private String symptom;
	private String prevention;
	private String medicine;
	
	public DiseaseEntity(){
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public String getPrevention() {
		return prevention;
	}

	public void setPrevention(String prevention) {
		this.prevention = prevention;
	}

	public int getId() {
		return id;
	}

	public String getMedicine() {
		return medicine;
	}

	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}
	
}
