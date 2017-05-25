package com.hb.student.model;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Test;

public class HomeworkDaoTest {

	@Test
	public void test() throws ClassNotFoundException, SQLException {
		HomeworkDao dao = new HomeworkDao();
		ArrayList<HomeworkDto> list = dao.SelectOne("stu7");
		assertNotEquals(0, list.size());
	}

}
