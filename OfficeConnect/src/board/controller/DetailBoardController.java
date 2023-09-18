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


@WebServlet("/board/detail.do")
public class DetailBoardController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int brdNo = Integer.parseInt(req.getParameter("brdNo"));
		System.out.println(brdNo);
		IBoardService boardService = BoardServiceImpl.GetInstance();
		
		int cnt = boardService.updateViews(brdNo);
		
		BoardVO boardVO = boardService.detailBoard(brdNo);
		req.setAttribute("boardVO", boardVO);
		
		
		System.out.println("게시판 리뷰수 cnt값" + cnt);
		req.getRequestDispatcher("/views/freeBoardInfo.jsp").forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}

}