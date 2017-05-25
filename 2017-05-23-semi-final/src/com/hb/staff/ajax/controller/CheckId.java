package com.hb.staff.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.user.model.HanbUserDao;
import com.hb.util.DBcon;

@WebServlet(urlPatterns = {"/staff/idchk.hb"})
public class CheckId extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		boolean result=false;
		String id=req.getParameter("id");

		HanbUserDao dao = new HanbUserDao();
		try{
		result=dao.checkId(id);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JSONObject jobj1 = new JSONObject();
		
		//jobj2.put("result",result);
		//jlist1.add(jobj2);
		jobj1.put("result", result);
		
		//{chk:[{result:true}]}
		//String msg="{\"chk\":[{\"result\":"+result+"}]}";
		System.out.println(jobj1);
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(jobj1);
		out.close();
	}
}
