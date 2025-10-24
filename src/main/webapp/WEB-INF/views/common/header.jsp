<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ✅ 헤더 영역 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/header.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="icon" href="<%= request.getContextPath() %>/images/favicon.ico">

<header class="header">
    <div class="header-content">
        <div class="logo">
        <a href="<%= request.getContextPath() %>/">
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="로고 이미지">
            </a>
        </div>
        <nav class="nav">
            <ul>
                <li><a href="/guide">서비스 소개</a></li>
                <li><a href="/location">오시는 길</a></li>
                
                <!-- ⭐️ 드롭다운 컨테이너 (relative) ⭐️ -->
                <li class="nav-dropdown">
                    <a href="#" class="dropdown-toggle">서비스 신청 <i class="bi bi-chevron-down"></i></a>
                    
                    <!-- ⭐️ 서브메뉴 리스트 (absolute) ⭐️ -->
                    <ul class="submenu">
                        <li>
                            <!-- 수급자 신청 (Controller 경로 사용) -->
                            <a href="<%= request.getContextPath() %>/recipients">
                                <i class="bi bi-person-heart"></i> 수급자 신청
                            </a>
                        </li>
                        <li>
                            <!-- ⭐️ 요양보호사 신청 (Controller 경로로 통일) ⭐️ -->
                            <a href="<%= request.getContextPath() %>/caregiver">
                                <i class="bi bi-file-earmark-text"></i> 요양보호사 신청
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</header>

<script>
    // 헤더 스크롤 축소 효과
    window.addEventListener('scroll', function() {
        const header = document.querySelector('.header');
        header.classList.toggle('scrolled', window.scrollY > 100);
    });
</script>
