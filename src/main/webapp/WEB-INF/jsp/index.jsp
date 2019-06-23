<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>        
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Reasons</title>
		
<!-- 		// links and scripts are kept in a separate file -->
		<%@include file="headerLinksAndScripts.jsp" %>
		
		<script>
			// local array so only one db call is needed
			var reasons = [];
			var index;
			
			// Button that displays alert div
			function buttonPress(){

				$( '#buttonContainerDiv' ).prepend(
						"<div class='alert reason'> " +
						"<span class='closebtn' onclick='this.parentElement.style.display='none';'>&times;" +
						   "This is an alert box. " +
						"</div>"
				);
				$( '.alert' ).text(reasons[index + 1].reason);
				$( '#button' ).css({
					"visibility": "hidden"
				});
				$( '.buttonHeader' ).css({
					"visibility": "hidden"
				});
				
			}
		
			// Initialization of widgets once document is ready for scripting
			$(document).ready(function(){
						
				$( "#accordion" ).accordion();
				$( "#button" ).button();
				$( "#button-icon" ).button({
					icon: "ui-icon-gear",
					showLabel: false
				});
				$( "#tabs" ).tabs();
				$( "#slider" ).slider({
					min: 0,
					max: 100,
					value: 100,
					slide: function(event, ui){
						$( '#slider' ).prev().css({ opacity: ui.value / 100});
					}
				});
				
				$( "#menu" ).menu({
				// menu select event will cause a check for the menu items text with the reasons array
				// and alert with the appropriate reason
					select: function(event, ui){
						for(var i=0; i<reasons.length; i++){
							
							if((ui.item.text()).substring(0,30) == (reasons[i].reason).substring(0,30)){
								alert(reasons[i].reason);
								
							}
						}
					}
				});							
				
				// function to retrieve reasons from db and insert them into the widgets
				function getReasons(){
					$.ajax({
						url:'/reasons',
						type: 'GET',
						success: function(result){
							
							// push to local array
							reasons = result;
							
							$( '.reason ').each(function(idx){
								var reason = result[idx].reason;
								$(this).text(reason);
								index = idx;
								
							});	
							$( '.menuReason' ).each(function(idx){
								var reason = result[index + 1].reason;
								var prefix = reason.substring(0, 30);
								$(this).text(prefix + '...');
								index++;
							});
						},
						error: function(result){
							console.log("error")
						}
					});
				}
				getReasons();				
			// END OF $(document).ready()
			});			
		</script>
	</head>
	<body>
		<div id="maincontainer">
			<div id="core-rail">
				
				<h1 class="demoHeaders" id="title">Reasons I'd like to work at </br> Berkshire Hathaway Homestate Companies:</h1>
				
				<!-- Accordion -->
				<h2 class="demoHeaders">Accordion</h2>
				<div id="accordion">
					<h3>First</h3>
					<div class="reason">Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.</div>
					<h3>Second</h3>
					<div class="reason">Phasellus mattis tincidunt nibh.</div>
					<h3>Third</h3>
					<div class="reason">Nam dui erat, auctor a, dignissim quis.</div>
				</div>
			
				<!-- Button -->
				<div id="buttonContainerDiv">
					<h2 class="demoHeaders buttonHeader">Button</h2>
					<button onclick="javascript:buttonPress()" id="button">Press</button>
				</div>				
				
				<!-- Tabs -->
				<h2 class="demoHeaders">Tabs</h2>
				<div id="tabs">
					<ul> 
						<li><a href="#tabs-1">First</a></li>
						<li><a href="#tabs-2">Second</a></li>
						<li><a href="#tabs-3">Third</a></li>
					</ul>
					<div id="tabs-1" class="reason">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
					<div id="tabs-2" class="reason">Phasellus mattis tincidunt nibh. Cras orci urna, blandit id, pretium vel, aliquet ornare, felis. Maecenas scelerisque sem non nisl. Fusce sed lorem in enim dictum bibendum.</div>
					<div id="tabs-3" class="reason">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.</div>
				</div>
			
				<!-- Slider -->
				<h2 class="demoHeaders">Slider</h2>
				<div class="ui-widget ui-corner-all">					
					<div class="reason">Cras orci urna, blandit id, pretium vel, aliquet ornare, felis. Maecenas scelerisque sem non nisl. Fusce sed lorem in enim dictum bibendum.</div>
					<div id="slider"></div>
				</div>
						
				<!-- Menu -->
				<h2 class="demoHeaders" id="menuH2">Menu</h2>
				<ul id="menu">
					<li><div class="menuReason">Item 1</div></li>
					<li><div class="menuReason">Item 2</div></li>
					<li><div class="menuReason">Item 3</div></li>					
					<li><div class="menuReason">Item 4</div></li>					
					<li><div class="menuReason">Item 5</div></li>					
					<li><div class="menuReason">Item 6</div></li>									
				</ul>
			</div>
		</div>
	</body>
</html>