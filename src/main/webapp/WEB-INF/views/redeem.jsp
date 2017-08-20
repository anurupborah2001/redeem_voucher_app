<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page language="java" trimDirectiveWhitespaces="true"%>
<jsp:include page="include/header.jsp"></jsp:include>
<jsp:include page="include/navigation.jsp"></jsp:include>
<%@ page import="com.jwt.redeem.constants.Constant" %>
<div class="container">
		<div class="row">
		 <div class="col-md-12">
				<div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">Redeem Voucher</div>
                            </div>
                            
                            <div class="bootstrap-admin-panel-content">
                             <c:choose>
	                              	<c:when test="${empty listDeals && listDeals != null}">
												    <tr><td colspan="7">You have redeemed all vouchers</td></tr>
								    </c:when>
								     <c:otherwise>
								     
											<table class="table">
				                                    <thead>
				                                        <tr>
				                                            <th>#</th>
				                                            <th>Deal Code</th>
				                                            <th>Logo</th>
				                                            <th>Shop Name</th>
				                                            <th>Short Description</th>
				                                            <th>Detail Button</th>
				                                            <th>Redeem</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                    <c:url value="<%= Constant.REDEEM_DETAILS_PATH  %>" var="detailUrl"/>
				                                    <c:url value="<%= Constant.REDEEM_SAVE  %>" var="redeembookUrl"/>
				                                    <span id="detailurlId" data-url="${detailUrl}"></span>
				                                    <span id="redeemurlId" data-url="${redeembookUrl}"></span>
				                                    <c:forEach var="listDeal" items="${listDeals}" varStatus="iter">
				                                        <c:choose>
															    <c:when test="${listDeal.getClass().isArray()}">
															        <c:set var="listDealObj" scope = "session" value = "${listDeal[0]}"/>              
														         </c:when>
														         <c:otherwise>
														               <c:set var="listDealObj" scope = "session" value = "${listDeal}"/>
														         </c:otherwise>
															</c:choose>
													    <tr>
													    	<td>${listDealObj.jwt_deal_id}</td>
													    	<td>${listDealObj.jwt_deal_code}</td>
													    	<td><img width="150" height="100" src="${logopath}${listDealObj.jwt_deal_long_logo}" /></td>
													    	<td>${listDealObj.shop.shop_name}</td>
													    	<td>${listDealObj.jwt_deal_short_desc}</td>
													    	<td><button type="button" data-id="${listDealObj.jwt_deal_id}" class="btn btn-primary dealDetails">Details</button></td>
													    	<td>
													    	<sec:authorize access="isAuthenticated()">
													    	<sec:authentication var="principal" property="principal" />
													    	<td><button type="button" data-id="${listDealObj.jwt_deal_id}" data-shopname="${listDealObj.shop.shop_name}" data-uid="${principal.username}" id="redeem-btn" class="btn btn-primary">Redeem</button></td>
													    	</sec:authorize>
													    	</td>
													    </tr>
													</c:forEach>
				                                    </tbody>
				                                </table>
				                                <sec:csrfInput/>
				                                <sec:authorize access="isAuthenticated()">
				                                <div class="span12 pagination-centered">
												    <button onClick="window.location.reload()" class="btn btn-lg btn-info">Refresh Deal</button>
												</div>
												</sec:authorize>         
									</c:otherwise>
								</c:choose>
                            </div>
                        </div>
                        </div>
                        
                <!-- Modal Popup for Redeem -->        
      	<div id="redeemModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="classInfo" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			          ×
			        </button>
			        <h4 class="modal-title" id="redeemModalLabel">
			            </h4>
			      </div>
			      <div class="modal-body">
			        <table id="redeemModal" class="table table-bordered">
			          <thead>
			          	 <th>Deal Code</th>
			          	 <th>Logo</th>
                         <th>Shop Name</th>
                         <th>Description</th>
                         <th>Shop Location</th>
                         <th>Total Quota</th>
			          </thead>
			          <tbody id="redeemtd">
			            
			          </tbody>
			        </table>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary" data-dismiss="modal">
			          Close
			        </button>
			      </div>
			    </div>
			  </div>
		</div>
		
		<!-- Modal Popup for Prompt -->
		<!-- The Modal -->
			
		<div id="redeemSubmission" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="classInfo" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			          ×
			        </button>
			        <h4 class="modal-title" id="getRedeemModalLabel">Redeem Voucher
			            </h4>
			      </div>
			      <div class="modal-body">
			      <div style="display:none" class="alert alert-success" id="successMsg"><strong>Success!</strong>Successfully registered the redeem</div>
			      <div style="display:none" class="alert alert-danger" id="failMsg"><strong>OOPs!</strong>Something went wrong.Please Try Again</div>
			        <p>Are you sure you want to grab the his redeem from <span id="shopName"></span> ?</p>
			      </div>
			      <div class="modal-footer">
			        	<button type="button" id="getredeem" class="btn btn-primary">Get It</button>
				        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
		</div>
	</div>
</div>
</div>
 <jsp:include page="../views/include/footer.jsp"></jsp:include>