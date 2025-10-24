<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신청 완료</title>
    
    <meta http-equiv="refresh" content="5;URL=/"> 
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { font-family: 'Arial', 'Malgun Gothic', sans-serif; background-color: #f4f7f6; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .success-box {
            max-width: 800px;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            text-align: center;
            border-left: 5px solid #28a745; /* 성공 색상 */
        }
        .success-box .icon {
            font-size: 5rem;
            color: #28a745;
            margin-bottom: 20px;
        }
        .success-box h1 {
            color: #333;
            font-size: 1.8rem;
            margin-bottom: 10px;
        }
        .success-box p {
            color: #666;
            line-height: 1.6;
            margin-bottom: 30px;
        }
        .auto-redirect {
            font-size: 0.9rem;
            color: #999;
        }
        .home-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .home-link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="success-box">
    <div class="icon">
        <i class="bi bi-check-circle-fill"></i>
    </div>
    <h1>예약 신청이 완료되었습니다!</h1>
    <p>
        담당자가 내용을 확인하는 즉시 빠른 시일 내에 연락드리겠습니다. 감사합니다.
    </p>
    <p>곧 메인페이지로 이동합니다</p>
    <a href="/" class="home-link">메인 페이지로 바로가기</a>
</div>

</body>
</html>