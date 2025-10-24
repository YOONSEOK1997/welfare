<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소망재가복지센터 - 서비스 소개</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Arial', 'Malgun Gothic', sans-serif;
            scroll-behavior: smooth;
        }
        h1, h2, h3 { color: #333; }
        
        main {
            padding-top: 80px;
        }
        
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
        /* 서비스 콘텐츠 영역 */
        /* ------------------------------------------- */
        .section-service-list {
            max-width: 1200px;
            margin: 50px auto 100px;
            padding: 0 20px;
        }
        
        .service-item {
            display: flex;
            align-items: stretch;
            background-color: #ffffff;
            border: 1px solid #eee;
            border-radius: 10px;
            margin-bottom: 40px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            overflow: hidden;
        }
        
        .service-text-area {
            flex: 1;
            padding: 40px;
        }

        .service-image-area {
            flex-shrink: 0;
            width: 350px;
            height: 350px;
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
        }

        /* 이미지 지정 */
        .service-item.visit-care .service-image-area {
            background-image: url('<%= request.getContextPath() %>/images/bath_service.jpg');
        }
        .service-item.bath-service .service-image-area {
            background-image: url('<%= request.getContextPath() %>/images/play.png');
        }
        .service-item.emotional-care .service-image-area {
            background-image: url('<%= request.getContextPath() %>/images/emotional_care.jpg');
        }
        .service-item.service-target-area .service-image-area {
            background-image: url('<%= request.getContextPath() %>/images/house.png');
            background-color: #f0f8ff;
        }

        .service-item h2 {
            font-size: 28px;
            color: rgb(16, 78, 86);
            border-bottom: 3px solid #f0f8ff;
            padding-bottom: 10px;
            margin-bottom: 15px;
            font-weight: 700;
        }
        
        .service-item .description {
            font-size: 16px;
            line-height: 1.7;
            color: #444;
            margin-bottom: 20px;
        }

        .service-details ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-wrap: wrap;
        }
        .service-details li {
            width: 100%;
            padding: 6px 0;
            font-size: 15px;
            color: #333;
            position: relative;
        }
        .service-details li::before {
            content: "•";
            color: rgb(16, 78, 86);
            font-weight: bold;
            margin-right: 8px;
        }

        /* 유의사항 */
        .note-box {
            background-color: #f8f8f8;
            border-left: 5px solid rgb(16, 78, 86);
            padding: 25px 30px;
            border-radius: 10px;
            margin-top: 60px;
            font-size: 15px;
            color: #444;
            line-height: 1.8;
        }
        .note-box h3 {
            color: rgb(16, 78, 86);
            font-size: 20px;
            margin-bottom: 10px;
        }
        .note-box ol {
            margin: 0;
            padding-left: 20px;
        }

        /* 반응형 */
        @media (max-width: 992px) {
            .service-item {
                flex-direction: column;
            }
            .service-item.bath-service,
            .service-item.service-target-area {
                flex-direction: column;
            }
            .service-image-area {
                width: 100%;
                height: 250px;
            }
            .service-text-area {
                padding: 25px;
            }
        }

        @media (max-width: 768px) {
            main { padding-top: 70px; }
            .sub-visual h1 { font-size: 30px; }
            .service-item h2 { font-size: 24px; }
        }
    </style>
</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<main>
    <section class="sub-visual">
        <div class="sub-visual-content">
            <h1>서비스 소개</h1>
            <p>어르신의 삶의 질 향상을 위한 전문적이고 체계적인 재가 서비스를 제공합니다.</p>
        </div>
    </section>

    <section class="section-service-list">

        <!-- 1️⃣ 신체활동 지원 -->
        <div class="service-item visit-care">
            <div class="service-text-area">
                <h2><i class="bi bi-heart-pulse-fill" style="margin-right: 10px;"></i> 신체활동 지원</h2>
                <p class="description">
                    일상생활 수행이 어려운 어르신들을 위해 신체활동 전반에 걸친 도움을 제공합니다.
                </p>
                <div class="service-details">
                    <ul>
                        <li>세면 도움 – 얼굴과 목, 손 씻기 등, 세면대까지 이동 도움 포함</li>
                        <li>머리감기 도움 – 세면대나 이동용 세면기 이용, 필요물품 준비</li>
                        <li>몸 씻기 도움 – 목욕 준비, 입욕 시 이동 보조, 목욕 후 정리</li>
                        <li>화장실 이용 돕기 – 용변 시 이동, 변기 사용 보조, 기저귀 교환</li>
                    </ul>
                </div>
            </div>
            <div class="service-image-area"></div>
        </div>

        <!-- 2️⃣ 인지활동 지원 -->
        <div class="service-item bath-service" style="flex-direction: row-reverse;">
            <div class="service-image-area"></div>
            <div class="service-text-area">
                <h2><i class="bi bi-lightbulb-fill" style="margin-right: 10px;"></i> 인지활동 지원</h2>
                <p class="description">
                    어르신의 인지 기능을 유지하고 향상시키기 위한 다양한 활동을 함께합니다.
                </p>
                <div class="service-details">
                    <ul>
                        <li>인지자극 활동 – 프로그램 참여, 교재 및 도구 활용</li>
                        <li>일상생활 함께하기 – 산책, 대화, 취미활동 등</li>
                        <li>인지관리 지원 – 수급자 상태 관찰 및 평가, 변화를 기록하여 보호자 및 기관에 보고</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 3️⃣ 정서 지원 -->
        <div class="service-item emotional-care">
            <div class="service-text-area">
                <h2><i class="bi bi-emoji-smile-fill" style="margin-right: 10px;"></i> 정서 지원</h2>
                <p class="description">
                    어르신의 정서적 안정과 사회적 교류를 돕기 위해 따뜻한 관계 형성을 지원합니다.
                </p>
                <div class="service-details">
                    <ul>
                        <li>의사소통 도움 – 대화, 경청, 공감 등</li>
                        <li>말벗 및 격려 – 정서적 지지, 생활 동기 부여</li>
                        <li>가족 및 친구와의 연락 유도</li>
                        <li>고독감 완화 및 긍정적 정서 형성</li>
                    </ul>
                </div>
            </div>
            <div class="service-image-area"></div>
        </div>

        <!-- 4️⃣ 가사 및 일상생활 지원 -->
        <div class="service-item service-target-area" style="flex-direction: row-reverse;">
            <div class="service-image-area"></div>
            <div class="service-text-area">
                <h2><i class="bi bi-house-door-fill" style="margin-right: 10px;"></i> 가사 및 일상생활 지원</h2>
                <p class="description">
                    어르신의 안전하고 쾌적한 생활 환경을 유지하기 위한 일상생활 전반의 지원을 제공합니다.
                </p>
                <div class="service-details">
                    <ul>
                        <li>식사준비 및 정리</li>
                        <li>청소, 주변정돈, 세탁</li>
                        <li>개인활동 지원 – 병원 동행, 외출 보조</li>
                        <li>수급자 맞춤형 생활 관리</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 유의사항 -->
        <div class="note-box">
            <h3><i class="bi bi-exclamation-circle-fill" style="margin-right:8px;"></i> 유의사항</h3>
            <ol>
                <li>일정관리란, 서비스 제공과 관련된 날짜 및 급여제공시간을 기록합니다.</li>
                <li>변화상태란, 어르신의 신체·정신적 상태의 변화를 기록하며 필요한 경우 보호자 및 기관에 보고합니다.</li>
                <li>인지활동형 방문요양 제공 시에는 인지활동지원 내역을 급여제공시간에 맞춰 기록합니다.</li>
                <li>특이사항은 급여제공 중 확인한 주요 변화사항 및 조치내용을 기록합니다.<br>
                    예) 염증, 피부 이상, 혈압 변화, 병원 동행 등</li>
            </ol>
        </div>

    </section>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
