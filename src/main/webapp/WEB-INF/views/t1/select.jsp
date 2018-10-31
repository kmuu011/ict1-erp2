<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

<style>
	#leftDiv {
		width:40%;
		height:400px;
		float:left;
		background-color:rgba(153,51,242,0.8);
	}
	
	#rightDiv{
		width:40%;
		height:400px;
		float:right;
		background-color:rgba(213,101,100,0.8);
	}
</style>
</head>

<body>
<c:set var="page" value="${param.page}"/>

<c:if test="${empty page}">
	<c:set var="page" value="r1"/>
</c:if>

<div>

	<div id="leftDiv">
		<jsp:include page="/WEB-INF/views/t1/left.jsp"></jsp:include>
	</div>
	
	<div id="rightDiv">
		<jsp:include page="/WEB-INF/views/t1/${page}.jsp"></jsp:include>
	</div>

</div>

<script>
document.querySelector('#op').onchange = function(){
	location.href = "/ict1-erp2/uri/t1:select?page=" + this.value;
}

</script>

</body>
</html>