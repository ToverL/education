package com.oracle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oracle.vo.State;
import org.springframework.stereotype.Repository;

@Repository
public interface StateDao {
	
	public List<State> getStateByType(@Param("type") int type);
	
	
}
