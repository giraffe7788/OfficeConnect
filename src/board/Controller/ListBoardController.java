package board.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.BoardVO;


@WebServlet("/board/list.do")
public class ListBoardController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		IBoardService boardService = BoardServiceImpl.GetInstance();
		List<BoardVO> boardList = boardService.selectAll();
		
		req.setAttribute("boardList", boardList);
		
		RequestDispatcher dispacther = req.getRequestDispatcher("/board/list.jsp");
		dispacther.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
