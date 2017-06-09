<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>맛조::고객의 소리</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
		<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
		
</head>
<body class="no-sidebar">
		<div id="page-wrapper">

			<!-- Header -->
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
								<h2 class="title_ko" lang="ko"><a href="#">고객의 소리</a></h2>
								<p lang="ko">
									친절하게 답변하겠습니다! *^^*
								</p>
							</header>
							<section>
                                 <div class="notice">
                                    <div>
                                        <button type="button" class="sch_smit" onclick="javascript:location.href='insertInquiryForm.html';">글쓰기</button>
                                    </div>
                                     <table class>
                                         <colgroup>
                                             <col width="10%">
                                             <col width="*">
                                             <col width="10%">
                                             <col width="10%">
                                             <col width="10%">
                                             <col width="8%">
                                         </colgroup>
                                         <tr>
                                             <th>번호</th>
                                             <th>제목</th>
                                             <th>답변여부</th>
                                             <th>작성자</th>
                                             <th>날짜</th>
                                             <th>조회수</th>
                                         </tr>
                                         <tr>
                                             <td>6</td>
                                             <td><a href="selectInquiryDetail.html">이거 불편해요 ㅠ.ㅠ</a></td>
                                             <td>
                                                <!-- 답변하기 위치로 이 -->
                                                 <button type="button" value="need_answer" onclick="javascript:location.href='selectInquiryDetail.html#reply';">답변하기</button>
                                             </td>
                                             <td>징징이</td>
                                             <td>2017-05-22</td>
                                             <td>17</td>
                                         </tr>
                                         <tr>
                                             <td>5</td>
                                             <td><a href="selectInquiryDetail.html">이거 불편해요 ㅠ.ㅠ</a></td>
                                             <td>
                                                 <button type="button" value="need_answer" onclick="javascript:location.href='selectInquiryDetail.html#reply';">답변하기</button>
                                             </td>
                                             <td>징징이</td>
                                             <td>2017-05-22</td>
                                             <td>17</td>
                                         </tr>
                                         <tr>
                                             <td>4</td>
                                             <td><a href="selectInquiryDetail.html">이거 불편해요 ㅠ.ㅠ</a></td>
                                             <td>
                                                 <button type="button" value="need_answer" onclick="javascript:location.href='selectInquiryDetail.html#reply';">답변하기</button>
                                             </td>
                                             <td>징징이</td>
                                             <td>2017-05-22</td>
                                             <td>17</td>
                                         </tr>
                                         <tr>
                                             <td>3</td>
                                             <td><a href="selectInquiryDetail.html">이거 불편해요 ㅠ.ㅠ</a></td>
                                             <td>
                                                 <button type="button" value="need_answer" onclick="javascript:location.href='selectInquiryDetail.html#reply';">답변하기</button>
                                             </td>
                                             <td>징징이</td>
                                             <td>2017-05-22</td>
                                             <td>17</td>
                                         </tr>
                                         <tr>
                                             <td>2</td>
                                             <td><a href="selectInquiryDetail.html">이거 불편해요 ㅠ.ㅠ</a></td>
                                             <td>
                                                 <button type="button" value="need_answer" onclick="javascript:location.href='selectInquiryDetail.html#reply';">답변하기</button>
                                             </td>
                                             <td>징징이</td>
                                             <td>2017-05-22</td>
                                             <td>17</td>
                                         </tr>
                                         <tr>
                                             <td>1</td>
                                             <td><a href="selectInquiryDetail.html">이거 불편해요 ㅠ.ㅠ</a></td>
                                             <td>
                                                 <button type="button" value="finish_answer">답변완료</button>
                                             </td>
                                             <td>징징이</td>
                                             <td>2017-05-22</td>
                                             <td>17</td>
                                         </tr>
                                         
                                         
                                     </table>
							     </div>
							</section>
						</article>
                        <!-- 페이지 -->
                        <div class="paging">
                            <div class="paging_number">
                                <span><a href="#">[1]</a></span>
                                <span><a href="#">[2]</a></span>
                                <span><a href="#">[3]</a></span>
                                <span><a href="#">[4]</a></span>
                                <span><a href="#">[5]</a></span>
                            </div>
                        </div>
                        <section>
						    <!-- 검색 창 -->
                            <div class="search_window">
                                <!-- 검색 선택창 -->
                                <select>
                                    <option value="all">전체</option>
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                    <option value="writer">작성자</option>
                                </select>
                                <span class="orange_window">
                                    <input type="text" class="input_text" />
                                </span>
                                <button type="submit" class="sch_smit">검색</button>
                            </div>
                        </section>
						<hr />
					</div>

				</div>

		</div>

	</body>
</html>