package com.oracle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.StateDao;
import com.oracle.vo.State;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	StateDao stateDao;
	
	@Override
	@Transactional(readOnly=true)
	public List<State> getStatesById(int type) {
		return stateDao.getStateByType(type);
	}

	
}
