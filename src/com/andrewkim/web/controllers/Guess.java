package com.andrewkim.web.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Guess
 */
@WebServlet("/guess")
public class Guess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Guess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int guess = Integer.parseInt(request.getParameter("guess"));
		int attempt = (int) session.getAttribute("attempt");
		
		if (guess > (int) session.getAttribute("number")) {
			System.out.println("You guessed: " + guess);
			session.setAttribute("guess", "high");
			attempt++;
			session.setAttribute("attempt", attempt);
			response.sendRedirect("/NumberGameTwo/home");
		}
		else if (guess < (int) session.getAttribute("number")) {
			System.out.println("You guessed: " + guess);
			session.setAttribute("guess", "low");
			attempt++;
			session.setAttribute("attempt", attempt);
			response.sendRedirect("/NumberGameTwo/home");
		}
		else {
			System.out.println("You guessed: " + guess);
			session.setAttribute("guess", "correct");
			session.setAttribute("correct", "correct");
			response.sendRedirect("/NumberGameTwo/home");
		}
	}

}
