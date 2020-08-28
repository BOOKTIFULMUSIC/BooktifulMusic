<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.web.jsp.Member.model.vo.*" import="com.web.jsp.book.model.vo.*"%>
<% Book b = (Book)session.getAttribute("book"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BookGenre</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/book_genre.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div class="content">
            <div id="section">
                <div id="sub_menu">
                    <ul>
                        <li><a onclick="BookGenre()">장르</a></li>
                        <li><a onclick="BookLike()">|&nbsp;좋아요</a></li>
                        <li><a onclick="BookReview()">|&nbsp;리뷰</a></li>
                    </ul>
			    </div>
                <form action="">
                    <div id="checkbox">
                        <p id="info"><b>장르선택</b>원하시는 장르를 선택해주세요.</p>
                        <table id="check_genre">
                            <tr>
                                <td><input type="checkbox" id="gerne1" name="gerne1" class="check_list"><label for="gerne1">전체</label></td>
                                <td><input type="checkbox" id="gerne2" name="gerne2" class="check_list"><label for="gerne2">소설</label></td>
                                <td><input type="checkbox" id="gerne3" name="gerne3" class="check_list"><label for="gerne3">에세이</label></td>
                                <td><input type="checkbox" id="gerne4" name="gerne4" class="check_list"><label for="gerne4">국내소설</label></td>
                                <td><input type="checkbox" id="gerne5" name="gerne5" class="check_list"><label for="gerne5">국외소설</label></td>
                                <td><input type="checkbox" id="gerne6" name="gerne6" class="check_list"><label for="gerne6">시</label></td>
                                <td><input type="checkbox" id="gerne7" name="gerne7" class="check_list"><label for="gerne7">어린이</label></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="gerne8" name="gerne8" class="check_list"><label for="gerne8">가정생활</label></td>
                                <td><input type="checkbox" id="gerne9" name="gerne9" class="check_list"><label for="gerne9">인문</label></td>
                                <td><input type="checkbox" id="gerne10" name="gerne10" class="check_list"><label for="gerne10">정치사회</label></td>
                                <td><input type="checkbox" id="gerne11" name="gerne11" class="check_list"><label for="gerne11">경제경영</label></td>
                                <td><input type="checkbox" id="gerne12" name="gerne12" class="check_list"><label for="gerne12">건강</label></td>
                                <td><input type="checkbox" id="gerne13" name="gerne13" class="check_list"><label for="gerne13">교양과학</label></td>
                                <td><input type="checkbox" id="gerne14" name="gerne14" class="check_list"><label for="gerne14">외국어</label></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="gerne15" name="gerne15" class="check_list"><label for="gerne15">예술</label></td>
                                <td><input type="checkbox" id="gerne16" name="gerne16" class="check_list"><label for="gerne16">취미/스포츠</label></td>
                                <td><input type="checkbox" id="gerne17" name="gerne17" class="check_list"><label for="gerne17">TOEIC/TOEFL</label></td>
                                <td><input type="checkbox" id="gerne18" name="gerne18" class="check_list"><label for="gerne18">유아</label></td>
                                <td><input type="checkbox" id="gerne19" name="gerne19" class="check_list"><label for="gerne19">종교</label></td>
                                <td><input type="checkbox" id="gerne20" name="gerne20" class="check_list"><label for="gerne20">아동만화</label></td>
                                <td><input type="checkbox" id="gerne21" name="gerne21" class="check_list"><label for="gerne21">요리/와인</label></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="gerne22" name="gerne22" class="check_list"><label for="gerne22">역사/문화</label></td>
                                <td><input type="checkbox" id="gerne23" name="gerne23" class="check_list"><label for="gerne23">자기계발</label></td>
                                <td><input type="checkbox" id="gerne24" name="gerne24" class="check_list"><label for="gerne24">여행</label></td>
                                <td><input type="checkbox" id="gerne25" name="gerne25" class="check_list"><label for="gerne25">기술/컴퓨터</label></td>
                                <td><input type="checkbox" id="gerne26" name="gerne26" class="check_list"><label for="gerne26">만화</label></td>
                                <td><input type="checkbox" id="gerne27" name="gerne27" class="check_list"><label for="gerne27">장르소설</label></td>
                            </tr>       
                        </table>
                    </div>
                </form>
				 <div id="genre_selected">
                    <div id="selected_list">
                        <p id="key">키워드</p>
                        <ul id="selected_genre" name="selected_genre">
                            <!-- <li><div>ggggggggg</div></li>
                            <li>gg</li> -->
                        </ul>
                        <div id="searchbtn">
                        <input type="submit" id="searchkey" name="searchkey" value="검색">
                        </div>
                    </div>
                </div>
                <!-- 체크박스 기능 script -->
                <script>
	                function BookGenre(){
	        			location.href="/BOOKTIFULMUSIC/bGenreList.bo";
	        		}
	                function BookLike(){
	        			location.href="/BOOKTIFULMUSIC/bLikeList.bo";
	        		}
	                function BookReview(){
	        			location.href="/BOOKTIFULMUSIC/bReviewList.bo";
	        		}
                    $(function(){
                        var a = document.getElementsByClassName('check_list');
                        var b = document.getElementById('selected_genre');
                        
                        

                        $("input[type='checkbox']").on('click',function(){
                            var arr = [];
                            var result = [];
                            b.innerHTML = '';
                            for (i = 0; i < a.length; i++) {
                                if (a[i].checked) {
                                    a[i].parentNode.style.background = "rgb(227,233,255)";
                                    arr.push(a[i].labels[0].innerText);
                      		        result = [...new Set(arr)];
                                    
                                }else{
                                    a[i].parentNode.style.background="white";
                                }
                            }
                            result.sort;
                            for(j=0;j<result.length;j++){
                                b.innerHTML += "<li><div id='keyword'>" + result[j] + "</div></li>";
                            }
                        });
                    });
                    
                    $(document).ready(function(){
                        var a = document.getElementsByName('genre');
            
                        $("input:checkbox").on('click', function () {
                            for (i = 0; i < a.length; i++) {
                                if (a[i].checked)  {
                                    a[i].parentNode.style.background = "rgb(227, 233, 255)";
                                }else {
                                    a[i].parentNode.style.background = "white";
                                }
                            }
                        }); 
                        
                    });
				
                </script>

                <div id="imgbox">
                    <table>
                        <colgroup>
                            <col style='width: 20%'>
                            <col style='width: 20%'>
                            <col style='width: 20%'>
                            <col style='width: 20%'>
                        </colgroup>
                        <tr>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                            <td><a onclick="BookInfo()">
                                    <img name="img" src="${pageContext.request.contextPath}/<% b.getbImage(); %>">
                                    <span>
                                        <p name="title" style="color: black;"><% b.getBtitle();%></p>
                                        <h6 name="author" style="color: #757575;">
                                            <% b.getAuthor(); %>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <b class="fas fa-heart">♥</b><p name="like"><% b.getbLikeCount(); %></p>
                                        </h6>
                                    </span>
                            	</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <script>
        	function BookInfo(){
        		location.href="/BOOKTIFULMUSIC/bSelectOne.bo";
        	}
        </script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>