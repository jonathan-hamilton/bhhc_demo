package com.jhamilton.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jhamilton.demo.Model.ReasonModel;

// By extending the JpaRepository interface, many CRUD methods become available
@Repository
public interface ReasonRepository extends JpaRepository<ReasonModel, Long>{}
