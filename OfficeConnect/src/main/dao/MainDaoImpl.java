package main.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.EmpVO;

public class MainDaoImpl implements IMainDao {

	private static IMainDao mainDao;

	public MainDaoImpl() {

	}

	public static IMainDao getInstance() {
		if(mainDao == null) {
			mainDao = new MainDaoImpl();
		}
		return mainDao;
	}

	@Override
	public List<EmpVO> selectMember(String empNo) {

		List<EmpVO> mtrList = new ArrayList<EmpVO>();
		SqlSession session = MyBatisUtil.getInstance();

		mtrList = session.selectList("", empNo);

		return mtrList;
	}

}