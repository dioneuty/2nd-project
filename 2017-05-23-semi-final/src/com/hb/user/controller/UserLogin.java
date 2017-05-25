package com.hb.user.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.hb.user.model.HanbUserDao;
import com.hb.user.model.HanbUserDto;
import com.hb.user.model.UserAttendDao;
import com.hb.user.model.UserAttendDto;
import com.hb.util.DBcon;

@WebServlet("/login.hb")
public class UserLogin extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
	throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uids = req.getParameter("uids");
		String upw = req.getParameter("upw");
		String remember = req.getParameter("remember"); // on off

		int result = 0;
		JSONObject udto = new JSONObject();
		HanbUserDto ubean = new HanbUserDto();

		// model
		List<Integer> list = new ArrayList<Integer>();
		HanbUserDao dao = new HanbUserDao();
		try{
		result = dao.LoginChk(uids, upw);
		dao = new HanbUserDao();
		udto = dao.selectOne(uids);
		ubean = dao.selectOnes(uids);
		} catch (ClassNotFoundException e) {
//			try {
//				DBcon.rollback();
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
			e.printStackTrace();
		} catch (SQLException e) {
//			try {
//				DBcon.rollback();
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
			e.printStackTrace();
		}

		// session
		int udres = 0;
		UserAttendDao uadao = new UserAttendDao();

		HttpSession sess = req.getSession();

		if (result > 0) {
			try {		
				udres = uadao.selectOne((Integer)udto.get("unum"));
				if(udres == 0){
					uadao.insertStart((Integer)udto.get("unum"));
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			sess.setAttribute("uids", uids);
			sess.setAttribute("result", true);
			sess.setAttribute("unum",(Integer) udto.get("unum"));
			// request.setAttribute("utype", bean.getUtype());
			sess.setAttribute("utype", (Integer) udto.get("utype"));
			sess.setAttribute("uname", (String) udto.get("uname"));
			sess.setAttribute("ubean", ubean);
		} else {
			sess.setAttribute("result", false);
			// request.setAttribute("utype", -1);
			sess.setAttribute("utype", -1);
		}

		resp.sendRedirect("index.hb");

	}

}
