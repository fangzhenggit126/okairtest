package com.shangwu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.shangwu.common.utils.ConnectionFactory;
import com.shangwu.dao.AssetstransDao;
import com.shangwu.po.Assetstrans;
import com.shangwu.po.Employee;

public class AssetstransDaoImpl implements AssetstransDao {

	@Override
	public List<Assetstrans> selectAssets_carList(String asetsId) {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Assetstrans> list = null;
        try {
        
            conn=ConnectionFactory.getConnection();
          
			ps = conn.prepareStatement("select * from  assetstrans where assetsId=?");
			ps.setString(1, asetsId);
			rs=ps.executeQuery();
			if(rs!=null)
			{
				list = new ArrayList<Assetstrans>();
				while(rs.next())
				{
					
					Assetstrans as=new Assetstrans();
					as.setId(rs.getString("id"));
					as.setAssetsId(rs.getString("assetsId"));
					as.setBatchNo(rs.getString("batchNo"));
					as.setComment(rs.getString("comment"));
					as.setCount(rs.getInt("count"));
                    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					
					as.setCreateTime(sdf.format(rs.getDate("createTime")));
					as.setHandlerEmp(rs.getString("handlerEmp"));
					as.setInstockTime(sdf.format(rs.getDate("instockTime")));
					as.setPrice(rs.getDouble("price"));
					as.setTargetEmp(rs.getString("targetEmp"));
					as.setTransType(rs.getString("transType"));
					list.add(as);
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
	public int inputAssetstrans(Assetstrans assetstrans) {
		Connection conn=null;
		
		PreparedStatement ps=null;
		int i=0;
        try {
        	
             conn=ConnectionFactory.getConnection();
       
             String sql="insert into assetstrans(id,assetsId,batchNo,transType,count,price,handlerEmp,instockTime,targetEmp,comment,createTime)"+
	                      "values(uuid(),?,?,?,?,?,?,?,?,?,?)";
             ps=conn.prepareStatement(sql);
            
             ps.setString(1, assetstrans.getAssetsId());
             ps.setString(2, assetstrans.getBatchNo());
             ps.setString(3, assetstrans.getTransType());
             ps.setInt(4, assetstrans.getCount());
             ps.setDouble(5, assetstrans.getPrice());
             ps.setString(6, assetstrans.getHandlerEmp());
             SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
             
             try {
				ps.setDate(7, new java.sql.Date(format.parse(assetstrans.getInstockTime()).getTime()));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
             ps.setString(8, assetstrans.getTargetEmp());
             ps.setString(9, assetstrans.getComment());
			 ps.setDate(10, new java.sql.Date(new Date().getTime()));
		
			
			i=ps.executeUpdate();
		
			if(i==1)
			{
				System.out.println("保存成功");
			}
			else
			{
				System.out.println("保存失败");
			}
			
		}
        catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        finally{
        	ConnectionFactory.close(conn, ps);
        }
        
       return i;
	}

	

	@Override
	public List<Assetstrans> selectAssetstransPage(int pageNumber, int pageSize, String asetsId) {
		// TODO Auto-generated method stub
        //声明连接对象
		Connection conn=null;
		//声明预制语句通道
		PreparedStatement ps=null;
		//声明数据库返回的结果集
		ResultSet rs=null;
		//声明一个集合
        ArrayList<Assetstrans> list=null;
       
        try {
        	 //建立连接对象
             conn=ConnectionFactory.getConnection();
            //根据连接对象建立语句通道
            StringBuffer  sql=new StringBuffer("SELECT a.id,a.assetsId,a.batchNo,a.transType,a.count,a.price,a.handlerEmp,a.instockTime,a.targetEmp,a.`comment`,a.createTime,a.createUser,b.nameCn as trans_Type,c.namecn as handlerMan,d.namecn as targetMan FROM assetstrans a");
            sql.append(" INNER JOIN category b ON a.transType = b.id left JOIN employee c ON a.handlerEmp = c.id left JOIN employee d ON a.targetEmp = d.id where 1=1");
            if(StringUtils.isNotBlank(asetsId))
            {
            	sql.append(" and a.assetsId='"+asetsId+"'");
            }
           
            sql.append(" limit "+pageNumber+","+pageSize);
			ps=conn.prepareStatement(sql.toString());
			//根据语句通道想数据库服务器发送sql，并返回结果集
			rs=ps.executeQuery();
			//判断返回的结果集是否为空
			if(rs!=null)
			{
				list=new ArrayList<Assetstrans>();
				while(rs.next())
				{
					Assetstrans as=new Assetstrans();
					as.setId(rs.getString("id"));
					as.setAssetsId(rs.getString("assetsId"));
					as.setBatchNo(rs.getString("batchNo"));
					as.setComment(rs.getString("comment"));
					as.setCount(rs.getInt("count"));
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					
					as.setCreateTime(sdf.format(rs.getDate("createTime")));
					as.setHandlerEmp(rs.getString("handlerMan"));
					as.setInstockTime(sdf.format(rs.getDate("instockTime")));
					as.setPrice(rs.getDouble("price"));
					as.setTargetEmp(rs.getString("targetMan"));
					as.setTransType(rs.getString("trans_Type"));
					list.add(as);
					
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
	public Integer selectAssetstransCount(String asetsId) {
		Connection conn=null;
		
		PreparedStatement ps=null;
	
		ResultSet rs=null;
		int resultCount = 0;
		try{
			
            conn=ConnectionFactory.getConnection();
            
            StringBuffer sql=new StringBuffer("select count(*) from assetstrans where 1=1 ");
            if(StringUtils.isNotBlank(asetsId))
            {
            	sql.append(" and assetsId='"+asetsId+"'");
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
