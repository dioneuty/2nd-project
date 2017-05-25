package com.hb.staff.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.staff.model.TchrDao;
import com.hb.util.DBcon;

@WebServlet("/staff/chkexam_result.hb")
public class ChkExamResult extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//////////[validation]/////////
		Enumeration<String> params = req.getParameterNames();
		while(params.hasMoreElements()){
			String param=params.nextElement();
			if(req.getParameter(param).equals("")){
				resp.getWriter().print(goback());
				resp.getWriter().close();
				return;
			}
		}//while end
		//////////////////////////
		int result=0;
		int unum=Integer.parseInt(req.getParameter("stud"));
		String fir_sub=req.getParameter("sub1");
		String sec_sub=req.getParameter("sub2");
		String thr_sub=req.getParameter("sub3");
		
		TchrDao tdao = new TchrDao();
		try{
		result = tdao.updateScore(unum,fir_sub,sec_sub,thr_sub);
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
		JSONObject jobj1 = new JSONObject();
		
		jobj1.put("result", result);
		/*jlist1.add(jobj2);
		jobj1.put("submit", jlist1);*/
		
//		System.out.println(jobj1);
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(jobj1);
		out.close();
		
		/*if(result>0){
			resp.setContentType("text/html; charset=UTF-8"); 
			resp.setCharacterEncoding("UTF-8");
			String msg="<script type=\"text/javascript\">";
			msg+="alert('추가완료했습니다.');";
			msg+="</script>";
			PrintWriter out = resp.getWriter();
			out.println(msg);
			resp.sendRedirect("stf_info.hb");
		}else{
			req.getRequestDispatcher("/err.jsp").forward(req, resp);
		}*/
		
	}
	private String goback() {
		String msg="<script type=\"text/javascript\">";
		msg+="window.history.back();";
		msg+="</script>";
		return msg;
	}

}
