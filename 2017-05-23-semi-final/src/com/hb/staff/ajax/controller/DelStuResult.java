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
import com.hb.util.DBcon;

@WebServlet("/staff/delstu_result.hb")
public class DelStuResult extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Integer value = Integer.parseInt((String) req.getParameter("notStu"));
		Integer unum = Integer.parseInt((String) req.getParameter("stuList"));
		int result = 0;
		PaDao pdao = new PaDao();
		
		try {
			
			if (value == 0){
				result = pdao.delStuAndUtype0(unum);
			} else if(value == 1){
				result = pdao.delStuDelUser(unum);
			} else{
				return;
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
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(obj);
		out.close();
	}
}
