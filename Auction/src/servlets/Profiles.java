package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AuctionDao;
import bean.AuctionBean;


@WebServlet("/Profiles")
public class Profiles extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ftype=request.getParameter("ftype"); // to categorize the form type
		AuctionDao ad=new AuctionDao();
		AuctionBean ab=new AuctionBean();
		HttpSession session = request.getSession();
		PrintWriter out=response.getWriter();
		 
		
	 
		
		switch(ftype)
		{
		
				case "signup" : String vpass= request.getParameter("pass");
								String vcpass= request.getParameter("cpass");
								String i=request.getParameter("num");
								System.out.println(i+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
								System.out.println(vcpass+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
								System.out.println(vpass+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
							 
								if(vpass.equals(vcpass))
								{
									ab.setPfname( request.getParameter("fname"));
									ab.setPlname( request.getParameter("lname"));
									ab.setPmno(Integer.parseInt(request.getParameter("num")) );
									ab.setPemail(request.getParameter("email"));
									ab.setPadd( request.getParameter("addr"));
									ab.setPcountry( request.getParameter("country"));
									ab.setPstate( request.getParameter("state"));
									ab.setPcity( request.getParameter("city"));
									ab.setUname(request.getParameter("uname"));
									ab.setPass(vpass);
									
									String s=ad.accCreation(ab);
									if(s.equalsIgnoreCase("success"))
									{
										System.out.println("account created successfully");
										response.sendRedirect("user_Home.jsp");
										
									}
									else
									{
										System.out.println("password did not match confirm password");
									}
									
								}
								else
								{
									System.out.print("password ");
								}
								break;
				case "login":	String puname =request.getParameter("uname");
								String ppass=request.getParameter("pass");
								System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+puname);
								System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+ppass);
								ab.setPass(ppass);
								ab.setUname(puname);
								
								String val=ad.accAuth(ab);
								 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+val);
								 if(val.equalsIgnoreCase("admin"))
								 {
									session.setAttribute("Authentication", "successfull");
									session.setAttribute("result", "fail");
									session.setAttribute("suname",puname);
									session.setAttribute("spwd",ppass);
									session.setAttribute("val", val);
									response.sendRedirect("admin_home.jsp");
									 
								 }
								 else if(val.equalsIgnoreCase("USER")) {
									 
									 
									 session.setAttribute("Authentication", "successfull");
									 session.setAttribute("result", "fail");
									 session.setAttribute("suname",puname);
									session.setAttribute("spwd",ppass);
									session.setAttribute("val", val);
									 response.sendRedirect("user_home.jsp");
								     
								}
								 else {
									 response.getWriter().println("Password Incorrect");//failed logging in
									 
								 }
								 break;
				case "changePass":	String s_uname=session.getAttribute("suname").toString();
									String s_pwd=session.getAttribute("spwd").toString();

									String popwd=request.getParameter("oldpass");
									String pnpwd=request.getParameter("newpass");
									String pcpwd=request.getParameter("Cnewpass");
									System.out.println(s_uname+"000000000000000000000000000000000000000000000000000");
									
									if(s_pwd.equals(popwd))
									{
										System.out.println(pnpwd+"8888888888888888888");
										System.out.println(pcpwd);
										if(pnpwd.equalsIgnoreCase(pcpwd))
										{
											ab.setUname(s_uname);
											ab.setPass(pnpwd);
											
											String a=ad.changePass(ab);
											if(a.equalsIgnoreCase("success"))
											{
												response.sendRedirect("passSuccess.html");
												
											}
											else
											{
												out.println("<center><h1>ERROR IN DATABASE</h1></center>");
											}
											
										}
										else
										{
											 
												out.print("<center><h2>Password and cofirm password does not matched</h2></center>");
											 
										}
									}
									else
									{
										out.print("<center><h2>Old password does not matched</h2></center>");
									}
									break;
										
				case "edit":	String sunm=session.getAttribute("suname").toString();
								String p_fnm=request.getParameter("fnm");
								String p_lnm=request.getParameter("lnm");
								int p_mob_no=Integer.parseInt(request.getParameter("phn"));
								String p_email=request.getParameter("email");
								String p_address=request.getParameter("address");
								String p_country=request.getParameter("country");
								String p_state=request.getParameter("state");
								String p_city=request.getParameter("city");
								
								ab.setUname(sunm);
								ab.setPemail(p_fnm);
								ab.setPlname(p_lnm);
								ab.setPmno(p_mob_no);
								ab.setPemail(p_email);
								ab.setPadd(p_address);
								ab.setPcountry(p_country);
								ab.setPstate(p_state);
								ab.setPcity(p_city);

								int val5=ad.updateAcc(ab);
								if(val5>0)
								{
									session.setAttribute("result", "fail");
									response.sendRedirect("edit_profile.jsp");
								}
								else
								{
									session.setAttribute("result", "fail");
									response.sendRedirect("edit_profile.jsp");
								}
								break;
								
					
				
		
		}
	}

}
