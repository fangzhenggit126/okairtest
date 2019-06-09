package com.shangwu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import com.shangwu.po.Employee;
import com.shangwu.po.TableInfo;
import com.shangwu.service.EmployeeService;

import com.shangwu.service.impl.EmployeeServiceImpl;


/**
 * Servlet implementation class EmployeeServlet
 */
@WebServlet("/employeeservlet")
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeService employeeService=new EmployeeServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String action=request.getParameter("action");
		if("all".equals(action))
		{
			this.all(request, response);
		}
		else if("page".equals(action))
		{
			this.getPage(request, response);
		}
		
	}
	private void getPage(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String pageNumber=request.getParameter("pageNumber");
		String pageSize=request.getParameter("pageSize");
		String nameCn=request.getParameter("nameCn");
		String dept=request.getParameter("dept");
		if(nameCn!=null)
		{
			nameCn= new String(nameCn.getBytes("ISO8859-1"), "UTF-8");
		}
		if(dept!=null)
		{
			dept= new String(dept.getBytes("ISO8859-1"), "UTF-8");
		}
		
		
		List<Employee> employees=employeeService.selectEmployeesPage((Integer.parseInt(pageNumber)-1)*Integer.parseInt(pageSize), Integer.parseInt(pageSize), nameCn, dept);
	    int count=employeeService.selectEmployeesCount(nameCn, dept);
	    //定义的json对象
	    Gson obj=new Gson();
		
		String employeestr=obj.toJson(employees);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=utf-8");
		TableInfo<Employee> tableInfo = new TableInfo<Employee>();
		tableInfo.setTotal(count);
		tableInfo.setOffset(Integer.parseInt(pageNumber));
		tableInfo.setLimit(Integer.parseInt(pageSize));
	    tableInfo.setData(employees);
	    PrintWriter out = response.getWriter();
	    out.println(obj.toJson(tableInfo));
		
		System.out.println(obj.toJson(tableInfo));
	}
private void all(HttpServletRequest request, HttpServletResponse response) throws IOException
{
	List<Employee> employees=employeeService.selectEmployees();
	
	
    Gson obj=new Gson();
	
	String employeestr=obj.toJson(employees);
	response.setCharacterEncoding("UTF-8");
	response.setContentType("application/json;charset=utf-8");
	PrintWriter out = response.getWriter();
	out.append(employeestr);
	System.out.println(employeestr);
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
