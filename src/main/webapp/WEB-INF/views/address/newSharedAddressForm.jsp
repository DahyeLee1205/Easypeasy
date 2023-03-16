<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    <style>
        .content-outer{width:1000px; margin-left:200px;}
        .content-outer *{box-sizing: border-box;}
        #address-group{font-size:22px; font-weight:600;}

		/*a태그*/
       	#personal-a{color:black;}
       	#public-a{color:rgb(73, 84, 60); font-weight: 600;}
       	#personal-a:hover{font-weight: 600;}

        /*테이블*/
        .input-table{
            margin:auto; 
            border-collapse: separate; border-spacing:0px 10px; /*셀간격*/
        }
        .input-table td{height:30px;}
        .tb-input{
            width:100%; height:100%;
            border:1px solid gray; border-radius:5px;
        }

        .td-select{
            width:98%; height:100%;
            border:1px solid gray; border-radius:5px;
        }
        #add-btn{
            width:100%; height:100%;
            border:0; border-radius:5px; 
            color:white; background:rgb(166, 184, 145);
        }
        #add-btn:hover{background:rgb(73, 84, 60);}
        .td-textarea{border:1px solid gray; border-radius:5px;}

        /*버튼*/
        .set-btn{border:0; border-radius: 5px; width:90px; height:30px; color:white;}
        #reset-btn{background:rgb(158, 158, 158); margin:0 5px 0 450px;}
        #submit-btn{background:rgb(166, 184, 145);}

		/*그룹추가용 모달*/
	    .modal-body, .modal-footer{text-align: center;}
	    #modal-input{width:60%; height:40px; margin-top:10px; border:1px solid gray; border-radius:5px;}
	    #modal-close-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(158, 158, 158); display:inline-block;}
	    #modal-add-btn{width:130px; height:40px; border:0; border-radius:5px; color:white; background:rgb(166, 184, 145); display:inline-block;}
    
        /*편집가능여부 체크박스*/
        .editable-check{
            position: relative;
            width: 40px;
            height: 20px;
            -webkit-appearance: none;
            background: #c6c6c6;
            outline: none;
            border-radius: 10px;
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
            transition: 0.3s;
        }
        .editable-check:checked {background:rgb(135, 154, 114);}
        .editable-check::before {
            content: ' ';
            position: absolute;
            width: 20px;
            height: 20px;
            border-radius: 10px;
            top: 0;
            left: 0;
            background: #fff;
            transform: scale(1.1);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: .3s;
        }
        .editable-check:checked::before {left: 20px;}

        /*사원추가 div*/
        .empBox-mini{overflow:auto; width:48%; height:150px; float:left; border:1px solid gray; padding:10px; border-radius:10px;}
        .emp-mini2{margin-left:15px;}
        #search-emp{width:100%; margin:auto;}
        /*사원리스트테이블*/
        .list-show{font-size:14px; margin:auto;}
        .list-show tr:hover{font-weight:600; cursor:pointer;}

    </style>
</head>
<body>
	
	<jsp:include page="addMenubar.jsp"/>
	
    <div class="content-outer">

        <p id="address-group">연락처추가</p>

        <br>

        <ul class="nav nav-tabs">
            <li class="nav-item">
              <a class="nav-link" href="newPsForm.add" id="personal-a">개인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="newShForm.add" id="public-a">공용</a>
            </li>
        </ul>

        <br>
        <form action="">
            <table class="input-table">
                <colgroup>
                    <col style="width:150px;">
                    <col style="width:350px;">
                    <col style="width:150px;">
                </colgroup>
                <tr>
                    <td>이름</td>
                    <td colspan="2">
                        <input type="text" class="tb-input" required>
                    </td>
                </tr>
                <tr>
                    <td>회사</td>
                    <td colspan="2">
                        <input type="text" class="tb-input">
                    </td>
                </tr>
                <tr>
                    <td>부서</td>
                    <td colspan="2">
                        <input type="text" class="tb-input">
                    </td>
                </tr>
                <tr>
                    <td>직위</td>
                    <td colspan="2">
                        <input type="text" class="tb-input">
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td colspan="2">
                        <input type="email" class="tb-input">
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td colspan="2">
                        <input type="text" class="tb-input">
                    </td>
                </tr>
                <tr>
                    <td>그룹</td>
                    <td>
                        <select class="td-select" name="groupNo">
                            <option>선택안함</option>
                            <c:forEach var="s" items="${ sList }">
				        		<option value="${ s.groupNo }"> ${ s.groupName } </option>
				        	</c:forEach>
                        </select>
                    </td>
                    <td>
                        <button type="button" id="add-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">새그룹</button>
                    </td>
                </tr>
                <tr>
                    <td>회사전화</td>
                    <td colspan="2">
                        <input type="text" class="tb-input">
                    </td>
                </tr>
                <tr>
                    <td>회사주소</td>
                    <td colspan="2">
                        <input type="text" class="tb-input">
                    </td>
                </tr>
                <tr>
                    <td>메모</td>
                    <td colspan="2">
                        <textarea class="td-textarea" rows="4" style="resize:none; width:100%">

                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td>편집가능여부</td>
                    <td colspan="2">
                        <input type="checkbox" class="editable-check"> 
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <div class="empBox" style="width:100%; display:none;">
                            <div class="empBox-mini emp-mini1">
                                <input type="text" id="search-emp">
                                <br><br>
                                <table class="list-show">	
                                	<tbody id="tbd">
                                	</tbody>
                                </table>
                            </div>
                            <div class="empBox-mini emp-mini2">
                                <p>과장 홍길동</p>
                                <p>과장 홍길동</p>
                                <p>과장 홍길동</p>
                                <p>과장 홍길동</p>
                                <p>과장 홍길동</p>
                                <p>과장 홍길동</p>
                                <p>과장 홍길동</p>

                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            
            <br>

            <button type="reset" class="set-btn" id="reset-btn">초기화</button>
            <button type="submit" class="set-btn" id="submit-btn">추가</button>

        </form>
        <script>
            
            $(".editable-check").click(function(){ // 편집가능 체크박스
                if($(this).is(":checked")){
                    $(".empBox").show();
                }else {
                    $(".empBox").hide();
                    $("#search-emp").val("");
                }
            })

            $("#search-emp").keyup(function(){
                $.ajax({ // 편집가능 사원 목록 검색용 ajax
                	url:"selectEmpList.ad",
                	data:{empNo:${loginUser.empNo},
                		  empName:$("#search-emp").val()
                		  },
                	success:function(list){
                		let value="";
                		for(let i=0; i<list.length; i++){
                			value += "<tr id='emp" + list[i].empNo + "'>";
                			if(list[i].deptName != null){
                				value += "<td style='width:70px;'>" + list[i].deptName + "</td>";
                			}else{
                				value += "<td style='width:70px;'></td>";
                			}
                			
							if(list[i].jobName != null){
								value += "<td style='width:40px;'>" + list[i].jobName + "</td>";              				
							}else{
								value += "<td style='width:40px;'></td>";
							}
							value += "<td class='edit-empName'>" + list[i].empName + "</td></tr>";
                		}

                		$("#tbd").html(value);
                		/* console.log("tbd : " + $("#tbd").html());
                		console.log("tr : " +$("#tbd>tr").html());
                		console.log("td : " +$("#tbd>tr>td").html()); */
                	},error:function(){
                		console.log("사원리스트 조회용 ajax 통신 실패");
                	}
                })

            })
           
           $(function(){
        	   $("#tbd>tr").on("click", $("#tbd>tr"), function(){
                   let val = $(this).html();
                   console.log(val);
               })
           })
           
            
            
        </script>

        
    </div>
    
    
	<!--새로운 그룹 추가용 모달-->
    <div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header"  style="background-color:rgb(166, 184, 145);">
                    <p class="modal-title" style="font-weight:600">공유 그룹 추가</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                    <div class="modal-body">
                    	<div>📌공유그룹은 생성 후 관리자만 삭제 가능합니다❗<br>신중하세요💢</div>
                        <input type="text" id="modal-input" class="group-input" name="groupName" style="padding-left:10px;">
                        <br><br>
                        <button type="button" data-bs-dismiss="modal" id="modal-close-btn">닫기</button>
                        <button type="button" data-bs-dismiss="modal" id="modal-add-btn" onclick="addGroup();">추가</button>
                    </div>


            </div>
          </div>
    </div>
    <script>    	
    	function addGroup(){ /* 그룹 추가용 ajax */
    		if($(".group-input").val().trim().length > 0) {
    			
    			$.ajax({
    				url:"insertShGroup.add",
    				data:{
    					empNo:${loginUser.empNo},
    					groupName:$(".group-input").val()
    				},
    				success:function(result){
    					if(result == "success") {
    						
    						$(".group-input").val("");
    						swal({
            		            title: "그룹 추가", 
            		            text: "새로운 그룹이 추가되었습니다", 
            		            icon: "success",
            		            button: "확인",
            		         });
    						selectGroupList();
    					}else{
    						$(".group-input").val("");
        					
        					swal({
            		            title: "그룹 추가", 
            		            text: "이미 중복된 그룹명이 있습니다", 
            		            icon: "error",
            		            button: "확인",
            		         });
    					}
    						
    				},error:function(){
    					console.log("공유주소록 그룹 추가용 ajax 통신 실패");
    				}
    				
    			});
    		}else {
    			 swal({
    		            title: "그룹 추가", 
    		            text: "그룹명을 입력 해주세요", 
    		            icon: "error",
    		            button: "확인",
    		         });

    		}
    	}
    	
    	function selectGroupList(){
    		$.ajax({
    			url:"listShGroup.add",
    			data:{},
    			success:function(list){

    				let value="<option>선택안함</option>";
    				for(let i=0; i<list.length; i++){
    					value += "<option name='groupNo' value='" + list[i].groupNo + "'>"
    					         	+ list[i].groupName
    					        + "</option>";
    				}
    				$(".td-select").html(value);
    			},error:function(){
    				console.log("공유주소록 그룹 조회용 ajax 통신 실패");	
    			}
    		});
    	}
    </script>
</body>
</html>