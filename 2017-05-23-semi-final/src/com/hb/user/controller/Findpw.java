package com.hb.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.user.model.HanbUserDao;

@WebServlet("/user/findpw.hb")
public class Findpw extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		String passid = request.getParameter("passid");
		String passemail = request.getParameter("passemail");
		String passphone = request.getParameter("passphone");
		
		int result_p = 0;
		int result_e = 0;
		String results = "";
		String pass = "";
				
		HanbUserDao hdao = new HanbUserDao();
		try {
			result_p = hdao.checkphone(passid, passphone);
			result_e = hdao.checkemail(passid, passemail);
			System.out.println("p : "+result_p+"/ e : "+result_e );
			
			if(result_e != 0){
				pass = hdao.findpw(passid, passemail);
				results = "찾으시는 비밀번호는 "+pass+" 입니다.";
			}
			else if(result_p != 0){
				pass = hdao.findpws(passid, passphone);
				results = "찾으시는 비밀번호는 "+pass+" 입니다.";
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(results);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(results);
		out.close();
		
	}

}
