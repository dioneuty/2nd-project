package com.hb.student.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.student.model.HomeworkDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@WebServlet("/student/uploadOK.hb")
public class uploadOk extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String path = "C:\\Users\\hb\\Desktop\\workspace\\zxy\\WebContent\\upload"; 
		MultipartRequest m = new MultipartRequest(request, path,1024 * 1024 * 50,"UTF-8", new DefaultFileRenamePolicy());
		request.setCharacterEncoding("UTF-8");
		String sub = m.getParameter("h_sub");
		String cont = m.getParameter("h_cont");
		ArrayList<String> names = new ArrayList<String>();
		ArrayList<String> origins = new ArrayList<String>();

		Enumeration fnames = m.getFileNames();

		while (fnames.hasMoreElements()) {
			String file = (String) fnames.nextElement();
			String files = new String (file.getBytes ("8859_1"), "UTF-8");
			String finame = m.getFilesystemName(files);
			finame = rePlace(finame);
			names.add(finame);
			String forigin = m.getOriginalFileName(file);
			String forigins = new String (forigin.getBytes ("8859_1"), "UTF-8");
			origins.add(forigins);
		}
		

		
			String file1 = null;
			String file2 = null;
			String file3 = null;
			String file4 = null;
			String file5 = null;
			
		HomeworkDao hdao = new HomeworkDao();
		HttpSession session = request.getSession();
		String uname= (String) session.getAttribute("uname");
		
		if(names.size()==1){
			file1 = names.get(0);
		}if(names.size()==2){
			file1 = names.get(0);
			file2 = names.get(1);
		}
		if(names.size()==3){
			file1 = names.get(0);
			file2 = names.get(1);
			file3 = names.get(2);	
		}
		if(names.size()==4){
			file1 = names.get(0);
			file2 = names.get(1);
			file3 = names.get(2);
			file4 = names.get(3);
		}
		if(names.size()==5){
			file1 = names.get(0);
			file2 = names.get(1);
			file3 = names.get(2);
			file4 = names.get(3);
			file5 = names.get(4);
		}
		try {
			hdao.insertHw(sub, cont, file1, file2, file3, file4, file5, uname);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("std_info.hb");
	}

	
	public String rePlace(String s){
        s= s.replaceAll("\\p{Z}","");
        //s= s.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
        
        System.out.println(s);
        
        return s;
	}
}
