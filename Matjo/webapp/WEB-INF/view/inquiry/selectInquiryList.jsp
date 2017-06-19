<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>맛조: 고객의 소리-게시글 리스트</title>
<meta http-equiv="Content-Type" content="text/htm" charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
	<script type="text/javascript">
	function search() {
		var searchType = $("#searchType").val();
		var searchText = $("#searchText").val();
		
		location.href="/inquiry/selectInquiryList.do?searchType="+searchType+"&searchText="+searchText;
	}
	$(function() {
		var myElem3 = document.getElementById('replynotice');
		if("${sessionScope.memberLoginBean.memberId}" == "admin@."){
			myElem3.style.visibility="visible";
		}else{
			myElem3.style.visibility="hidden";
		}
		
	});//end ready
	</script>
</head>
<body class="no-sidebar">
       <div id="header">
	<!-- Inner -->
		<div class="inner">
		</div>
	</div>
	<!-- Main -->
	<div class="wrapper style1">
		<div class="container">
			<article id="main" class="special">
				<header>
					<h2 class="title_ko" lang="ko">
						<a href="#">고객의 소리</a>
					</h2>
					<p lang="ko">친절하게 답변하겠습니다! *^^*</p>
				</header>
				<section>
					<div class="notice">
						<div>
							<button type="button" class="sch_smit" onclick="javascript:location.href='/inquiry/insertInquiryForm.do';">글쓰기</button>
							<button type="button" class="sch_smit" onclick="javascript:location.href='/inquiry/selectInquiryList.do';">목록</button>
						</div>
						<br/>
						<table>
							<colgroup>
								<col width="10%">
								<col width="*">
								<col width="10%">
								<col width="10%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<tr>
								<th >번호</th>
								<th >제목</th>
								<th >작성자</th>
								<th >조회수</th>
								<th >작성날짜</th>
								<th >수정날짜</th>
								<th >답변여부</th>
							</tr>
							<c:forEach var="bean" items="${inquiryList}" varStatus="status">
							<tr>
									<td>${bean.inquiryNo}</td>
									<td><a href="/inquiry/selectInquiryDetail.do?inquiryNo=${bean.inquiryNo}">${bean.inquiryTitle}</a></td>
									<td>${sessionScope.memberLoginBean.memberId}</td>
									<td>${bean.inquiryCnt}</td>
									<td><span style="font-size: 11px;">${bean.inquiryDate}</span></td>
									<td><span style="font-size: 11px;">${bean.inquiryUpdate}</span></td>
									<td>
									<c:if test="${bean.inquiryReply eq ''}">
									<button type="button" id ="replynotice" style="visibility:hidden;" value="need_answer" class ="sch_smit" onclick="javascript:location.href='/inquiry/selectInquiryDetail.do?inquiryNo=${bean.inquiryNo}';">답변하기</button>
									</c:if>
									<c:if test="${bean.inquiryReply ne '' }">
									<button type="button" value="finish_answer" class ="sch_smit" onclick="javascript:location.href='/inquiry/selectInquiryDetail.do?inquiryNo=${bean.inquiryNo}';">답변완료</button>
									</c:if>
									</td>
							</tr>
							</c:forEach>
						</table>
						</div>
					</section>
				</article>
	  <!-- 페이지 -->
	  <div class="paging">
	  <div class ="paging_number">
	  	<tr>
			<td colspan="7">
									<!--  &lt;&lt;처음&nbsp;&nbsp;&nbsp;
								 &lt;이전 [1] [2] [3] [4] 다음&gt; 
								 &nbsp;&nbsp;&nbsp;마지막&gt;&gt; --> 
								 <c:if test="${pBean.groupNo > 1}">
										<a href="/inquiry/selectInquiryList.do?pageNo=${pBean.pageStartNo - 1}">&lt;이전</a>
									</c:if> 
									<c:forEach var="i" begin="${pBean.pageStartNo}"
										end="${pBean.pageEndNo}">
										<c:choose>
											<c:when test="${pBean.pageNo != i}">
												<a href="/inquiry/selectInquiryList.do?pageNo=${i}&searchType=${param.searchType}&searchText=${param.searchText}">[${i}]</a>
											</c:when>
											<c:otherwise>
									 			[${i}]
									 		</c:otherwise>
										</c:choose>
									</c:forEach> 
									<c:if test="${pBean.groupNo < pBean.totalGroupCount}">
										<a href="/inquiry/selectInquiryList.do?pageNo=${pBean.pageEndNo + 1}">다음&gt;</a>
									</c:if>
									</td>
									</tr>
									</div>
									</div>
								
       				 <section >
       				 <!-- 검색 창 -->
       				 <div class = "search_window">
									<select name="searchType" id="searchType">
										<option value="titleContent">검색</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
									</select> 
									<span class = "orange_window">
									<input type="text" name="searchText" id="searchText" class="input_text" /> 
									</span>
									<button type="submit" class="sch_smit" onclick="search();">검색</button>
								</div>
						</section>
						<hr/>
						</div>
                </div>
</body>
</html>