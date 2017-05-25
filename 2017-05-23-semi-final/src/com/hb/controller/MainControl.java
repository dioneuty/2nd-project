package com.hb.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.customer.model.NoticeDao;
import com.hb.customer.model.NoticeDto;
import com.hb.user.model.HanbUserDao;

@WebServlet("/index.hb")
public class MainControl extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> chks = new ArrayList<String>();
		ArrayList<NoticeDto> nlist = new ArrayList<NoticeDto>();
		
		HanbUserDao udao = new HanbUserDao();
		NoticeDao ndao = new NoticeDao();
		
		HttpSession session = request.getSession();
		
		
		Boolean results = (Boolean) session.getAttribute("result");
		Integer utypes = (Integer) session.getAttribute("utype");
		
		try {
			chks = udao.checkIds();
			nlist = ndao.SelectAll();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//model
			
		
		//view
			request.setAttribute("results", results);
			request.setAttribute("utypes", utypes);
			session.setAttribute("chks", chks);
			request.setAttribute("nlist", nlist);
			request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
