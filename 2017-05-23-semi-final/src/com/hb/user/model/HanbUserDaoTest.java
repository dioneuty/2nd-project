package com.hb.user.model;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Assert;
import org.junit.Test;

public class HanbUserDaoTest {

	@Test
	public void testSelectAll() throws ClassNotFoundException, SQLException {
		HanbUserDao dao = new HanbUserDao();
		ArrayList<HanbUserDto> list = dao.SelectAll();
		Assert.assertTrue(list.size() != 0);
	}

}
