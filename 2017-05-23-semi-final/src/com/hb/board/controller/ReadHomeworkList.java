package com.hb.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.board.model.BoardDao;
import com.hb.student.model.HomeworkDto;

@WebServlet("/staff/read_homework.hb")
public class ReadHomeworkList extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		JSONArray jlist = new JSONArray();
		JSONObject jobj= new JSONObject();
		
		BoardDao bdao = new BoardDao();
		int rows = 0;
		int pages = 1;
		
		try {
			jlist = bdao.selectAllJHmwk();
			rows = bdao.countHmwkRow();
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
		
		jobj.put("rows",rows);	
		jobj.put("pages",pages);
		jobj.put("homework",jlist);
		//{"noticeList":[{idx:, uids, },{idx:uids},{idx:udis}]}
		System.out.println(jobj);
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(jobj);
		out.close();
	}


}
