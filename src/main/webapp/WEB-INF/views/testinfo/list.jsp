<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
<script>
var AjaxUtil = function(conf){
	var xhr = new XMLHttpRequest();
	var url = conf.url;
	var method = conf.method?conf.method:'GET';
	var param = conf.param;
	
	var success = conf.success?conf.success:function(res){
		alert(res);
	}
	var error = conf.error?conf.error:function(res){
		alert(res);
	}
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status=="200"){
				success(xhr.responseText);
			}else{
				error(xhr.responseText);
			}
		}
	}
	xhr.open(method,url);
	if(method!='GET'){
		xhr.setRequestHeader('Content-type', 'application/json;charset=utf-8');
	}
	this.send = function(){
		xhr.send();
	}
}

window.addEventListener('load',function(){
	var conf = {
			url : '${rPath}/testinfo',
			success : function(res){
				res = JSON.parse(res);
				var html = '';
				for(var ti of res){
					html += '<tr>';
					html += '<td>' + ti.tid + '</td>';
					html += '<td><input type="text" id="' + ti.ttext + '" value="' + ti.ttext + '"></td>';
					html += '<td>' + ti.tdesc + '</td>';
					html += '<td><button onclick="updateLevelInfo(' + ti.tid + ')">수정</button><button>삭제</button></td>';
					html += '</tr>';
				} 
				document.querySelector('#tiBody').insertAdjacentHTML('beforeend',html);
			}
	}
	var au = new AjaxUtil(conf);
	au.send();
});
</script>

tiname : <input type="text" name="tiname">
<button>검색</button>
<table border="1">
	<thead>
		<tr>
			<th>tid</th>
			<th>ttext</th>
			<th>tdesc</th>
			<th>수정/삭제</th>
		</tr>
	</thead>
	<tbody id="tiBody">
	</tbody>
</table>


<script>

	function updateLevelInfo(linum){
		/* var lilevel = document.querySelector("input[name=tid" + linum + "]").value;
		var liname = document.querySelector("input[name=ttext" + linum + "]").value;
		var lidesc = document.querySelector("input[name=tdesc" + linum + "]").value; */
		alert(linum.value);
		
		
	}
	
	function deleteLevelInfo(linum){
		
	}
</script>

</body>

</html>