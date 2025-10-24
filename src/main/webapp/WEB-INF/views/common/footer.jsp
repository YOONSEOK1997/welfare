<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="footer">
    <div class="footer-content">
        <div class="footer-info-group">
            <p class="footer-logo">소망재가복지센터</p>
            
            <div class="contact-info">
                <span><i class="bi bi-telephone-fill"></i> 연락처: 02) 780-6259</span>
                <span><i class="bi bi-envelope-fill"></i> Email: somang-f@naver.com</span>
            </div>
            
            <p class="address">
                <i class="bi bi-geo-alt-fill"></i> 주소: 서울특별시 영등포구 63로 40, 444호(여의도동, 라이프오피스텔)
            </p>
        </div>
        
        <div class="footer-copyright">
            <p>Copyright &copy; 2026 Somang Home Care Center. All Rights Reserved.</p>
        </div>
    </div>
</footer>

<style>
    /* ------------------------------------------- */
    /* ⭐️ 푸터 스타일 (수정됨) */
    /* ------------------------------------------- */
    .footer {
        /* ⭐️ 배경색 변경: rgb(16, 78, 86) */
        background-color: rgb(16, 78, 86); 
        color: #ecf0f1; 
        padding: 40px 20px;
        font-size: 14px;
        width: 100%;
        box-sizing: border-box;
    }

    .footer-content {
        max-width: 1200px;
        margin: 0 auto;
        /* ⭐️ 내용 중앙 정렬을 위해 플렉스 항목을 가운데로 정렬 */
        display: flex;
        flex-direction: column;
        align-items: center; 
        /* ⭐️ 텍스트도 중앙 정렬 */
        text-align: center;
    }

    .footer-info-group {
        width: 100%;
        padding-bottom: 20px;
        border-bottom: 1px solid #44586c;
        margin-bottom: 20px;
    }

    .footer-logo {
        font-size: 20px;
        font-weight: bold;
        color: white;
        margin-top: 0;
        margin-bottom: 15px;
    }

    .contact-info span {
        margin: 0 15px; /* 중앙 정렬 시 좌우 마진 조정 */
        display: inline-block;
        line-height: 1.8;
    }
    
    .contact-info i, .address i {
        color: #f39c12; /* 아이콘 색상을 대비되게 변경 (주황색 계열) */
        margin-right: 8px;
    }

    .address {
        margin-top: 10px;
        margin-bottom: 0;
    }
    
    .footer-copyright {
        /* ⭐️ 텍스트 중앙 정렬 */
        text-align: center;
        color: #bdc3c7;
        width: 100%;
    }

    .footer-copyright p {
        margin: 0;
        font-size: 13px;
    }

    /* 반응형 */
    @media (max-width: 768px) {
        .footer {
            padding: 30px 15px;
        }
        .contact-info {
            /* 모바일에서 항목 세로 정렬 */
            display: flex;
            flex-direction: column;
        }
        .contact-info span {
            margin: 0;
            margin-bottom: 5px;
        }
    }
</style>