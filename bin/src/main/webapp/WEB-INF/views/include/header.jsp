<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="bootstrap-admin-vertical-centered">
    <head>
        <title>Login page | JWT REDEEM Application</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap -->
        <link rel="stylesheet" media="screen" href="<c:url value="/resources/css/bootstrap.min.css" />">
        <link rel="stylesheet" media="screen" href="<c:url value="/resources/css/bootstrap-theme.min.css" />">

        <!-- Bootstrap Admin Theme -->
        <link rel="stylesheet" media="screen" href="<c:url value="/resources/css/bootstrap-admin-theme.css" />">

        <!-- Custom styles -->
        <style type="text/css">
            .alert{
                margin: 0 auto 20px;
            }
        </style>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
           <script type="text/javascript" src="<c:url value="/resources/js/html5shiv.js" />"></script>
           <script type="text/javascript" src="<c:url value="/resources/js/respond.min.js" />"></script>
        <![endif]-->
    </head>
    <body class="bootstrap-admin-without-padding">
