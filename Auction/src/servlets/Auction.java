package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AuctionItem;
import dao.AuctionDao;

 
@WebServlet("/Auction")
public class Auction extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public Auction() {
        super();
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out=response.getWriter();
		AuctionItem ai=new AuctionItem();
		AuctionDao ad=new AuctionDao();
		String ftype=request.getParameter("ftype");
		
		switch(ftype)
		{
			case "addAuc":	String piname=request.getParameter("iname");
							String pdes=request.getParameter("des");
							int pctg=Integer.parseInt(request.getParameter("ctg"));
							int pbprice=Integer.parseInt(request.getParameter("bprice"));
							int pcredit=Integer.parseInt(request.getParameter("credit"));
							String psdate=request.getParameter("sdate");
							String pedate=request.getParameter("edate");
							String psts=request.getParameter("sts");
							String p_pimg=request.getParameter("pimg");
							String s_uname=session.getAttribute("suname").toString();
							
							ai.setPr_name(piname);
							ai.setDescription(pdes);
							ai.setCredit(pcredit);
							ai.setC_id(pctg);
							ai.setMin_bid_price(pbprice);
							ai.setSdate(psdate);
							ai.setEdate(pedate);
							ai.setStatus(psts);
							ai.setImg(p_pimg);
							ai.setUname(s_uname);
							
							int val=ad.addAuc(ai);
							System.out.println(val+"------bruuuuuu----"+s_uname);
							if(val>0)
							{
								session.setAttribute("result", "success");
								response.sendRedirect("add_auc_item.jsp");
								
							}
							else
							{
								out.print("<center><h2>ERROR CHECK DAO LAYER</h2></center>");

							}
							break;
			case "closebid":int pid=Integer.parseInt(request.getParameter("pid"));
							String sts="Close";
							
							ai.setPr_id(pid);
							ai.setStatus(sts);
							
							int val1=ad.closeBid(ai);
							if(val1>0)
							{
								session.setAttribute("result", "success");
								response.sendRedirect("auc_closed.jsp");
								
							}
							else
							{
								out.print("<center><h2>ERROR CHECK DAO LAYER</h2></center>");

							}
							break;
							
							
		}
	}

	 
	 

}
