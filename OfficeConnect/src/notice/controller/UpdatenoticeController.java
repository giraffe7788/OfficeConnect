package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notice.service.INoticeService;

import notice.service.NoticeServiceImpl;
import vo.NoticeVO;

@MultipartConfig
@WebServlet("/notice/update.do")
public class UpdatenoticeController extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      int ntcNo = Integer.parseInt(req.getParameter("ntcNo"));

      INoticeService noticeService = NoticeServiceImpl.GetInstance();
      NoticeVO nv = noticeService.detailNotice(ntcNo);
      System.out.println("제목 이다"+nv.getNtcTitle());
      req.setAttribute("nv", nv);

      req.getRequestDispatcher("/views/noticeUpdate.jsp").forward(req, resp);

   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      req.setCharacterEncoding("UTF-8");
      String ntcTitle = req.getParameter("title");
      String ntcCont = req.getParameter("comment");
      int ntcNo = Integer.parseInt(req.getParameter("num"));
      ntcCont = ntcCont.replace("\r\n","<br>");
      ntcCont = ntcCont.replace("\u0020","&nbsp;");
      try {

      } catch (Exception e) {
         e.printStackTrace();
      }

      INoticeService noticeService = NoticeServiceImpl.GetInstance();

      NoticeVO nv = new NoticeVO();
      nv.setNtcTitle(ntcTitle);
      nv.setNtcCont(ntcCont);
      nv.setNtcNo(ntcNo);
      

      System.out.println(ntcCont);
      System.out.println("공지사항 수정 도착");
      int cnt = noticeService.updateNotice(nv);

      String msg = "";

      if (cnt > 0) {
         msg = "성공";
      } else {
         msg = "실패";
      }

      HttpSession session = req.getSession();

      session.setAttribute("msg", msg);

      resp.sendRedirect(req.getContextPath() + "/notice/detail.do?ntcNo="+ntcNo);

   }
}