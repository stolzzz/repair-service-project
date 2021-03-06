<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="serviceRequest" tagdir="/WEB-INF/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/resources/libs/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js" />"> </script>
    <script type="text/javascript" src="<c:url value="/resources/libs/bootstrap/js/bootstrap.min.js" />"> </script>
    <title>We will serviceRequest</title>

    <spring:url value="/resources/js/jquery.min.js" var="jquery"/>
    <spring:url value="/resources/js/bike.js" var="appJs"/>

    <script src="${jquery}"></script>
    <script src="${appJs}"></script>
    <style>
        #customerTempName {
            padding-right: 12px;
        }
        #customerSearch {
            padding-bottom: 15px;

        }
        #editButton {
           padding-top: 12px;
        }
    </style>
</head>
<body>
<jsp:include page="../include/menu.jsp"/>
<div class="container">


    <h1>Add Service Request</h1>
    <hr>

    <c:if test="${successMessage}">
        <div class="alert alert-success">Service Request is created!</div>
    </c:if>
    <div id="customerSearch">
        <input class="form-control" name="customerIdTemp" type="hidden">
        <label>Search client</label><br>
        <input type="text" label="Search client" name="requestClientSearchField">
        <button class="btn btn-default" onclick="searchForClient()">Search</button>
        <div id="customerData"></div>
        <div id="customerName">Customer: <c:out value="${customer.retrieveCustomerName()}"/></div>
    </div>

    <form:form modelAttribute="serviceRequest" method="post" action="saveServiceRequest">
        <input class="form-control" name="customerId" type="hidden" value="${customer.customer}"/>
        <serviceRequest:textArea  label="Service description by customer" name="serviceDescByCustomer" rowNum="6" colNum="30"/>
        <serviceRequest:textArea label="Service description by worker" name="serviceDescByEmployee" rowNum="6" colNum="30"/>
        <div class="form-group">
            <label class="control-label">Request status</label>
            <form:select class="form-control" path="serviceRequestStatusType.serviceRequestStatusType" items="${statusTypes}"/>
        </div>
        <button class="btn btn-primary" id="editButton" type="submit">Edit</button>
        <c:if test="${serviceRequest.serviceRequestStatusType.serviceRequestStatusType == 1}">
        <c:choose>
            <c:when test="${not empty serviceRequest.serviceOrder}">
                 <a href="<c:url value="/service-order/updateServiceOrder?serviceOrderId=${serviceRequest.serviceOrder.serviceOrder}"/>" class="btn btn-default">Edit service order</a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="/service-order/addNewServiceOrder?serviceRequestId=${serviceRequest.serviceRequest}"/>"  class="btn btn-default">Create service order</a>
            </c:otherwise>
        </c:choose>
        </c:if>
    </form:form>
</div>

</body>
</html>