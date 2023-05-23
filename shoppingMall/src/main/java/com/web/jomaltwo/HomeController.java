package com.web.jomaltwo;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.service.CategoryService;
import com.web.jomaltwo.service.ProductService;
import com.web.jomaltwo.util.ProdSpec;


@Controller
public class HomeController {
	
	@Autowired
	private CategoryService service;
	
	@Autowired
	private ProductService pService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		
		return "redirect:/products/0001/all";
	}
	
}
