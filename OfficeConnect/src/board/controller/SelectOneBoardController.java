package board.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import emp.service.EmpServiceImpl;
import vo.BoardVO;
import vo.EmpVO;


@WebServlet("/board/selectOne.do")
public class SelectOneBoardController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String empNo = (req.getParameter("empNo"));
		IBoardService boardService = BoardServiceImpl.GetInstance();
		List<BoardVO> boardList = boardService.selectOne(empNo);
//		EmpVO empVO = boardService.selectEmp(empNo);
		
//		req.setAttribute("EmpVO", empVO);
		req.setAttribute("empNo", empNo);
		req.setAttribute("boardList", boardList);
		RequestDispatcher dispacther = req.getRequestDispatcher("/views/boardSelectone.jsp");
		dispacther.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}