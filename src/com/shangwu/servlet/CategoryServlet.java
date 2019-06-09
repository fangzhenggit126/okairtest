package com.shangwu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.google.gson.Gson;
import com.shangwu.po.Category;
import com.shangwu.po.Employee;
import com.shangwu.po.TableInfo;
import com.shangwu.service.CategoryService;
import com.shangwu.service.impl.CategoryServiceImpl;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/categoryservlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryService categoryService=new CategoryServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action =request.getParameter("action");
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
			String parentCn=request.getParameter("parentCn");
			if(nameCn!=null)
			{
				nameCn= new String(nameCn.getBytes("ISO8859-1"), "UTF-8");
			}
			if(parentCn!=null)
			{
				parentCn= new String(parentCn.getBytes("ISO8859-1"), "UTF-8");
			}
			
			
			List<Category> categoris=categoryService.selectCategoryByPage((Integer.parseInt(pageNumber)-1)*Integer.parseInt(pageSize), Integer.parseInt(pageSize), nameCn, parentCn);
		    int count=categoryService.selectCategoryCount(nameCn, parentCn);
		    //定义的json对象
		    Gson obj=new Gson();
			
			String categorytr=obj.toJson(categoris);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json;charset=utf-8");
			TableInfo<Category> tableInfo = new TableInfo<Category>();
			tableInfo.setTotal(count);
			tableInfo.setOffset(Integer.parseInt(pageNumber));
			tableInfo.setLimit(Integer.parseInt(pageSize));
		    tableInfo.setData(categoris);
		    PrintWriter out = response.getWriter();
		    out.println(obj.toJson(tableInfo));
			
			System.out.println(obj.toJson(tableInfo));
	 }
    private void all(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
    	String id =request.getParameter("id");
		
		List<Category> categories=categoryService.selectCategoryByParentId(Integer.parseInt(id));
		
		
         Gson obj=new Gson();
		
		String categorystr=obj.toJson(categories);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.append(categorystr);
		System.out.println(categorystr);
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
