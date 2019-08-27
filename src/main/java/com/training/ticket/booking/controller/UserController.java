package com.training.ticket.booking.controller;

import com.training.ticket.booking.entity.User;
import com.training.ticket.booking.service.TicketService;
import com.training.ticket.booking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.math.BigDecimal;
import java.util.Optional;

@Controller
//@RequestMapping("/user")
public class UserController {

    private static final String positiveSum = "It should be greater than 0";
    @Autowired
    private TicketService ticketService;
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) { // do not to get from db
        model.addAttribute("username", user.getUsername());
        model.addAttribute("firstName", user.getFirstName());
        model.addAttribute("lastName", user.getLastName());
        return "profile";
    }

    @PostMapping("/profile")
    public String updateProfile(@Valid User user,
                                BindingResult bindingResult,
//                                @AuthenticationPrincipal User user,
//                                @RequestParam String password,
//                                @RequestParam String password2,
//                                @RequestParam String firstName,
//                                @RequestParam String lastName,
                                Model model

    ) {
//        boolean errorExist = false;
//        if (user.getPassword() != null && !user.getPassword().equals(validuser.getPassword2())) {
//            model.addAttribute("passwordErrorDiffer", "Passwords are different!");
//            errorExist = true;
//        }
//        if (bindingResult.hasErrors()) {
//            Map<String, String> errors = ValidController.getErrors(bindingResult);
//            model.mergeAttributes(errors);
//            errorExist = true;
//        }
//        if (password.equals(password2)) {
//            model.addAttribute("passwordErrorDiffer", "Passwords are different!");
//            errorExist=true;
//        }
//        if (bindingResult.hasErrors()) {
//            Map<String, String> errors = ValidController.getErrors(bindingResult);
//            model.mergeAttributes(errors);
//            errorExist=true;
////            return "reg";
//        }
//
//        if (errorExist)
//            return "profile";
//        userService.updateProfile(user, validuser.getFirstName(), validuser.getLastName(), validuser.getPassword());
        return "redirect:/profile";
    }

    @GetMapping("/profile/account")
    public String getAccount(Model model, @AuthenticationPrincipal User user) { // do not to get from db
        model.addAttribute("balance", user.getBalance());
        return "account";
    }

    @PostMapping("/profile/account")
    public String updateAccount(@AuthenticationPrincipal User user,
                                @RequestParam BigDecimal replenishmentAmount,
                                Model model) {
        Optional.of(replenishmentAmount)
                .filter(a -> a.compareTo(BigDecimal.ZERO) > 0)
                .ifPresentOrElse((sum)-> userService.updateAccount(user, sum),
                        ()->model.addAttribute("errorReplenishmentAmount",positiveSum ));
        return "redirect:/profile/account";
    }
}
