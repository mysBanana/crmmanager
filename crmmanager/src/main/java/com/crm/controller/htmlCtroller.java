package com.crm.controller;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpSession;

@ApiIgnore
@Controller
public class htmlCtroller {
    @GetMapping("/")
    public String login(){
        return "login";
    }
    @GetMapping("main")
    public String main(){
        return "main";
    }
}
