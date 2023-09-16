package car.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.CarBookVO;
import vo.CarVO;
import vo.EmpVO;

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
	
	
	/**
	 * 차량 예약을 위한 메서드
	 * @return 성공하면 1 실패하면 0을 반환
	 */
	@Override
	public int insertCar(CarBookVO carBookVO) {
		
		int cnt =0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.insert("car.insertCar", carBookVO);
			if (cnt > 0){
				session.commit();
			}else {
				session.rollback();
			}
		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}
	
	/**
	 * 예약 된 차 정보를 가져오는 메서드
	 * @return 전체 예약 차량 정보를 담은 리스트
	 */
	@Override
	public List<CarBookVO> selectAllcarBookList() {
		
		List<CarBookVO> carBookList = new ArrayList<CarBookVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			carBookList = session.selectList("car.selectAllcarBookList");
			
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
			
		}finally {
			session.close();
		}
		
		return carBookList;
		
	}
	
	/**
	 * 차량 예약 한 사원의 이름을 가져오는 메서드
	 * @return 전체 예약 사원 정보를 담은 리스트
	 */
	@Override
	public List<EmpVO> selectOnecarBookEmpName() {
		
		List<EmpVO> empVO = new ArrayList<EmpVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			empVO = session.selectList("car.selectOnecarBookEmpName");
			
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
			
		}finally {
			session.close();
		}
		
		return empVO;
		
	
	}
	/**
	 * 나의 차량 예약 내역을 불러오는 메서드
	 * @return 나의 차량 내역
	 */
	@Override
	public CarBookVO selectOneMyCarBook(String empNo) {
		
		SqlSession session = MyBatisUtil.getInstance();

		CarBookVO carBookVO = null;
		
		try {
			carBookVO = session.selectOne("car.selectOneMycar", empNo);
			if(carBookVO!=null) {
				 session.commit();
			 }
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return carBookVO;
		
	}
	
	/**
	 * 예약한 차량 이미지 경로는 불러오는 메소드
	 * @return 이미지경로
	 */
	@Override
	public CarVO selectOneCarInfo(String carNo) {
		
		SqlSession session = MyBatisUtil.getInstance();
		
		CarVO carVO = null;
		
		try {
			
			carVO = session.selectOne("car.selectOneCarInfo", carNo);
			if (carVO != null) {
				session.commit();
			}
			
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return carVO;
	}
	/**
	 * 나의 차량 예약을 삭제하는 메소드
	 * @return 성공여부
	 */
	@Override
	public int deleteCarBook(String empNo) {
		
		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = session.delete("car.deleteCarBook", empNo);
			session.commit();
			
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return cnt;
	}

}
