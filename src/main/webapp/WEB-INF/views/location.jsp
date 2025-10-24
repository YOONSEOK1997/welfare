<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소망재가복지센터 - 오시는 길</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        /* [기본 스타일 및 헤더/네비게이션 스타일은 이전 코드와 동일하게 유지됩니다.] */
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Arial', 'Malgun Gothic', sans-serif;
            scroll-behavior: smooth;
        }
        h1, h2, h3 { color: #333; }
        
        main {
            padding-top: 80px; /* 헤더 높이만큼 여백 */
        }

        /* ------------------------------------------- */
        /* 서브 페이지 상단 비주얼 */
        /* ------------------------------------------- */
        .sub-visual {
            background-color: rgb(16, 78, 86);
            color: white;
            text-align: center;
            padding: 20px 20px;
        }
        .sub-visual h1 {
            font-size: 38px;
            font-weight: bold;
            color: white;
            margin-bottom: 10px;
        }
        .sub-visual p {
            font-size: 16px;
            color: #ccc;
        }

        /* ------------------------------------------- */
        /* 오시는 길 콘텐츠 섹션 스타일 */
        /* ------------------------------------------- */
        .section-location {
        max-width: 1200px;
        margin: 50px auto 100px;
        padding: 0 20px;
    }
    
    .section-location h2 {
        font-size: 30px;
        color: rgb(16, 78, 86);
        text-align: center;
        margin-bottom: 50px;
    }

    /* 본사 정보 및 지도 영역 (2열 배치) */
    .location-container {
        display: flex;
        /* ⭐️ 지도가 정보 영역보다 훨씬 넓게 보이도록 비율 조정 (예: 2.5 : 1) */
        gap: 40px;
    }

    /* ⭐️ 지도 이미지 영역 (flex 비율을 높여서 꽉 차게) */
    .map-area {
        flex: 2.5; /* 지도가 정보보다 2.5배 넓게 */
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
        /* ⭐️ 지도가 세로로 너무 납작하지 않도록 최소 높이 지정 */
        min-height: 400px; 
    }
    .map-area img {
        width: 100%;
        /* ⭐️ height: auto; (지도가 컨테이너에 맞춰 꽉 차게 늘어나도록 함) */
        height: 100%; 
        object-fit: cover; /* 이미지가 컨테이너를 꽉 채우도록 */
        display: block;
    }

    /* 본사 연락처 및 교통 정보 영역 */
    .info-area {
        flex: 1; /* 정보 영역은 1 */
        padding: 20px 0;
    }


        /* 본사 정보 및 지도 영역 (2열 배치) */
        .location-container {
            display: flex;
            gap: 40px;
        }


        .info-area h3 {
            font-size: 22px;
            color: #333;
            border-left: 5px solid rgb(16, 78, 86);
            padding-left: 10px;
            margin-top: 0;
            margin-bottom: 20px;
        }

        .info-detail p {
            font-size: 16px;
            color: #555;
            line-height: 1.8;
            margin-bottom: 10px;
        }
        
        .info-detail strong {
            display: inline-block;
            width: 50px;
            color: rgb(16, 78, 86);
            font-weight: bold;
        }

        /* 교통 정보 리스트 */
        .transport-section {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px dashed #ddd;
        }

        .transport-section h4 {
            font-size: 18px;
            color: rgb(16, 78, 86);
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }

        .transport-section ul {
            list-style: none;
            padding-left: 0;
            margin-top: 5px;
            margin-bottom: 20px;
            line-height: 1.6;
            color: #555;
        }
        
        .transport-section ul li {
            position: relative;
            padding-left: 20px;
        }
        
        .transport-section ul li::before {
             content: "\f26a"; /* Bootstrap Icons: caret-right-fill */
            font-family: "bootstrap-icons";
            color: #888;
            position: absolute;
            left: 0;
            font-size: 12px;
        }


        /* 반응형 */
        @media (max-width: 992px) {
            .location-container {
                flex-direction: column;
            }
            .info-area {
                order: -1; /* 모바일에서 주소 정보를 지도보다 위로 */
                padding: 0 0 20px 0;
            }
        }
        @media (max-width: 768px) {
            main { padding-top: 70px; }
            .sub-visual h1 { font-size: 30px; }
            .section-location { margin: 30px auto 50px; }
        }
    </style>
</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<main>
    
    <section class="sub-visual">
        <div class="sub-visual-content">
            <h1>오시는 길</h1>
            <p>소망재가복지센터의 위치와 대중교통 이용 정보를 안내해 드립니다.</p>
        </div>
    </section>

    <section class="section-location">
        <h2>소망재가복지센터 본사 위치 및 교통 안내</h2>
        
        <div class="location-container">
            
            <div class="info-area">
                <h3><i class="bi bi-building" style="margin-right: 5px;"></i> 본사 위치</h3>
                
                <div class="info-detail">
                    <p>
                        <strong>주소</strong> 서울특별시 영등포구 63로 40, 444호(여의도동, 라이프오피스텔)
                    </p>
                    <p>
                        <strong>전화</strong> 02) 780-6259
                    </p>
                    <p>
                        <strong>이메일</strong> somang-f@naver.com
                    </p>
                </div>
                
                <div class="transport-section">
                    <h4><i class="bi bi-train-front" style="margin-right: 5px;"></i> 주변 지하철</h4>
                    <ul>
                        <li>9호선 샛강역</li>
                        <li>5호선 여의나루역</li>
                        <li>5호선/ 9호선 여의도역</li>
                    </ul>
                </div>
                
                <div class="transport-section">
                    <h4><i class="bi bi-bus-front" style="margin-right: 5px;"></i> 주변 정류장 및 버스</h4>
                    <ul>
                        <li>**주변 정류장:** 63빌딩</li>
                        <li>**간선 버스:** 61, 162, 503, 505, 262</li>
                        <li>**좌석 버스:** 700, 108</li>
                        <li>**지선 버스:** 5534, 5633, 7611, 5012, 5618</li>
                    </ul>
                </div>
            </div>
            
            <div class="map-area">
                <img src="<%= request.getContextPath() %>/images/map.png" alt="소망재가복지센터 지도 위치">
            </div>
        </div>
        
    </section>

</main>

<script>
    // 페이지별 스크립트 (필요시 추가)
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>