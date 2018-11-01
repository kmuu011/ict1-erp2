<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="${skyPath}/dhtmlx.css"/>
</head>
<body>
	<div id="dxGrid" style="width:400px; height:300px"></div>

<script>
window.addEventListener('load', doInit);
var mData = [{id:'delete',text:'delete'},
	{id:'add',text:'Add Row'}];
	
	var dxGrid,dxMenu;
	
	function doInit(){
		dxMenu = new dhtmlXMenuObject();
		dxMenu.setIconsPath("../common/images/");
		dxMenu.renderAsContextMenu();
		
		dxMenu.attachEvent("onClick", function(mId,type){
			if(mId == 'delete'){
				var rId = dxGrid.getSelectedRowId();
				
				if(!rId){
					alert('삭제할 로우를 선택해주세요');
					return;
				}
				
				var cIdx = dxGrid.getColIndexById('linum');
				var linum = dxGrid.cells(rId,cIdx).getValue();
				dhx.ajax.del('${rPath}/levelinfos/' + linum, function(res){
					alert(res.xmlDoc.response);
				});
				
			}else if(mId == 'add'){
				dhx.ajax.get('${rPath}/linum', function(res){
					var data = JSON.parse(res.xmlDoc.responseText);
					var rId = dxGrid.uid();
					dxGrid.addRow(rId,[data],dxGrid.getRowsNum());
					dxGrid.setRowAttribute(rId,"st","new");
				});
				
			}
			
		});
		
		dxMenu.loadStruct(mData);
		dxGrid = new dhtmlXGridObject('dxGrid');
		dxGrid.setImagePath('${skyPath}/imgs/');
		dxGrid.setHeader('번호,레벨,이름,설명');
		dxGrid.setColumnIds('linum,lilevel,liname,lidesc');
		dxGrid.setColTypes('ro,ed,ed,ed');
		dxGrid.enableContextMenu(dxMenu);
		dxGrid.init();
		
		dhx.ajax.get('${rPath}/levelinfos', function(res){
			var data = JSON.parse(res.xmlDoc.response);
			dxGrid.parse(data,'js');
		});
		
		dxGrid.attachEvent('onEditCell', function(stage,rId,cInd,nValue,oValue){
			if(stage == 2){
				if(dxGrid.getRowAttribute(rId,'st') == 'new'){
					var rData = dxGrid.getRowData(rId);
					alert(rData.linum)
					return true;
				}
				
				if(nValue != oValue){
					var rData = dxGrid.getRowData(rId);
					var xhr = new XMLHttpRequest();
					
					xhr.onreadystatechange = function(){
						if(xhr.readyState == xhr.DONE){
							if(xhr.status == 200){
								alert(1);
							}
						}
					}
					
					xhr.open('PUT', '${rPath}/levelinfos/' + rData.linum);
					xhr.setRequestHeader('Content-type','application/json;charset=utf-8');
					xhr.send(JSON.stringify(makeParams(rData)));
					
				}
				
				
				
			}
		});
		
		
	}
	
	function makeParams(data){
		var params = {};
		for(var key in data){
			params[key] = data[key];
		}
		
		return params;
	}
	                        

</script>

</body>
</html>