package com.hb.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.user.model.HanbUserDao;

@WebServlet("/user/findid.hb")
public class Findid extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		HanbUserDao hdao = new HanbUserDao();
		String idemail = request.getParameter("idemail");
		String idphone = request.getParameter("idphone");

		String results = "";
		String id = "";
		try {
			if (!(idemail.equals(""))) {
				id = hdao.findide(idemail);
				results = "찾으시는 아이디는 "+id+" 입니다.";
			}
			else if (!(idphone.equals(""))) {
				id = hdao.findidp(idphone);
				results = "찾으시는 아이디는 "+id+" 입니다.";
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(results);
		out.close();
	}

}
