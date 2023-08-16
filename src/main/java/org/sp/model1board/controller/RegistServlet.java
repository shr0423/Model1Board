package org.sp.model1board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sp.model1board.domain.Board;
import org.sp.model1board.model.BoardDAO;

//넘어온 파라미터들을 이용하여 오라클에 insert!!
public class RegistServlet extends HttpServlet{
	BoardDAO boardDAO;
	public RegistServlet() {
		boardDAO=new BoardDAO();
	}
	
	
	//클라이어느 요청이 post방식일 경우 이 메서드가 동작한다.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//파라미터 받기
		request.setCharacterEncoding("utf-8");//파라미터 인코딩
		
		String title=request.getParameter("title");
		String writer=request.getParameter("writer");
		String content=request.getParameter("content");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		out.print("title is "+title);
		out.print("<br>");
		out.print("writer is "+writer);
		out.print("<br>");
		out.print("content is "+content);
		
		//db에 insert
		Board board=new Board();//비어있는 DTO생성
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		
		int result=boardDAO.insert(board);
		
		out.print("<script>");
		if(result>0) {//성공 
			out.print("alert('등록성공');");
			out.print("location.href='/board/list.jsp';");
			
		}else {//실패
			out.print("alert('등록실패');");
			out.print("history.back();");
			
		}
		out.print("</script>");
		
		
	}
}
