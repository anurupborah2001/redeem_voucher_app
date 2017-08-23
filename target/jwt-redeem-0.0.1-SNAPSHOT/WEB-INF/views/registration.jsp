<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="include/header.jsp"></jsp:include>
<jsp:include page="include/navigation.jsp"></jsp:include>
<div class="container">
		<div class="row">
		<div class="panel panel-default bootstrap-admin-no-table-panel">
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <c:url var="addAction" value="${formaction}" ></c:url>
                                <form:form  action="${addAction}" class="form-horizontal bootstrap-admin-login-form"  method="post" name="userForm"  commandName="user">
                                    <fieldset>
                                        <legend>${label}</legend>
                                        <h3 class="isa_success">${successMessage}</h3>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="focusedInput"><spring:message code="lbl.first_name" text="First Name" /></label>
                                            <div class="col-lg-9">
                                                <form:input class="form-control" value="${user.first_name}" path="first_name" />
												<form:errors path="first_name" cssClass="error" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label"><spring:message code="lbl.last_name" text="Last Name" /></label>
                                            <div class="col-lg-9">
                                               <form:input class="form-control" value="${user.last_name}" path="last_name" />
												<form:errors path="last_name" cssClass="error" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label"><spring:message code="lbl.username" text="User Name" /></label>
                                            <div class="col-lg-9">
                                               <form:input class="form-control" value="${user.username}" path="username" />
												<form:errors path="username" cssClass="error" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label"><spring:message code="lbl.email" text="Email Address" /></label>
                                            <div class="col-lg-9">
                                               <form:input class="form-control" value="${user.email}" path="email" />
												<form:errors path="email" cssClass="error" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label"><spring:message code="lbl.password" text="Password" /></label>
                                            <div class="col-lg-9">
                                               <form:password class="form-control" value="${user.password}" path="password" />
												<form:errors path="password" cssClass="error" />
                                            </div>
                                        </div>
                                        	<div class="form-group">
											<a href="<c:url value="/login" />">Sign In</a>
											</div>
                                        <sec:csrfInput/>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </fieldset>
                                </form:form>
                            </div>
                        </div>
		</div>
</div>
<jsp:include page="../views/include/footer.jsp"></jsp:include>