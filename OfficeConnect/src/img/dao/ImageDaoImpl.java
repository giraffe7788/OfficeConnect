package img.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.ImageVO;

public class ImageDaoImpl implements IImageDao {

	private static IImageDao atchFileDao;

	private ImageDaoImpl() {

	}

	public static IImageDao getInstance() {
		if (atchFileDao == null) {
			atchFileDao = new ImageDaoImpl();
		}

		return atchFileDao;
	}

	@Override
	public int insertImage(ImageVO imageVO) {

		SqlSession session = MyBatisUtil.getInstance();

		int cnt = 0;
		try {
			cnt = session.insert("image.insertImage", imageVO);
			if (cnt > 0) {
				session.commit();
			}
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
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return imageVO;
	}
	

	@Override
	public int updateImage(ImageVO imageVO) {

		SqlSession session = MyBatisUtil.getInstance();

		int cnt = 0;
		try {
			cnt = session.insert("image.updateImage", imageVO);
			if (cnt > 0) {
				session.commit();
			}
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}
}
