<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<title>맛조::고객의 소리-게시글 작성</title>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
		<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
	
	<script type="text/javascript">
		function writeInquiry() {
			
			var formData = new FormData();
			
			formData.append("inquiryTitle", $("#inquiryTitle").val() );
			formData.append("inquiryContent", $("#inquiryContent").val() );
			formData.append("inquiryMember", $("#inquiryMember").val() );
			$.ajax({
	                url: '/inquiry/inquiryInsertProcAjax.do',
	                processData: false,
	                contentType: false,
	                data: formData,
	                type: 'POST',
	                dataType: "json",
	                success: function(data){
	                	alert(data.resultMsg);
	                	if(data.result == "ok") {
	                		//화면이동 처리
	                		
	                		var inquiryTitle = data.inquiryTitle;
	                		var inquiryContent = data.inquiryContent;
							$("#inquiryTitle").text("inquiryTitle");
							$("#inquiryContent").text("inquiryContent");
							
							location.replace("/inquiry/selectInquiryList.do");
							return;
						} else {
							alert(data.resultMsg);
							location.replace("/inquiry/selectInquiryList.do");
							return;
						}
	                },//success
	                	error: function(xhr, status, error) {
						console.log(xhr);
						alert("error\nxhr : " + xhr + ", status : " 
								+ status + ", error : " + error);      
						}
	            });

		};//end function
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
                                   <div>
                                        <button type="button" class="sch_smit" onclick="javascript:location.href='/inquiry/selectInquiryList.do'">목록</button>
                                    </div>
								<form>
                                    <table class="detail">
                                       <colgroup>
                                           <col width="20%">
                                           <col width="*">
                                           <col width="20%">
                                       </colgroup>
                                        <tr>
                                            <th>제목</th>
                                            <td colspan="2">
                                                <input type="text" id="inquiryTitle" maxlength="49" required autofocus/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>작성자</th>
                                            <td colspan="2">
                                            <input type="hidden" id="inquiryMember" value="${sessionScope.memberLoginBean.memberNo}"/>
                                            <span>
                                            ${sessionScope.memberLoginBean.memberName}</span></td>
                                        </tr>
                                        <tr>
                                           <td class="table_content" colspan="3" >
                                            <textarea id="inquiryContent" cols="20" rows="20"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="1">
                                            </td>
                                            <td class="submit_btn" colspan="2">
                                                <button class="sch_smit" type="button" onclick="writeInquiry(); return false;">작성완료</button>
                                                <button class="sch_smit" type="button" onclick="history.back()">취소</button>
                                            </td>
                                        </tr>
                                    </table>
                                    </form>
									</div>
  		                          </section>
						</article>
						<hr />
					</div>
				</div>
				</div>
</body>
</html>