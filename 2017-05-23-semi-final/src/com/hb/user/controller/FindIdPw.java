package com.hb.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.user.model.HanbUserDao;
import com.hb.user.model.HanbUserDto;

@WebServlet("/user/find_idpw.hb")
public class FindIdPw extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HanbUserDao udao = new HanbUserDao();

		request.getRequestDispatcher("find_idpw.jsp").forward(request, response);
	}

}
