package com.dubbo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("ueditor")
public class UEditorController {

	@RequestMapping("testUeditor.html")
	public String testUeditor(@RequestParam String content,HttpServletRequest request){
		request.setAttribute("content", content);
		return "editor/test" ;
	}
}
