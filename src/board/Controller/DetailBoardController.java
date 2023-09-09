package board.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.BoardVO;


//게시판 제목 클릭시 화면 
@WebServlet("/board/detail.do")
public class DetailBoardController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int brdNo = Integer.parseInt(req.getParameter("brdNo"));
		
		IBoardService memService = BoardServiceImpl.GetInstance();
		
		BoardVO bv = memService.detailBoard(brdNo);
		
		req.setAttribute("bv", bv);
		System.out.println("왔음");
		
		
		req.getRequestDispatcher("/board/detail.jsp").forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}

}
