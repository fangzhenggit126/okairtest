package com.shangwu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.shangwu.common.utils.Page;
import com.shangwu.dao.CategoryDao;
import com.shangwu.dao.DictvalueDao;
import com.shangwu.dao.impl.CategoryDaoImpl;
import com.shangwu.dao.impl.DictvalueDaoImpl;
import com.shangwu.po.Assets_car;
import com.shangwu.po.Category;
import com.shangwu.po.Dictvalue;
import com.shangwu.po.User;
import com.shangwu.service.Assets_carService;
import com.shangwu.service.impl.Assets_carServiceImpl;

/**
 * Servlet implementation class Assets_carServlet
 */
@WebServlet("/assets_carservlet")
public class Assets_carServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Assets_carService assets_carService=new Assets_carServiceImpl();  
	DictvalueDao dictvalueDao=new DictvalueDaoImpl();
	CategoryDao categoryDao=new CategoryDaoImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Assets_carServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action =request.getParameter("action") ;
		if(action.equals("create"))
		{
			this.create(request, response);
		}
		else if(action.equals("del"))
		{
			this.delete(request, response);
		}
		else if(action.equals("update"))
		{
			this.update(request, response);
		}
		else if(action.equals("list"))
		{
			this.list(request, response);
		}
		else if(action.equals("getAssets_carById"))
		{
			this.getAssets_carById(request, response);
		}
	}
	public void getAssets_carById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("id") ;
		System.out.print("id="+id);
		Assets_car assets_car=assets_carService.getAssets_carById(id);
		Gson obj=new Gson();
		
		String jsonstr=obj.toJson(assets_car);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=utf-8");
		
		System.out.println(jsonstr);
		
		PrintWriter out = response.getWriter();
		out.append(jsonstr);
	}
	public void delete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("id") ;
		
		int rows = assets_carService.deleteAssets_car(id);
		PrintWriter out = response.getWriter();
	    if(rows > 0){
	      out.print("OK");
	    }else{
	    	out.print("FAIL");
	    }
	}
	public void update(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("id") ;
		String assetsCode =request.getParameter("assetsCode") ;
		String nameCn =request.getParameter("nameCn") ;
		String assetsType ="44";//request.getParameter("assetsType") ;
		String powerType =request.getParameter("powerType") ;
		String carBrand=request.getParameter("carBrand") ;
		String carModel =request.getParameter("carModel") ;
		String sitCount =request.getParameter("sitCount") ;
		String engineInfo =request.getParameter("engineInfo") ;
		String autoTrans =request.getParameter("autoTrans") ;
		String comment =request.getParameter("comment") ;
		Assets_car assets_car=new Assets_car();
		assets_car.setId(id);
		assets_car.setAssetsCode(assetsCode);
		assets_car.setNameCn(nameCn);
		assets_car.setAssetsType(Integer.parseInt(assetsType));
		assets_car.setPowerType(powerType);
		assets_car.setCarBrand(carBrand);
		assets_car.setCarModel(carModel);
		assets_car.setSitCount(Integer.parseInt(sitCount));
		assets_car.setEngineInfo(engineInfo);
		assets_car.setAutoTrans(Integer.parseInt(autoTrans));
		assets_car.setComment(comment);
		User user=(User)request.getSession().getAttribute("USER_SESSION");
		assets_car.setCreateUser(user.getUid());
		int rows = assets_carService.updateAssets_car(assets_car);
		PrintWriter out = response.getWriter();
	    if(rows > 0){
	      out.print("OK");
	    }else{
	    	out.print("FAIL");
	    }
	 
	}
	public void create(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		String assetsCode =request.getParameter("assetsCode") ;
		String nameCn =request.getParameter("nameCn") ;
		String assetsType =request.getParameter("assetsType") ;
		String powerType =request.getParameter("powerType") ;
		String carBrand=request.getParameter("carBrand") ;
		String carModel =request.getParameter("carModel") ;
		String sitCount =request.getParameter("sitCount") ;
		String engineInfo =request.getParameter("engineInfo") ;
		String autoTrans =request.getParameter("autoTrans") ;
		String comment =request.getParameter("comment") ;
		Assets_car assets_car=new Assets_car();
		assets_car.setAssetsCode(assetsCode);
		assets_car.setNameCn(nameCn);
		assets_car.setAssetsType(Integer.parseInt(assetsType));
		assets_car.setPowerType(powerType);
		assets_car.setCarBrand(carBrand);
		assets_car.setCarModel(carModel);
		assets_car.setSitCount(Integer.parseInt(sitCount));
		assets_car.setEngineInfo(engineInfo);
		assets_car.setAutoTrans(Integer.parseInt(autoTrans));
		assets_car.setComment(comment);
		User user=(User)request.getSession().getAttribute("USER_SESSION");
		assets_car.setCreateUser(user.getUid());
		int rows = assets_carService.createAssets_car(assets_car);
		PrintWriter out = response.getWriter();
	    if(rows > 0){
	      out.print("OK");
	    }else{
	    	out.print("FAIL");
	    }
	 
	}
	public void list(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String page =request.getParameter("page");
		if(page==null)
		{
			page="1";
		}
		String rows =request.getParameter("rows") ;
		if(rows==null)
		{
			rows="10";
		}
		String nameCn =request.getParameter("nameCn") ;
		String assetsCode =request.getParameter("assetsCode") ;
		String powerType =request.getParameter("powerType") ;
		String carModel =request.getParameter("carModel") ;
		String autoTrans=request.getParameter("autoTrans") ;
		if(autoTrans==""||autoTrans==null)
		{
			autoTrans="101";
		}
		String Power_Type="powerType" ;
		String ParentId="2" ;
		// 条件查询所有客户
		Page<Assets_car> assets_cars = assets_carService.findAssets_carList(Integer.parseInt(page), Integer.parseInt(rows), nameCn, assetsCode, powerType, carModel,Integer.parseInt(autoTrans));
		request.setAttribute("page", assets_cars);
		// 客户来源
		List<Dictvalue> powerTypes = dictvalueDao.selectDictvalueByTypeCode(Power_Type);
		List<Category> categorys =categoryDao.selectCategoryByParentId(Integer.parseInt(ParentId));
		// 添加参数
		request.setAttribute("powerTypes", powerTypes);
		request.setAttribute("powerType", powerType);
		request.setAttribute("nameCn", nameCn);
		request.setAttribute("assetsCode", assetsCode);
		request.setAttribute("carModel", carModel);
		request.setAttribute("autoTrans", autoTrans);
		request.setAttribute("categoryps", categorys);
		request.getRequestDispatcher("WEB-INF/jsp/assets_car.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
