<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session = "true" import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${page_title}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark ">
			<div class="container-fluid">
		    	<a class="navbar-brand" href="#">${page_title}</a>
		    		<form class="d-flex p-2">
		    			<div class="btn-group">
		   					 	<%
								    List<String[][]> navLinks = (List<String[][]>) request.getAttribute("arr");
								    
								    int itemCount = 1;
								    
								    //Here we iterate inside the whole array
								    for (String[][] lst : navLinks) {
								    	
								    	itemCount = 1;
								    	String subMenuA = null;
										String subMenuLinkA = null;
										
										//If we only have one last inner object then it means it just one menu and its link
										if (lst.length==1) {
											
											for (String[] obj : lst) {
												
												for (String item : obj) {
													
													//First item in the object is the menu title
													if (itemCount==1) {
														//System.out.println("This is the main menu title: "+item);
														out.println("<p>" + item + "</p>");
														subMenuA = item;
													}else {// Second item in the current object is the menu link or url
														//This is the main menu link url;
														subMenuLinkA = item;
													}
													if (subMenuA != null && subMenuLinkA != null){
														out.println("<button class='btn btn-secondary' style='width: 200px;' onclick='"+request.getContextPath()+"/"+subMenuLinkA+"'>" + subMenuA +"</button>");
													}
													itemCount = itemCount + 1;
											    }
											}
											
										}else { //If we have more than one object then it means we have one menu in first object and its sub menus on other objects after the first
											
											out.println(" <div class='dropdown'> ");
											
											for (String[] obj : lst) {
												
													String subMenu = null;
													String subMenuLink = null;
													//We are now looping in the last inner object
													for (String item : obj) { 
														
														//If we found the first objects item its the menu 
														if (itemCount==1) {
															//This is the main menu title;
															 out.println("<button class='btn btn-secondary dropdown-toggle' style='width: 200px;' type='button' id='dropdownMenuButton1' data-bs-toggle='dropdown' aria-expanded='false'>"+
																	    item+"</button>");
															 
															 out.println("<ul class='dropdown-menu' aria-labelledby='dropdownMenuButton1'>");
															
														}else {
															
															//If we found the object item number divisible by two and we get zero its the sub menu title
															if (itemCount %2 == 0) {
																//This is the main menu submenu title;
																subMenu = item;
															}else {//If we found the object item number divisible by two and we don't get zero its the sub menu link
																//This is the main menu submenu link url;
																subMenuLink = item;
															}
															if (subMenu != null && subMenuLink != null){
																out.println(" <li><a class='dropdown-item' href='"+request.getContextPath()+"/"+subMenuLink+"'>"+ subMenu +"</a></li> ");
															}
															
															
														}
														itemCount = itemCount + 1;
												    }
													
												
											}
											out.println(" <ul> ");
											out.println(" </div> ");
											
										}
									}
								         
							    %>
	    				</div> 
	     			</form>
		  	</div>
		</nav>
	</div>
</body>
</html>