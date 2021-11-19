package com.capstone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.capstone.entity.DiseaseEntity;
@Service
public interface IDiseaseService {
	DiseaseEntity getDataDiseaseById(int id);
	
	List<DiseaseEntity> getDataDisease();
}
