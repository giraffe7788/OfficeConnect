package main.dao;

import java.util.List;

import vo.EmpVO;

public interface IMainDao {

	public List<EmpVO> selectMember(String empNo);

	

}
