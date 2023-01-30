package com.kelvinorg;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//Below we are specifying the endpoint to be used to access the dashboard ("/")
@WebServlet("/")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	// get method to display the dasboard.jsp from this route ("/") specified above
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Here we are creating the session variable to attach session attributes to
		HttpSession session = request.getSession();
		
		//Below we have set session attribute named page_title and we assigned it a value "Welcome page"
		session.setAttribute("page_title", "Welcome Page");
		
		
		//Here we are creating an multidimensional array with all the links
		
		
		/* 
		 * We have Home menu and it has one link that directs the user to the home page
		 * Secondly we have the Products menu and it has three sub menus and their corresponding links for the variety of products in supermarket
		 * Lastly we have the Contact_Us menu with two sub menus and their links(Contact us via web page and contact us via whatsapp)
		 * 
		 */
		
		String[][][] menus = {
				{{"Home","Dashboard"}},
				{{"Products"}, {"Shop Butchery", "Butchery"}, {"Shop Backery", "Backery"}, {"Shop Liquor", "Liquor"}},
				{{"Contact_Us"}, {"Webpage", "WebpageContactus"}, {"Whatsapp", "WhatappContactus"}}
				};
		
		//Here we are creating a List and assigning it objects with string values from the menus multidimensional array 
		List<String[][]> navLinks = Arrays.asList(menus);
		 
		//Here we are redirecting our application to dashboard page and the request will carry our list to the page
		RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
		request.setAttribute("arr",navLinks);
		rd.forward(request, response);
	}

}
