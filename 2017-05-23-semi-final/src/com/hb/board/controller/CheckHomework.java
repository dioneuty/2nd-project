package com.hb.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.hb.board.model.BoardDao;

@WebServlet("/staff/check_homework.hb")
public class CheckHomework extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
	throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		int hnum = Integer.parseInt(req.getParameter("hnum"));
		int result = 0;
		 	
		BoardDao bdao = new BoardDao();
		try {
			result = bdao.updateChkHmwk(hnum);
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
			
		JSONObject jResult=new JSONObject();
		jResult.put("result", result);
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(jResult);
		out.close();
	}
}
