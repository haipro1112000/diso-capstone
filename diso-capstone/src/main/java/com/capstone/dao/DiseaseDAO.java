package com.capstone.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.capstone.entity.DiseaseEntity;
import com.capstone.entity.DiseaseMapper;
@Repository
public class DiseaseDAO extends BaseDAO{
	private String sqlString(int id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from disease ");
		sql.append("where id = " + id);
		return sql.toString();
	}
	
	public List<DiseaseEntity> getDataDisease() {
		List<DiseaseEntity> disease = new ArrayList<>();
		String sql = "select * from disease";
		try {
			disease = _jdbcTemplate.query(sql, new DiseaseMapper());
			return disease;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public DiseaseEntity getDataDiseaseById(int id) {
		DiseaseEntity disease = new DiseaseEntity();
		try {
			disease = _jdbcTemplate.query(sqlString(id), new DiseaseMapper()).get(0);
			return disease;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
