package car.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import car.service.CarServiceImpl;
import car.service.ICarService;
import vo.CarBookVO;

@WebServlet("/car/book.do")
public class CarBook extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("여기까지 옴?");
		String currentCarNo = req.getParameter("currentCarNo");
		String carBookRent = req.getParameter("carBookRent");
		String carBookReturn = req.getParameter("carBookReturn");
		String carBookCont = req.getParameter("carBookCont");
		
		String empNo = (String)req.getSession().getAttribute("empNo");
		
		System.out.println("사원번호 :" + empNo + "차 넘버 : " + currentCarNo + "빌린날짜 : " + carBookRent + "반납날짜 : " + carBookReturn + "사유 :" + carBookCont);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date carBookRentDate = null;
		Date carBookReturnDate = null;
		try {
			carBookRentDate = sdf.parse(carBookRent);
			carBookReturnDate = sdf.parse(carBookReturn);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		ICarService service = CarServiceImpl.getInstance();
		
		CarBookVO carBookVO = new CarBookVO(empNo, currentCarNo, carBookRentDate, carBookReturnDate, carBookCont);
		
		if (service.registCar(carBookVO) > 0) {
			
			System.out.println("예약성공");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
			
		}else {
			System.out.println("예약실패");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}
	}
}
