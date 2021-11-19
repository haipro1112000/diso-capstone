package com.capstone.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DiseaseMapper implements RowMapper<DiseaseEntity>{

	@Override
	public DiseaseEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		DiseaseEntity disease =  new DiseaseEntity();
		disease.setName(rs.getString("name"));
		disease.setImage1(rs.getString("image1"));
		disease.setImage2(rs.getString("image2"));
		disease.setImage3(rs.getString("image3"));
		disease.setReason(rs.getString("reason"));
		disease.setSymptom(rs.getString("symptom"));
		disease.setPrevention(rs.getString("prevention"));
		disease.setMedicine(rs.getString("medicine"));
		return disease;
	}

}
