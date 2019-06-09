package com.shangwu.service.impl;

import java.util.List;

import com.shangwu.dao.EmployeeDao;
import com.shangwu.dao.impl.EmployeeDaoImpl;
import com.shangwu.po.Employee;
import com.shangwu.service.EmployeeService;

public class EmployeeServiceImpl implements EmployeeService {
	EmployeeDao employeeDao=new EmployeeDaoImpl();
	@Override
	public List<Employee> selectEmployees() {
		// TODO Auto-generated method stub
		return employeeDao.selectEmployees();
	}
	@Override
	public List<Employee> selectEmployeesPage(int pageNumber, int pageSize, String nameCn, String dept) {
		// TODO Auto-generated method stub
		return employeeDao.selectEmployeesPage(pageNumber, pageSize, nameCn, dept);
	}
	@Override
	public Integer selectEmployeesCount(String nameCn, String dept) {
		// TODO Auto-generated method stub
		return employeeDao.selectEmployeesCount(nameCn, dept);
	}

}
