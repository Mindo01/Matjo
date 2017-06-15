<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<title>맛조::공지사항-게시글 상세보기</title>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
		<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
	
	<script type="text/javascript">
	function updateNoticePage(){
		location.href="/notice/updateNoticeForm.do?noticeNo=${param.noticeNo}";
	}
	$(function() {
			selectNotice();
		});//end ready
		function selectNotice() {
			
			$.ajax({
				type: "post",
				url: "/notice/noticeDetailViewProc.do",
				data: {
					noticeNo: "${param.noticeNo}"
					},
				dataType: "json",
				success: function(data) {
					printLog(data);
					if(data.result == "ok") {
						var notice = data.noticeBean;
						
						$("#noticeNo").text(notice.noticeNo);
						$("#noticeTitle").text( notice.noticeTitle );
						$("#noticeContent").text( notice.noticeContent );
						$("#noticeCnt").text( notice.noticeCnt );
						$("#noticeDate").text( notice.noticeDate );
						$("#noticeUpdate").text( notice.noticeUpdate );
					} else {
						alert(data.resultMsg);
					}
				},
				error: function(xhr, status, error) {
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " 
							+ status + ", error : " + error);      
				}
			});
			
		}; //end ready
		
		function noticeDelete(){
			$.ajax({
				type: "post",
				url: "/notice/noticeDeleteProc.do",
				data: { 
					noticeNo: "${param.noticeNo}"
				},
				dataType: "json",
				success: function(data) {
					console.log(data);
					if(data.result == "ok") {
						location.replace("/notice/selectNoticeList.do");
					} else {
						alert(data.resultMsg);
					}
					
				},
				error: function(xhr, status, error) {
					HoldOn.close();
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " 
							+ status + ", error : " + error);      
				}
			});
		};
		$(function() {
			var myElem3 = document.getElementById("insertNoticeButton");
			if("${sessionScope.memberLoginBean.memberId}" == "admin@." ){
				myElem3.style.visibility="visible";
			}else{
				myElem3.style.visibility="hidden";
			}
	});	
	</script>
</head>
<body class="no-sidebar">
		<div id="page-wrapper">
	<!-- Header -->
				<div id="header">
					<!-- Inner -->
						<div class="inner"></div>
						</div>
						<!-- Main -->
				<div class="wrapper style1">
					<div class="container">
						<article id="main" class="special">
							<section>
                                <div class="notice">
                                   <div class="other_btn">
                                       <div style="visibility:visible;" id="insertNoticeButton">
                                        <button type="button" class="sch_smit" onclick="noticeDelete(); return false;">삭제하기</button>
                                        <button type="button" class="sch_smit"  onclick="updateNoticePage();">수정하기</button>
                                        </div>
                                        <button type="button" class="sch_smit" onclick="location.href='/notice/selectNoticeList.do'">목록</button>
                                    </div>
                                    <table class="detail">
                                       <colgroup>
                                           <col width="20%">
                                           <col width="*">
                                           <col width="20%">
                                           <col width="10%">
                                       </colgroup>
                                        <tr>
                                            <th>제목</th>
                                            <td class="title"><span id="noticeTitle"></span></td>
                                            <th>조회수</th>
                                            <td class="count"><span id="noticeCnt"></span></td>
                                        </tr>
                                        <tr>
                                            <th>작성자</th>
                                            <td>관리자</td>
                                            <td colspan="2">
                                                <span id="noticeDate"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                           <td class="table_content" colspan="4">
                                           <pre>
                                            <span id="noticeContent"></span>
                                            </pre>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </section>
						</article>
						<hr />
					</div>
					</div>
				</div>
</body>
</html>