package com.shangwu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.shangwu.common.utils.ConnectionFactory;
import com.shangwu.dao.CategoryDao;
import com.shangwu.po.Category;
import com.shangwu.po.Employee;


public class CategoryDaoImpl implements CategoryDao {

	@Override
	public List<Category> selectCategoryByParentId(int parentId) {
		// TODO Auto-generated method stub
        //声明连接对象
		Connection conn=null;
		//声明预制语句通道
		PreparedStatement ps=null;
		//声明数据库返回的结果集
		ResultSet rs=null;
		//声明一个集合
        ArrayList<Category> categorylist=null;
       
        try {
        	 //建立连接对象
             conn=ConnectionFactory.getConnection();
            //根据连接对象建立语句通道
            String sql="select * from category where parentId =?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, parentId);
			//根据语句通道想数据库服务器发送sql，并返回结果集
			rs=ps.executeQuery();
			//判断返回的结果集是否为空
			if(rs!=null)
			{
				categorylist=new ArrayList<Category>();
				while(rs.next())
				{
					Category category=new Category();
					category.setId(rs.getInt("id"));
					category.setCode(rs.getString("code"));
					category.setNameCn(rs.getString("nameCn"));
					category.setComment(rs.getString("comment"));
					category.setParentId(rs.getInt("parentId"));
					categorylist.add(category);
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
		return categorylist;
	}

	@Override
	public List<Category> selectCategoryByPage(int pageNumber, int pageSize, String nameCn, String parentCn) {
		// TODO Auto-generated method stub
        //声明连接对象
		Connection conn=null;
		//声明预制语句通道
		PreparedStatement ps=null;
		//声明数据库返回的结果集
		ResultSet rs=null;
		//声明一个集合
        ArrayList<Category> list=null;
       
        try {
        	 //建立连接对象
             conn=ConnectionFactory.getConnection();
            //根据连接对象建立语句通道
            StringBuffer  sql=new StringBuffer("select a.id,a.code,a.nameCn,a.comment,b.nameCn as parentCn from category a LEFT JOIN category b on a.parentId=b.id where 1=1");
            if(StringUtils.isNotBlank(nameCn))
            {
            	sql.append(" and a.namecn='"+nameCn+"'");
            }
            if(StringUtils.isNotBlank(parentCn))
            {
            	sql.append(" and b.nameCn='"+parentCn+"'");
            }
            sql.append(" limit "+pageNumber+","+pageSize);
			ps=conn.prepareStatement(sql.toString());
			//根据语句通道想数据库服务器发送sql，并返回结果集
			rs=ps.executeQuery();
			//判断返回的结果集是否为空
			if(rs!=null)
			{
				list=new ArrayList<Category>();
				while(rs.next())
				{
					Category category=new Category();
					category.setId(rs.getInt("id"));
					category.setCode(rs.getString("code"));
					category.setNameCn(rs.getString("nameCn"));
					category.setParentCn(rs.getString("parentCn"));
					category.setComment(rs.getString("comment"));
					list.add(category);
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
	public Integer selectCategoryCount(String nameCn, String parentCn) {
		Connection conn=null;
	
		PreparedStatement ps=null;
	
		ResultSet rs=null;
		int resultCount = 0;
		try{
			
            conn=ConnectionFactory.getConnection();
            
            StringBuffer sql=new StringBuffer("select count(*) from category a LEFT JOIN category b on a.parentId=b.id where 1=1");
            if(StringUtils.isNotBlank(nameCn))
            {
            	sql.append(" and a.namecn='"+nameCn+"'");
            }
            if(StringUtils.isNotBlank(parentCn))
            {
            	sql.append(" and b.nameCn='"+parentCn+"'");
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
