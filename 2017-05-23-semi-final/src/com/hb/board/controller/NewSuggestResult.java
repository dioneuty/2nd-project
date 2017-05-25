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

@WebServlet("/staff/newsuggest_result.hb")
public class NewSuggestResult extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession sess = req.getSession();
		
		String id = (String) sess.getAttribute("uids");
		int utype = (int) sess.getAttribute("utype");
		
		//String pw = req.getParameter("pw");
		String title = req.getParameter("title");
		String sgstext = req.getParameter("cont");
		int result = 0;
		
		BoardDao bdao = new BoardDao();
		try {
			result = bdao.insertSuggest(utype, id, title, sgstext);
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




		// if(result>0){
		// 	resp.setContentType("text/html; charset=UTF-8");
		// 	resp.setCharacterEncoding("UTF-8");
		// 	String msg = "<script type=\"text/javascript\">";
		// 	msg += "alert('추가완료했습니다.');";
		// 	msg += "</script>";
		// 	resp.getWriter().print(msg);
		// 	resp.sendRedirect("stf_info.hb");
		// }else{
		// 	req.getRequestDispatcher("/err.jsp").forward(req, resp);
		// }
	}
}
