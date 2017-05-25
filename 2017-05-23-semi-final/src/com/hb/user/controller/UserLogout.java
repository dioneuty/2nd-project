package com.hb.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout.hb")
public class UserLogout extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// session
		HttpSession sess = req.getSession();
		sess.setAttribute("uids", null);
		sess.setAttribute("result", null);
		sess.setAttribute("utype", null);
		String path = req.getContextPath();
		resp.sendRedirect(path+"/index.hb");
	}

}
