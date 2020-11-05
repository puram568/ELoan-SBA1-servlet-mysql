package com.iiht.evaluation.eloan.model;

public class LoanInfo {
	private String applno;
	private String purpose;
	private int amtrequest;
	private String doa;
	private String bstructure;
	private String bindicator;
	private String taxindicator;
	private String address;
	private String email;
	private String mobile;
	private String status;

	@Override
	public String toString() {
		return "LoanInfo [applno=" + applno + ", purpose=" + purpose + ", amtrequest=" + amtrequest + ", doa=" + doa
				+ ", bstructure=" + bstructure + ", bindicator=" + bindicator +", taxindicator=" + taxindicator + ", address=" + address + ", email="
				+ email + ", mobile=" + mobile + ", status=" + status + "]";
	}

	public LoanInfo() {

	}

	public LoanInfo(String applno, String purpose, int amtrequest, String doa, String bstructure, String bindicator,
			String taxindicator, String address, String email, String mobile, String status) {
		super();
		this.applno = applno;
		this.purpose = purpose;
		this.amtrequest = amtrequest;
		this.doa = doa;
		this.bstructure = bstructure;
		this.bindicator = bindicator;
		this.taxindicator = taxindicator;
		this.address = address;
		this.email = email;
		this.mobile = mobile;
		this.status = status;
	}

	public String getTaxindicator() {
		return taxindicator;
	}

	public void setTaxindicator(String taxindicator) {
		this.taxindicator = taxindicator;
	}

	public String getApplno() {
		return applno;
	}

	public void setApplno(String applno) {
		this.applno = applno;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public int getAmtrequest() {
		return amtrequest;
	}

	public void setAmtrequest(int amtrequest) {
		this.amtrequest = amtrequest;
	}

	public String getDoa() {
		return doa;
	}

	public void setDoa(String doa) {
		this.doa = doa;
	}

	public String getBstructure() {
		return bstructure;
	}

	public void setBstructure(String bstructure) {
		this.bstructure = bstructure;
	}

	public String getBindicator() {
		return bindicator;
	}

	public void setBindicator(String bindicator) {
		this.bindicator = bindicator;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

}
