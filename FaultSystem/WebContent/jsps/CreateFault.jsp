<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Mr. Faulty Create Fault Page</title>
  </head>
  <body>
	<%@include file="Header.jsp" %>

		  <h4>Create Fault</h4>
		  
		  <jsp:useBean id="userFault" class="mrfault.user.UserFaultBean">
				<jsp:setProperty name="userFault" property="logonid" value="${logonid}" />
		  </jsp:useBean>
		  
		  <table class="gridtable">
			  <tbody>
			    <!-- Results table headers -->
			    <tr>
			      <th><b>Assign To</b></th>
			      <th><b>Short Description</b></th>
			      <th><b>Long Description</b></th>
			      <th><b>Reporter <br/>(read only)</b></th>
			      <th><b>Priority</b></th>
			      <th><b>Status</b></th>
			      <th><b>Action</b></th>
			    </tr> 
		
				  <form method="post" action="/FaultSystem/createfault.do" id="faultform" name="faultform">
				  	<tr>
					  	<input type="hidden" name="faultId" maxlength="50" id="faultId" value="${userFault.maxFaultId}"/>
									
					  	<td><label>Assign To: </label>
					  	
					  	<select id="logonId" name="logonId">
						  <c:forEach items="${userFault.allUsers}" var="eachUser">
						  	<option value="${eachUser.logonid}">${eachUser.logonid}</option>
						  </c:forEach>
						</select></td>
					  	
					  	<td><label>Short Description :</label>
					  	<input type="text" name="shortdescription" maxlength="50" id="shortdescription" value=""/></td>
					  	
					  	<td><label>Long Description :</label>
					  	<input type="text" name="longdescription" maxlength="50" id="longdescription" value=""/></td>
					  	
					  	<td><label>Reporter :</label>
					  	<input type="text" readonly="readonly" name="reporter" maxlength="50" id="reporter" value="${logonid}"/></td>
					  	
					  	<td><label>Priority</label>
					  	<select id="priority" name="priority">
						  <option value="Blocker">Blocker</option>
						  <option value="Critical">Critical</option>
						  <option value="Major">Major</option>
						  <option value="Minor">Minor</option>
						  <option value="Trivial">Trivial</option>
						</select></td>
					  	
					  	<td><label>Status</label>
					  	<select id="status" name="status">
						  <option value="Assigned">Assigned</option>
						  <option value="In Progress">In Progress</option>
						  <option value="Cannot Reproduce">Cannot Reproduce</option>
						  <option value="In Test">In Test</option>
						  <option value="Closed">Closed</option>
						  <option value="Deferred">Deferred</option>
						  <option value="Test Fail">Test Fail</option>
						  <option value="Duplicate">Duplicate</option>
						</select></td>
					  	<td>
					  		<input type="button" onclick="formSubmit()" value="Create Fault" />
					  	</td>
				  	</tr>
				  	
				  </form>
		  	   </tbody>
		  </table>
		  
		   <script type="text/javascript">
				function formSubmit()
				{
					document.getElementById("faultform").submit();
				}
		  </script>
		  
		  <%@include file="Footer.jsp" %>
		  
	</body>
</html>			