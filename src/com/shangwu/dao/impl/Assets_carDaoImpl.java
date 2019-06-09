package com.shangwu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.shangwu.common.utils.ConnectionFactory;
import com.shangwu.dao.Assets_carDao;
import com.shangwu.po.Assets_car;

public class Assets_carDaoImpl implements Assets_carDao {

	@Override
	public List<Assets_car> selectAssets_carList(Assets_car assets_car) {
	
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Assets_car> assets_cars = null;
        try {
        
             conn=ConnectionFactory.getConnection();
          
          
			StringBuffer sql=new StringBuffer("select * from  assets_car where 1=1 ");
			if(assets_car.getNameCn()!=null)
			{
				sql.append(" and nameCn like '%"+assets_car.getNameCn()+"%'");
			}
			if(assets_car.getAssetsCode()!=null)
			{
				sql.append(" and assetsCode='"+assets_car.getAssetsCode()+"'");
			}
			if(assets_car.getPowerType()!=null)
			{
				sql.append(" and powerType='"+assets_car.getPowerType()+"'");
			}
			if(assets_car.getCarModel()!=null)
			{
				sql.append(" and carModel='"+assets_car.getCarModel()+"'");
			}
			if(assets_car.getAutoTrans()!=101)
			{
				sql.append(" and autoTrans='"+assets_car.getAutoTrans()+"'");
			}
			sql.append(" limit "+assets_car.getStart()+","+assets_car.getRows());
			ps = conn.prepareStatement(sql.toString());
			rs=ps.executeQuery();
			if(rs!=null)
			{
				assets_cars = new ArrayList<>();
				while(rs.next())
				{
					
					assets_car=new Assets_car();
					assets_car.setId(rs.getString("id"));
					assets_car.setNameCn(rs.getString("nameCn"));
					assets_car.setAssetsCode(rs.getString("assetsCode"));
					assets_car.setAssetsType(rs.getInt("assetsType"));
					assets_car.setAutoTrans(rs.getInt("autoTrans"));
					assets_car.setCarBrand(rs.getString("carBrand"));
					assets_car.setCarModel(rs.getString("carModel"));
					assets_car.setComment(rs.getString("comment"));
					assets_car.setCreateDate(rs.getDate("createDate"));
					assets_car.setCreateUser(rs.getString("createUser"));
					assets_car.setEngineInfo(rs.getString("engineInfo"));
					assets_car.setPowerType(rs.getString("powerType"));
					assets_car.setSitCount(rs.getInt("sitCount"));
					assets_cars.add(assets_car);
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
		return assets_cars;
	}

	@Override
	public Integer selectAssets_carListCount(Assets_car assets_car) {
		 //�������Ӷ���
		Connection conn=null;
		//����Ԥ�����ͨ��
		PreparedStatement ps=null;
		//�������ݿⷵ�صĽ����
		ResultSet rs=null;
		int resultCount = 0;
		try{
			//�������Ӷ���
            conn=ConnectionFactory.getConnection();
            
            StringBuffer sql=new StringBuffer("select count(*) from assets_car where 1=1 ");
			if(assets_car.getNameCn()!=null)
			{
				sql.append(" and nameCn like '%"+assets_car.getNameCn()+"%'");
			}
			if(assets_car.getAssetsCode()!=null)
			{
				sql.append(" and assetsCode='"+assets_car.getAssetsCode()+"'");
			}
			if(assets_car.getPowerType()!=null)
			{
				sql.append(" and powerType='"+assets_car.getPowerType()+"'");
			}
			if(assets_car.getCarModel()!=null)
			{
				sql.append(" and carModel='"+assets_car.getCarModel()+"'");
			}
			if(assets_car.getAutoTrans()!=101)
			{
				sql.append(" and autoTrans='"+assets_car.getAutoTrans()+"'");
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

	@Override
	public int createAssets_car(Assets_car assets_car) {
		
		Connection conn=null;
	
		PreparedStatement ps=null;
		int i=0;
        try {
        	
             conn=ConnectionFactory.getConnection();
       
             String sql="insert into assets_car(id,assetsCode,assetsType,nameCn,engineInfo,carBrand,carModel,powerType,sitCount,autoTrans,comment,createDate,createUser)"+
	                      "values(uuid(),?,?,?,?,?,?,?,?,?,?,?,?)";
             ps=conn.prepareStatement(sql);
            
             ps.setString(1, assets_car.getAssetsCode());
             ps.setInt(2, assets_car.getAssetsType());
             ps.setString(3, assets_car.getNameCn());
             ps.setString(4, assets_car.getEngineInfo());
             ps.setString(5, assets_car.getCarBrand());
             ps.setString(6, assets_car.getCarModel());
             ps.setString(7, assets_car.getPowerType());
             ps.setInt(8, assets_car.getSitCount());
             ps.setInt(9, assets_car.getAutoTrans());
             ps.setString(10, assets_car.getComment());
			 ps.setDate(11, new java.sql.Date(new Date().getTime()));
			 ps.setString(12, assets_car.getCreateUser());
		
			
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
	public Assets_car getAssets_carById(String id) {
		// TODO Auto-generated method stub
    
		Connection conn=null;
	
		PreparedStatement ps=null;
	
		ResultSet rs=null;
		Assets_car assets_car=null;
       
        try {
        	
             conn=ConnectionFactory.getConnection();
            
			ps=conn.prepareStatement("select * from assets_car where id =?");
			ps.setString(1, id);
		
			rs=ps.executeQuery();
		
			if(rs!=null)
			{
				assets_car=new Assets_car();
				rs.next();
				assets_car.setId(rs.getString("id"));
				assets_car.setNameCn(rs.getString("nameCn"));
				assets_car.setAssetsCode(rs.getString("assetsCode"));
				assets_car.setAssetsType(rs.getInt("assetsType"));
				assets_car.setAutoTrans(rs.getInt("autoTrans"));
				assets_car.setCarBrand(rs.getString("carBrand"));
				assets_car.setCarModel(rs.getString("carModel"));
				assets_car.setComment(rs.getString("comment"));
				assets_car.setCreateDate(rs.getDate("createDate"));
				assets_car.setCreateUser(rs.getString("createUser"));
				assets_car.setEngineInfo(rs.getString("engineInfo"));
				assets_car.setPowerType(rs.getString("powerType"));
				assets_car.setSitCount(rs.getInt("sitCount"));
			}
			
			
		}
        catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        finally{
        	ConnectionFactory.close(conn,ps, rs);
        }
		return assets_car;
	}

	@Override
	public int updateAssets_car(Assets_car assets_car) {
		
		Connection conn=null;
	
		PreparedStatement ps=null;
		int i=0;
        try {
        	
             conn=ConnectionFactory.getConnection();
            
             String sql="update assets_car set assetsCode=?,assetsType=?,nameCn=?,engineInfo=?,carBrand=?,carModel=?,powerType=?,sitCount=?,autoTrans=?,comment=? where id=?";
             ps=conn.prepareStatement(sql);
             ps.setString(1, assets_car.getAssetsCode());
             ps.setInt(2, assets_car.getAssetsType());
             ps.setString(3, assets_car.getNameCn());
             ps.setString(4, assets_car.getEngineInfo());
             ps.setString(5, assets_car.getCarBrand());
             ps.setString(6, assets_car.getCarModel());
             ps.setString(7, assets_car.getPowerType());
             ps.setInt(8, assets_car.getSitCount());
             ps.setInt(9, assets_car.getAutoTrans());
             ps.setString(10, assets_car.getComment());
             ps.setString(11, assets_car.getId());
			
			i=ps.executeUpdate();
		
			if(i==1)
			{
				System.out.println("修改成功");
			}
			else
			{
				System.out.println("修改失败");
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
	public int deleteAssets_car(String id) {
		//�������Ӷ���
		Connection conn=null;
		//�������ͨ��
		PreparedStatement ps=null;
		int i=0;
        try {
        	 //�������Ӷ���
             conn=ConnectionFactory.getConnection();
            //�������Ӷ��������ͨ��
             String sql="delete from assets_car where id=?";
             ps=conn.prepareStatement(sql);
             ps.setString(1, id);
            
			
			//�������ͨ�������ݿ����������sql�������ؽ����
			
			i=ps.executeUpdate();
			//�жϷ��صĽ�����Ƿ�Ϊ��
			if(i==1)
			{
				System.out.println("ɾ���ɹ�");
			}
			else
			{
				System.out.println("ɾ��ʧ��");
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

}
