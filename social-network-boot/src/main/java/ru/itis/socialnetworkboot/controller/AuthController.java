package ru.itis.socialnetworkboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AuthController {

    @RequestMapping(value = "/auth", method = RequestMethod.GET)
    public String showAuthPage() {
        return "auth";
    }

}
