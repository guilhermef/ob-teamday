package com.orderbird.teamday;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@EnableAutoConfiguration
public class HelloSpringController {

    @RequestMapping("/")
    @ResponseBody
    public String index() {
        return "Hello Spring!";
    }

}