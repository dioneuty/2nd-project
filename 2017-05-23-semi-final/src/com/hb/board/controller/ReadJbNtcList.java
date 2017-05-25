package com.hb.board.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.board.model.BoardDao;

@WebServlet("/staff/read_jbntclist.hb")
public class ReadJbNtcList extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		JSONArray jbNtcList_jlist = new JSONArray(); //jbNtcList
		BoardDao bdao = new BoardDao();
		int rows = 0;
		int pages = 1;
		try {
			jbNtcList_jlist = bdao.selectAllNewJobs();
			rows = bdao.countJbntcRow();
			
			if( (rows / 10) > 0){
				pages = rows/10;
				if( (rows % 10) > 0){
					pages++;
				}
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JSONObject obj = new JSONObject();
		obj.put("jbNtcList_jlist", jbNtcList_jlist);
		obj.put("rows", rows);
		obj.put("pages", pages);
		System.out.println(obj);
		
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().print(obj);
	}
}
