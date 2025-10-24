<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wix 스타일 JSP 템플릿</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
        /* Wix 템플릿 느낌을 내기 위한 간단한 커스텀 스타일 */
        body {
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            box-shadow: 0 2px 4px rgba(0,0,0,.05);
        }
        /* 기타 커스텀 스타일은 여기에 추가 */
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary" href="index.jsp">Template Logo</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">홈</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#about">소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#gallery">갤러리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#contact">연락</a>
                </li>
            </ul>
        </div>
    </div>
</nav>