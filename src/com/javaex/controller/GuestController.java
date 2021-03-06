package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestDao;
import com.javaex.util.WebUtil;
import com.javaex.vo.GuestVo;

@WebServlet("/gctrl")
public class GuestController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글꺠짐 방지
		request.setCharacterEncoding("UTF-8");
		
		//파라미터의 action 값을 읽어오도록
		String action = request.getParameter("action");
		System.out.println(action);
		
		if ("guestList".equals(action)) {
			//action = gustList
			//리스트 출력하기
			GuestDao guestDao = new GuestDao();
			List<GuestVo> guestList = guestDao.ListAllGuest();
			
			//데이터 전달
			request.setAttribute("gList", guestList);	//(실제데이터에 붙여줄 별명, 실제데이터)
			
			//포워드 과정
			/*
			RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/guestList.jsp");
			rd.forward(request, response);
			*/
			WebUtil.forward(request, response, "./WEB-INF/guestList.jsp");
			
		} else if ("guestInsert".equals(action)) {
			//action = guestInsert
			//방명록 insert
			
			//파라미터 값
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");
			
			GuestVo guestVo = new GuestVo(name, password, content);
			
			//new GeustDao
			GuestDao guestDao = new GuestDao();
			guestDao.guestInsert(guestVo);
			
			//insert 하고 다시 guestList로
			//response.sendRedirect("/guestbook2/gctrl?action=guestList");
			
			WebUtil.redirect(request, response, "/guestbook2/gctrl?action=guestList");
			
		} else if ("guestDelForm".equals(action)) {
			//action = guestDelForm
			//그러게.. 생각해보니 GuestVo에 다시 넣어줄 필요가 없었네.. 없애버리고 수정
			//포워드
			//RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/deleteForm.jsp");
			//rd.forward(request, response);
			
			WebUtil.forward(request, response, "./WEB-INF/deleteForm.jsp");
			
		} else if ("guestDelete".equals(action)) {
			//action = guestDelete
			//방명록 delete
			
			//파라미터값
			int no = Integer.parseInt(request.getParameter("no"));
			String password = request.getParameter("password");
			
			GuestVo guestVo = new GuestVo(no, password);
			//new guestDao
			GuestDao guestDao = new GuestDao();
			
			int count = guestDao.guestDelete(guestVo);
			
			if(count == 1) {
				//response.sendRedirect("/guestbook2/gctrl?action=guestList");
				WebUtil.redirect(request, response, "/guestbook2/gctrl?action=guestList");
			} else {
				//RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/returnDelete.jsp");
				//rd.forward(request, response);
				WebUtil.forward(request, response, "./WEB-INF/returnDelete.jsp");
			}
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
