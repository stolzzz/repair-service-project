<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="serviceAction" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="servicePart" tagdir="/WEB-INF/tags" %>

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
        #orderDevices {
            padding-bottom: 12px;
        }
        #foundDevices {
            padding-left: 15px;
            float: left;
        }

        #devices td {
            padding: 5px;
        }

        #serviceOrderNote {
            float: right;
        }

        #container {
            overflow: hidden;
        }

        label {
            padding-left: 10px;
        }
        .errorMsg {
            color: #ff0000;
        }

    </style>
</head>
<body>
<jsp:include page="../include/menu.jsp"/>
<div class="container" id="container">

    <h1 class="text-left">Device service details</h1>

    <div class="row">
        <div class="col-lg-4">
        <form:form id="serviceDevices" role="form" method="get" action="editServiceDevice">
            <input name="serviceOrderId" type="hidden" value="${serviceOrderId}">
            <label class="control-label">Device in service:</label>
            <select name="deviceId" class="form-control" id="deviceSelector">
                <c:forEach var="device" items="${deviceList}">
                    <option value="${device.device}" ${device.device == selectedDeviceId ? 'selected="selected"' : ''}>${device.name}</option>
                </c:forEach>
            </select>
            <button type="submit" class="btn btn-primary">Select device</button>
        </form:form>
        </div>
    </div>

    <div class="row">
            <c:if test="${fail}">
                <div class="alert alert-danger">Failed to save changes</div>
            </c:if>
            <c:if test="${success}">
                <div class="alert alert-success">Changes successfully saved</div>
            </c:if>
        <h2>Device service actions:</h2>
        <div class="col-lg-11">
         <c:if test="${not empty serviceActions}">
          <c:forEach var="serviceAction" items="${serviceActions}">
              <h3>Service action № ${serviceAction.serviceAction}</h3>
              <c:choose>
                  <c:when test="${not empty actionErrorMapHolder && actionErrorMapHolder.formIndex == serviceAction.serviceAction}">
                      <c:set var="errors" value="${actionErrorMapHolder.errors}"></c:set>

                      <form:form modelAttribute="serviceActions" method="post" class="form-inline" id="form_${serviceAction.serviceAction}" action="saveEditedServiceAction">
                          <input id="${serviceActionId}" name="serviceActionId" value="${serviceAction.serviceAction}" type="hidden">

                          <label class="control-label">Service action description:</label>
                          <input name="actionDescription" class="form-control" id="actionDescription" value="${invalidAction.actionDescription}" />
                          <c:if test="${not empty errors['actionDescription']}"><span class="errorMsg">${errors['actionDescription']}</span></c:if>

                          <label class="control-label">Service type:</label>
                          <select name="serviceType" class="form-control">
                              <c:forEach var="serviceType" items="${serviceTypeList}">
                                  <option value="${serviceType.serviceType}" ${serviceType.serviceType == invalidAction.serviceType ? 'selected="selected"' : ''}>${serviceType.typeName}</option>
                              </c:forEach>
                          </select>

                          <label class="control-label">Service amount (${serviceAction.serviceType.serviceUnitType.typeName}):</label>
                          <input class="form-control" name="serviceAmount" id="serviceAmount" value="${invalidAction.serviceAmount}"/>
                          <c:if test="${not empty errors['serviceAmount']}"><span class="errorMsg">${errors['serviceAmount']}</span></c:if>

                          <label class="control-label">Service price:</label>
                          <input class="form-control" name="price" id="price" value="${invalidAction.price}" />
                          <c:if test="${not empty errors['price']}"><span class="errorMsg">${errors['price']}</span></c:if>

                          <label class="control-label">Total price:</label>
                          <input class="form-control" name="totalPrice" readonly value="${serviceAction.price * serviceAction.serviceAmount}" />


                          <label class="control-label">Action status:</label>
                          <select name="serviceActionStatusType" id="serviceActionStatusType" class="form-control">
                              <c:forEach var="type" items="${serviceActionStatusTypes}">
                                  <option value="${type.serviceActionStatusType}" ${type.serviceActionStatusType == invalidAction.serviceActionStatusType ? 'selected="selected"' : ''}>${type.typeName}</option>
                              </c:forEach>
                          </select>

                          <button class="btn btn-default" type="submit">Submit changes</button>
                      </form:form>
                  </c:when>
                  <c:otherwise>
                      <form:form modelAttribute="serviceActions" method="post" class="form-inline" id="form_${serviceAction.serviceAction}" action="saveEditedServiceAction">
                          <input id="${serviceActionId}" name="serviceActionId" value="${serviceAction.serviceAction}" type="hidden">

                          <label class="control-label">Service action description:</label>
                          <input name="actionDescription" class="form-control" id="actionDescription" value="${serviceAction.actionDescription}" />

                          <label class="control-label">Service type:</label>
                          <select name="serviceType" class="form-control">
                              <c:forEach var="serviceType" items="${serviceTypeList}">
                                  <option value="${serviceType.serviceType}" ${serviceType.serviceType == serviceAction.serviceType.serviceType ? 'selected="selected"' : ''}>${serviceType.typeName}</option>
                              </c:forEach>
                          </select>

                          <label class="control-label">Service amount (${serviceAction.serviceType.serviceUnitType.typeName}):</label>
                          <input class="form-control" name="serviceAmount" id="serviceAmount" value="${serviceAction.serviceAmount}"/>

                          <label class="control-label">Service price:</label>
                          <input class="form-control" name="price" id="price" value="${serviceAction.price}" />

                          <label class="control-label">Total price:</label>
                          <input class="form-control" name="totalPrice" readonly value="${serviceAction.price * serviceAction.serviceAmount}" />

                          <label class="control-label">Action status:</label>
                          <select name="serviceActionStatusType" id="serviceActionStatusType" class="form-control">
                              <c:forEach var="type" items="${serviceActionStatusTypes}">
                                  <option value="${type.serviceActionStatusType}" ${type.serviceActionStatusType == serviceAction.serviceActionStatusType.serviceActionStatusType ? 'selected="selected"' : ''}>${type.typeName}</option>
                              </c:forEach>
                          </select>

                          <button class="btn btn-primary" type="submit">Submit changes</button>
                      </form:form>
                  </c:otherwise>
              </c:choose>
          </c:forEach>
         </c:if>
            <hr>
            <h3>Add new Action</h3>
            <c:choose>
            <c:when test="${not empty newActionErrors}">
            <form:form  method="post" class="form-inline" action="saveNewServiceAction">

            <input name="serviceDeviceId" value="${selectedDeviceId}" type="hidden" />
            <input name="deviceInService" value="${deviceInService}" type="hidden"/>

            <label class="control-label">Service action description:</label>
            <input name="actionDescription" class="form-control" id="actionDescription" value="${invalidNewAction.actionDescription}"  />
                <c:if test="${not empty newActionErrors['actionDescription']}"><span class="errorMsg">${newActionErrors['actionDescription']}</span></c:if>


                <label class="control-label">Service type:</label>
            <select name="serviceType" class="form-control">
                <c:forEach var="serviceType" items="${serviceTypeList}">
                    <option value="${serviceType.serviceType}" ${serviceType.serviceType == invalidNewAction.serviceType ? 'selected' : ''} >${serviceType.typeName}</option>
                </c:forEach>
            </select>

            <label class="control-label">Service amount:</label>
            <input class="form-control" name="serviceAmount" id="serviceAmount" value="${invalidNewAction.serviceAmount}" />
            <c:if test="${not empty newActionErrors['serviceAmount']}"><span class="errorMsg">${newActionErrors['serviceAmount']}</span></c:if>


            <label class="control-label">Service price:</label>
            <input class="form-control" name="price" id="price" value="${invalidNewAction.price}" />
            <c:if test="${not empty newActionErrors['price']}"><span class="errorMsg">${newActionErrors['price']}</span></c:if>

                <label class="control-label">Action status:</label>

                <select name="serviceActionStatusType" id="serviceActionStatusType" class="form-control">
                <c:forEach var="type" items="${serviceActionStatusTypes}">
                    <option value="${type.serviceActionStatusType}" ${type.serviceActionStatusType == invalidNewAction.serviceActionStatusType ? 'selected' :''}>${type.typeName}</option>
                </c:forEach>
            </select>

            <button class="btn btn-primary" type="submit">Submit new Action</button>
            </form:form>
            </c:when>
            <c:otherwise>
                <form:form  method="post" class="form-inline" action="saveNewServiceAction">

                <input name="serviceDeviceId" value="${selectedDeviceId}" type="hidden" />
                <input name="deviceInService" value="${deviceInService}" type="hidden"/>


                <label class="control-label">Service action description:</label>
                <input name="actionDescription" class="form-control" id="actionDescription"  />

                <label class="control-label">Service type:</label>
                <select name="serviceType" class="form-control">
                    <c:forEach var="serviceType" items="${serviceTypeList}">
                        <option value="${serviceType.serviceType}" >${serviceType.typeName}</option>
                    </c:forEach>
                </select>

                <label class="control-label">Service amount:</label>
                <input class="form-control" name="serviceAmount" id="serviceAmount" />

                <label class="control-label">Service price:</label>
                <input class="form-control" name="price" id="price"  />

                <label class="control-label">Action status:</label>

                <select name="serviceActionStatusType" id="serviceActionStatusType" class="form-control">
                    <c:forEach var="type" items="${serviceActionStatusTypes}">
                        <option value="${type.serviceActionStatusType}" >${type.typeName}</option>
                    </c:forEach>
                </select>
                <button class="btn btn-primary" type="submit">Submit new Action</button>
                </form:form>
            </c:otherwise>
            </c:choose>

        </div>
    </div>
    <div class="row">
        <h2>Device parts:</h2>
        <div class="col-lg-10">
        <c:if test="${not empty serviceParts}">
            <c:forEach var="part" items="${serviceParts}">
                <h3>Device part № ${part.servicePart}</h3>
                <c:choose>
                    <c:when test="${not empty partErrorMapHolder && partErrorMapHolder.formIndex == part.servicePart}">
                        <c:set var="errors" value="${partErrorMapHolder.errors}"></c:set>
                        <form:form method="post" class="form-inline" action="saveEditedServicePart">
                            <input class="form-control" name="deviceId" value="${selectedDeviceId}" type="hidden" />
                            <input class="form-control" name="deviceInService" value="${deviceInService}" type="hidden"/>
                            <input class="form-control" name="servicePartId" value="${part.servicePart}" type="hidden">

                            <label class="control-label">Part name:</label>
                            <input class="form-control" name="partName" value="${invalidPart.partName}">
                            <c:if test="${not empty errors['partName']}"><span class="errorMsg">${errors['partName']}</span></c:if>


                            <label class="control-label">Serial number:</label>
                            <input class="form-control" name="serialNo" value="${invalidPart.serialNo}">
                            <c:if test="${not empty errors['serialNo']}"><span class="errorMsg">${errors['serialNo']}</span></c:if>


                            <label class="control-label">Part price:</label>
                            <input class="form-control" name="partPrice" value="${invalidPart.partPrice}">
                            <c:if test="${not empty errors['partPrice']}"><span class="errorMsg">${errors['partPrice']}</span></c:if>


                            <label class="control-label">Part count:</label>
                            <input class="form-control" name="partCount" value="${invalidPart.partCount}">
                            <c:if test="${not empty errors['partCount']}"><span class="errorMsg">${errors['partCount']}</span></c:if>

                            <button class="btn btn-primary" type="submit">Submit edited part</button>
                        </form:form>
                    </c:when>
                    <c:otherwise>
                       <form:form method="post" class="form-inline" action="saveEditedServicePart">
                           <input class="form-control" name="deviceId" value="${selectedDeviceId}" type="hidden" />
                           <input class="form-control" name="deviceInService" value="${deviceInService}" type="hidden"/>
                           <input class="form-control" name="servicePartId" value="${part.servicePart}" type="hidden">

                           <label class="control-label">Part name:</label>
                           <input class="form-control" name="partName" value="${part.partName}">

                           <label class="control-label">Serial number:</label>
                           <input class="form-control" name="serialNo" value="${part.serialNo}">

                           <label class="control-label">Part price:</label>
                           <input class="form-control" name="partPrice" value="${part.partPrice}">

                           <label class="control-label">Part count:</label>
                           <input class="form-control" name="partCount" value="${part.partCount}">

                           <button class="btn btn-primary" type="submit">Submit edited part</button>
                       </form:form>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:if>

            <hr>
            <h3>Add new Part</h3>
            <c:choose>
                <c:when test="${not empty newInvalidPart}">
                    <form:form  method="post" class="form-inline" action="saveNewServicePart">

                        <input name="serviceDeviceId" value="${selectedDeviceId}" type="hidden" />
                        <input name="deviceInService" value="${deviceInService}" type="hidden"/>

                        <label class="control-label">Part Name:</label>
                        <input name="partName" class="form-control" id="partName" value="${newInvalidPart.partName}"  />
                        <c:if test="${not empty partErrors['partName']}"><span class="errorMsg">${partErrors['partName']}</span></c:if>

                        <label class="control-label">Serial No:</label>
                        <input class="form-control" name="serialNo" id="serialNo" value="${newInvalidPart.serialNo}" />
                        <c:if test="${not empty partErrors['serialNo']}"><span class="errorMsg">${partErrors['serialNo']}</span></c:if>

                        <label class="control-label">Part price:</label>
                        <input class="form-control" name="partPrice" id="partPrice" value="${newInvalidPart.partPrice}" />
                        <c:if test="${not empty partErrors['partPrice']}"><span class="errorMsg">${partErrors['partPrice']}</span></c:if>

                        <label class="control-label">Part count:</label>
                        <input class="form-control" name="partCount" id="partCount" value="${newInvalidPart.partCount}" />
                        <c:if test="${not empty partErrors['partCount']}"><span class="errorMsg">${partErrors['partCount']}</span></c:if>

                        <button class="btn btn-primary" type="submit">Submit new part</button>
                    </form:form>
                </c:when>
                <c:otherwise>
                    <form:form  method="post" class="form-inline" action="saveNewServicePart">

                        <input name="serviceDeviceId" value="${selectedDeviceId}" type="hidden" />
                        <input name="deviceInService" value="${deviceInService}" type="hidden"/>

                        <label class="control-label">Part Name:</label>
                        <input name="partName" class="form-control" id="partName"  />

                        <label class="control-label">Serial No:</label>
                        <input class="form-control" name="serialNo" id="serialNo" />

                        <label class="control-label">Part count:</label>
                        <input class="form-control" name="partCount" id="partCount"  />

                        <label class="control-label">Action status:</label>
                        <input class="form-control" name="partPrice" id="partPrice"  />

                        <button class="btn btn-primary" type="submit">Submit new part</button>
                    </form:form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

</body>
</html>