package com.hb.staff.ajax.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.hb.staff.model.PaDao;
import com.hb.util.DBcon;

@WebServlet("/staff/modifystu_result.hb")
public class ModifyStuResult extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String uids = req.getParameter("uids");
		String ename = req.getParameter("ename");
		String uname = req.getParameter("uname");
		Integer s_append = Integer.parseInt( req.getParameter("s_append"));
		Integer s_early = Integer.parseInt( req.getParameter("s_early"));
		Integer s_absent = Integer.parseInt( req.getParameter("s_absent"));
		Integer s_empoly = Integer.parseInt( req.getParameter("s_empoly"));
		Integer s_cmpt = Integer.parseInt( req.getParameter("s_cmpt"));
		Integer s_sucemp = Integer.parseInt( req.getParameter("s_sucemp"));
		
		int result = 0;
		
		PaDao pdao = new PaDao();
		try {
			result = pdao.modifyStu(uids,ename,uname,s_append,s_early,s_absent,s_empoly,s_cmpt,s_sucemp);
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
		if(result>0){
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			String msg = "<script type=\"text/javascript\">";
			msg += "alert('추가완료했습니다.');";
			msg += "</script>";
			resp.getWriter().print(msg);
			resp.sendRedirect("stf_info.hb");
		}else{
			req.getRequestDispatcher("/err.jsp").forward(req, resp);
		}
	}

}
