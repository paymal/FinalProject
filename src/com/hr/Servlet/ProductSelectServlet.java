package com.hr.Servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hr.dao.EASYBUY_PRODUCTDao;
import com.hr.dao.EASYBUY_PRODUCT_CATEGORYDao;
import com.hr.entity.EASYBUY_PRODUCT;

public class ProductSelectServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		int cpage = 1;
		int count = 5;
		String cp = req.getParameter("cp");
		if(cp!=null){
			cpage = Integer.parseInt(cp);
		}
		
		int tpage = 0;
		ArrayList<EASYBUY_PRODUCT> eplist = EASYBUY_PRODUCTDao.selectAll(cpage, count);
		tpage = EASYBUY_PRODUCTDao.totalPage(count);
		
		req.setAttribute("eplist", eplist);		
		req.setAttribute("cpage", cpage);		
		req.setAttribute("tpage", tpage);
		req.getRequestDispatcher("product.jsp").forward(req, resp);
	}
}
