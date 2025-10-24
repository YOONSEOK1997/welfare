<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소망재가복지센터 - 서비스 소개</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        /* [기존 스타일 및 헤더/네비게이션 스타일은 동일하게 유지됩니다.] */
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Arial', 'Malgun Gothic', sans-serif;
            scroll-behavior: smooth;
        }
        h1, h2, h3 { color: #333; }
        
        /* ------------------------------------------- */
        /* 서브 페이지 상단 비주얼 */
        /* ------------------------------------------- */
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
        /* 서비스 콘텐츠 섹션 스타일 */
        /* ------------------------------------------- */
        .section-service-list {
            max-width: 1200px;
            margin: 50px auto 100px;
            padding: 0 20px;
        }
        
        /* 서비스 개별 항목 - Flexbox 컨테이너로 설정 */
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
        
        /* 서비스 텍스트 영역 */
        .service-text-area {
            flex: 1;
            padding: 40px;
        }

        /* 서비스 이미지 영역 */
        .service-image-area {
            flex-shrink: 0;
            width: 350px;
            height: 350px;
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
        }

        /* 서비스별 이미지 지정 (경로 가정) */
        .service-item.visit-care .service-image-area {
            background-image: url('<%= request.getContextPath() %>/images/visit_care.jpg');
        }
        .service-item.bath-service .service-image-area {
            background-image: url('<%= request.getContextPath() %>/images/bath_service.jpg');
        }
        .service-item.emotional-care .service-image-area {
            background-image: url('<%= request.getContextPath() %>/images/emotional_care.jpg'); 
        }
        
        /* 서비스 대상 이미지 지정 (경로 가정) */
        .service-item.service-target-area .service-image-area {
            background-image: url('<%= request.getContextPath() %>/images/service_target.jpg');
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
        
        .service-details ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-wrap: wrap;
        }

        /* 서비스 상세 리스트 아이템 스타일 */
        .service-details li {
             width: 48%; /* 2개씩 배치 */
             margin-right: 2%;
             padding: 8px 0;
             padding-left: 25px;
             font-size: 15px;
             color: #333;
             position: relative;
        }
        
        .service-details li::before {
            content: "\2713"; /* 체크마크 유니코드 */
            font-family: 'Arial', sans-serif;
            font-weight: bold;
            color: rgb(16, 78, 86);
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            font-size: 16px;
        }
        
        .service-target-area .target-list li::before {
             content: "\f46c"; /* Bootstrap icon: bi-person-heart */
             font-family: "bootstrap-icons";
             color: rgb(16, 78, 86);
             position: absolute;
             left: 0;
             top: 50%;
             transform: translateY(-50%);
             font-size: 18px;
        }

        /* ------------------------------------------- */
        /* 이용후기 섹션 스타일 */
        /* ------------------------------------------- */
        .section-reviews {
            max-width: 1200px;
            margin: 80px auto;
            padding: 0 20px;
            text-align: center;
        }
        /* 앵커를 위한 공간 확보 */
        #reviews-anchor {
            display: block; 
            position: relative; 
            top: -80px; 
            visibility: hidden;
            height: 0;
        }
        .section-reviews h2 {
            font-size: 32px;
            color: rgb(16, 78, 86);
            margin-bottom: 40px;
            position: relative;
            padding-bottom: 10px;
            font-weight: 700;
        }
        .section-reviews h2::after {
            content: '';
            display: block;
            width: 60px;
            height: 4px;
            background-color: rgb(16, 78, 86);
            margin: 10px auto 0;
            border-radius: 2px;
        }

        .reviews-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin-top: 50px;
        }

        .review-card {
            background-color: #ffffff;
            border: 1px solid #f0f8ff;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 8px 15px rgba(0,0,0,0.05);
            text-align: left;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .review-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0,0,0,0.15);
        }
        
        /* ⭐️ 초기 숨김 카드 스타일 (7번째 카드부터 적용) */
        .review-card.hidden-review {
            display: none;
        }

        .review-rating {
            color: #ffc107;
            margin-bottom: 15px;
            font-size: 18px;
        }

        /* 더보기/접기 버튼 스타일 */
        .view-more-button {
            background-color: white;
            border: 2px solid rgb(16, 78, 86);
            color: rgb(16, 78, 86);
            padding: 10px 30px;
            border-radius: 50px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 50px;
            transition: background-color 0.3s, color 0.3s;
        }
        .view-more-button:hover {
            background-color: rgb(16, 78, 86);
            color: white;
        }


        /* 반응형 */
        @media (max-width: 992px) {
            .service-details li, .service-target-area .target-list li {
                width: 100%;
            }
            .service-item {
                flex-direction: column; 
            }
            .service-item.bath-service,
            .service-item.emotional-care { 
                flex-direction: column;
            }
            .service-image-area {
                width: 100%;
                height: 250px;
            }
            .service-text-area { 
                 padding: 25px; 
            }
            .service-target-area .service-text-area { 
                padding-bottom: 0;
            }
            .service-target-area h2 {
                text-align: center;
            }
        }
        @media (max-width: 768px) {
            main { padding-top: 70px; }
            .sub-visual h1 { font-size: 30px; }
            .service-item h2 { font-size: 24px; }
            .section-reviews h2 { font-size: 28px; }
            .reviews-container { grid-template-columns: 1fr; }
        }
    </style>
</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<main>
    
    <section class="sub-visual">
        <div class="sub-visual-content">
            <h1>소망재가복지센터 서비스 소개</h1>
            <p>어르신의 삶의 질 향상을 위한 전문적이고 체계적인 재가 서비스를 제공합니다.</p>
        </div>
    </section>

    <section class="section-service-list">
        
        <div class="service-item visit-care">
            <div class="service-text-area">
                <h2><i class="bi bi-house-door-fill" style="margin-right: 10px;"></i> 재가방문요양 서비스</h2>
                <p class="description">
                    숙련된 전문가들이 직접 어르신들의 가정을 방문하여 필요한 신체활동 및 다양한 활동 지원을 해드리며 삶의 질을 향상시켜 드립니다.
                </p>
                <div class="service-details">
                    <ul>
                        <li>탈의 및 복장 도움</li>
                        <li>식사 도움 (준비 및 섭취 지원)</li>
                        <li>세면 도움</li>
                        <li>외출 동행 및 도움 (가벼운 외출)</li>
                        <li>화장실 이용 도움</li>
                        <li>배변 및 용변 도움</li>
                        <li>환부에 따른 자세 변형 도움</li>
                        <li>신체활동 증진 지도</li>
                        <li>일상생활 활동 도움</li>
                    </ul>
                </div>
            </div>
            <div class="service-image-area"></div>
        </div>
        
        <div class="service-item bath-service" style="flex-direction: row-reverse;">
             <div class="service-image-area"></div>
            <div class="service-text-area">
                <h2><i class="bi bi-droplet-fill" style="margin-right: 10px;"></i> 방문 목욕 서비스</h2>
                <p class="description">
                    목욕 전 상태 체크를 통해 청결하고 건강을 유지해 드립니다. 목욕뿐 아니라 이후 배뇨, 배변까지 도움을 드리며 건강 상태와 청결까지 유지해드립니다.
                </p>
                <div class="service-details">
                    <ul>
                        <li>샤워 도움</li>
                        <li>전신 입욕 도움</li>
                        <li>입욕 시 이동 도움</li>
                        <li>목욕 전 준비 및 목욕 후 주변 정리 도움</li>
                        <li>목욕 중 건강 상태 체크</li>
                    </ul>
                </div>
            </div>
        </div>
        
        <div class="service-item emotional-care">
            <div class="service-text-area">
                <h2><i class="bi bi-heart-fill" style="margin-right: 10px;"></i> 정서 케어 서비스</h2>
                <p class="description">
                    우울증, 무기력증으로 삶의 의욕을 잃은 어르신들의 정서를 보살펴 드립니다.
                </p>
                <div class="service-details">
                    <ul>
                        <li>대화 및 소통 지원</li>
                        <li>독서 지원</li>
                        <li>긍정적인 마인드 함양 지원</li>
                        <li>일상 생활을 위한 정서 및 인지 활동 도움</li>
                        <li>삶의 긍정적인 태도 유지 도움</li>
                    </ul>
                </div>
            </div>
            <div class="service-image-area"></div>
        </div>

        <div class="service-item service-target-area" style="flex-direction: row-reverse;">
            <div class="service-image-area"></div>
            <div class="service-text-area">
                <h2><i class="bi bi-person-check-fill" style="margin-right: 10px;"></i> 서비스 대상</h2>
                <ul class="target-list">
                    <li>만 65세 이상의 어르신</li>
                    <li>만 65세 미만, 치매, 중풍 등 노인성 질환으로 인해 거동이 불편하신 모든 분</li>
                </ul>
                <p class="description" style="margin-top: 30px; font-style: italic; color: #777;">
                    장기요양 등급을 받으신 분들에 한하여 서비스 이용이 가능합니다. 등급 신청 절차는 저희 센터로 문의해 주세요.
                </p>
            </div>
        </div>
        
    </section>

    <!-- ⭐️ ------------------------------------------- -->
    <!-- ⭐️ 5. 이용 후기 섹션 (6개 초기 노출, 더보기/접기 기능) -->
    <!-- ⭐️ ------------------------------------------- -->
    <section class="section-reviews">
        <div id="reviews-anchor"></div> <!-- 스크롤 이동을 위한 앵커 -->
        <h2><i class="bi bi-chat-heart-fill" style="margin-right: 10px;"></i> 수급자 및 가족 이용 후기</h2>
        <p style="color: #777; font-size: 18px;">
            저희 소망재가복지센터와 연결된 요양보호사님들의 따뜻한 손길을 경험하세요.
        </p>

        <div class="reviews-container">
            <!-- 후기 카드 1 (노출) -->
            <div class="review-card">
                <div class="review-rating">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p class="review-quote">
                    "어머니와 성격이 잘 맞는 요양보호사님을 직접 선택할 수 있어서 너무 좋았습니다. 
                    다른 기관에서는 상상도 못할 일이었는데, 덕분에 어머니의 생활 만족도가 훨씬 높아졌어요."
                </p>
                <span class="reviewer-info">김*수 (수급자 보호자)</span>
            </div>

            <!-- 후기 카드 2 (노출) -->
            <div class="review-card">
                <div class="review-rating">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p class="review-quote">
                    "방문 목욕 서비스가 필요했는데, 젊고 힘이 좋으신 분이 오셔서 안전하게 도와주셨습니다. 
                    프로페셔널하고 친절하셔서 믿음이 갑니다. 주변에도 강력 추천할 예정입니다."
                </p>
                <span class="reviewer-info">박*숙 (수급자 본인)</span>
            </div>
            

            <!-- 후기 카드 3 (노출) -->
            <div class="review-card">
                <div class="review-rating">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p class="review-quote">
                    "정서 지원 서비스가 정말 큰 도움이 되었습니다. 요양보호사님과 대화하는 시간이 즐겁고, 
                    다시 삶의 활력을 찾은 것 같아요. 섬세하게 보살펴 주셔서 감사합니다."
                </p>
                <span class="reviewer-info">이*영 (수급자 보호자)</span>
            </div>

            <!-- 후기 카드 4 (노출) -->
            <div class="review-card">
                <div class="review-rating">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p class="review-quote">
                    "근무 스케줄이 자주 바뀌는데도, 플랫폼을 통해 원하는 시간대의 복지사님을 빠르게 찾을 수 있었습니다. 
                    기관 관리자로서 행정 부담이 줄어들어 업무 효율이 크게 올랐습니다."
                </p>
                <span class="reviewer-info">최*호 (복지 기관 관계자)</span>
            </div>
            
            <!-- ⭐️ 후기 카드 5 (노출) -->
            <div class="review-card">
                <div class="review-rating">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p class="review-quote">
                    "어르신 상태에 따라 필요한 특수 기술을 가진 요양보호사님을 찾고 싶었는데, 검색 조건이 잘 되어 있어서 딱 맞는 분을 찾을 수 있었습니다."
                </p>
                <span class="reviewer-info">정*민 (수급자 보호자)</span>
            </div>

            <!-- ⭐️ 후기 카드 6 (노출) -->
            <div class="review-card">
                <div class="review-rating">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p class="review-quote">
                    "기관을 거치지 않고 직접 수급자와 소통하며 일할 수 있게 되어, 업무 만족도가 높습니다. 불필요한 행정 절차가 줄어들어 복지 서비스에 더 집중할 수 있어요."
                </p>
                <span class="reviewer-info">강*희 (요양보호사)</span>
            </div>

            <!-- ⭐️ 후기 카드 7 (초기 숨김) -->
            <div class="review-card hidden-review">
                <div class="review-rating">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p class="review-quote">
                    "급작스러운 일정 변경에도 플랫폼을 통해 신속하게 대체 인력을 구할 수 있었습니다. 이전에는 불가능했던 빠른 대응이 가능해졌습니다."
                </p>
                <span class="reviewer-info">윤*아 (복지 기관 관계자)</span>
            </div>

            <!-- ⭐️ 후기 카드 8 (초기 숨김) -->
            <div class="review-card hidden-review">
                <div class="review-rating">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p class="review-quote">
                    "가족과 함께 요양보호사님의 자세한 프로필을 보고 결정할 수 있어, 심리적으로 훨씬 안심이 되었습니다. 돌봄 서비스의 질이 다르다는 것을 느낍니다."
                </p>
                <span class="reviewer-info">오*준 (수급자 보호자)</span>
            </div>

        </div>
        
        <!-- 더보기/접기 버튼 -->
        <button id="viewMoreBtn" class="view-more-button" onclick="toggleReviews()">
            <i class="bi bi-arrow-down-circle"></i> 이용 후기 더보기
        </button>

    </section>

</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
    /**
     * 후기 카드의 보이기/숨기기 상태를 토글하고 버튼 텍스트/아이콘을 변경합니다.
     * 초기 6개 노출, 7번째 카드부터 토글합니다.
     */
    function toggleReviews() {
        // 모든 토글 대상 후기 (7번째 카드부터)를 선택
        const toggleReviews = document.querySelectorAll('.review-card:nth-child(n+7)');
        const viewMoreBtn = document.getElementById('viewMoreBtn');
        
        // 토글 대상이 없다면 함수 실행을 멈춤
        if (toggleReviews.length === 0) return;
        
        // 현재 숨겨져 있는지 확인 (토글 대상 중 첫 번째 요소에 hidden-review 클래스가 있는지 확인)
        const isCollapsed = toggleReviews[0].classList.contains('hidden-review');

        if (isCollapsed) {
            // 상태: 접힘 -> 펼치기 (더보기)
            toggleReviews.forEach(card => {
                card.classList.remove('hidden-review');
            });
            viewMoreBtn.innerHTML = '<i class="bi bi-arrow-up-circle"></i> 이용 후기 접기';
        } else {
            // 상태: 펼침 -> 접기
            toggleReviews.forEach(card => {
                card.classList.add('hidden-review');
            });
            viewMoreBtn.innerHTML = '<i class="bi bi-arrow-down-circle"></i> 이용 후기 더보기';
            
            // 접을 때 화면을 후기 섹션 상단(앵커 위치)으로 부드럽게 이동
            const reviewsAnchor = document.getElementById('reviews-anchor');
            if (reviewsAnchor) {
                reviewsAnchor.scrollIntoView({ behavior: 'smooth' }); 
            }
        }
    }
</script>

</body>
</html>
