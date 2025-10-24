<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소망재가복지센터</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Arial', 'Malgun Gothic', sans-serif;
            scroll-behavior: smooth;
        }
        h1, h2, h3 { color: #333; }

        /* =======================
            메인 풀스크린 (슬라이더 재활성화)
            ======================= */
        .main-visual {
            position: relative;
            width: 100%;
            height: 100vh; /* 화면 전체 높이 사용 */
            overflow: hidden;
            /* ⭐️ 헤더 높이만큼 Padding을 줘서, 메인 콘텐츠가 헤더 아래에서 시작하도록 설정 */
            padding-top: 80px;
            box-sizing: border-box;
            /* 단일 이미지 배경 설정 제거 */
        }

        /* ⭐️ 슬라이더 트랙: 모든 슬라이드를 감싸며 가로로 정렬 */
        .slider-track {
            display: flex; /* 자식 요소(슬라이드)를 가로로 배치 */
            width: 300%; /* 슬라이드 개수(3개 가정) * 100% */
            height: 100%;
            transition: transform 0.5s ease-in-out; /* 슬라이드 전환 효과 */
        }

        /* ⭐️ 개별 슬라이드 스타일 */
        .slide {
            width: 100vw; /* 각 슬라이드는 뷰포트 너비만큼 차지 */
            height: 100%;
            flex-shrink: 0; /* 슬라이드가 줄어들지 않도록 설정 */
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
        }

        /* ⭐️ 슬라이드별 배경 이미지 설정 */
        .slide:nth-child(1) {
            background-image: url('<%= request.getContextPath() %>/images/mainback1.jpg');
        }
        .slide:nth-child(2) {
            background-image: url('<%= request.getContextPath() %>/images/mainback2.jpg');
        }
        .slide:nth-child(3) {
            background-image: url('<%= request.getContextPath() %>/images/mainback3.jpg');
        }


        /* 이미지 위 텍스트 오버레이 */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%; /* main-visual의 100vh 높이를 모두 사용 */
            background: rgba(0,0,0,0.35);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            padding: 0 20px;
            /* ⭐️ 헤더 높이만큼 패딩을 추가하여 텍스트가 헤더에 가려지지 않도록 조정 */
            padding-top: 80px;
            box-sizing: border-box;
            z-index: 10; /* 슬라이더 이미지 위에 표시되도록 z-index 설정 */
        }

        .overlay p {
            font-size: 20px;
            margin-bottom: 15px;
        }

        .overlay h2 {
            font-size: 48px;
            font-weight: bold;
            margin-bottom: 25px;
            color: #fff;
        }
		
        /* ⭐️ 변경: 수급자 신청 버튼 - 밝은 시안색 */
        .btn-reservation {
            background-color: #00bcd4; /* Bright Cyan */
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s;
            margin-left :30px;
        }
        .btn-reservation:hover { 
            background-color: #0097a7;
        }

        /* ⭐️ 변경: 요양보호사 지원 버튼 - 더 밝은 하늘색 */
        .btn-reservation.secondary {
            background-color:  #00bcd4; 
            color: white;
            margin-right: 20px;
        }
        .btn-reservation.secondary:hover {
            background-color:  #0097a7; 
        }
        /* 섹션 2 (소개) */
        .section-intro {
            background-color: white;
            padding: 100px 5%;
            display: flex;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            gap: 50px;
        }
        /* ------------------------------------------- */
        /* 섹션 2: 인물 소개 스타일 추가/수정 */
        /* ------------------------------------------- */

        /* 센터 핵심 가치 목록 스타일 */
        .section-intro .center-values {
            list-style: none; /* 기본 리스트 마커 제거 */
            padding-left: 0;
            margin-top: 25px;
            margin-bottom: 30px;
        }

        .section-intro .center-values li {
            line-height: 1.8;
            color: #444;
            margin-bottom: 10px;
            padding-left: 1.5em; /* 들여쓰기 */
            text-indent: -1.5em; /* 번호/글머리 기호 위치 조정 */
        }

        .section-intro .center-values li strong {
            color: rgb(16, 78, 86); /* 번호와 제목 색상 강조 */
            font-weight: 700;
        }

        /* ⭐️ 센터장 직함 영역 스타일 (크게 강조) */
        .center-director-info {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ddd; /* 구분선 추가 */
            color: #555;
            font-size: 16px;
            line-height: 1.6;
        }

        .center-director-info strong {
            /* ⭐️ 이름 부분의 글자 크기를 크게 설정 */
            font-size: 26px;
            font-weight: bold;
            display: block; /* 줄 바꿈 후 블록 요소로 만들어 크기 적용 */
            color: rgb(16, 78, 86);
            margin-top: 5px;
        }

        /* 기존 .intro-text-area p 스타일을 유지하면서 strong 태그가 잘 보이도록 설정 */
        .intro-text-area p strong {
            font-weight: bold;
            color: #0d5f69; /* 일반 텍스트 내 강조 색상 */
        }
        .intro-text-area { flex: 1; }
        .intro-image-area {
            flex: 1;
            position: relative;
            padding: 20px;
            background-color: white;
        }
        .intro-image-area img {
            width: 100%;
            height: auto;
            display: block;
            object-fit: cover;
        }
        .intro-image-area::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            /* border: 10px solid rgb(16, 78, 86); */
            transform: translate(15px, 15px);
            z-index: 1;
        }
        .intro-image-area img { position: relative; z-index: 2; }
        .intro-text-area h2 {
            font-size: 32px;
            border-bottom: 3px solid #0b4c5f;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .intro-text-area p {
            line-height: 1.8;
            color: #444;
            margin-bottom: 15px;
            text-align: justify;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .overlay h2 { font-size: 32px; }
            .overlay p { font-size: 16px; }
            .section-intro { flex-direction: column; padding: 50px 20px; }
            .intro-image-area::before { transform: translate(10px, 10px); }

            /* ⭐️ 모바일 헤더 높이에 맞춰 조정 (헤더가 작아지므로) */
            .main-visual { padding-top: 70px; }
            .overlay { padding-top: 70px; }
        }
    </style>
</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<main>
    <section class="main-visual">
        <div class="slider-track" id="sliderTrack">
            <div class="slide"></div>
            <div class="slide"></div>
            <div class="slide"></div>
        </div>

        <div class="overlay">
            <p>도움이 필요한 분들에게 삶의 행복을 전달해드립니다.</p>
            <h2>소망재가복지센터</h2>

            <div class="btn-group">
                <a href="<%= request.getContextPath() %>/recipients" class="btn-reservation">
                    <i class="bi bi-person-heart"></i> 수급자 신청
                </a>

                <a href="<%= request.getContextPath() %>/caregiver" class="btn-reservation secondary">
                    <i class="bi bi-file-earmark-text"></i> 요양보호사 지원
                </a>
            </div>
        </div>
    </section>


    <section class="section-intro" id="section2">
        <div class="intro-text-area">
            <h2>
                부모님께 효도하는 마음으로
                <br>
                소망재가복지센터가 도와드립니다.</h2>

            <p>안녕하세요.
                소망재가복지센터는 사랑과 정성으로 거동이 불편하신 부모님들께 방문하여 손발이 되어드리고,
                치매 증상이 있는 어르신분들에게 치매전문 요양사가 방문하여 언어 발달 및 정신건강의 다양한 부분의 개선을 위해 도와드립니다.</p>

            <p>저희 소망재가복지센터는 전문교육을 받고 현장에서 열심히 일하는 많은 요양사분들과 함께 여러분의 어려움을 공유하고 도움을 드리고자 합니다.
                효도하는 마음으로 어르신들의 행복한 삶을 함께 합니다.</p>

            <p>소망재가복지센터는 신뢰, 정성, 그리고 전문성을 바탕으로 모든 이들의 행복하고 건강한 삶을 위해 나아갑니다.</p>

            <ul class="center-values">
                <li><strong>1. 전문성과 신뢰:</strong> 전문적 교육을 받고 현장에서 다양한 경험을 가진 요양사분들과 함께합니다.</li>
                <li><strong>2. 확고한 목표의식:</strong> 단순한 케어뿐 아니라 도움을 받으시는 분들의 행복한 삶을 위해 나아갑니다.</li>
                <li><strong>3. 실버산업 대비:</strong> 고령화에 대비하여 안정적이고 행복한 미래를 설계합니다.</li>
            </ul>

            <div class="center-director-info">
                소망재가복지센터 센터장 / 사회복지사<br>
                <strong>이 경 희</strong>
            </div>

        </div>
        <div class="intro-image-area">
            <img src="<%= request.getContextPath() %>/images/master.png" alt="소망재가복지센터장 이미지">
        </div>
    </section>
</main>

<script>
    // 헤더 스크롤 축소 효과
    window.addEventListener('scroll', function() {
        const header = document.querySelector('.header');
        // toggle 메소드를 사용하여 코드를 더 간결하게 수정했습니다.
        header.classList.toggle('scrolled', window.scrollY > 100);
    });


    /* ⭐️⭐️⭐️ 자동 슬라이드 기능 추가 ⭐️⭐️⭐️ */
    const sliderTrack = document.getElementById('sliderTrack');
    const slides = document.querySelectorAll('.slide');
    const slideCount = slides.length; // 현재 3개
    let currentSlide = 0;

    function nextSlide() {
        currentSlide = (currentSlide + 1) % slideCount; // 0 -> 1 -> 2 -> 0 순환
        
        // 슬라이더 트랙을 이동하여 현재 슬라이드를 표시
        // 이동 거리: -0vw, -100vw, -200vw
        const offset = -currentSlide * 100;
        sliderTrack.style.transform = `translateX(${offset}vw)`;
    }

    // 5초(5000ms)마다 nextSlide 함수 호출하여 자동 전환
    let slideInterval = setInterval(nextSlide, 5000);

    // 마우스를 올렸을 때 슬라이드 정지, 벗어났을 때 다시 시작
    const mainVisual = document.querySelector('.main-visual');
    let isPaused = false;

    mainVisual.addEventListener('mouseenter', () => {
        clearInterval(slideInterval); // 인터벌 중지
        isPaused = true;
    });

    mainVisual.addEventListener('mouseleave', () => {
        if (isPaused) {
            // 다시 시작 (새로운 인터벌 할당)
            slideInterval = setInterval(nextSlide, 5000);
            isPaused = false;
        }
    });
 


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
