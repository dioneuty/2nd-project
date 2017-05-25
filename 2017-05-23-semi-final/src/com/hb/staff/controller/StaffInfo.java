package com.hb.staff.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.edu.model.EducationDto;
import com.hb.student.model.HomeworkDao;
import com.hb.student.model.HomeworkDto;
import com.hb.student.model.StudentDao;
import com.hb.student.model.StudentDto;

@WebServlet("/staff/stf_info.hb")
public class StaffInfo extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		/*user*/
		HttpSession session = req.getSession(); //info
		String id = (String) session.getAttribute("uids");
		int utype = -1;
		if (session.getAttribute("utype")!=null) {
		utype = (int) session.getAttribute("utype");
		}
		else if (session.getAttribute("utype") == null) {
			resp.sendRedirect("../index.hb");
			return;
		}
		
		
		Integer unum =(Integer)session.getAttribute("unum");
		String uname =(String) session.getAttribute("uname");
		
		StudentDao dao = new StudentDao();
		HomeworkDao hdao = new HomeworkDao();
		StudentDto list = null;
		EducationDto dto = null;
		ArrayList<HomeworkDto> hlist = null;
		
		try {
			list = dao.SelectAll(unum);
			dto = dao.stEdu(list.getEnums());
			hlist = hdao.SelectAllHmwk();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		req.setAttribute("edu", dto);
		req.setAttribute("slist", list);
		req.setAttribute("hbean", hlist);
		
		req.getRequestDispatcher("stf_info.jsp").forward(req, resp);
	}

}