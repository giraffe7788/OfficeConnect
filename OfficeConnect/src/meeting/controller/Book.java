package meeting.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meeting.service.IMeetingService;
book.java

import meeting.service.MeetingServiceImpl;

@WebServlet("/list.do")
public class Book extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int mtrbookNo = Integer.parseInt(req.getParameter("content"));
		int mtrNo = Integer.parseInt(req.getParameter("time"));
		int mtrbookPer = Integer.parseInt(req.getParameter("person"));
		
		IMeetingService mtrService = MeetingServiceImpl.getInstance();
		
	}
	

}
