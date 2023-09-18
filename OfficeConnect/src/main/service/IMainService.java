package main.service;

import java.util.List;

import vo.EmpVO;

public interface IMainService {

	public List<EmpVO> getMtrBook(String empNo);

}