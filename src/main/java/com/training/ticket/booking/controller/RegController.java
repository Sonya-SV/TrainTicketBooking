package com.training.ticket.booking.controller;

import com.training.ticket.booking.entity.User;
import com.training.ticket.booking.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegController {
    private static final String USER_EXISTS = "User is already exists";
    private static final String DIFFERENT_PASSWORDS="Passwords are different!";

    private final UserService userService;

    public RegController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/reg")
    public String reg() {
        return "reg";
    }

    @PostMapping("/reg")
    public String addUser(@Valid User user, BindingResult bindingResult, Model model) {
        boolean errorExist=false;

        if (user.getPassword() != null && !user.getPassword().equals(user.getPassword2())) {
            model.addAttribute("passwordErrorDiffer", DIFFERENT_PASSWORDS);
            errorExist=true;
        }
        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ValidController.getErrors(bindingResult);
            model.mergeAttributes(errors);
            errorExist=true;
        }

        User userFromDb = (User) userService.loadUserByUsername(user.getUsername());
        if (userFromDb != null) {
            model.addAttribute("usernameError", USER_EXISTS);
            errorExist=true;

        }
        if(errorExist)
            return "reg";
        userService.saveNewUser(user);
        return "redirect:/login";
    }
}
