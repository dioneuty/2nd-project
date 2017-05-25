package com.hb.staff.model;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Test;

public class DaoTest {
	private String ename = "e";
	private String esub1 = "e";
	private String esub2 = "e";
	private String esub3 = "e";
	private String startdate = "2017-01-02";
	private String enddate = "2017-01-20";
	private int etotalday = 23;
	private Integer tchrN = 41;
	private int stnum = 23;

	@Test
	public void test() throws SQLException, ClassNotFoundException {
		PaDao pdao = new PaDao();
		// int result=pdao.PinsertTchr2("efe", "3f3", 22);
		assertEquals("1", "1");
	}

}
