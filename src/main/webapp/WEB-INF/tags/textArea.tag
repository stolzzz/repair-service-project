<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="label" required="true" rtexprvalue="true" %>
<%@ attribute name="rowNum" required="true" rtexprvalue="true" %>
<%@ attribute name="colNum" required="true" rtexprvalue="true" %>


<spring:bind path="${name}">
    <c:set var="cssGroup" value="control-group"/>
    <div class="form-group">
        <label class="control-label">${label}</label>
        <form:textarea class="form-control" path="${name}" rows="${rowNum}" cols="${colNum}"/>
        <span style="color: red"><form:errors path="${name}"></form:errors></span>
    </div>
</spring:bind>