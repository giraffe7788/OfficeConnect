package board.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.BoardVO;


@MultipartConfig
@WebServlet("/board/insert.do") // value 생략가능(어노테이션)
public class InsertBoardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/board/insertForm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("왔음");

		req.setCharacterEncoding("UTF-8");
		
		String brdTitle = req.getParameter("title");
		String brdCont = req.getParameter("comment");
		

		IBoardService boardService = BoardServiceImpl.GetInstance();
		BoardVO bv = new BoardVO(brdCont, brdTitle);
			
		int cnt = boardService.insertBoard(bv);

		String msg = "";

		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		HttpSession session = req.getSession();

		session.setAttribute("msg", msg);

//		req.getRequestDispatcher("/board/list.do").forward(req, resp);

		resp.sendRedirect(req.getContextPath() + "/board/list.do");

	}
}
