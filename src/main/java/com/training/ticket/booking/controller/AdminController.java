package com.training.ticket.booking.controller;

import com.training.ticket.booking.entity.Role;
import com.training.ticket.booking.entity.User;
import com.training.ticket.booking.service.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller

@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/user")
public class AdminController {

    private final UserService userService;

    public AdminController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping
    public String userList(Model model) {
        try {
            model.addAttribute("users", userService.findAllUsers());
        } catch (Exception e) {
            model.addAttribute("users", "No users");
        }
        return "userList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    public String userUpdate(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user) {

        userService.updateUserByAdmin(user, username, form);
        return "redirect:/user";
    }
}
