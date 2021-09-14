package com.dotin.bean;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "CUSTOMER")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", nullable = false)
	private int id;

	@Column(name = "NAME", nullable = false)
	private String name;

	@Column(name = "FAMILY", nullable = false)
	private String family;

	@Column(name = "FATHERNAME", nullable = false)
	private String fatherName;

	@Column(name = "GENDER", nullable = false)
	private boolean gender;

	@Column(name = "BIRTHDAY", nullable = false)
	private String birthday;

	@Column(name = "NATIONALCODE", nullable = false, unique = true)
	private String nationalCode;

	@Column(name = "PLACEOFBIRTH", nullable = false)
	private String placeOfBirth;

	@Column(name = "ADDRESS", nullable = false)
	private String address;

	@Column(name = "MOBILENUMBER", nullable = false)
	private String mobileNumber;

	@Column(name = "PHONENUMBER", nullable = false)
	private String phoneNumber;

	@Column(name = "CUSTOMERNUMBER", nullable = false)
	private int customerNumber = 1;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_ID")
	private Set<LoanFile> loanFiles = new HashSet<LoanFile>(0);

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

	public String getFamily() {
		return family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getNationalCode() {
		return nationalCode;
	}

	public void setNationalCode(String nationalCode) {
		this.nationalCode = nationalCode;
	}

	public String getPlaceOfBirth() {
		return placeOfBirth;
	}

	public void setPlaceOfBirth(String placeOfBirth) {
		this.placeOfBirth = placeOfBirth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(int customerNumber) {
		this.customerNumber = customerNumber;
	}

	public Set<LoanFile> getLoanFiles() {
		return loanFiles;
	}

	public void setLoanFiles(Set<LoanFile> loanFiles) {
		this.loanFiles = loanFiles;
	}

	

}
