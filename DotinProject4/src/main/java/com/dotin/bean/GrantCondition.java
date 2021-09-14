package com.dotin.bean;

import javax.persistence.*;

@Entity
@Table(name = "GRANTCONDITION")
public class GrantCondition {

	@Id
	@GeneratedValue()
	@Column(name = "ID")
	private int id;
	@Column(name = "NAME")
	private String name;
	@Column(name = "MINIMUMCONTRACTPERIOD")
	private int minimumContractPeriod;

	@Column(name = "MAXIMUMCONTRACTPERIOD")
	private int maximumContractPeriod;

	@Column(name = "MINIMUMCONTRACTAMOUNT")
	private int minimumContractAmount;

	@Column(name = "MAXIMUMCONTRACTAMOUNT")
	private int maximumContractAmount;

	@ManyToOne(cascade = CascadeType.ALL)
	private LoanType loanType;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMinimumContractPeriod() {
		return minimumContractPeriod;
	}

	public void setMinimumContractPeriod(int minimumContractPeriod) {
		this.minimumContractPeriod = minimumContractPeriod;
	}

	public int getMaximumContractPeriod() {
		return maximumContractPeriod;
	}

	public void setMaximumContractPeriod(int maximumContractPeriod) {
		this.maximumContractPeriod = maximumContractPeriod;
	}

	public int getMinimumContractAmount() {
		return minimumContractAmount;
	}

	public void setMinimumContractAmount(int minimumContractAmount) {
		this.minimumContractAmount = minimumContractAmount;
	}

	public int getMaximumContractAmount() {
		return maximumContractAmount;
	}

	public void setMaximumContractAmount(int maximumContractAmount) {
		this.maximumContractAmount = maximumContractAmount;
	}

	public LoanType getLoanType() {
		return loanType;
	}

	public void setLoanType(LoanType loanType) {
		this.loanType = loanType;
	}

}
