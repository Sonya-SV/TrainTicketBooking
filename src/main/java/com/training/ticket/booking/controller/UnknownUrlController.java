package com.training.ticket.booking.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class UnknownUrlController implements ErrorController {

    @GetMapping("/404")
    public String getUnknownPage() {
        return "404";
    }

    @GetMapping("/error")
    public void redirectNonExistentUrlsToHome(HttpServletResponse response) throws IOException {
        response.sendRedirect("/404");
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}