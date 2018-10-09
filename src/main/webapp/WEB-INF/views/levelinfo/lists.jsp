<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
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
			url : '${rPath}/levelinfo',
			success : function(res){
				res = JSON.parse(res);
				var html = '';
				for(var li of res){
					html += '<tr>';
					html += '<td>' + li.linum + '</td>';
					html += '<td><input type="text" id="' + li.lilevel + '" value="' + li.lilevel + '"></td>';
					html += '<td>' + li.liname + '</td>';
					html += '<td>' + li.lidesc + '</td>';
					html += '<td><button onclick="updateLevelInfo(' + li.linum + ')">수정</button><button>삭제</button></td>';
					html += '</tr>';
				} 
				document.querySelector('#liBody').insertAdjacentHTML('beforeend',html);
			}
	}
	var au = new AjaxUtil(conf);
	au.send();
});
</script>

<body> 
liname : <input type="text" name="liname">
<button>검색</button>
<table border="1">
	<thead>
		<tr>
			<th>linum</th>
			<th>lilevel</th>
			<th>liname</th>
			<th>lidesc</th>
			<th>수정/삭제</th>
		</tr>
	</thead>
	<tbody id="liBody">
	</tbody>
</table>

<button onclick="addLevelInfo()"> 레벨 추가</button>

<script>

function addLevelInfo(){
	var html = '';
	html += '<tr>';
	html += '<td>&nbsp;</td>';
	html += '<td><input type="text" id=lilevel"></td>';
	html += '<td><input type="text" id=liname"></td>';
	html += '<td><input type="text" id=lidesc"></td>';
	html += '<td><button onclick="saveLevelInfo()">저장</button></td>';
	html += '</tr>';
	
	document.querySelector('#libody').innerHTML = html;
	
}

function saveLevelInfo(){
	var lilevel = document.querySelector("#lilevel").value;
	var liname = document.querySelector("#liname").value;
	var lidesc = document.querySelector("#lidesc").value;
	var params = {lilevel:lilevel, liname:liname, lidesc:lidesc};
	params = JSON.stringify(params);
	
	var conf ={
			url : '/levelinfos',
			method : 'POST',
			param : params,
			
	}
	
}

function updateLevelInfo(linum){
	var lilevel = document.querySelector("#lilevel" + linum).value;
	var liname = document.querySelector("input[name=liname" + linum + "]").value;
	var lidesc = document.querySelector("input[name=lidesc" + linum + "]").value;
	alert(lilevel + "," + liname + "," +lidesc);
	
	
}

function deleteLevelInfo(linum){
}
</script>
</body>
</html>