package com.shangwu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.shangwu.common.utils.ConnectionFactory;
import com.shangwu.dao.EmployeeDao;
import com.shangwu.po.Employee;

public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public List<Employee> selectEmployees() {
		// TODO Auto-generated method stub
        //声明连接对象
		Connection conn=null;
		//声明预制语句通道
		PreparedStatement ps=null;
		//声明数据库返回的结果集
		ResultSet rs=null;
		//声明一个集合
        ArrayList<Employee> list=null;
       
        try {
        	 //建立连接对象
             conn=ConnectionFactory.getConnection();
            //根据连接对象建立语句通道
            String sql="select * from employee";
			ps=conn.prepareStatement(sql);
			//根据语句通道想数据库服务器发送sql，并返回结果集
			rs=ps.executeQuery();
			//判断返回的结果集是否为空
			if(rs!=null)
			{
				list=new ArrayList<Employee>();
				while(rs.next())
				{
					Employee emp=new Employee();
					emp.setId(rs.getInt("id"));
					emp.setDept(rs.getString("dept"));
					emp.setEmpNo(rs.getString("empNo"));
					emp.setNamecn(rs.getString("namecn"));
					emp.setReportTo(rs.getInt("reportTo"));
					list.add(emp);
				}
			}
			
		}
        catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        finally{
        	ConnectionFactory.close(conn,ps, rs);
        }
		return list;
	}


	@Override
	public List<Employee> selectEmployeesPage(int pageNumber, int pageSize, String nameCn, String dept) {
		// TODO Auto-generated method stub
        //声明连接对象
		Connection conn=null;
		//声明预制语句通道
		PreparedStatement ps=null;
		//声明数据库返回的结果集
		ResultSet rs=null;
		//声明一个集合
        ArrayList<Employee> list=null;
       
        try {
        	 //建立连接对象
             conn=ConnectionFactory.getConnection();
            //根据连接对象建立语句通道
            StringBuffer  sql=new StringBuffer("select a.id,a.empNo,a.reportTo,a.dept,a.namecn,b.namecn as report_To from employee a LEFT JOIN employee b on b.id=a.reportTo where 1=1");
            if(StringUtils.isNotBlank(nameCn))
            {
            	sql.append(" and a.namecn='"+nameCn+"'");
            }
            if(StringUtils.isNotBlank(dept))
            {
            	sql.append(" and a.dept='"+dept+"'");
            }
            sql.append(" limit "+pageNumber+","+pageSize);
			ps=conn.prepareStatement(sql.toString());
			//根据语句通道想数据库服务器发送sql，并返回结果集
			rs=ps.executeQuery();
			//判断返回的结果集是否为空
			if(rs!=null)
			{
				list=new ArrayList<Employee>();
				while(rs.next())
				{
					Employee emp=new Employee();
					emp.setId(rs.getInt("id"));
					emp.setDept(rs.getString("dept"));
					emp.setEmpNo(rs.getString("empNo"));
					emp.setNamecn(rs.getString("namecn"));
					emp.setReportTo(rs.getInt("reportTo"));
					if(rs.getString("report_To")!=null)
					{
						emp.setReport_To(rs.getString("empNo")+rs.getString("report_To"));
					}
					
					list.add(emp);
				}
			}
			
		}
        catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        finally{
        	ConnectionFactory.close(conn,ps, rs);
        }
		return list;
	}


	@Override
	public Integer selectEmployeesCount(String nameCn, String dept) {
		
		Connection conn=null;
	
		PreparedStatement ps=null;
	
		ResultSet rs=null;
		int resultCount = 0;
		try{
			
            conn=ConnectionFactory.getConnection();
            
            StringBuffer sql=new StringBuffer("select count(*) from employee where 1=1 ");
            if(StringUtils.isNotBlank(nameCn))
            {
            	sql.append(" and namecn='"+nameCn+"'");
            }
            if(StringUtils.isNotBlank(dept))
            {
            	sql.append(" and dept='"+dept+"'");
            }
			ps = conn.prepareStatement(sql.toString());
			rs = ps.executeQuery();
			
			while(rs.next()){
				  resultCount = rs.getInt(1);
			}
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        finally{
        	ConnectionFactory.close(conn,ps, rs);
        }
		return resultCount;
	}

}
