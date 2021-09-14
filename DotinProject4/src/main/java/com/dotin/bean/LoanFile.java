package com.dotin.bean;

import javax.persistence.*;

@Entity
@Table(name = "LOANFILE")
public class LoanFile {

	@Id
	@GeneratedValue()
	@Column(name = "ID")
	private int id;

	@Column(name = "CONTRACTPERIOD", nullable = false)
	private int contractPeriod;

	@Column(name = "AMOUNT", nullable = false)
	private int amount;
	
	@Column(name = "STATE", nullable = false)
	private String state = "ÝÚÇá";

	@ManyToOne(cascade = CascadeType.ALL)
	private LoanType loanType;

	@ManyToOne(cascade = CascadeType.ALL)
	private Customer customer;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getContractPeriod() {
		return contractPeriod;
	}

	public void setContractPeriod(int contractPeriod) {
		this.contractPeriod = contractPeriod;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public LoanType getLoanType() {
		return loanType;
	}

	public void setLoanType(LoanType loanType) {
		this.loanType = loanType;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

}
