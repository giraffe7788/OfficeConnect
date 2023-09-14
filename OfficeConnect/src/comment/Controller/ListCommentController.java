package comment.Controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.service.CommentServiceImpl;
import comment.service.ICommentService;
import comment.vo.CommentVO;




@WebServlet("/comment/list.do")
public class ListCommentController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int brdNo = Integer.parseInt(req.getParameter("brdNo"));

		ICommentService commentService = CommentServiceImpl.GetInstance();
		List<CommentVO> commentList = commentService.selectAll(brdNo);
		
		req.setAttribute("commentList", commentList);
		
		RequestDispatcher dispacther = req.getRequestDispatcher("/comment/list.jsp");
		dispacther.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
