package com.hb.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.board.model.BoardDao;

@WebServlet("/staff/read_jobstatelist.hb")
public class ReadJobStateList extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		JSONArray jobstatelist = new JSONArray();
		JSONObject obj= new JSONObject();

		BoardDao bdao = new BoardDao();
		int rows = 0;
		int pages = 1;
		
		try {
			jobstatelist = bdao.selectAllJobState();
			rows = bdao.countJobstateRow();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if( (rows / 10) > 0){
			pages = rows/10;
			if( (rows % 10) > 0){
				pages++;
			}
		}
		
		
		obj.put("rows",rows);
		obj.put("pages",pages);
		obj.put("jobstate",jobstatelist);
		//{"noticeList":[{idx:, uids, },{idx:uids},{idx:udis}]}
		System.out.println(obj);
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(obj);
		out.close();
	}
}