package com.hb.staff.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.hb.staff.model.PaDao;

@WebServlet("/staff/stuinfoshow.hb")
public class StuInfoShow extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		Integer unum = Integer.parseInt(req.getParameter("unum"));
		
		PaDao pdao = new PaDao();
		JSONObject sdto = new JSONObject();
		try {
			sdto = pdao.selectOneStu(unum);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JSONObject obj = new JSONObject();
		obj.put("stuinfo",sdto);
		
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(obj);
		out.close();
	}

}
