package com.example.dopza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class MainController {
	 @GetMapping("/")
	    public String mainPage(Model model) {
		 System.out.println("★★★★ 메인 진입 ★★★★");
	        return "main"; 
	    }
}

