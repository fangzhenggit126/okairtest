package com.shangwu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shangwu.common.utils.ConnectionFactory;
import com.shangwu.dao.UserDao;
import com.shangwu.po.User;

public class UserDaoImpl implements UserDao {

	@Override
	public User findUser(String uid, String pwd) {
		// TODO Auto-generated method stub
        //声明连接对象
		Connection conn=null;
		//声明预制语句通道
		PreparedStatement ps=null;
		//声明数据库返回的结果集
		ResultSet rs=null;
		User user=null;
       
        try {
        	 //建立连接对象
             conn=ConnectionFactory.getConnection();
            //根据连接对象建立语句通道
			ps=conn.prepareStatement("select * from sysuser where uid =? and pwd =?");
			ps.setString(1, uid);
			ps.setString(2, pwd);
			//根据语句通道想数据库服务器发送sql，并返回结果集
			rs=ps.executeQuery();
			//判断返回的结果集是否为空
			if(rs!=null)
			{
				rs.next();
				user=new User();
				user.setId(rs.getInt("id"));
				user.setPwd(rs.getString("pwd"));
				user.setNickName(rs.getString("nickName"));
				user.setUid(rs.getString("uid"));
				user.setRole(rs.getString("role"));
				user.setCreateTime(rs.getDate("createTime"));
			}
			
		}
        catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        finally{
        	ConnectionFactory.close(conn,ps, rs);
        }
		return user;
	}

	@Override
	public List<User> getUsers() {
		// TODO Auto-generated method stub
        //声明连接对象
		Connection conn=null;
		//声明预制语句通道
		PreparedStatement ps=null;
		//声明数据库返回的结果集
		ResultSet rs=null;
		//声明一个集合
        ArrayList<User> list=null;
       
        try {
        	 //建立连接对象
             conn=ConnectionFactory.getConnection();
            //根据连接对象建立语句通道
            String sql="select * from sysuser";
			ps=conn.prepareStatement(sql);
			//根据语句通道想数据库服务器发送sql，并返回结果集
			rs=ps.executeQuery();
			//判断返回的结果集是否为空
			if(rs!=null)
			{
				list=new ArrayList<User>();
				while(rs.next())
				{
					User user=new User();
					user.setId(rs.getInt("id"));
					user.setPwd(rs.getString("pwd"));
					user.setNickName(rs.getString("nickName"));
					user.setUid(rs.getString("uid"));
					user.setRole(rs.getString("role"));
					user.setCreateTime(rs.getDate("createTime"));
					list.add(user);
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

}
