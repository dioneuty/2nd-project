package com.hb.edu.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.edu.model.EpilogueDao;
import com.hb.edu.model.EpilogueDto;

@WebServlet("/education/process.hb")
public class EducationProcess extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<EpilogueDto> eplist = new ArrayList<EpilogueDto>();
		EpilogueDao epdao = new EpilogueDao();
		
		try {
			eplist= epdao.selectAll();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("eplist", eplist);
		request.getRequestDispatcher("process.jsp").forward(request, response);
	}

}
