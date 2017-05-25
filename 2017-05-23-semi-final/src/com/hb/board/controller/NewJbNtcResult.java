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
import com.hb.util.DBcon;

@WebServlet("/staff/newjbntc_result.hb")
public class NewJbNtcResult extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
	throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession sess = req.getSession();
		
		String id = (String) sess.getAttribute("uids");
		int utype = (int) sess.getAttribute("utype");
		
		int ji_num = Integer.parseInt(req.getParameter("ji_num"));
		String ji_comp = req.getParameter("ji_comp");
		String ji_area = req.getParameter("ji_area");
		int ji_recruit = Integer.parseInt(req.getParameter("ji_recruit"));
		String ji_type = req.getParameter("ji_type");
		String ji_enddate = req.getParameter("ji_enddate");
		String ji_date = req.getParameter("ji_date");
		String ji_pay = req.getParameter("ji_pay");
		String ji_phone = req.getParameter("ji_phone");
		String ji_cont = req.getParameter("ji_cont");
		
		int result = 0;
		
		BoardDao bdao = new BoardDao();
		try {
			result = bdao.insertJobNotice(id,utype,ji_num,ji_comp,ji_area,ji_recruit,ji_type,ji_enddate,ji_date,ji_pay,ji_phone,ji_cont);
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
		
		
		
		/*if(result>0){
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			String msg = "<script type=\"text/javascript\">";
			msg += "alert('추가완료했습니다.');";
			msg += "</script>";
			resp.getWriter().print(msg);
			resp.sendRedirect("stf_info.hb");
		}else{
			req.getRequestDispatcher("/err.jsp").forward(req, resp);
		}*/
	}
}
