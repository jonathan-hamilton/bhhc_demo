package com.jhamilton.demo.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhamilton.demo.Model.ReasonModel;
import com.jhamilton.demo.Repository.ReasonRepository;

// Service Tier where the business logic is located
@Service
public class ReasonService {
	
	@Autowired
	ReasonRepository reasonRepository;

	public List<ReasonModel> getAllReasons() {
		List<ReasonModel> reasons = new ArrayList<ReasonModel>();
		reasonRepository.findAll().forEach(reasons::add);
		return reasons;
	}
	
	public void addReason(ReasonModel reason) {
		reasonRepository.save(reason);
	}
}
