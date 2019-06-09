package com.shangwu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.shangwu.po.Assetstrans;
import com.shangwu.po.Employee;
import com.shangwu.po.TableInfo;
import com.shangwu.service.AssetstransService;
import com.shangwu.service.impl.AssetstransServiceImpl;

/**
 * Servlet implementation class AssetstransServlet
 */
@WebServlet("/assetstransServlet")
public class AssetstransServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AssetstransService assetstransService=new AssetstransServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssetstransServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		if("input".equals(action))
		{
			this.input(request, response);
		}
		else if("record".equals(action))
		{
			this.record(request, response);
		}
		
	}
	protected void record(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String assetsId=request.getParameter("assetsId");
		String pageNumber=request.getParameter("pageNumber");
		String pageSize=request.getParameter("pageSize");
		if(pageNumber==null)
		{
			pageNumber="1";
		}
		if(pageSize==null)
		{
			pageSize="5";
		}
		List<Assetstrans> assetstranslist=assetstransService.selectAssetstransPage((Integer.parseInt(pageNumber)-1)*Integer.parseInt(pageSize), Integer.parseInt(pageSize), assetsId);
	    int count=assetstransService.selectAssetstransCount(assetsId);
	    //定义的json对象
	    Gson obj=new Gson();
		
		String employeestr=obj.toJson(assetstranslist);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=utf-8");
		TableInfo<Assetstrans> tableInfo = new TableInfo<Assetstrans>();
		tableInfo.setTotal(count);
		tableInfo.setOffset(Integer.parseInt(pageNumber));
		tableInfo.setLimit(Integer.parseInt(pageSize));
	    tableInfo.setData(assetstranslist);
	    PrintWriter out = response.getWriter();
	    out.println(obj.toJson(tableInfo));
		
		System.out.println(obj.toJson(tableInfo));
	}
	protected void input(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String transType=request.getParameter("transType");
		String assetsId=request.getParameter("assetsId");
		String batchNo=request.getParameter("batchNo");
		String comment=request.getParameter("comment");
		String count=request.getParameter("count");
		String handlerEmp=request.getParameter("handlerEmp");
		String instockTime=request.getParameter("instockTime");
		String price=request.getParameter("price");
		String targetEmp=request.getParameter("targetEmp");
		Assetstrans as=new Assetstrans();
		
		as.setAssetsId(assetsId);
		as.setBatchNo(batchNo);
		as.setComment(comment);
		as.setCount(Integer.parseInt(count));
		as.setHandlerEmp(handlerEmp);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		as.setInstockTime(instockTime);
		
		as.setPrice(Double.parseDouble(price));
		as.setTargetEmp(targetEmp);
		as.setTransType(transType);
		int rows=assetstransService.inputAssetstrans(as);
		PrintWriter out = response.getWriter();
	    if(rows > 0){
	      out.print("OK");
	    }else{
	    	out.print("FAIL");
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
