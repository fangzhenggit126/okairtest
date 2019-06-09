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
        //�������Ӷ���
		Connection conn=null;
		//����Ԥ�����ͨ��
		PreparedStatement ps=null;
		//�������ݿⷵ�صĽ����
		ResultSet rs=null;
		User user=null;
       
        try {
        	 //�������Ӷ���
             conn=ConnectionFactory.getConnection();
            //�������Ӷ��������ͨ��
			ps=conn.prepareStatement("select * from sysuser where uid =? and pwd =?");
			ps.setString(1, uid);
			ps.setString(2, pwd);
			//�������ͨ�������ݿ����������sql�������ؽ����
			rs=ps.executeQuery();
			//�жϷ��صĽ�����Ƿ�Ϊ��
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
        //�������Ӷ���
		Connection conn=null;
		//����Ԥ�����ͨ��
		PreparedStatement ps=null;
		//�������ݿⷵ�صĽ����
		ResultSet rs=null;
		//����һ������
        ArrayList<User> list=null;
       
        try {
        	 //�������Ӷ���
             conn=ConnectionFactory.getConnection();
            //�������Ӷ��������ͨ��
            String sql="select * from sysuser";
			ps=conn.prepareStatement(sql);
			//�������ͨ�������ݿ����������sql�������ؽ����
			rs=ps.executeQuery();
			//�жϷ��صĽ�����Ƿ�Ϊ��
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
