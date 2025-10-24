package com.example.dopza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {
	@GetMapping("/guide")
	public String guidePage(Model model) {
		
		return "guide";
	}
	@GetMapping("/location")
	public String howToCome(Model model) {
		
		return "location";
	}
	@GetMapping("/recipients")
	public String recipientsService(Model model) {
		
		return "recipients";
	}
	@GetMapping("/caregiver")
	public String careService(Model model) {
		return "caregiver";
	}
}
