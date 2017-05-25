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

import com.hb.staff.model.EduDto;
import com.hb.staff.model.PaDao;
import com.hb.util.DBcon;

@WebServlet("/staff/subshow.hb")
public class StuSubShow extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		int unum=Integer.parseInt(req.getParameter("unum"));
		//Integer unum=64;
		String esub1 = "없음";
		String esub2 = "없음";
		String esub3 = "없음";
		
		JSONObject edto = new JSONObject();
		PaDao pdao=new PaDao(); 
		try{
		edto = pdao.selectSubsOfOneClsUnum(unum);
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
		
		esub1 = (String) edto.get("esub1");
		esub2 = (String) edto.get("esub2");
		esub3 = (String) edto.get("esub3");
		
		//{chk:[{result:true}]}
		JSONObject jobj1 = new JSONObject();
		JSONArray jlist1 = new JSONArray();
		JSONObject jobj2 = new JSONObject();

		jobj2.put("esub1", esub1);
		jobj2.put("esub2", esub2);
		jobj2.put("esub3", esub3);
		//jlist1.add(jobj2);
		jobj1.put("subject", jobj2);
		
		//String msg="{\"subject\":[{\"esub1\":\""+esub1+"\",\"esub2\":\""+esub2+"\",\"esub3\":\""+esub3+"\"}]}";
		//System.out.println(msg);
		System.out.println(jobj1);
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(jobj1);
		out.close();
		
	}
}
