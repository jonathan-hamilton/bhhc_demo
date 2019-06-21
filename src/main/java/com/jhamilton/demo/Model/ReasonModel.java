package com.jhamilton.demo.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

// Data object that is persisted in the h2 database in a table named "reasons"
@Entity
@Table(name="reasons")
public class ReasonModel {
	
	// Indicates the PK of the table
	@Id
	@GeneratedValue
	private Long id;
	private String reason;
	
	public ReasonModel() {}
	
	public ReasonModel(Long id, String reason) {
		this.id = id;
		this.reason = reason;
	}

	public Long getId() {
		return id;
	}

	public String getReason() {
		return reason;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}
