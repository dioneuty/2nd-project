package com.hb.customer.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.customer.model.FaqDao;
import com.hb.customer.model.FaqDto;
import com.hb.customer.model.NoticeDao;
import com.hb.customer.model.NoticeDto;

@WebServlet("/customer/custom_info.hb")
public class custom_info extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<NoticeDto> nlist = new ArrayList<NoticeDto>();
		ArrayList<FaqDto> flist = new ArrayList<FaqDto>();
		ArrayList<FaqDto> ftype1 = new ArrayList<FaqDto>();
		ArrayList<FaqDto> ftype2 = new ArrayList<FaqDto>();
		ArrayList<FaqDto> ftype3 = new ArrayList<FaqDto>();
		NoticeDao ndao = new NoticeDao();
		FaqDao fdao = new FaqDao();
		
		try {
			nlist = ndao.SelectAll();
			flist = fdao.SelectAll();
			ftype1 = fdao.SelectOne(1);
			ftype2 = fdao.SelectOne(2);
			ftype3 = fdao.SelectOne(3);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("nlist", nlist);
		request.setAttribute("flist", flist);
		request.setAttribute("ftype1", ftype1);
		request.setAttribute("ftype2", ftype2);
		request.setAttribute("ftype3", ftype3);
		request.getRequestDispatcher("custom_info.jsp").forward(request, response);
	}

}
