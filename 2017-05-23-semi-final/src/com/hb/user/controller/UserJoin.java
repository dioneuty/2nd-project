package com.hb.user.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.user.model.HanbUserDao;
import com.hb.util.DBcon;

@WebServlet("/join.hb")
public class UserJoin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone1");
		phone += request.getParameter("phone2");
		phone += request.getParameter("phone3");
		int type = Integer.parseInt(request.getParameter("utypes"));
		
		// model

		int result = 0;
		ArrayList<String> chks = new ArrayList<String>();
		HanbUserDao udao = new HanbUserDao();
		HttpSession session = request.getSession();
		
		try{
			result = udao.insertOne(id, password, name, email, phone, type);
		if (result > 0) {
			response.sendRedirect("index.hb");
			session.setAttribute("join_result",result);
		} else {
			session.setAttribute("join_result",result);
		}	
		//DBcon.commit();
		} catch (ClassNotFoundException e) {
//			try {
//				DBcon.rollback();
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
			e.printStackTrace();
		} catch (SQLException e) {
//			try {
//				DBcon.rollback();
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
			e.printStackTrace();
		}
	}
}
