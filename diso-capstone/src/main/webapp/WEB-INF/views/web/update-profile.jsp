<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<c:url var="editAction" value="/edit"/>
	<c:if test="${ errorEdit }">
		<h1>${ errorEdit }</h1>
	</c:if>
	<form:form method="post" action="${ editAction }" modelAttribute="user"
		style="width:300px;margin-left: 300px; margin-top: 100px;">
		<form:hidden path="id"/>
		<div class="control-group">
			<label class="control-label" for="inputFname">First name <sup>*</sup></label>
			<div class="controls">
				<form:input type="text" id="inputFname" cssClass="form-control" required="required" 
					path="firstName" />
			</div>
			<label class="control-label" for="inputLname">Last name <sup>*</sup></label>
			<div class="controls">
				<form:input type="text" id="inputLname" cssClass="form-control" required="required" 
					path="lastName" />
			</div>
		</div>
		
	
		<div class="control-group">
			<label class="control-label" for="inputAdress">Address <sup>*</sup></label>
			<div class="controls">

				<form:input type="text" id="inputAdress" cssClass="form-control" required="required"  
					path="address" />
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="inputPhone">Phone <sup>*</sup></label>
			<div class="controls">

				<form:input type="text" id="inputPhone" cssClass="form-control" pattern="[0]{1}[1-9]{8,10}" 
       				title="Số điện thoại không hợp lệ vui lòng nhập lại(9-11 )"
					path="phone" />
			</div>
		</div>
			<div class="control-group">
			<label class="control-label" for="inputEmail">Email <sup>*</sup></label> 
			<div class="controls">
				<form:input type="emai" id="inputEmail" cssClass="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
					title="Email không hợp lệ. vui lòng nhập lại"
					path="email" required="required"/>
				
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<input type="submit" value="Cập nhập" />
			</div>
		</div>
		
	</form:form>

</body>