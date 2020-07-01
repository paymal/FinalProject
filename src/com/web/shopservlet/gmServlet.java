package com.web.shopservlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hr.dao.ESDao;
import com.hr.entity.EASYBUY_ORDER_DETAIL;
import com.hr.entity.EASYBUY_USER;
import com.hr.util.EncodeUtil;


public class gmServlet extends HttpServlet {
@Override
protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
		throws ServletException, IOException {
	arg1.setContentType("text/html;charset=utf-8");
	PrintWriter out=arg1.getWriter();
	EncodeUtil.encode(arg0);
	HttpSession session=arg0.getSession();
	EASYBUY_USER list=(EASYBUY_USER)session.getAttribute("name");	
	String id=list.getEU_USER_ID();	
	String name=list.getEU_USER_NAME();	
	String address=list.getEU_ADDRESS();
	String price=arg0.getParameter("jstext");
	String [] EP_ID=arg0.getParameterValues("spID");	
	String [] quantity=arg0.getParameterValues("number");	
	String [] sPPrice=arg0.getParameterValues("sPPrice");
	

	for(int i=0;i<EP_ID.length;i++){
		int count5=ESDao.updateStock(Integer.parseInt(quantity[i]),Integer.parseInt(EP_ID[i]));
	}
	
	int [] pprice=new int[EP_ID.length];
	for(int i=0;i<EP_ID.length;i++){
		pprice[i]=Integer.parseInt(quantity[i])*Integer.parseInt(sPPrice[i]);
	} 
	
	int count=ESDao.insertDD(id, name, address,Integer.parseInt(price));
	int getSequenceId=ESDao.getSequenceId();
	
	for(int i=0;i<EP_ID.length;i++){
		EASYBUY_ORDER_DETAIL eod=new EASYBUY_ORDER_DETAIL(1,getSequenceId,Integer.parseInt(EP_ID[i]),Integer.parseInt(quantity[i]),pprice[i]);
		int count2=ESDao.eodInsert(eod);
	}
	
	
	String [] esID=arg0.getParameterValues("esID");
	for(int i=0;i<esID.length;i++){
		int count3 =ESDao.esdelete(Integer.parseInt(esID[i]));
	}
	
	if(count>0){
			
		out.print("<script>");
		out.print("alert('Successful shopping');");
		out.print("location.href='shopping-result.jsp';");
		out.print("</script>");
		out.close();
	}else{
		out.print("<script>");
		out.print("alert('Shopping failed, please re-select the product');");
		out.print("location.href='ShopSelect';");
		out.print("</script>");
		out.close();
	}
}
}
