package com.hb.job.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.job.model.JobInfoDao;
import com.hb.job.model.JobInfoDto;
import com.hb.job.model.JobStateDao;
import com.hb.job.model.JobStateDto;

@WebServlet("/job/info.hb")
public class JobInfo extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<JobInfoDto> jilist = new ArrayList<JobInfoDto>();
		ArrayList<JobStateDto> jslist = new ArrayList<JobStateDto>();
		JobInfoDao jidao = new JobInfoDao();
		JobStateDao jsdao = new JobStateDao();
		try {
			jilist = jidao.selectAll();
			jslist = jsdao.selectAll();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("jilist", jilist);
		request.setAttribute("jslist", jslist);
		request.getRequestDispatcher("info.jsp").forward(request, response);
	}

}
