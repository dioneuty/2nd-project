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

@WebServlet("/staff/newepil_result.hb")
public class NewEpilResult extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
	throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession sess = req.getSession();
		
		String id = (String) sess.getAttribute("uids");
		int utype = (int) sess.getAttribute("utype");
		
		String uname = req.getParameter("uname");
		String title = req.getParameter("title");
		String cont = req.getParameter("cont");
		int result = 0;
		 	
		BoardDao bdao = new BoardDao();
		try {
			result = bdao.insertOneEpil(id,utype,uname,title,cont);
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
