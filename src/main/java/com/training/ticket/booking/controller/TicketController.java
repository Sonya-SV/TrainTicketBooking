package com.training.ticket.booking.controller;

import com.training.ticket.booking.entity.Train;
import com.training.ticket.booking.entity.User;
import com.training.ticket.booking.service.TicketService;
import com.training.ticket.booking.service.TrainService;
import com.training.ticket.booking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class TicketController {

    @Autowired
    private TrainService trainService;
    @Autowired
    private UserService userService;
    @Autowired
    private TicketService ticketService;

    @GetMapping("/tickets/{train}")
    public String makeOrderForm(@PathVariable Train train,
                                @AuthenticationPrincipal User user,
                                Model model) {

        model.addAttribute("train", train);
        model.addAttribute("user", user);
        return "order";
    }

    @PostMapping("/tickets")
    public String bookTheTicket(
            @AuthenticationPrincipal User user,
            @RequestParam("trainId") Train train,
            Model model) {

        model.addAttribute("train", train);
        trainService.bookTheTicket(train);
        return "cart";
    }
    @GetMapping("/history")
    public String getHistory(Model model,
                             @AuthenticationPrincipal User user) {

        model.addAttribute("tickets", ticketService.findAllByPassenger(user));
        return "history";
    }

}
