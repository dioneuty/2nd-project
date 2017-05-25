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

import com.hb.staff.model.EduDto;
import com.hb.staff.model.PaDao;
import com.hb.user.model.HanbUserDao;
import com.hb.util.DBcon;

@WebServlet("/staff/addstu_result.hb")
public class AddStuResult extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int result=0; int typeChk=0;
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
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String uname = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		
		int enum1 = Integer.parseInt(req.getParameter("enum"));
		EduDto edto=new EduDto();
		int unum;
		
//		try {
//			PaDao pdao=new PaDao();
//			edto=pdao.selectSubsOfOneCls(enum1);
//		} catch (SQLException e1) {
//			e1.printStackTrace();
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		}
		
		String firsub = "0";
		String secsub = "0";
		String thrsub = "0";
		System.out.println(firsub+secsub+thrsub);

		HanbUserDao dao = new HanbUserDao();
		try{
		result = dao.BinsertOne(id,pw,uname,email,phone);
		unum = dao.selectUnum(id);
		//교육테이블 필요
		result = dao.BinsertOneStu(unum,enum1,firsub,secsub,thrsub);
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
		JSONArray jlist1 = new JSONArray();
		JSONObject jobj2 = new JSONObject();
		
		/*jobj2.put("result", result);
		jlist1.add(jobj2);*/
		jobj1.put("result", result);
		
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
			out.print(msg);
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


