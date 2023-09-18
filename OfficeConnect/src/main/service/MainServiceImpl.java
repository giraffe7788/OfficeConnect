package main.service;

import java.util.List;

import main.dao.IMainDao;
import main.dao.MainDaoImpl;
import vo.EmpVO;

public class MainServiceImpl implements IMainService {

	private static MainServiceImpl instance = new MainServiceImpl();

	private IMainDao mainDao;

	public MainServiceImpl() {
		mainDao = MainDaoImpl.getInstance();
	}

	public static IMainService getInstance() {
		return instance;
	}


	@Override
	public List<EmpVO> getMtrBook(String empNo) {

		List<EmpVO> mtrList = mainDao.selectMember(empNo);

		return mtrList;
	}
}