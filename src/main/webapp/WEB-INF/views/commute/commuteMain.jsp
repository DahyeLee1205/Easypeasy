<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }
    .side{
        width: 200px;
        height: 900px;
        box-sizing: none;
        float: left;
    }
    .title{
        width: 980px;
        height: 100px;
        box-sizing: none;
        float: left;
        font-size: 30px;
        
    }
    .allContent{
        width: 990px;
        height: 900px;
        box-sizing: none;
        float: left;
    }
    .content1{
        width: 490px;
        height: 390px;
        box-sizing: none;
        float: left;
    }
    .content2{
        width: 490px;
        height: 390px;
        box-sizing: none;
        float: left;
    }
    .content3{
        width: 490px;
        height: 390px;
        box-sizing: none;
        float: left;
        
    }
    .content4{
        width: 490px;
        height: 390px;
        box-sizing: none;
        float: left;
    }
    .name{
        font-size: 25px;
        margin-top: 10px;
        margin-left: 10px;
        font-weight: bold;
    }
    #commute{
        border: 1px solid gray;
        width: 400px;
        height: 300px;
        font-size: 15px;
        text-align: center;
        margin: 0 auto;
        border-radius: 10px;
    }
    .vac{
        border: 1px solid gray;
        width: 400px;
        height: 100px;
        text-align: center;
        font-size: 15px;
        margin: 0 auto;
        border-radius: 10px;
    }
    .recode{
        border: 1px solid gray;
        border-radius: 10px;
        width: 400px;
        height: 200px;
        margin: 0 auto;
        padding: 20px;
        font-size: 14px;
    }
    .button{
        width: 100px;
        height: 30px;
        border: none;
    }
    .start{
        float: left;
        margin: 20px;
        margin-left: 30px;
        font-size: 18px;
        text-align: center;
    }
    .end{
        float: left;
        margin: 20px;
        font-size: 18px;
        text-align: center;
    }
    .bbb{
        margin-left: 40px;
    }
    #clock{
        margin-left:10px;
        font-size: 35px;
    }
    .status{
        width: 80px;
        height: 25px;
        background-color: lightgray;
        text-align: center;
        font-weight: bold;
        margin-left: 300px;

    }
    .tg  {border-collapse:collapse;border-color:#ccc;border-spacing:0;width: 400px; height: 150px; margin: 0 auto;}
    .tg td{background-color:#fff;border-color:#ccc;border-style:solid;border-width:0px;color:#333;
           font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
    .tg th{background-color:#f0f0f0;border-color:#ccc;border-style:solid;border-width:0px;color:#333;
             font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
    .tg .tg-0lax{text-align:center;vertical-align:top}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!--Popper JS --> 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>


	    <div class="outer">

        <div class="side">사이드바</div>
        <div class="allContent">
            <div class="title"><b>나의 근무 정보</b><hr></div>
            
            

            <div class="content1">
                <div class="name" style="float: left;">근무체크</div><br><br>

                <div class="status">근무중</div><br>

                <h1 id="clock" style="color:black;">clock</h1>

                <div class="start">출근시각 <br>
                    08:55:14
                    <br><button class="button" style="background-color: rgb(214, 223, 204); width: 150px; height: 40px;">출근하기</button>
                </div>
                

                <div class="end">퇴근시각 <br>
                    18:00:40
                    <br><button class="button" style="width: 150px; height: 40px;">퇴근하기</button>
                </div>
                
    
                <script>
                    var Target = document.getElementById("clock");
                    function clock() {
                        var time = new Date();
            
                        var month = time.getMonth();
                        var date = time.getDate();
                        var day = time.getDay();
                        var week = ['일', '월', '화', '수', '목', '금', '토'];
            
                        var hours = time.getHours();
                        var minutes = time.getMinutes();
                        var seconds = time.getSeconds();
            
                        Target.innerText = 
                        	"${month + 1}월 ${date}일 ${week[day]}요일" +
                        	"${hours < 10 ? '0${hours}' : hours}" 
                        	+ ":" + "${minutes < 10 ? '0${minutes}' : minutes}" 
                        	+ ":" + "${seconds < 10 ? '0${seconds}' : seconds}";
                        
                    }
                    clock();
                    setInterval(clock, 1000); // 1초마다 실행
                </script>
            </div>
            <div class="content2">
                <div class="name">근무현황</div><br>
                <div class="bbb">
                <button class="button">근무</button>
                <button class="button">회의</button>
                <button class="button">외근</button>
                <button class="button">외출</button>
                </div> <br>

                <div class="recode">
                    -- 출근 08:55:14 <br>
                    -- 회의중 09:20:11 <br>
                    -- 근무중 10:01:54 <br>

                </div>
            </div>
            <div class="content3">
                <div class="name">근태현황</div><br>
                <table  id="commute">
                    <tr>
                        <td>지각</td>
                        <td>2회</td>
                    </tr>
                    <tr>
                        <td>조기퇴근</td>
                        <td>0회</td>
                    </tr>
                    <tr>
                        <td>결근</td>
                        <td>0회</td>
                    </tr>
                    <tr>
                        <td>퇴근미체크</td>
                        <td>3회</td>
                    </tr>
                </table>
            </div>
            <div class="content4">
                <div class="name" style="float: left; width: 330px;">휴가현황</div><br>
                <button class="button" style="float: left; background-color: rgb(214, 223, 204); ">휴가신청</button><br><br><br>
                <table class="vac">
                    <tr>
                        <td>잔여휴가</td>
                        <td>14일</td>
                    </tr>
                </table><br>
                <table class="tg">
                    <thead>
                      <tr>
                        <th class="tg-0lax">휴가기간</th>
                        <th class="tg-0lax">휴가일수</th>
                        <th class="tg-0lax">상태</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="tg-0lax">2023-02-21~2023-02-24</td>
                        <td class="tg-0lax">4일</td>
                        <td class="tg-0lax"></td>
                      </tr>
                      <tr>
                        <td class="tg-0lax">2023-02-21~2023-02-24</td>
                        <td class="tg-0lax">4일</td>
                        <td class="tg-0lax">완료</td>
                      </tr>
                      <tr>
                        <td class="tg-0lax">2023-02-21~2023-02-24</td>
                        <td class="tg-0lax">4일</td>
                        <td class="tg-0lax">완료</td>
                      </tr>
                    </tbody>
                    </table>
            </div>
        </div>
    </div>


</body>
</html>