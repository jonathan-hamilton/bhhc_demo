package com.jhamilton.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jhamilton.demo.Model.ReasonModel;
import com.jhamilton.demo.Service.ReasonService;

// Controller method which resolves view and directs requests
@RestController
public class ReasonController {
	
	@Autowired
	private ReasonService reasonService;
	
	// Loads index page with the url "/"
	@RequestMapping(value="/")
	public ModelAndView indexPage() {
		ModelAndView model = new ModelAndView("index");
		return model;
	}
	
	// Returns the entire list of reason objects at url "/reasons"
	@GetMapping(value="/reasons")
	public List<ReasonModel> getAllReasons() {
		return reasonService.getAllReasons();
	}
}
