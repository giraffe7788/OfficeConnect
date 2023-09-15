package car.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import car.service.CarServiceImpl;
import car.service.ICarService;
import emp.service.EmpServiceImpl;
import vo.CarBookVO;
import vo.CarVO;
import vo.EmpVO;

@WebServlet("/car/list.do")
public class CarList extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ICarService carService = CarServiceImpl.getInstance();
		List<CarVO> carList = carService.selectAllCar();
		List<CarBookVO> carbookList = carService.selectAllcarBookList();
		
		req.setAttribute("carList", carList);
		req.setAttribute("carbookList", carbookList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/car.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}

}
