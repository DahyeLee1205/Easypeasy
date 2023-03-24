<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 전체 wrapper */
    .wrapper { width: 1200px; margin: 0 auto; position: absolute; top: 120px}
    body {font-family: Arial, sans-serif; margin: 0; padding: 0;}

    /* 게시판 스타일 */
    .board {width: 1000px;float: right;}
    .container {margin: 20px auto; width: 900px; padding: 20px;}
    .replyContent{margin: 20px auto; width: 900px; padding: 10px;}
	h2 {padding:1% 1%;}
	table {border-collapse: collapse; width: 100%;}
	tr {text-align: center;}
	th, td {text-align: center; padding: 8px; border-bottom: 1px solid #ccc;}
	th {background-color: #ddd;}
	.views {text-align: center;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
	
		<jsp:include page="../board/boardSidebar.jsp" />
       
        <div class="board">
        
        	 <h1>${b.boardCno}</h1><br><br>
    
		    <div class="container" style="width:1000px">
		    	
		            <button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='enrollForm.bo';"> 새글쓰기</button>
		            
		            <c:if test="${ loginUser.empNo eq b.boardWriter }">
			            <a class="btn btn-primary btn-sm" onclick="postFormSubmit(1);">수정하기</a>
		                <a class="btn btn-danger btn-sm" onclick="postFormSubmit(2);">삭제하기</a>
		                
		                <form action="" method="post" id="postForm"> 
				         	<input type="hidden" name="no" value="${b.boardNo}">
				        </form>
			        
			            <script>
				            function postFormSubmit(num){
				                if(num == 1){ 
				                	$("#postForm").attr("action", "updateForm.bo").submit();
				                }else{ 
				                	$("#postForm").attr("action", "delete.bo").submit();
				                }
				        	}
				        </script>
		            </c:if>
		            
		            <button type="button" class="btn btn-outline-secondary btn-sm" style="float:right" onclick="location.href='list.bo';">목록으로</button> 
		            <br><br>
		             
		            <table id="contentArea" align="center" class="table" border="1px, solid">
		                <tr>
		                    <th width="500" colspan="3">${b.boardTitle}</th>
		                </tr>
		                <tr>
		                    <td>
		                        작성자 프로필이미지(-)
		                    </td>
		                    <td>
		                        ${b.boardWriter}
		                    </td>
		                    <td>
		                        ${b.createDate}
		                    </td>
		                </tr>
		                <tr>
		                   <td colspan="3">
		                     <c:choose>
                                  <c:when test="${ empty attachmentList }">
                                          <div>첨부파일이 없습니다.</div>
                                  </c:when>
                                  <c:otherwise>
                                      <c:forEach var="a" items="${ attachmentList }">
                                           <a href="${ a.changeName }" download="${ a.originName }">${ a.originName }</a><br>
                                       </c:forEach>
                                   </c:otherwise>
                             </c:choose>
		                    </td>
		                </tr>
		                <tr>
		                    <td colspan="4">
		                        <p style="height:150px">
		                        	${b.boardContent}
		                        </p>
		                    </td>
		                </tr>
		            </table>
		      
		    </div>
		
		    <div class="replyContent" style="width:1000px" >
		        <table id="replyArea" class="table" align="center" border="1px, solid">
		            <thead>
		                <tr>
		                    <td colspan="3">댓글 (<span id="rcount">3</span>) </td> 
		                </tr>
			            <tr>
			                <th colspan="2">
			                     <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
			                 </th>
			                  <th style="vertical-align: middle"><button class="btn btn-secondary"  onclick="addReply();">등록하기</button></th>
			            </tr>
		            </thead>
		            <tbody>
		            
		                
		            </tbody>
		        </table>
		    </div>
        	<script>
        	$(function(){
        		selectReplyList();
        	})
        	
        	function addReply(){ // 댓글 작성용 ajax
        		
        		if($("#content").val().trim().length > 0){ 
        			
        			$.ajax({
        				url:"rinsert.bo",
        				data:{
        					replyContent:$("#content").val(),
        					replyWriter:'${loginUser.empNo}',
        					boardNo:'${b.boardNo}'
        				},success:function(result){
        					if(result == "success"){
        						$("#content").val("");
        						selectReplyList();
        					}
        				},error:function(){
        					console.log("댓글 작성용 ajax 통신 실패");
        				}
        			})
        			
        			
        		}else{
        			alertify.alert("댓글 작성 후 등록 요청해주세요");
        		}
        			
        	}
        	
        	function selectReplyList(){ //  조회용 ajax
        		$.ajax({
        			url:"rlist.bo",
        			data:{no:${b.boardNo}},
        			success:function(list){
        				console.log(list);
        				
        				let value = "";
        				for(let i=0; i<list.length; i++){
        					value += "<tr>"
        							+	"<td>" + list[i].replyWriter + "</td>"
        							+	"<td>" + list[i].replyContent + "</td>"
        							+	"<td>" + list[i].createDate + "</td>"
        							+"</tr>";
        				}
        				
        				$("#replyArea tbody").html(value);
        				$("#rcount").text(list.length);
        				
        			},error:function(){
        				console.log("댓글리스트 조회용 ajax 통신 실패");
        			}
        		})
        	}
		    </script>
        </div>
	</div>
	
		<div class="board">
		
			<h1>${b.boardCno}</h1><br><br>
	
			<div class="container" style="width:1000px">
				
					<button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='enrollForm.bo';"> 새글쓰기</button>
					
					<c:if test="${ loginUser.empNo eq b.boardWriter }">
						<a class="btn btn-primary btn-sm" onclick="postFormSubmit(1);">수정하기</a>
						<a class="btn btn-danger btn-sm" onclick="postFormSubmit(2);">삭제하기</a>
						
						<form action="" method="post" id="postForm"> 
							<input type="hidden" name="boardNo" value="${b.boardNo}">
						</form>
					
						<script>
							function postFormSubmit(num){
								if(num == 1){ 
									$("#postForm").attr("action", "updateForm.bo").submit();
								}else{ 
									$("#postForm").attr("action", "delete.bo").submit();
								}
							}
						</script>
					</c:if>
					
					<button type="button" class="btn btn-outline-secondary btn-sm" style="float:right" onclick="location.href='list.bo';">목록으로</button> 
					<br><br>
					
					<table id="contentArea" align="center" class="table" border="1px, solid">
						<tr>
							<th width="500" colspan="3">${b.boardTitle}</th>
						</tr>
						<tr>
							<td>
								작성자 프로필이미지(-)
							</td>
							<td>
								${b.boardWriter}
							</td>
							<td>
								${b.createDate}
							</td>
						</tr>
						<tr>
						<td colspan="3">
							<c:choose>
								<c:when test="${ empty attachmentList }">
										<div>첨부파일이 없습니다.</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="a" items="${ attachmentList }">
										<a href="${ a.changeName }" download="${ a.originName }">${ a.originName }</a><br>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<p style="height:150px">
									${b.boardContent}
								</p>
							</td>
						</tr>
					</table>
			
			</div>
		
			<div class="replyContent" style="width:1000px" >
				<table id="replyArea" class="table" align="center" border="1px, solid">
					<thead>
						<tr>
							<td colspan="3">댓글 (<span id="rcount">3</span>) </td> 
						</tr>
						<tr>
							<th colspan="2">
								<textarea class="form-control" name="" id="rcontent" cols="55" rows="2" style="resize:none; width:100%"></textarea>
							</th>
							<th style="vertical-align: middle"><button class="btn btn-secondary"  onclick="addReply();">등록하기</button></th>
						</tr>
					</thead>
					<tbody>
					
						
					</tbody>
				</table>
			</div>
			<script>
				$(function(){
					selectReplyList();
				})	
				
				function addReply(){ 
					if($("#rcontent").val().trim().length > 0){ 
						
						$.ajax({
							url:"rinsert.bo",
							data:{
								replyContent:$("#rcontent").val(),  
								replyWriter:'${loginUser.empNo}',
								boardNo:${b.boardNo}  
							},success:function(result){
								
								if(result == "success"){
									$("#rcontent").val("");
									selectReplyList();
								}
							}, error:function(){
								console.log("댓글 작성용 ajax 통신 실패");
							}
						})
					}else{
						alertify.alert("댓글 작성 후 등록 요청해주세요"); 
					}
				}
					
				function selectReplyList(){
					$.ajax({
						url:"rlist.bo",
						data:{no:${b.boardNo}}, 
						success:function(list){
							console.log(list);
							
							let value = "";
							for(let i=0; i<list.length; i++){
								value += "<tr>"
										+	"<td>" + list[i].replyWriter + "</td>"
										+	"<td>" + list[i].replyContent + "</td>"
										+	"<td>" + list[i].createDate + "</td>"
										+"</tr>";
							}
							
							$("#replyArea tbody").html(value);
							$("#rcount").text(list.length);
							
						},error:function(){
							console.log("댓글 작성용 ajax 통신 실패");
						}
					})
				}
			</script>
		</div>
	</div>
	
</body>
</html>