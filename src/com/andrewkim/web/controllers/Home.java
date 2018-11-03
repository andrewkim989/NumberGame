package com.andrewkim.web.controllers;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Home
 */
@WebServlet("/home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Random r = new Random();
		int attempt;
		
		if (session.getAttribute("guess") == null) {
			attempt = 1;
			session.setAttribute("attempt", attempt);
			int min = (int) session.getAttribute("min");
			int max = (int) session.getAttribute("max");
			int number = r.nextInt(max - min) + min;
			session.setAttribute("number", number);
			session.setAttribute("correct", "incorrect");
		}
		System.out.println(session.getAttribute("number"));
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/game.jsp");
	    view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
