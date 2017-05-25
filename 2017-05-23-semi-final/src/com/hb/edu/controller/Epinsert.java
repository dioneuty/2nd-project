package com.hb.edu.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.edu.model.EpilogueDao;
import com.hb.user.model.HanbUserDao;

@WebServlet("/education/ep_insert.hb")
public class Epinsert extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String uids = (String) session.getAttribute("uids");
		System.out.println("id : "+uids);
		HanbUserDao hdao = new HanbUserDao();
		EpilogueDao epdao = new EpilogueDao();
		String epcont = request.getParameter("epils");
		String uname = "";
		try {
			uname = hdao.selectUname(uids);
			epdao.insertOne(epcont, uname);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			response.sendRedirect("process.hb");
	}

}
