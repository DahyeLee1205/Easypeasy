<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 조직도 트리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<link rel="stylesheet" type="text/css" href="resources/org/jquery.treeview.css"/>
<link rel="stylesheet" type="text/css" href="resources/org/demo/screen.css"/>
	
<style>
  /* 전체 wrapper */
  .wrapper {width: 1200px;margin: 0 auto;}
  body {font-family: Arial, sans-serif;	margin: 0; padding: 0;}
  
  /* content */
  .board {width: 1000px; float: right;}
  .container {margin: 20px auto; width: 100%; padding: 20px;}
  form {max-width: 1000px; margin: 0 auto; padding: 10px; border-radius: 5px; box-sizing: border-box;}
  .search-container {display: flex; justify-content: flex-end;margin-bottom: 10px;}
  .card {
      display: inline-block;
      width: 300px;
      height: 120px;
      margin: 10px;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      box-shadow: 2px 2px 5px #ddd;
      text-align: center;
      z-index:-99;
  }
  .imagecard {
  	  display: inline-block;
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      float: left;
      margin-right: 10px;
  }
  .imagecard img {
      display: inline-block;
      width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 50%;
  }
  .details { align-items: center; margin-top: 10px;}
  .details h4 { margin: 0; text-align: center; transform: translateY(70%);}

/* Modal styles */
    .modal {
      display: none; /* Hide modal by default */
      position: fixed; /* Position modal */
      z-index: 1; /* Make modal appear on top of other elements */
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.4); /* Add black background with opacity */
    }
    .modal-content {
      background-color: white;
      margin: 15% auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 500px; /* Could be more or less, depending on screen size */
    }
    .close {color: #aaa; float: right; font-size: 28px; font-weight: bold;}
    .close:hover, .close:focus {color: black; text-decoration: none; cursor: pointer;}
    
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
	   
	   <jsp:include page="../organization/orgSidebar.jsp" />
	  
	  
	    <div class="board">
	    	<h2>조직도</h2><br>
			<div class="container">
	          <h6>인사관리부</h6>
	          
	          <form>
	              <div class="search-container">
	                  <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#tree-modal">사원 검색</button>
	              </div>
	          </form>
	        
	          <!-- <div class="card">
	            <div class="imagecard">
	                <img src="resources/common_images/default_profile.png">
	            </div>
	            <div class="details">
	                <h4>부장 홍길동</h4>
	            </div>
	          </div>
	          <br> -->
	          
	           <div class="card">
	            <table>
	            	<tr>
	            		<td><img src="resources/common_images/default_profile.png"  style="width:80px;"></td>
	            		<td><br><h4>부장 홍길동</h4></td>
	            	</tr>
	            </table>
	          </div>
	          <br>
	        
	          
	          <div class="card">
	            <table>
	            	<tr>
	            		<td><img src="resources/common_images/default_profile.png"  style="width:80px;"></td>
	            		<td><br><h4>과장 홍길동</h4></td>
	            	</tr>
	            </table>
	          </div>
	          <br>
	          
	          <div class="card">
	            <table>
	            	<tr>
	            		<td><img src="resources/common_images/default_profile.png"  style="width:80px;"></td>
	            		<td><br><h4>대리 홍길동</h4></td>
	            	</tr>
	            </table>
	          </div>
	          <div class="card">
	            <table>
	            	<tr>
	            		<td><img src="resources/common_images/default_profile.png"  style="width:80px;"></td>
	            		<td><br><h4>대리 홍길동</h4></td>
	            	</tr>
	            </table>
	          </div>
	          <br>
	          
	          <div class="card">
	            <table>
	            	<tr>
	            		<td><img src="resources/common_images/default_profile.png"  style="width:80px;"></td>
	            		<td><br><h4>사원 홍길동</h4></td>
	            	</tr>
	            </table>
	          </div>
	          <br>
	          
	      </div>
	    </div>
	</div>
	
	   <!-- 모달 -->
	  <div id="myModal" class="modal">
	    <div class="modal-content">
	      <span class="close">&times;</span>
	      <div class="modal-body">
	        <table>
	          <tr>
	            <td><img src="resources/common_images/default_profile.png" alt="Profile Image"  style="width:80%;"></td>
	            <td><h3>홍길동</h3>
	              <p>부장</p>
	              <p>인사관리부</p>
	              <p>honggildong@company.com</p></td>
	          </tr>
	        </table>
	      </div>
	    </div>
	  </div>
	
	  <script>
	    // 모달을 위한 JavaScript 코드
	    var modal = document.getElementById("myModal");
	    var card = document.querySelector(".card");
	    var img = document.querySelector(".card img");
	    var span = document.getElementsByClassName("close")[0];
	
	    card.addEventListener("click", function() {
	      modal.style.display = "block";
	      img.classList.add("modal-image");
	    });
	
	    span.onclick = function() {
	      modal.style.display = "none";
	      img.classList.remove("modal-image");
	    };
	
	    window.onclick = function(event) {
	      if (event.target == modal) {
	        modal.style.display = "none";
	        img.classList.remove("modal-image");
	      }
	    };
	  </script>
	    
	    
	    
	    
	  <!-- 검색/조직도 트리 -->
		<!-- 모달 -->
		<div class="modal fade" id="tree-modal" tabindex="-1" role="dialog" aria-labelledby="tree-modal-label" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="tree-modal-label">
						
							<form action="searchForm.org" method="Get" id="searchForm">
							<input type="hidden" name="cpage" value="1">
								<input type="text" name="keyword" value="${keyword}" id="search" placeholder="사원 검색"></h5>
								<button type="submit" class="btn btn-success">검색</button>
							</form>
							
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- 조직도 트리 -->
						
						<div id="main">
	
							<h5>Easy peasy조직도</h5>
							<form action="adminList.org">
								<input type="hidden" name="empNo" value="empNo">
								<ul id="browser" class="filetree treeview-famfamfam">
									<li><span class="folder">이지피지</span>
										<ul>
											<%-- <c:forEach var="e" items="${list}">
												<c:if test="${empty e.deptCode}">
													<li><span class="file">${ e.empName }</span></li>
												</c:if> 
											</c:forEach> --%>
											
											<li><span class="file">대표</span></li>
											<li><span class="file">상무</span></li>
											
											<c:forEach var="d" items="${deptList}">
												<li class="closed">
													<span class="folder">${d.deptName}</span>
													<ul>
														<c:forEach var="e" items="${list}">
															<c:if test="${ e.deptName eq d.deptName }">
																<li><span class="file">${ e.empName }</span></li>
															</c:if>
														</c:forEach>
													</ul>
												</li>
											</c:forEach>
												
											<%-- c:forEach var="부서" items="${부서리스트 }">
												<li class="closed">
													<span class="folder">${ 부서명 }</span>
														<ul>
															<c:forEach var="사원" items="${ 사원리스트 }">
																<c:if test="${ 사원.부서명 eq 부서명 }">
																	<li><span class="file">${ 사원명 }</span></li>
																</c:if>
															</c:forEach>
														</ul>
												</li>
											</c:forEach> --%>
										</ul>
									</li>
								</ul>
							</form>
						</div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                    </div>
	                </div>
	            </div>
	        </div>
		</div>
		  <script src="resources/org/demo/jquery.cookie.js" type="text/javascript"></script>
			<script src="resources/org/jquery.treeview.js" type="text/javascript"></script>
			<script type="text/javascript">
				$(document).ready(function(){
					$("#browser").treeview({
						toggle: function() {
							console.log("%s was toggled.", $(this).find(">span").text());
						}
					});
			
					$("#add").click(function() {
						var branches = $("<li><span class='folder'>New Sublist</span><ul>" +
							"<li><span class='file'>Item1</span></li>" +
							"<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser");
						$("#browser").treeview({
							add: branches
						});
					});
				});
			</script>
			
		<!-- 사원 검색 -->
		<script>
			$(function(){
				
				if($("#search").val.trim().length > 0){
					$.ajax({
						uri:"searchForm.org"
						data:{},
						success:function(result){
							if(result == "success"){
								$()
							}
						}
					})
				}
				
			})
		</script>
		
		
</body>
</html>
	          
	          
	          
	          
	          
	          