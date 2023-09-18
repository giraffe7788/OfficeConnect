package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import vo.BoardVO;


//寃뚯떆�뙋 �젣紐� �겢由��떆 �솕硫� 
@WebServlet("/board/detail.do")
public class DetailBoardController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int brdNo = Integer.parseInt(req.getParameter("brdNo"));
		System.out.println(brdNo);
		IBoardService memService = BoardServiceImpl.GetInstance();
		
		BoardVO boardVO = memService.detailBoard(brdNo);
		
		req.setAttribute("boardVO", boardVO);
		
		
		
		req.getRequestDispatcher("/views/freeBoardInfo.jsp").forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}

}
