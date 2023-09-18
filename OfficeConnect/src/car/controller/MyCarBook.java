package car.controller;

import java.io.IOException;

import javax.mail.Session;
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
import vo.CarVO;

@WebServlet("/car/mybook.do")
public class MyCarBook extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      ICarService carService = CarServiceImpl.getInstance();

      String empNo = (String) req.getSession().getAttribute("empNo");
      CarBookVO carBookVO = carService.selectOneMyCarBook(empNo);
      CarVO carVO = null;
      if (carBookVO != null) {
         carVO = carService.selectOneCarInfo(carBookVO.getCarNo());
      }

      req.setAttribute("carBookVO", carBookVO);
      req.setAttribute("carVO", carVO);
      req.getRequestDispatcher("../views/carBook.jsp").forward(req, resp);
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

   }
}