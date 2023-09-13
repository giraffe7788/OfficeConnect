package img.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.ImageVO;

public class ImageDaoImpl implements IImageFileDao {
	
	private static IImageFileDao atchFileDao;
	
	private ImageDaoImpl() {
		
	}
	
	public static IImageFileDao getInstance() {
		if(atchFileDao == null) {
			atchFileDao = new ImageDaoImpl();
		}
		
		return atchFileDao;
	}

	@Override
	public int insertAtchFile(ImageVO atchFileVO) {
		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		try {
			cnt = session.insert("image.insertImage", atchFileVO);
			session.commit();
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
		return cnt;
	}


	@Override
	public ImageVO getImage(String empNo) {
		SqlSession session = MyBatisUtil.getInstance();
		
		ImageVO imageVO = null;
		
		try {
			imageVO = session.selectOne("image.getImage", empNo);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return imageVO;
	}
}
