package com.hb.staff.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.user.model.HanbUserDao;

@WebServlet("/staff/modifyself_result.hb/")
public class ModifySelfResult extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession sess = req.getSession();
		int utype = (int) sess.getAttribute("utype");
		int unum = (int) sess.getAttribute("unum");
		
		JSONObject obj = new JSONObject();
		int result = 0;
		
		String uids = req.getParameter("uids");
		String upw = req.getParameter("upw");
		String uemail = req.getParameter("uemail");
		String uphone = req.getParameter("uphone");
		
		HanbUserDao udao = new HanbUserDao();
		
		try {
			result = udao.updateSelf(unum,uids,upw,uemail,uphone,utype);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		obj.put("result", result);

		if (result > 0) {
			sess.setAttribute("uids", uids);
		}
		
		System.out.println(obj);
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(obj);
		out.close();
	}

}
