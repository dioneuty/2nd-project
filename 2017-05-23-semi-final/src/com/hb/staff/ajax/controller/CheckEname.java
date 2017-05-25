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

import com.hb.staff.model.PaDao;
import com.hb.user.model.HanbUserDao;
import com.hb.util.DBcon;

@WebServlet("/staff/checkename.hb")
public class CheckEname extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		boolean result=false;
		String ename=req.getParameter("ename");
		
		PaDao dao = new PaDao();
		try{
		result=dao.checkEname(ename);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		JSONObject jobj1 = new JSONObject();
		/*JSONArray jlist1 = new JSONArray();
		JSONObject jobj2 = new JSONObject();
		
		jobj2.put("result",result);
		jlist1.add(jobj2);*/
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
