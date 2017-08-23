<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<a href="<spring:url value="/"/>" class="navbar-brand">JWT Redeem Voucer</a>
			</div>
			
			<c:url value="/logout" var="logoutUrl" />
				<!-- csrt for log out-->
			<form action="${logoutUrl}" method="post" id="logoutForm">
			  <input type="hidden"
				name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			</form>
			<script>
				function formSubmit() {
					document.getElementById("logoutForm").submit();
				}
			</script>
			<ul class="nav navbar-nav">
					<li><a href="<spring:url value="/redeem"/>">Redeem Arena</a></li>
				<sec:authorize access="authenticated" var="authenticated"/>
				<c:choose>
					<c:when test="${authenticated}">
						<li>
							<p class="navbar-text">
								Welcome
								<sec:authentication property="name"/>
								<a id="logout" href="javascript:formSubmit()"> Logout</a>
							</p>
							<form id="logout-form" action="<c:url value="/logout"/>" method="post">
								<sec:csrfInput/>
							</form>
						</li>	
					</c:when>
					<c:otherwise>
						<li><a href="<spring:url value="/login/"/>">Sign In</a></li>			
					</c:otherwise>
				</c:choose>
				
				
			</ul>
		</div>
	</nav>