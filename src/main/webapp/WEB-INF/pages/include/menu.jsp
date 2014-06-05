<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="bike" tagdir="/WEB-INF/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">RemondiTeenus</a>
        </div>

        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/device/add">Add Device</a></li>
                <li><a href="/device/search">Search Device</a></li>
                <li><a href="/service-order/update?serviceRequestId=1">Service order search</a></li>
                <li><a href="/invoice/add">Add Invoice</a></li>
                <li><a href="/service-request/add">Add Service Request</a></li>
            </ul>
        </div>
    </div>
</div>
<div style="margin-bottom: 30px;padding-bottom: 30px"></div>