<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->


<!-- 공통 CSS -->
<link rel="stylesheet" href="../../resources/assets/css/main.css" />

<link rel="stylesheet" href="../../resources/assets/css/font-kor.css" />
<link rel="stylesheet" type="text/css" href="/js/common/holdon/HoldOn.css"/>
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->


<!-- 공통 JS -->
<script type="text/javascript" src="/js/common/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/js/common/common.js"></script>
<script type="text/javascript" src="/js/common/holdon/HoldOn.js"></script>

    <script src="/js/common/jquery.min.js"></script>
    <script src="/js/common/jquery.dropotron.min.js"></script>
    <script src="/js/common/jquery.scrolly.min.js"></script>
    <script src="/js/common/jquery.onvisible.min.js"></script>
    <script src="/js/common/skel.min.js"></script>
    <script src="/js/common/util.js"></script>
    <script src="/js/common/main.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        
 	<!--부트스트랩-->
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <script>
            $(document).ready(function() {
                $(".login").click(function() {
                    $('div.modal').modal();
                });
            });
    </script>   