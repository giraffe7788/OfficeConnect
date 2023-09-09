package meeting.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import meeting.service.IMeetingService;
import meeting.service.MeetingServiceImpl;
import vo.MeetingVO;

@WebServlet("/book.do")
public class Book extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int mtrNo = Integer.parseInt(req.getParameter("mtrNo"));
		int mtrbookPer = Integer.parseInt(req.getParameter("mtrbookPer"));
		int mtrbookRent = Integer.parseInt(req.getParameter("mtrbookRent"));
		int mtrbookRtn = Integer.parseInt(req.getParameter("mtrbookRtn"));
		String mtrbookCont = req.getParameter("mtrbookCont");
		
		IMeetingService mtrService = MeetingServiceImpl.getInstance();
		String empNo = (String)req.getSession().getAttribute("empNo");

		MeetingVO mtVO = new MeetingVO(mtrNo, empNo, mtrbookRent, mtrbookRtn, mtrbookPer, mtrbookCont);
		
		System.out.println(mtrNo + "|" + mtrbookPer + "|" + mtrbookRent + "|" + mtrbookRtn + "|" + mtrbookCont + "|" + empNo);
		
		if(mtrService.registMtr(mtVO) > 0) {
			System.out.println("예약 성공");

			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonsStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonsStr);
		} else {
			System.out.println("예약 실패");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonsStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonsStr);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}