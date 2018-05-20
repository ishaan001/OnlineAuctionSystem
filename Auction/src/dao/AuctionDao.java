package dao;

import config.DBConnection;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import bean.AuctionBean;
import bean.AuctionItem;

public class AuctionDao {
	static Connection con = DBConnection.getConnection();
	
	
	public String accAuth(AuctionBean ab1)
	{
		
		String git="ishaan";
		String uname=ab1.getUname();
		String pwd=ab1.getPass();
		System.out.println(uname);
		System.out.println(pwd);
		try {
			Statement stat= con.createStatement();
			ResultSet rs=stat.executeQuery("select * from user_master where user_name ='"+uname+"' and password ='"+pwd+"';");
			  
			    	while( rs.next())
			    	{
			    		git=rs.getString(4);
			    		System.out.println(git+"55555555555555555555555555555555555555555555555");
			    	}
			     
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(g);
		return git;
		
	}
	
	public String accCreation(AuctionBean ab2)
	{
		String so=null;
		String utype="USER";
		int pno=0;
		int awon=0;
		int c_used=0;
		int c_bgt=0;
		int c_bal=5;
		
		try {
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery("select * from user_master where user_name='"+ab2.getUname()+"'");
			if(rs.next())
			{
			  System.out.print("Already exists");	
			}
			else
			{
				PreparedStatement ps=con.prepareStatement("insert into profile values(?,?,?,?,?,?,?,?)");
				ps.setString(1,ab2.getPfname());
				ps.setString(2,ab2.getPlname());
				ps.setInt(3,ab2.getPmno());
				ps.setString(4,ab2.getPemail());
				ps.setString(5,ab2.getPadd());
				ps.setString(6,ab2.getPcountry());
				ps.setString(7,ab2.getPstate());
				ps.setString(8,ab2.getPcity());
				ps.executeUpdate();

				PreparedStatement ps_um=con.prepareStatement("insert into user_master values(?,?,?,?)");
				ps_um.setInt(1,ab2.getPmno());
				ps_um.setString(2,ab2.getUname());
				ps_um.setString(3,ab2.getPass());
				ps_um.setString(4,utype);
				ps_um.executeUpdate();

				PreparedStatement ps_cd=con.prepareStatement("insert into ac_stat values(?,?,?,?,?,?)");
				ps_cd.setString(1,ab2.getUname());
				ps_cd.setInt(2,pno);
				ps_cd.setInt(3,awon);
				ps_cd.setInt(4,c_used);
				ps_cd.setInt(5,c_bgt);
				ps_cd.setInt(6,c_bal);
				ps_cd.executeUpdate();

				ps.close();
				ps_um.close();
				ps_cd.close();

				so="success";
				return so;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		
		return "none";
	}
	
	public String changePass(AuctionBean ab3)
	{
		String s_uname=ab3.getUname();
		String pnpwd=ab3.getPass();
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement("update user_master set password=? where user_name='"+s_uname+"'");
			ps.setString(1,pnpwd);
							
			i=ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(i>0)
		{
			return "success";
		}
		else
		{
			return "fail";
		}
		
	}
	public int addAuc(AuctionItem ai)
	{
		int i=0,j=0,k=0;
		String piname=ai.getPr_name();
		String pdes=ai.getDescription();
		int pctg=ai.getC_id();
		int pbprice=ai.getMin_bid_price();
		int pcredit=ai.getCredit();
		String psdate=ai.getSdate();
		String pedate=ai.getEdate();
		String psts=ai.getStatus();
		String p_pimg=ai.getImg();
		String s_uname=ai.getUname();

		String vp_id=null;
		String wname=null;
		

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			File imgfile = new File(p_pimg);
			System.out.println("================================="+p_pimg);
			FileInputStream fin = new FileInputStream(imgfile);
			
			System.out.println(new java.sql.Date(df.parse(psdate).getTime()));
			
			
			
			
			PreparedStatement ps=con.prepareStatement("insert into product(pr_name,c_id,description,min_bid_price,credit,status,start_date,end_date,user_name,win_name,img) values(?,?,?,?,?,?,?,?,?,?,?)");
		 
			ps.setString(1,piname);
			ps.setInt(2,pctg);
			ps.setString(3,pdes);
			ps.setInt(4,pbprice);
			ps.setInt(5,pcredit);
			ps.setString(6,psts);
			ps.setDate(7,new java.sql.Date(df.parse(psdate).getTime()));
			ps.setDate(8,new java.sql.Date(df.parse(pedate).getTime()));
			ps.setString(9,s_uname);
			ps.setString(10,wname);
			ps.setBinaryStream(11,(InputStream)fin,(int)imgfile.length());
			
			i=ps.executeUpdate();
			
			Statement s1=con.createStatement();
		    ResultSet rs1=s1.executeQuery("select count(*) from sel_amount where user_name='"+s_uname+"'");
		    if(rs1.next())
		    {
		      int c=rs1.getInt(1);
		      if(c==0)
		      {
		    	  	int amount=0;
		    		PreparedStatement ps_am=con.prepareStatement("insert into sel_amount values(?,?)");
		    		ps_am.setString(1,s_uname);
		    		ps_am.setInt(2,amount);
		    		j=ps_am.executeUpdate();
		    		ps_am.close();
		      }
		      else {
		    	  j=c;
		      }
			
			}
			
			ps.close();
			System.out.println("======================================"+i);
			System.out.println("======================================"+j);
			
			ResultSet rs = con.createStatement().executeQuery("select * from product;");
			rs.last();
			saveImage(rs.getBlob(12), rs.getInt(1));
			System.out.println("======================================"+rs.getInt(1));
			
			
			 
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0 && j>0)
		{
			k=1;
		}
		else
		{
			k=0;
		}
		return k;
	}
	 public static void saveImage(Blob blob, int id){
	        FileOutputStream fos = null;
	        
	        try {
	        	System.out.println("======================================3");
	            InputStream input;
	            fos = new FileOutputStream("E:\\Hackathon's\\3rdyr_project\\Auction\\WebContent\\images\\"+id+"Prdct.jpg");
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
	            
	        
	        } catch (Exception ex) {
	           ex.printStackTrace();
	        }
	  }
	 
	 public int closeBid(AuctionItem ai3)
	 {
		 int i=0;
		 try {
			 	PreparedStatement ps=con.prepareStatement("update product set status=? where pr_id='"+ai3.getPr_id()+"'");
				ps.setString(1,ai3.getStatus());
					
				i=ps.executeUpdate();
				ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return i;
	 }
	 
	 public int updateAcc(AuctionBean ab4)
	 {
		 int i=0;
		 
		 return i;
	 }
	
	

}
