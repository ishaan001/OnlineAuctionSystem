package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDao;
import bean.CategoryPackBean;
 
@WebServlet("/Categories")
public class Categories extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
    public Categories() {
        super();
        // TODO Auto-generated constructor stub
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ftype=request.getParameter("ftype");
		CategoryPackBean cb=new CategoryPackBean();
		CategoryDao cd= new CategoryDao();
		HttpSession session = request.getSession();
		PrintWriter out=response.getWriter();
		
		switch(ftype)
		{
			case "addCategory": String cname=request.getParameter("cat");
								String cdesc=request.getParameter("cdes");
								
								cb.setCname(cname);
								cb.setCdes(cdesc);
								int val=cd.addCategory(cb);
								System.out.println(val+"HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
								if(val>0)
								{
									session.setAttribute("result", "success");
									response.sendRedirect("add_category.jsp");
									//out.print("<center><h2>Category information has been succesfully created.</h2></center>");
								}
								else
								{
									out.print("<center><h2>ERROR CHECK DAO LAYER</h2></center>");
								}
								break;
			case "editCategory":String pc_id=request.getParameter("cid");
								String pc_name=request.getParameter("cname");
								String pc_des=request.getParameter("cdes");
								cb.setCid(pc_id);
								cb.setCname(pc_name);
								cb.setCdes(pc_des);
								
								int val1=cd.editCategory(cb);
								if(val1>0)
								{
									session.setAttribute("result", "success");
									response.sendRedirect("edit_category.jsp");
									//out.print("<center><h2>Category information has been succesfully created.</h2></center>");
								}
								else
								{
									out.print("<center><h2>ERROR CHECK DAO LAYER</h2></center>");
								}
								break;
			case "addPackage":	String p_pname=request.getParameter("pname");
								String p_pcredit=request.getParameter("pcredit");
								String p_price=request.getParameter("price");
								String p_pimg=request.getParameter("pimg");
								
								cb.setPname(p_pname);
								cb.setPrice(p_price);
								cb.setPcredits(p_pcredit);
								cb.setPimg(p_pimg);
								
								int val2=cd.addPack(cb);
								if(val2>0)
								{
									session.setAttribute("result", "success");
									response.sendRedirect("add_package.jsp");
								}
								else
								{
									out.print("<center><h2>ERROR CHECK DAO LAYER</h2></center>");
								}
								break;
								
			case "addUpdatedPackage":String p_pid=request.getParameter("pid");
									 String p_name=request.getParameter("pname");
									 String p_rice=request.getParameter("price");
									 String p_credit=request.getParameter("credit");
									 String p_img=request.getParameter("img");
									 
									 int id=Integer.parseInt(p_pid);
									 
									 cb.setPid(id);
									 cb.setPname(p_name);
									 cb.setPrice(p_rice);
									 cb.setPcredits(p_credit);
									 cb.setPimg(p_img);
									 
									 int val3=cd.addUpdatePack(cb);
									 if(val3>0)
									 {
										 session.setAttribute("result", "success");
											response.sendRedirect("edit_pack.jsp"); 
									 }
									 else
									 {
										 out.print("<center><h2>ERROR CHECK DAO LAYER</h2></center>"); 
									 }
									 
									 break;

		}
		
		 
	}

	 

}
