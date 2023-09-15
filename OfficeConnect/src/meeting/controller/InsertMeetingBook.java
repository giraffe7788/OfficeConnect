package meeting.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

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
import vo.MeetingBookVO;

@WebServlet("/meeting/insert.do")
public class InsertMeetingBook extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int mtrNo = Integer.parseInt(req.getParameter("mtrNo"));
		int mtrbookPer = Integer.parseInt(req.getParameter("mtrbookPer"));
		String mtrbookRent = (String)(req.getParameter("mtrbookRent"));
		String mtrbookRtn = (String)(req.getParameter("mtrbookRtn"));
		String mtrbookCont = req.getParameter("mtrbookCont");
		
		// MeetingVO를 만들어서 db에 전달
		IMeetingService service = MeetingServiceImpl.getInstance();
		String empNo = (String)req.getSession().getAttribute("empNo");
		MeetingBookVO mtVO = new MeetingBookVO(mtrNo, empNo, mtrbookRent, mtrbookRtn, mtrbookPer, mtrbookCont);
		
		if(service.registMtr(mtVO) > 0) {
			System.out.println("예약 성공 :D");

			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonsStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonsStr);
			
		} else {
			System.out.println("예약 실패 :(");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonsStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonsStr);
		}
	}
}
