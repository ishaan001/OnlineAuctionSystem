package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.*;
import config.DBConnection;
import bean.CategoryPackBean;

public class CategoryDao {
	static Connection con = DBConnection.getConnection();

	public int addCategory(CategoryPackBean cb)
	{
		
		String pcname=cb.getCname();
		String pdes=cb.getCdes();
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement("insert into category(C_NAME,DESCRIPTION) values(?,?);");
			ps.setString(1,pcname);
			ps.setString(2,pdes);
				
			i=ps.executeUpdate();
			
			ps.close();
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int editCategory(CategoryPackBean cb1)
	{
		String pc_id=cb1.getCid(); 
		String pc_name= cb1.getCname();
		String pc_des=  cb1.getCdes();
		int j=0;
		

		try {
			PreparedStatement ps=con.prepareStatement("update category set c_name=?,description=? where c_id='"+pc_id+"'");
			ps.setString(1,pc_name);
			ps.setString(2,pc_des);
					
			j=ps.executeUpdate();
			ps.close();
			return j;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return j;
		
	}
	public int addPack(CategoryPackBean cb2)
	{
		int k=0;
		String p_pname=cb2.getPname();
		String p_pcredit=cb2.getPcredits();
		String p_price= cb2.getPrice();
		String p_pimg= cb2.getPimg();
		
		try {
			File imgfile = new File(p_pimg);
			System.out.println("================================="+p_pimg);
			FileInputStream fin = new FileInputStream(imgfile);
			
			PreparedStatement ps=con.prepareStatement("insert into package(p_name,p_price,p_credit,Img) values(?,?,?,?)");
			ps.setString(1, p_pname);
			ps.setString(2, p_price);
			ps.setString(3, p_pcredit);
			ps.setBinaryStream(4,(InputStream)fin,(int)imgfile.length());
			
			
			k=ps.executeUpdate();
			ps.close();
			System.out.println("======================================1");
			ResultSet rs = con.createStatement().executeQuery("select * from package;");
			rs.last();
			saveImage(rs.getBlob(4), rs.getInt(1));
			System.out.println("======================================"+rs.getInt(1));
			System.out.println("======================================2");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return k;
	}
	public int addUpdatePack(CategoryPackBean cb3)
	{
		int j=0;
		int p_pid=cb3.getPid();
		String p_pname=cb3.getPname();
		String p_pcredit=cb3.getPcredits();
		String p_price= cb3.getPrice();
		String p_pimg= cb3.getPimg();
		try {
			File imgfile = new File(p_pimg);
			System.out.println("==============ivd==================="+p_pimg);
			FileInputStream fin = new FileInputStream(imgfile);
			
			PreparedStatement ps=con.prepareStatement("update package set p_name=?,p_price=?,p_credit=?,img=? where pack_id='"+p_pid+"'");
			ps.setString(1, p_pname);
			ps.setString(2, p_price);
			ps.setString(3, p_pcredit);
			ps.setBinaryStream(4,(InputStream)fin,(int)imgfile.length());
			j=ps.executeUpdate();
			ps.close();
			System.out.println("======================ivd================1");
			ResultSet rs = con.createStatement().executeQuery("select * from package;");
			rs.last();
			saveImage(rs.getBlob(4), rs.getInt(1));
			System.out.println("======================ivd ================"+rs.getInt(1));
			System.out.println("====================ivd==================2");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return j;
	}
	

	 public static void saveImage(Blob blob, int id){
	        FileOutputStream fos = null;
	        
	        try {
	        	System.out.println("======================================3");
	            InputStream input;
	            fos = new FileOutputStream("E:\\Hackathon's\\3rdyr_project\\Auction\\WebContent\\images\\"+id+"pack.jpeg");
	            {
	               
	                input = blob.getBinaryStream();
	                int i=0;
	                i++;
	                int c = 0;
	                while ((c = input.read()) > -1) {
	                    fos.write(c);
	                }
	            }
	            input.close();
	            fos.close();
	            System.out.println("Success===========================4===== ");
	        
	        } catch (Exception ex) {
	           ex.printStackTrace();
	        }
	  }
}
