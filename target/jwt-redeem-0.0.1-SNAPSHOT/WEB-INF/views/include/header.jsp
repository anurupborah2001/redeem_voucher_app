<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.jwt.redeem.constants.Constant" %>
<!DOCTYPE html>
<html class="bootstrap-admin-vertical-centered">
    <head>
        <title>Login page | JWT REDEEM Application</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
 		<meta name="_csrf" content="${_csrf.token}"/>
	    <!-- default header name is X-CSRF-TOKEN -->
	    <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <!-- Bootstrap -->
        <link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/css/bootstrap.min.css" />">
        <link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/css/bootstrap-theme.min.css" />">

        <!-- Bootstrap Admin Theme -->
        <link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/css/bootstrap-admin-theme.css" />">

        <!-- Custom styles -->
        <style type="text/css">
            .alert{
                margin: 0 auto 20px;
            }
        </style>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
           <script type="text/javascript" src="<c:url value="/resources/theme/js/html5shiv.js" />"></script>
           <script type="text/javascript" src="<c:url value="/resources/theme/js/respond.min.js" />"></script>
        <![endif]-->
    </head>
    <body class="bootstrap-admin-without-padding">
    <c:url var="logopath" value="<%= Constant.LOGO_PATH  %>" scope="application" />
    <c:set var="req" value="${pageContext.request}" />
	<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" scope="request" />
	<div id="baseUrl" data-url="${baseURL}"></div>
	<div id="logoPath" data-logourl="${logopath}"></div>