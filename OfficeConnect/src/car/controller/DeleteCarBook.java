package car.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import car.service.CarServiceImpl;
import car.service.ICarService;


@WebServlet("/car/delete.do")
public class DeleteCarBook extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      ICarService carService = CarServiceImpl.getInstance();
      
      String empNo = (String)req.getSession().getAttribute("empNo");
      
      System.out.println("사원번호 : " + empNo );
      
      int cnt = carService.deleteCarBook(empNo);
      
      if(cnt > 0) {
         System.out.println("삭제성공");
         
         JsonObject jsonObject = new JsonObject();
         jsonObject.addProperty("isSuccess", "ok");
         String jsonStr = new Gson().toJson(jsonObject);
         resp.setContentType("application/json");
         resp.getWriter().write(jsonStr);
      }else {
         System.out.println("삭제실패");
         
         JsonObject jsonObject = new JsonObject();
         jsonObject.addProperty("isSuccess", "fail");
         String jsonStr = new Gson().toJson(jsonObject);
         resp.setContentType("application/json");
         resp.getWriter().write(jsonStr);
      }
   }

}