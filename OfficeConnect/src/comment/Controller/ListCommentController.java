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

import com.google.gson.Gson;

import comment.service.CommentServiceImpl;
import comment.service.ICommentService;
import vo.CommentVO;




@WebServlet("/comment/list.do")
public class ListCommentController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("댓글리스트왔음");
		int brdNo = Integer.parseInt(req.getParameter("brdNo"));
		ICommentService commentService = CommentServiceImpl.GetInstance();
		List<CommentVO> commentList = commentService.selectAll(brdNo);
		
		Gson g = new Gson();
		String json=g.toJson(commentList);
		
		resp.setContentType("text/json;charset=utf-8");
		System.out.println(json); // [{    },{    }.....  ]
		// $.ajax() --> json
		resp.getWriter().print(json);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	

}
