package com.kjap.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DemoProjectController {

	@RequestMapping("/greeting")
	public @ResponseBody String greeting() {
		return "Hello from KJAP";
	}
}
