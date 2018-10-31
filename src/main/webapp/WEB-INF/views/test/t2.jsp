<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>

<style>
	#leftDiv{
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

<body>
<div>

	<div id="leftDiv">
		<jsp:include page="/WEB-INF/views/test/t2left.jsp"/>
	</div>
	 
	<div id="rightDiv">
		<c:if test="${page eq 'r1'}">
			<jsp:include page="/WEB-INF/views/test/r1.jsp"/>
		</c:if>
		<c:if test="${page eq 'r2'}">
			<jsp:include page="/WEB-INF/views/test/r2.jsp"/>
		</c:if>
		<c:if test="${page eq 'r3'}">
			<jsp:include page="/WEB-INF/views/test/r3.jsp"/>
		</c:if>
	</div>
	
</div>

<script>

	document.querySelector('#op').onchange = function(){
		/* var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == xhr.DONE){
				if(xhr.status == 200){
					
				}
			}
		}
		
		xhr.open('GET', '/ict1-erp2/ttest');
		xhr.send(); */
		
		location.href = "/ict1-erp2/ttest/" + this.value;
		
	}

</script>

</body>
</html>