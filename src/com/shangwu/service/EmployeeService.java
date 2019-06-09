package com.shangwu.service;

import java.util.List;

import com.shangwu.po.Employee;

public interface EmployeeService {
	public List<Employee> selectEmployees();
	public List<Employee> selectEmployeesPage(int pageNumber,int pageSize,String nameCn,String dept);
	public Integer selectEmployeesCount(String nameCn,String dept);
}
