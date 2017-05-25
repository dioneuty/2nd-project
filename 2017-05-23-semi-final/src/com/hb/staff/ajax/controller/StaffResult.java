package com.hb.staff.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.board.model.BoardDao;
import com.hb.staff.model.BsnsDao;
import com.hb.staff.model.JbSptDao;
import com.hb.staff.model.PaDao;
import com.hb.user.model.HanbUserDao;

@WebServlet("/staff/stf_result.hb")
public class StaffResult extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		///////////////////////////////////////////////////////////////////
		Integer signal = 0;
		signal = Integer.parseInt(req.getParameter("signal"));
		/*bsns*/
		JSONArray addStuFormList_elist = new JSONArray();//addstuform
		JSONArray updateStuForm_ulist = new JSONArray();//updatestuform
		JSONArray updateStuForm_elist = new JSONArray();//updatestuform
		JSONArray cnsltWaiting = new JSONArray();
		
		/*jbSpt*/
		JSONArray jbCnsltStuList_ulist = new JSONArray(); //jbCnsltStuList
		// JSONArray jbNtcList_jlist = new JSONArray(); //jbNtcList
			//cStuList
			//MngCBoard
		
		/*pa*/
			//addStaff (x)
		JSONArray addTchrForm_elist = new JSONArray(); //addTchrForm
		JSONArray clsList_elist = new JSONArray(); //ClsList
		JSONArray mngatndList = new JSONArray(); //MngAtnd
			//MngBoard
		JSONArray newClsForm_ulist = new JSONArray();//newClsForm
			//NewNoticeForm
		JSONArray noclsTchrs_ulist = new JSONArray(); //NoClassTeacher
		JSONArray stusList_slist = new JSONArray(); //StusList
		JSONArray modifyStuList_slist = new JSONArray(); //stuList in modifyStu
		JSONArray modifyEduList_elist = new JSONArray();//eduList in modifyStu
		JSONArray delStuList_slist = new JSONArray(); //delStuList
		JSONArray tchrList_tlist = new JSONArray(); //TchrList
		JSONArray stfList_ulist = new JSONArray(); //stfList
		JSONArray userList = new JSONArray(); //UserList
		
		/*stu*/
			
			
		
		/*tchr*/
		JSONArray chkAtndForm_ulist = new JSONArray(); //ChkAtndForm
		JSONArray chkExamForm_ulist = new JSONArray(); //ChkAtndForm
		//ChkExamForm
		
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
		//Boolean result = (Boolean) session.getAttribute("result");
		
			//joinform
			//loginform
			//loginresult
		JSONArray noticeBoard_blist = new JSONArray(); 	//noticboard
			//opinionform
		
		//////////////////////////////////////////////////////////////////////////
		PaDao pdao;
		JSONObject info_udto = null;
		
		pdao = new PaDao();
		HanbUserDao udao = new HanbUserDao();
		BoardDao bdao = new BoardDao();
		JbSptDao jdao = new JbSptDao();
		BsnsDao bsdao = new BsnsDao();
		try{
		////////////////////
		
		/*TODO b*/
		if(signal==1) addStuFormList_elist = pdao.selectAllCls(); //addstuform
//		System.out.println("stu: "+addStuFormList_elist);
		if(signal==2) updateStuForm_ulist = udao.selectAllNotStu(); //updatestuform
		if(signal==2) updateStuForm_elist = pdao.selectAllCls(); //updatestuform
		if(signal==3) cnsltWaiting = bsdao.selectAllCnsltMembers();
		
		/*TODO jbSpt*/
		if(signal==41)jbCnsltStuList_ulist = jdao.selectAllWait();//jbCnsltStuList
		//jbNtcList_jlist = jdao.selectAllNewJobs(); //jbNtcList
			//cStuList
			//MngCBoard
		
		/*TODO p*/
		//addStaff (x)
		if(signal==72) addTchrForm_elist = pdao.selectAllCls(); //addtchrform
		if(signal==9) clsList_elist = pdao.selectAllCls(); //clslist
		if(signal==6) mngatndList = pdao.selectStusAtnd(); //mngatndlist
		//MngBoard
		if(signal==91) newClsForm_ulist = udao.selectTchrs(); //newclsform
		if(signal==92) clsList_elist = pdao.selectAllCls(); //modifyClsList
		if(signal==92) tchrList_tlist = udao.selectTchrs();
		if(signal==93) clsList_elist = pdao.selectAllCls(); //delClsList
		//NewNoticeForm
		if(signal==61) stusList_slist = pdao.selectStusAtnd(); //stusList
		if(signal==62){
			modifyStuList_slist = pdao.selectStusAtnd(); //stuList in modifyStu
			modifyEduList_elist = pdao.selectAllCls(); //eduList in modifyStu
		}
		if(signal==63) delStuList_slist = pdao.selectStusAtnd(); //delStuList
		if(signal==71) tchrList_tlist = udao.selectTchrAll(); //tchrlist
		if(signal==8) stfList_ulist = udao.selectAllStf(); //stfList
		if(signal==82) stfList_ulist = udao.selectAllStf(); //ModifyStf
		if(signal==82) noclsTchrs_ulist = pdao.selectNoclsTchrs(); 
		if(signal==5) userList = udao.selectAllUser();//UserList 
		
		/*stu*/
		
		/*tchr*/
		if(signal==11) chkAtndForm_ulist = udao.selectAllStuAtnd(); //chkantdForm
		if(signal==12) chkExamForm_ulist = udao.selectAllStu(); //ChkExamForm
		
		/*user*/
		if(signal==13) info_udto = udao.selectOne(id,utype);  //info
		//System.out.println("info_udto"+info_udto);
		//joinform
		//loginform
		//loginresult
			//noticeBoard_blist = bdao.selectAllNoticeboard();//noticboard
		//opinionform
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
			
//		System.out.println("staffinfo.jsp");
		/*TODO JSON */
		JSONObject topobj=new JSONObject();
		///////////////////////////////////////////////////////////////////////////////
		//bsns
		if(signal==1) topobj.put("addStuFormList_elist", addStuFormList_elist);
		if(signal==2) topobj.put("updateStuForm_ulist", updateStuForm_ulist);
		if(signal==2) topobj.put("updateStuForm_elist", updateStuForm_elist);
		if(signal==3) topobj.put("cnsltWaiting", cnsltWaiting);
		if(signal==13) topobj.put("info_udto", info_udto);
		
		//jbspt
		if(signal==41) topobj.put("jbCnsltStuList_ulist", jbCnsltStuList_ulist);
			//topobj.put("jbNtcList_jlist", jbNtcList_jlist);
		
		
		//pa
		if(signal==72) topobj.put("addTchrForm_elist", addTchrForm_elist);
		if(signal==9) topobj.put("clsList_elist", clsList_elist);
		if(signal==6) topobj.put("mngatndList", mngatndList);
		if(signal==91) topobj.put("newClsForm_ulist", newClsForm_ulist);
		if(signal==92) topobj.put("clsList_elist", clsList_elist);
		if(signal==92) topobj.put("tchrList_tlist", tchrList_tlist);
		if(signal==93) topobj.put("clsList_elist", clsList_elist);
		if(signal==61) topobj.put("stusList_slist", stusList_slist);
		if(signal==62){
			topobj.put("modifyStuList_slist", modifyStuList_slist);
			topobj.put("modifyEduList_elist", modifyEduList_elist);
		}
		if(signal==63) topobj.put("delStuList_slist", delStuList_slist);
		if(signal==71) topobj.put("tchrList_tlist", tchrList_tlist);
		if(signal==8) topobj.put("stfList_ulist", stfList_ulist);
		if(signal==82) topobj.put("stfList_ulist", stfList_ulist);
		if(signal==82) topobj.put("noclsTchrs_ulist",noclsTchrs_ulist);
		if(signal==5) topobj.put("userList", userList);
		
		//tchr
		if(signal==11) topobj.put("chkAtndForm_ulist", chkAtndForm_ulist);
		if(signal==12) topobj.put("chkExamForm_ulist", chkExamForm_ulist);
		
		//user
			//topobj.put("noticeBoard_blist", noticeBoard_blist);
		
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		System.out.println(topobj);
		out.print(topobj);
		out.close();
		
		
		
		/*req.getRequestDispatcher("astf_info.jsp").forward(req, resp);*/
	}

}
