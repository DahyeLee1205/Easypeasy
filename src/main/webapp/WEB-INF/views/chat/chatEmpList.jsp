<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
    * {padding: 0; margin: 0; box-sizing: border-box;}
	a {text-decoration: none;}
	
	/*채팅방 헤더*/
	.chat-header{margin:10px; height:50px;}
	.chat-title{float:left; height:50px; line-height:50px; padding-left:10px; font-weight:600; width:90%;}
	.room-manage{float:left; height:50px; line-height:50px;}
	.room-manage span:hover{cursor:pointer; font-size:18px;}
	
	/*채팅방 리스트*/
	.list-area{height:480px; overflow-y:auto;}
	.list-area::-webkit-scrollbar{width:5px;}
	.list-area::-webkit-scrollbar-thumb{background-color:rgb(92, 95, 197); border-radius:10px;}
	.list-area::-webkit-scrollbar-track{background-color:white;}
	
	.indiv-list{
		height:70px; 
		padding:10px;
		padding-left:20px;
		border-top:1px solid lightgray;
	}
	.indiv-list:hover{background-color:lightgray;}
	
	.indiv-list div{float:left;}
	.img-area{height:100%; width:70px;}
	.img-area img{height:100%; border-radius:50%;}
	.room-info{height:100%; line-height:55px;}
	.room-info span{display:inline-block;}
	.emp-name{font-weight:600;}
	
	/*검색*/
	.search-area{line-height:40px; background-color:white; text-align:center; display:none;}
	#searchEmp{border:0; padding:10px; border-bottom:1px solid black; width:80%; height:40px; margin-left:5px;}
	.search-area img:hover{cursor:pointer;}
	.search-area img{width:20px;}
</style>
</head>
<body>
    <div class="chat">
        <div class="chat-header">
        	<div class="chat-title">
        		EASY PEASY
        	</div>
        	<div class="room-manage">
        		<span id="room-search">🔍</span>
        	</div>
        	
        	<div class="search-area">
        	<form action="" method="post">
        		<input type="text" id="searchEmp" name="empNo">
        		<a href="#"><img src="resources/common_images/search-icon.png"></a>
        	</form>
        	</div>
        </div>
        <script> 		
         	$("#room-search").click(function(){
         		if($(".search-area").css("display")=="none"){
         			$(".chat-header").css("height", "90px");
         			$(".list-area").css("height", "430px");
             		$(".search-area").show();	
         		}else {
         			$(".chat-header").css("height", "50px");
         			$(".list-area").css("height", "480px");
             		$(".search-area").hide();
         		}
        	})
        </script>
        
		<div class="list-area">
		
			<div class="indiv-list">
				<div class="img-area">
					<img src="resources/chat-images/rockstar.png">
				</div>
				<div class="room-info">
					<span class="dept-name">영엽1팀</span>
					<span class="emp-name">홍길동</span>
					<span class="job-name">사원</span>
				</div>
			</div>
			<div class="indiv-list">
				<div class="img-area">
					<img src="resources/chat-images/rockstar.png">
				</div>
				<div class="room-info">
					<span class="dept-name">영엽1팀</span>
					<span class="emp-name">홍길동</span>
					<span class="job-name">사원</span>
				</div>
			</div>
			<div class="indiv-list">
				<div class="img-area">
					<img src="resources/chat-images/rockstar.png">
				</div>
				<div class="room-info">
					<span class="dept-name">영엽1팀</span>
					<span class="emp-name">홍길동</span>
					<span class="job-name">사원</span>
				</div>
			</div>
			<div class="indiv-list">
				<div class="img-area">
					<img src="resources/chat-images/rockstar.png">
				</div>
				<div class="room-info">
					<span class="dept-name">영엽1팀</span>
					<span class="emp-name">홍길동</span>
					<span class="job-name">사원</span>
				</div>
			</div>
			<div class="indiv-list">
				<div class="img-area">
					<img src="resources/chat-images/rockstar.png">
				</div>
				<div class="room-info">
					<span class="dept-name">영엽1팀</span>
					<span class="emp-name">홍길동</span>
					<span class="job-name">사원</span>
				</div>
			</div>
			<div class="indiv-list">
				<div class="img-area">
					<img src="resources/chat-images/rockstar.png">
				</div>
				<div class="room-info">
					<span class="dept-name">영엽1팀</span>
					<span class="emp-name">홍길동</span>
					<span class="job-name">사원</span>
				</div>
			</div>
			<div class="indiv-list">
				<div class="img-area">
					<img src="resources/chat-images/rockstar.png">
				</div>
				<div class="room-info">
					<span class="dept-name">영엽1팀</span>
					<span class="emp-name">홍길동</span>
					<span class="job-name">사원</span>
				</div>
			</div>
			<div class="indiv-list">
				<div class="img-area">
					<img src="resources/chat-images/rockstar.png">
				</div>
				<div class="room-info">
					<span class="dept-name">영엽1팀</span>
					<span class="emp-name">홍길동</span>
					<span class="job-name">사원</span>
				</div>
			</div>
			<div class="indiv-list">
				<div class="img-area">
					<img src="resources/chat-images/rockstar.png">
				</div>
				<div class="room-info">
					<span class="dept-name">영엽1팀</span>
					<span class="emp-name">홍길동</span>
					<span class="job-name">사원</span>
				</div>
			</div>
			
			
			
			
		</div><!-- list-area끝 -->
		<script>
			$(function(){
				$(".room-name").each(function(){
					if($(this).text().length > 15){
						$(this).text(($(this).text().substring(0,15)).concat("..."));
					}
				})
				
				$(".indiv-list").click(function(){
					var wName = "room1"; // 새창의이름
					var options = 'top=500, left=1400, width=400, height=600, status=no, menubar=no, toolbar=no, titlebar=no, resizable=no, location=no, scrollbars=no';
					window.open("chatRoom.ch", wName, options);
				})
				
			})
		</script>
    </div>
    <jsp:include page="chatFooter.jsp"/>
    
</body>
</html>