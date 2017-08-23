<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="include/header.jsp"></jsp:include>
<jsp:include page="include/navigation.jsp"></jsp:include>
<div class="container">
		<div class="row">
		<c:if test="${param.logout != null }">
		   <div class="alert alert-info" style="width: 400px;">
                    <a class="close" data-dismiss="alert" href="#">×</a>
                  You have successfully been logged out.
            </div>
		</c:if>
		<c:if test="${param.error != null }">
		<div class="alert alert-danger" style="width: 400px;">
                    <a class="close" data-dismiss="alert" href="#">×</a>
                  Invalid Username and Password.
         </div>
			
		</c:if>
		<c:url value="/login" var="loginVar"/>
		<form id="appointment-form" action="${loginVar}" method="POST" class="bootstrap-admin-login-form">
			<div class="form-group">
				<label for="make">Username</label>
				<input name="custom_username" class="form-control" />
			</div>
			<div class="form-group">
				<label for="model">Password</label>
				<input type="password" name="custom_password" class="form-control" />
			</div>
			<div class="form-group">
			<a href="<c:url value="/registration" />">Register Here</a>
			</div>
			<sec:csrfInput/>

			<button type="submit" id="btn-save" class="btn btn-primary">Login</button>
		</form>
		</div>
</div>
 <jsp:include page="../views/include/footer.jsp"></jsp:include>