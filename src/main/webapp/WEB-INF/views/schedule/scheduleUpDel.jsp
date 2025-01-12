<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#main{  
        position: absolute; top: 120px;
    }

	#content{
        border-left: 1px solid lightgray;
        width: 1000px;
        float: left;
        margin-top: 15px;
        box-sizing: border-box;
    }
    
	#title h5{
        padding-left: 25px;
        margin-bottom: 20px;
    }
    #title div{
        margin-bottom: -10px;
        display: inline-block;
    }

    #enroll{
        width: 95%;
        margin: auto;
    }
    #enroll input{
        border: 1px solid lightgray;
        border-radius: 5px;
    }
    #enroll textarea{
        border: 1px solid lightgray;
        border-radius: 5px;
    }

    .sel{
        height: 30px;
        border: 1px solid lightgray;
        border-radius: 5px;
    }

    #sel3{
        width: 130px;
        height: 35px;
        margin-top: 15px;
    }
    
    /* 참석자 선택 모달 */
    /* 모달 창 가운데로 정렬*/
    .modal.modal-center {
    	/* text-align: center; */
    }

    @media screen and (min-width: 768px) { 
	    .modal.modal-center:before {
	        display: inline-block;
	        vertical-align: middle;
	        content: " ";
	        height: 30%;
	    }
    } 

    .modal-dialog.modal-center {
	    display: inline-block;
	    text-align: left;
	    vertical-align: middle; 
    }
    .moal{z-index:10000;
    	/* z-index: 2147483647; */
    }
    
    .selectForm>div{width:50%; float:left;}
        .appLine>div{float:left;}
        .appLine1, .appLine2{width:50%;}
        .appLine1 *,.appLine2 *{list-style:none;}
        .app-comment{padding:10px;}  
        
     /* 문서목록 스타일 */        
     .list-1{width:100%; height:60px;}
     .list-1{
         text-align:right;
         width:100%; 
         padding:15px;
         margin-right: 10px; 
         font-size:13px;
        
     }
     .list1-1{height:40px;}
     #paging{text-align: center; display: inline-block; padding-left :0;}
     #paging li {text-align: center; float: left; list-style:none; border-radius:10px; margin:2px; background-color: rgb(234, 234, 234);}
     #paging li a {display: block; font-size: 12px; color: black; padding: 5px 10px; box-sizing: border-box; text-decoration-line:none;}
     #paging li.on {background:rgb(166, 184, 145);}
     #paging li.on a { color: white;}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="main">
	
		<jsp:include page="sidebar.jsp"/>

		<div id="content">
			
	        <form action="update.sc" method="post">
	        <input type="hidden" name="scNo" value="${ s.scNo }">
	            <div id="title">
	                <span>
	                    <h5>일정 상세</h5>
	                </span>
	                <div>
	                    <button class="btn">
	                        <i class="fas fa-check"></i>
	                        확인
	                    </button>
	                </div>
	                <div>
	                    <button type="reset" class="btn">
	                        <i class="far fa-times-circle"></i>
	                        취소
	                    </button>
	                </div>
	                <div>
	                    <a href="delete.sc?no=${ s.scNo }" class="btn" onclick="">
	                        <i class="fas fa-trash-alt"></i>
	                        삭제
	                    </a>
	                </div>
	                <div style="margin-left: 605px;">
	                    <a href="main.sc" class="btn" onclick="">
	                        <i class="fas fa-calendar-alt"></i>
	                        캘린더로 돌아가기
	                    </a>
	                </div>
	            </div>
	            <hr>
	            <div id="content-1">
	                <table id="enroll">
	                    <thead>
	                        <tr height="45">
	                            <td colspan="3">
	                                <input type="text" name="scTitle" size="82" value="${ s.scTitle }">
	                            </td>
	                        </tr>
	                        <tr height="45">
	                            <td colspan="3">
	                                <input type="text" id="sDate" size="11" name="startDate" value="${ s.startDate }">
	                                <span>
	                                    <select class="sel" name="startTime" id="sel1">
	                                        <option value="00:30">00:30</option>
                                            <option value="01:00">01:00</option>
                                            <option value="01:30">01:30</option>
                                            <option value="02:00">02:00</option>
                                            <option value="02:30">02:30</option>
                                            <option value="03:00">03:00</option>
                                            <option value="03:30">03:30</option>
                                            <option value="04:00">04:00</option>
                                            <option value="04:30">04:30</option>
                                            <option value="05:00">05:00</option>
                                            <option value="05:30">05:30</option>
                                            <option value="06:00">06:00</option>
                                            <option value="06:30">06:30</option>
                                            <option value="07:00">07:00</option>
                                            <option value="07:30">07:30</option>
                                            <option value="08:00">08:00</option>
                                            <option value="08:30">08:30</option>
                                            <option value="09:00">09:00</option>
                                            <option value="09:30">09:30</option>
                                            <option value="10:00">10:00</option>
                                            <option value="10:30">10:30</option>
                                            <option value="11:00">11:00</option>
                                            <option value="11:30">11:30</option>
                                            <option value="12:00">12:00</option>
                                            <option value="12:30">12:30</option>
                                            <option value="13:00">13:00</option>
                                            <option value="13:30">13:30</option>
                                            <option value="14:00">14:00</option>
                                            <option value="14:30">14:30</option>
                                            <option value="15:00">15:00</option>
                                            <option value="15:30">15:30</option>
                                            <option value="16:00">16:00</option>
                                            <option value="16:30">16:30</option>
                                            <option value="17:00">17:00</option>
                                            <option value="17:30">17:30</option>
                                            <option value="18:00">18:00</option>
                                            <option value="18:30">18:30</option>
                                            <option value="19:00">19:00</option>
                                            <option value="19:30">19:30</option>
                                            <option value="20:00">20:00</option>
                                            <option value="20:30">20:30</option>
                                            <option value="21:00">21:00</option>
                                            <option value="21:30">21:30</option>
                                            <option value="22:00">22:00</option>
                                            <option value="22:30">22:30</option>
                                            <option value="23:00">23:00</option>
                                            <option value="23:30">23:30</option>
	                                    </select>
	                                </span>
	                                <span>~</span>
	                                <input type="text" id="eDate" size="11" name="endDate" value="${ s.endDate }">
	                                <span>
	                                    <select class="sel" name="endTime" id="sel2">
	                                        <option value="00:30">00:30</option>
                                            <option value="01:00">01:00</option>
                                            <option value="01:30">01:30</option>
                                            <option value="02:00">02:00</option>
                                            <option value="02:30">02:30</option>
                                            <option value="03:00">03:00</option>
                                            <option value="03:30">03:30</option>
                                            <option value="04:00">04:00</option>
                                            <option value="04:30">04:30</option>
                                            <option value="05:00">05:00</option>
                                            <option value="05:30">05:30</option>
                                            <option value="06:00">06:00</option>
                                            <option value="06:30">06:30</option>
                                            <option value="07:00">07:00</option>
                                            <option value="07:30">07:30</option>
                                            <option value="08:00">08:00</option>
                                            <option value="08:30">08:30</option>
                                            <option value="09:00">09:00</option>
                                            <option value="09:30">09:30</option>
                                            <option value="10:00">10:00</option>
                                            <option value="10:30">10:30</option>
                                            <option value="11:00">11:00</option>
                                            <option value="11:30">11:30</option>
                                            <option value="12:00">12:00</option>
                                            <option value="12:30">12:30</option>
                                            <option value="13:00">13:00</option>
                                            <option value="13:30">13:30</option>
                                            <option value="14:00">14:00</option>
                                            <option value="14:30">14:30</option>
                                            <option value="15:00">15:00</option>
                                            <option value="15:30">15:30</option>
                                            <option value="16:00">16:00</option>
                                            <option value="16:30">16:30</option>
                                            <option value="17:00">17:00</option>
                                            <option value="17:30">17:30</option>
                                            <option value="18:00">18:00</option>
                                            <option value="18:30">18:30</option>
                                            <option value="19:00">19:00</option>
                                            <option value="19:30">19:30</option>
                                            <option value="20:00">20:00</option>
                                            <option value="20:30">20:30</option>
                                            <option value="21:00">21:00</option>
                                            <option value="21:30">21:30</option>
                                            <option value="22:00">22:00</option>
                                            <option value="22:30">22:30</option>
                                            <option value="23:00">23:00</option>
                                            <option value="23:30">23:30</option>
	                                    </select>
	                                </span>
	                                &nbsp;
	                                <div class="custom-control custom-checkbox" style="display: inline-block;">
	                                    <input type="checkbox" class="custom-control-input" name="allDay" id="allDay" onclick="allDayShowHidden();">
	                                    <label class="custom-control-label" for="allDay">종일</label>
	                                </div>
	                            </td>
	                        </tr>
	                    </thead>
	                    <tbody class="body">
	                        <tr height="45">
	                            <th>내 캘린더</th>
	                            <td colspan="2">
	                                <select class="custom-select mb-3" name="calNo" id="sel3">
                                        <c:forEach var="c" items="${ myCalList }">
                                            <c:choose>
                                                <c:when test="${ c.calDefault eq 'Y' }">
                                                    <option value="${ c.calNo }">(기본) ${ c.calTitle }</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${ c.calNo }">${ c.calTitle }</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
	                            </td>
	                        </tr>
	                        <tr style="height: 45px;">
                                <th>참석자</th>
                                <td width="150">
                                    <div style="overflow:auto; height: 100px; width: 150px;">
                                        <span style="background: rgb(238, 238, 238); border-radius: 15px; padding: 2px 10px 2px 10px;">${ loginUser.empName } ${ loginUser.jobName }</span><br>
                                        <span class="app-body">
                                        	<c:forEach var="a" items="${ atList }">
                                    		<div style="background: rgb(214, 223, 204); display: inline-flex; border-radius: 15px; padding: 2px 10px 2px 10px;">
	                                    		${ a.empName } ${ a.jobName }
	                                    		<span class="empDelete">x</span>
                                    		</div>
                                    		<input type="hidden" name="empNo" value="${ a.empNo }">
	                                    	<input type="hidden" name="scNo" value="${ a.scNo }">
                                    		</c:forEach>
                                        </span>
                                        <input type="hidden" name="scWriter" value="${ loginUser.empNo }">
                                    </div>
                                </td>
                                <td class="attendee-click">
                                    <a style="color: gray; cursor: pointer;" data-toggle="modal" data-target="#attendee-add">+ 참석자 선택</a>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="2" id="empList-td">
                                    <div class="empBox" style="width:100%; display:none;">
                                        <div class="empBox-mini emp-mini1">
                                            <div style="background-color:white; width:100%; height:10px; top:0; position:sticky;"></div>
                                            <input type="text" id="search-emp">
                                            <br><br>
                                            <table class="list-show">	
                                                <tbody id="show-tbd">
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="empBox-mini emp-mini2"></div>
                                    </div>
                                </td>
                            </tr>
	                    </tbody>
	                    <tfoot>
	                        <tr height="55">
	                            <th>장소</th>
	                            <td colspan="2">
	                                <input type="text" name="scPlace" size="70" value="${ s.scPlace }">
	                            </td>
	                        </tr>
	                        <tr height="50">
	                            <th style="vertical-align: top; padding-top: 10px;">내용</th>
	                            <td colspan="2" style="padding-top: 15px; padding-bottom: 20px;">
	                                <textarea name="scContent" cols="69" value="${ s.scContent }" rows="5" style="resize: none;"></textarea>
	                            </td>
	                        </tr>
	                    </tfoot>
	                </table>
	            </div>
	        </form>
	    </div>
	    
	    
	    <!-- 참석자 선택하는 모달 -->
        <!-- The Modal -->
        <div class="modal" id="attendee-add">
            <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">참석자 선택</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body appLine">
                        <div class="appLine1">
                        <c:forEach var="d" items="${deptList}" begin="0" end="6" varStatus="dept">
                            <div>
                                <b class="${ d.deptCode }">${ d.deptName }</b>
                                <span><img src="resources/common_images/list-down.png" style="width:15px;" class="dropdown-key" id="cList-key${ dept.index }"></span>
                            </div>
                            <ul class="empList" id="cList-in${ dept.index }" style="display: none;"> <!-- 사원리스트 -->
                                <c:forEach var="e" items="${list}">
                                    <c:if test="${ e.deptName eq d.deptName }">
                                    <li id="appEmp${ e.empNo }" class="appEmp">
                                            <span class="indiv-job">${e.jobName}</span> 
                                            <span class="indiv-name">${ e.empName }</span>
                                            <input type="hidden" name="empNo" value="${e.empNo}">
                                            <button class="btn btn-outline-secondary addbtn">+</button>
                                    </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:forEach>
                        </div>
                        <div class="appLine2">
                            <form action="">
                                <h5>참석자</h5>
                                <div class="appArea">
                                    <ul class="appList"><!-- 추가되는 사원리스트 -->
                                    	<c:forEach var="a" items="${ atList }">
	                                    	<li class="emp-list">
		                                    	<span class="indiv-job">${ a.jobName }</span>
		       									<span class="indiv-name">${ a.empName }</span>
		        								<input type="hidden" name="empNo" value="${ a.empNo }">
		        								<input type="hidden" name="scNo" value="${ a.scNo }">
		        								<button type="button" class="btn btn-outline-secondary minusbtn">-</button>
	        								</li>
        								</c:forEach>
                                    </ul>
                                </div>
                            </form>                    
                        </div>
                    </div>
            
                    <!-- Modal footer -->
                    <div style="margin:auto;">
                        <button type="button" class="btn btn-light" data-dismiss="modal" id="add-empList">확인</button>
                        <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>

    
	<script>
		let val = "";
		let eee;
		$(document).on("click", ".addbtn", function(){ 
			
			let job = $(this).siblings().eq(0).text();
			let name = $(this).siblings().eq(1).text();
			let input = $(this).siblings("input").val();
			
			let arr = $(".appList").children();
			
			
			/*
			for(var i = 0; i < arr.length; i++){

                if(arr[i].lastElementChild().val() == $(".appList").children("input").val()){

                    arr[i].lastElementChild().attr("disabled");
                    console.log(arr[i].lastElementChild().html());
                }
            }
			*/
			val = "<li class='emp-list'><span class='indiv-job'>" + job + "</span> " 
       		+ "<span class='indiv-name'> " + name + "</span> "
        	+ " <input type='hidden' name='empNo' value='"+ input +"'>"
        	+ "<button type='button' class='btn btn-outline-secondary minusbtn'>-</button></li>";
        
			$(".appList").append(val);
			
			eee = $(this).parent();
			eee.hide();
			
		})
		
		$(document).on("click", ".minusbtn", function(){
			$(this).parent().remove();
			let li = $(".empList").children();	
			eee.show();
		})
		
		$(document).on("click", "#add-empList", function(){
			
			var liList = $(".appList").children();
			
			var aaa = "";
			
			
			liList.each(function(){
				let job = $(this).children().eq(0).text();
				let name = $(this).children().eq(1).text();
				let no = $(this).children("input").val();
				console.log(no);
				aaa += "<div style='background: rgb(214, 223, 204); display: inline-flex; border-radius: 15px; padding: 2px 10px 2px 10px;'>" + name + "&nbsp;" + job + "<input type='hidden' name='empNo' value='"+ no + "'>" + "<span class='empDelete'>x</span></div>";
				
			})
			
			
			$(".appList").html("");
			
			$(".app-body").html(aaa);
			
		})
		
		
		$(document).on("click", ".empDelete", function(){
			$(this).parent().remove();
		})
		
	</script>
	
	
	<script>
    	$(function(){
    		
    		$("#cList-key0").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#cList-in0").show();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in0").hide();
    			}
    		})
    		$("#cList-key1").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#cList-in1").show();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in1").hide();
    			}
    		})
    		$("#cList-key2").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");
    				$("#cList-in2").show();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in2").hide();
    			}
    		})
    		$("#cList-key3").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#cList-in3").show();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in3").hide();
    			}
    		})
    		$("#cList-key4").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#cList-in4").show();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in4").hide();
    			}
    		})
    		$("#cList-key5").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#cList-in5").show();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in5").hide();
    			}
    		})
    		$("#cList-key6").click(function(){
    			if($(this).attr("src") === "resources/common_images/list-down.png"){
    				$(this).attr("src", "resources/common_images/list-up.png");	
    				$("#cList-in6").show();
    			}else {
    				$(this).attr("src", "resources/common_images/list-down.png");
    				$("#cList-in6").hide();
    			}
    		})
    		
    		
    	})
    </script>
	    
	    
	
    <!-- 달력 -->
    <script>
         $(function(){
             $("#sDate, #eDate").datepicker({
                 dateFormat: "yy-mm-dd",
                 showOtherMonths: true,
                 showMonthAfterYear: true,
                 changeYear: true,
                 changeMonth: true,
                 buttonImageOnly: true,
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dayNamesMin: ['일','월','화','수','목','금','토'],
                 dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
                 minDate: "D"
             })

             //$("#sDate").datepicker("setDate", "today");
             //$("#eDate").datepicker("setDate", "+7");

            
             $("#sDate").datepicker();
             $("#sDate").datepicker("option", "maxDate", $("#eDate").val());
             $("#sDate").datepicker("option", "onClose", function (selectedDate) {
                 $("#eDate").datepicker("option", "minDate", selectedDate);
             });
             
             $("#eDate").datepicker();
             $("#eDate").datepicker("option", "minDate", $("#sDate").val());
             $("#eDate").datepicker("option", "onClose", function (selectedDate) {
                 $("#sDate").datepicker("option", "maxDate", selectedDate);
             });

         })

         function allDayShowHidden(){
	          if($("input:checkbox[id='allDay']").is(":checked") == true) {
	              $(".sel").attr("hidden", true);
	              $("#sel1").val(""); // 시간 값 00:00시부터
	              $("#sel2").val(""); // 23:30시까지
	              $("input[name=allDay]").val("Y");
	          } else {
	          	//console.log($("input:checkbox[id='allDay']").prop("checked", false));
	              $(".sel").attr("hidden", false);
	              $("input[name=allDay]").val("N");
	          } 
	      }
         
         
      	// 시간 DB에 저장된 값으로 선택돼 있도록
 	    $("#sel1").val("${ s.startTime }").prop("selected", true);
     	$("#sel2").val("${ s.endTime }").prop("selected", true);
 	 	
     	
     	// DB에 담긴 값이 allDay Y면 기본값으로 종일 선택시키고 시간 선택 숨기기
     	var allDay = "<c:out value='${ s.allDay }'/>";
     	
     	if(allDay == "Y"){
     		$("#allDay").prop("checked", true);
     		$(".sel").attr("hidden", true);
     	}
     	
     	
     	var calendar = "<c:out value='${ s.calNo }'/>";
     	$("#sel3").val("${ s.calNo }").prop("selected", true);
     	

         /*
         // 전사일정 체크 확인
         function showHidden(){
             if($("input:checkbox[id='company']").is(":checked") == true) {
                 $(".body").attr("hidden", true);    
             } else {
                 $(".body").attr("hidden", false);
             }
         }

		*/
         

     </script>

</body>
</html>