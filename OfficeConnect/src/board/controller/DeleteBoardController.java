package board.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.BoardServiceImpl;
import board.service.IBoardService;

//삭제파일
@WebServlet("/board/delete.do")
public class DeleteBoardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int brdNo = Integer.parseInt(req.getParameter("brdNo"));
		System.out.println(brdNo);
		IBoardService boardService = BoardServiceImpl.GetInstance();

		int cnt = boardService.deleteBoard(brdNo);
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		HttpSession session = req.getSession();

		session.setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath() + "/board/list.do");

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}