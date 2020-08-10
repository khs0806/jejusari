<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../javascript/jquery-3.5.1.js"></script>
<script type="text/javascript">
function memberDrop(obj){
	var drop=[];
	
	$("input[name=drop]:checked").each(function(){
		drop.push($(this).val());
	});
	
	alert(drop);
	
}
</script>
<style type="text/css">
	#admin_container{
		margin:5% 16% 3% 16%;
		width: 100%;
		float:left;
		font-size: 16px;
	}

	#admin_container>.admin_title{
		float:left;
		width: 100%;
		font-size: 25px;
		font-weight: bold;
		
	}

	#admin_table{
		margin-top:16px;
	    border: 1px solid black; 
		float:left;
/* 		background-color:mistyrose; */
		width:1235px;

	}
	
	#admin_table>.line{
		float:left;
		width:100%;
		border-bottom:1px solid black;
		padding:0px;
		margin: 0px;
	}
	
	.column>div{
/* 		background-color:aliceblue; */
		width:200px;
		display: inline-block;
		text-align: center;
		border-right:  1px solid black;
	}
	

	.column>div:nth-child(6) {
		border-right:  0px;
	}
	
	.th{
		font-weight:bold;
	    background-color: rgb(84, 207, 43);
	}



    form>#admin_container>.submit{
    margin-top:10px;
    float:left;
   	width: 1235px;
/*    	background-color: yellow; */
   }
   
   .submit>#dropMem{
   	float:right;
   }


</style>
</head>
<body>
<form action="#" method="POST" onsubmit="return memberDrop(this)">
	<div id="admin_container">	
			<div class="admin_title">
				회원관리
			</div>
			<div id="admin_table">
			<div class="line">
				<div class="column th">
					<div>1</div>
					<div>2</div>
					<div>3</div>
					<div>4</div>
					<div>5</div>
					<div>6</div>
				</div>
			</div>
			<div class="line">
				<div class="column">
					<div><input type="checkbox" value="1" name="drop"/></div>
					<div>a</div>
					<div>b</div>
					<div>c</div>
					<div>d</div>
					<div>e</div>
				</div>
			</div>
			<div class="line">
				<div class="column">
					<div><input type="checkbox" value="2" name="drop"/></div>
					<div>a</div>
					<div>b</div>
					<div>c</div>
					<div>d</div>
					<div>e</div>
				</div>
			</div>
			<div class="line">
				<div class="column">
					<div><input type="checkbox" value="3" name="drop"/></div>
					<div>a</div>
					<div>b</div>
					<div>c</div>
					<div>d</div>
					<div>e</div>
				</div>
			</div>
			<div class="line">
				<div class="column">
					<div><input type="checkbox" value="4" name="drop"/></div>
					<div>a</div>
					<div>b</div>
					<div>c</div>
					<div>d</div>
					<div>e</div>
				</div>
			</div>
			<div class="line">
				<div class="column">
					<div><input type="checkbox" value="5" name="drop"/></div>
					<div>a</div>
					<div>b</div>
					<div>c</div>
					<div>d</div>
					<div>e</div>
				</div>
			</div>
			<div class="line">
				<div class="column">
					<div><input type="checkbox" value="dropCheck" name="drop"/></div>
					<div>a</div>
					<div>b</div>
					<div>c</div>
					<div>d</div>
					<div>e</div>
				</div>
			</div>
			<div class="line">
				<div class="column">
					<div><input type="checkbox" value="dropCheck" name="drop"/></div>
					<div>a</div>
					<div>b</div>
					<div>c</div>
					<div>d</div>
					<div>e</div>
				</div>
			</div>
		</div>	
		
		<div class="submit">
			<input type="submit" id="dropMem" value="탈퇴처리">
		</div>
		
	</div>
	
</form>
</body>
</html>