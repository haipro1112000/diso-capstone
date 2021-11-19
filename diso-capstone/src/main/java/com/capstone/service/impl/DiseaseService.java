package com.capstone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.dao.DiseaseDAO;
import com.capstone.entity.DiseaseEntity;
import com.capstone.service.IDiseaseService;
@Service
public class DiseaseService implements IDiseaseService {

	@Autowired
	private DiseaseDAO diseaseDAO;
	
	@Override
	public DiseaseEntity getDataDiseaseById(int id) {
		
		return diseaseDAO.getDataDiseaseById(id);
	}

	@Override
	public List<DiseaseEntity> getDataDisease() {		
		return diseaseDAO.getDataDisease();
	}

}
