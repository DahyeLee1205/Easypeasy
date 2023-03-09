<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    /* 전체 wrapper */
    .wrapper {
    width: 1200px;
    margin: 0 auto;
    /* 중앙 정렬을 위한 margin: 0 auto; */
    }
    body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
	}

    /* sidebar 스타일 */
    .sidebar {
        position: fixed;
		top: 0;
		left: 0;
		width: 200px;
		height: 100%;
		background-color: #fff;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        float: left;
    }
    .menu {
			margin-top: 20px;
	}
		.menu ul {
			list-style: none;
			padding: 0;
			margin: 0;
		}
		.menu li {
			margin-bottom: 5px;
		}
		.menu a {
			display: block;
			padding: 10px;
			color: #333;
			text-decoration: none;
			transition: background-color 0.3s ease-in-out;
		}
		.menu a:hover {
			background-color: #f2f2f2;
		}
		.submenu ul {
			list-style: none;
			padding: 0;
			margin: 0;
			display: none;
		}
		.submenu li {
			margin-bottom: 5px;
		}
		.submenu a {
			display: block;
			padding: 10px;
			color: #333;
			text-decoration: none;
			transition: background-color 0.3s ease-in-out;
		}
		.submenu a:hover {
			background-color: #f2f2f2;
		}
		.active {
			background-color: #f2f2f2;
		}
		.collapse-indicator:after {
        content: " ∨"; 
		}
		.submenu.active > .collapse-indicator:after {
			content: " ∧";
		}

    /* 게시판 스타일 */
    .board {
    width: 1000px;
    float: right;
    }
    .container {
		margin: 20px auto;
		width: 900px;
		border: 1px solid #ccc;
		padding: 20px;
	}
	h1 {
		padding:5% 10%;
	}
	table {
		border-collapse: collapse;
		width: 100%;
	}
	th, td {
		text-align: center;
		padding: 8px;
		border-bottom: 1px solid #ccc;
	}
	th {
		background-color: #ddd;
	}
	tr:hover {
		background-color: #f5f5f5;
	}
	.views {
		text-align: center;
	}
    .search-container {
		display: flex;
		justify-content: flex-end;
		margin-bottom: 10px;
	}
	.search-container input[type=text] {
		padding: 6px;
		margin-right: 10px;
		border: none;
		border-radius: 3px;
		width: 200px;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="wrapper">
        <div class="sidebar">
          <!-- sidebar 내용 -->
          <div class="sidebar">
            <br><br><br>
            <div class="menu">
                <ul>
                    <li><a href="#">전체 공지사항</a></li>
                    <li><a href="#">식단표</a></li>
                        
                    <li><a href="#">자유게시판</a></li>
                    <li><a href="#">커뮤니티</a></li>
    
                    <li class="submenu">
                        <a href="#" class="dep">부서게시판<span class="collapse-indicator"></span></a>
                         <ul>
                            <li><a href="#">&nbsp&nbsp부서 공지사항</a></li>
                            <li><a href="#">&nbsp&nbsp부서 자유게시판</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    
        <script>
            $(document).ready(function(){
                $('.dep').click(function(){
                    $(this).next().toggle();
                });
            });
        </script>
        </div>
        <div class="board">
          <!-- 게시판 내용 -->
          <header>
            <br><br>
            <h1>공지사항 게시판</h1>
            <br><br>
    
        </header>
        <div class="container">
            <form>
                <div class="search-container">
                    <select>
                        <option value="">전체</option>
                        <option value="1">1일</option>
                        <option value="7">1주일</option>
                        <option value="30">1개월</option>
                    </select>
                    <select>
                        <option value="">선택하세요</option>
                        <option value="title">제목</option>
                        <option value="author">작성자</option>
                        <option value="content">내용</option>
                    </select>
                        <input type="text" placeholder="검색">
                        <button onclick="search()">검색</button>
                </div>
            </form>
            <button type="button" class="btn btn-outline-success btn-sm"> 새글쓰기</button>
            <br><br>
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>공지사항 제목입니다.</td>
                        <td>사용자</td>
                        <td>2022-02-26</td>
                        <td class="views">10</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>공지사항 제목입니다.</td>
                        <td>사용자</td>
                        <td>2022-02-25</td>
                        <td class="views">7</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>공지사항 제목입니다.</td>
                        <td>사용자</td>
                        <td>2022-02-24</td>
                        <td class="views">5</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>공지사항 제목입니다.</td>
                        <td>사용자</td>
                        <td>2022-02-23</td>
                        <td class="views">2</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>공지사항 제목입니다.</td>
                        <td>사용자</td>
                        <td>2022-02-22</td>
                        <td class="views">1</td>
                    </tr>
                </tbody>
            </table>
            <br><br>
            <tfoot>
                <ul class="pagination justify-content-center" style="margin:20px 0">
                    <li class="page-item"><a class="page-link" href="#"><</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">></a></li>
                  </ul>
            </tfoot>
        </div>
        </div>
      </div>
</body>
</html>