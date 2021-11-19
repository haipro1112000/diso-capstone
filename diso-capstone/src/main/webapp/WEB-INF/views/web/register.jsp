<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<c:url var="registerAction" value="/register" />
	<c:if test="${ status }">
		<h1>${ status }</h1>
	</c:if>
	<form:form method="post" action="${ registerAction }"
		modelAttribute="user"
		style="width:300px;margin-left: 300px; margin-top: 100px;">
		<div class="control-group">
			<label class="control-label" for="inputFname">First name <sup>*</sup></label>
			<div class="controls">
				<form:input type="text" id="inputFname" cssClass="form-control" 
					path="firstName" required="required"/>
			
			</div>
			<label class="control-label" for="inputLname">Last name <sup>*</sup></label>
			<div class="controls">
				<form:input type="text" id="inputLname" cssClass="form-control"  
					path="lastName" required="required"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputEmail">username <sup>*</sup></label>
			<div class="controls">
				<form:input type="text" id="inputFname" cssClass="form-control" 
					path="userName" required="required"/>
	
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Password <sup>*</sup></label>
			<div class="controls">
				<form:input type="password" id="inputFname" cssClass="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				 title="Mật khẩu phải gồm chữ HOA, chữ thường và số" 
					path="password" required="required" />
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
				<input type="submit" value="Đăng ký" />
			</div>
		</div>
	</form:form>

</body>