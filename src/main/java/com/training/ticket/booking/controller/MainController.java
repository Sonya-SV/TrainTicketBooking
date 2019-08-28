package com.training.ticket.booking.controller;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Optional;

@Controller
public class MainController {

    @GetMapping("/")
    public String greeting() {
        return "greeting";
    }

    @GetMapping("/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Optional.of(SecurityContextHolder.getContext().getAuthentication())
                .ifPresent((auth) -> new SecurityContextLogoutHandler().logout(request, response, auth));
        return "redirect:/login?logout";
    }

    @GetMapping("/login")
    public String getLogin(@RequestParam(value = "error", required = false) String error,
                           @RequestParam(value = "logout", required = false) String logout,
                           Model model) {

        model.addAttribute("error", error);
        model.addAttribute("logout", logout);
        return "login";
    }
}