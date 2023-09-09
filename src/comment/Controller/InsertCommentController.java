package comment.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comment.service.CommentServiceImpl;
import comment.service.ICommentService;
import comment.vo.CommentVO;


@MultipartConfig
@WebServlet("/Comment/insert.do") // value 생략가능(어노테이션)
public class InsertCommentController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Comment/insertForm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("댓글등록");

		req.setCharacterEncoding("UTF-8");
		
		String brdTitle = req.getParameter("brdTitle");
		String brdCont = req.getParameter("brdCont");
		

		ICommentService CommentService = CommentServiceImpl.GetInstance();
		CommentVO cv = new CommentVO();
			
		int cnt = CommentService.insertComment(cv);

		String msg = "";

		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		HttpSession session = req.getSession();

		session.setAttribute("msg", msg);

//		req.getRequestDispatcher("/Comment/list.do").forward(req, resp);

		resp.sendRedirect(req.getContextPath() + "/Comment/list.do");

	}
}
