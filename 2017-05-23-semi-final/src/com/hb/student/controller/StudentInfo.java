package com.hb.student.controller;

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
import com.hb.user.model.UserAttendDao;
import com.hb.user.model.UserAttendDto;

@WebServlet("/student/std_info.hb")
public class StudentInfo extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer unum =(Integer)session.getAttribute("unum");
		String uname =(String) session.getAttribute("uname");
		
		UserAttendDao uadao = new UserAttendDao();
		StudentDao dao = new StudentDao();
		HomeworkDao hdao = new HomeworkDao();
		StudentDto list = null;
		EducationDto dto = null;
		ArrayList<HomeworkDto> hlist = null;
		ArrayList<UserAttendDto> ualist = null;
		try {
			list = dao.SelectAll(unum);
			dto = dao.stEdu(list.getEnums());
			ualist = uadao.selectAll(unum); 
			hlist = hdao.SelectOne(uname);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		request.setAttribute("edu", dto);
		request.setAttribute("slist", list);
		request.setAttribute("hbean", hlist);
		request.setAttribute("ualist", ualist);
		request.getRequestDispatcher("std_info.jsp").forward(request, response);
	}

}
