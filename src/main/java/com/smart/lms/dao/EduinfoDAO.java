package com.smart.lms.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EduinfoDAO {
	
	 @Autowired private SqlSessionTemplate mybatis;
	 
}
