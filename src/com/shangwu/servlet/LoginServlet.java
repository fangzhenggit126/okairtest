package com.shangwu.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shangwu.po.User;
import com.shangwu.service.UserService;
import com.shangwu.service.impl.UserServiceImpl;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usercode =request.getParameter("usercode") ;
		String password =request.getParameter("password") ;
		UserService userDao=new UserServiceImpl();
		User user=userDao.findUser(usercode, password);
		if(user!=null)
		{
			request.getSession().setAttribute("USER_SESSION", user);
			///request.getRequestDispatcher("customerservlet?action=list").forward(request, response);
			request.getRequestDispatcher("starter.html").forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "用户名或密码有误....");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
