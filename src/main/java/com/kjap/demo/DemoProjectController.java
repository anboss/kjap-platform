package com.kjap.demo;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DemoProjectController {

    private static final Logger logger = LogManager.getLogger("Logger logged: ");

	@RequestMapping("/greeting")
	public @ResponseBody String greeting() {
		logger.error("A call is made");
		return "Hello from KJAP";
	}
}
