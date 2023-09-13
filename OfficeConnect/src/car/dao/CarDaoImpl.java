package car.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.CarVO;

public class CarDaoImpl implements ICarDao {
	
	private static ICarDao carDao;
	
	private CarDaoImpl(){}
	
	public static ICarDao getInstance() {
		if(carDao == null) {
			carDao = new CarDaoImpl();
		}
		return carDao;
	}
	
	
	/**
	 * 전체 보유차량 정보를 가져올 메서드
	 * @return 전체 차량정보를 담은 리스트
	 */
	@Override
	public List<CarVO> selectAllCar() {
		
		List<CarVO> carList = new ArrayList<CarVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			carList = session.selectList("car.selectAllcar");
			
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
			
		}finally {
			session.close();
		}
		
		return carList;
	}

}
