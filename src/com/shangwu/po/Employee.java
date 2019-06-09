package com.shangwu.po;

public class Employee {
	private int id;
	private String empNo;
	private String namecn;
	private int reportTo;
	private String report_To;
	public String getReport_To() {
		return report_To;
	}
	public void setReport_To(String report_To) {
		this.report_To = report_To;
	}
	private String dept;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getNamecn() {
		return namecn;
	}
	public void setNamecn(String namecn) {
		this.namecn = namecn;
	}
	public int getReportTo() {
		return reportTo;
	}
	public void setReportTo(int reportTo) {
		this.reportTo = reportTo;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
} 
