package com.capstone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDAO {
	@Autowired
	protected JdbcTemplate _jdbcTemplate;
}
