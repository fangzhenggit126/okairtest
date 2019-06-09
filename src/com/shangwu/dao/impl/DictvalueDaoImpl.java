package com.shangwu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shangwu.common.utils.ConnectionFactory;
import com.shangwu.dao.DictvalueDao;
import com.shangwu.po.Dictvalue;

public class DictvalueDaoImpl implements DictvalueDao {

	@Override
	public List<Dictvalue> selectDictvalueByTypeCode(String typecode) {
		// TODO Auto-generated method stub
        //声明连接对象
		Connection conn=null;
		//声明预制语句通道
		PreparedStatement ps=null;
		//声明数据库返回的结果集
		ResultSet rs=null;
		//声明一个集合
        ArrayList<Dictvalue> dictvaluelist=null;
       
        try {
        	 //建立连接对象
             conn=ConnectionFactory.getConnection();
            //根据连接对象建立语句通道
            String sql="select * from sysdictvalue where typeCode =?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, typecode);
			//根据语句通道想数据库服务器发送sql，并返回结果集
			rs=ps.executeQuery();
			//判断返回的结果集是否为空
			if(rs!=null)
			{
				dictvaluelist=new ArrayList<Dictvalue>();
				while(rs.next())
				{
					Dictvalue dictvalue=new Dictvalue();
					dictvalue.setId(rs.getInt("id"));
					dictvalue.setTypeCode(rs.getString("typeCode"));
					dictvalue.setValue(rs.getString("value"));
					dictvalue.setDisplay(rs.getString("display"));
					dictvalue.setDesc(rs.getString("desc"));
					dictvaluelist.add(dictvalue);
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
		return dictvaluelist;
	}

}
