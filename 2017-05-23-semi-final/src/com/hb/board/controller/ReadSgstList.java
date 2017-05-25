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

@WebServlet("/staff/read_suggestlist.hb")
public class ReadSgstList extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		JSONArray List = new JSONArray();
		JSONObject Json= new JSONObject();

		BoardDao bdao = new BoardDao();
		int rows = 0;
		int pages = 1;
		
		try {
			List = bdao.selectAllSuggestList();
			rows = bdao.countSuggestRow();
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
		
		
		Json.put("rows",rows);
		Json.put("pages",pages);
		Json.put("sgstList_blist",List);
		//{"noticeList":[{idx:, uids, },{idx:uids},{idx:udis}]}
		System.out.println(Json);
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(Json);
		out.close();
	}
}
