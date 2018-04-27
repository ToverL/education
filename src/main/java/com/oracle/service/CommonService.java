package com.oracle.service;

import java.util.List;

import com.oracle.vo.State;

public interface CommonService {
	List<State> getStatesById(int stateid);
}
