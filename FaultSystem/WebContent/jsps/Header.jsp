<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	table.gridtable {
		font-family: verdana,arial,sans-serif;
		font-size:14px;
		color:#333333;
		border-width: 1px;
		border-color: #666666;
		border-collapse: collapse;
	}
	table.gridtable th {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #666666;
		background-color: #dedede;
	}
	table.gridtable td {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #666666;
		background-color: #ffffff;
	}
</style>


<h1>MR FAULTY.</h1>
	
<%-- Loop over the JSTL cookie implicit object, which is a  map. If there are no cookies, the <c:forEach> action does nothing. --%>
<c:forEach items='${cookie}' var='eachCookie'>
	<c:if test="${eachCookie.key eq 'logonid'}">
		<c:set var="logonid" value="${eachCookie.value.value}"/>
		<c:out value="Wlecome ${logonid}"/> &nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
</c:forEach>

<jsp:useBean id="userFaultHeader" class="mrfault.user.UserFaultBean">
<jsp:setProperty name="userFaultHeader" property="logonid" value="${logonid}" />
</jsp:useBean>

<c:set var="typeOfUser" value="${userFaultHeader.userTypeByLogin}"/>

	<a href="/FaultSystem/jsps/results.jsp"><c:out value="Home"/></a> &nbsp;&nbsp;&nbsp;&nbsp;
	
	
	<c:if test="${typeOfUser eq 'Admin' || typeOfUser eq 'Reporter'}">
		<a href="/FaultSystem/jsps/CreateFault.jsp"><c:out value="Create Fault"/></a> &nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/FaultSystem/jsps/CreateResource.jsp"><c:out value="Create Resource"/></a> &nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/FaultSystem/jsps/AllFaults.jsp"><c:out value="List All Faults"/></a> &nbsp;&nbsp;&nbsp;&nbsp;
</c:if>

<c:if test="${typeOfUser eq 'Admin'}">
		<a href="/FaultSystem/jsps/AllUsers.jsp"><c:out value="List All Users"/></a> &nbsp;&nbsp;&nbsp;&nbsp;
</c:if>

<a href="/FaultSystem/jsps/LogonPage.jsp"><c:out value="Sign Out"/></a>   
