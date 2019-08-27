package com.training.ticket.booking.controller;

import com.training.ticket.booking.entity.Ticket;
import com.training.ticket.booking.entity.Train;
import com.training.ticket.booking.entity.User;
import com.training.ticket.booking.service.TicketService;
import com.training.ticket.booking.service.TrainService;
import com.training.ticket.booking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private UserService userService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private TrainService trainService;

    @GetMapping
    public String getCart() {
        return "cart";
    }

    @PostMapping
    public String checkTicket(@AuthenticationPrincipal User user,
                              @RequestParam String firstName,
                              @RequestParam String lastName,
                              @RequestParam("trainId") Train train,
                              Model model) {
        Ticket ticket = Ticket.builder()
                .firstName(firstName)
                .lastName(lastName)
                .train(train)
                .passenger(user)
                .build();
        model.addAttribute("ticket", ticket);
        model.addAttribute("user", user);
        return "cart";

    }

    @PostMapping("/pay")
    public String payTicket(@AuthenticationPrincipal User user,
                            @RequestParam String passengerFirstName,
                            @RequestParam String passengerLastName,
                            @RequestParam("ticketId") Train train,
                            Model model) {
        Ticket ticket = Ticket.builder()
                .firstName(passengerFirstName)
                .lastName(passengerLastName)
                .train(train)
                .passenger(user)
                .build();
        if (user.getBalance().compareTo(train.getPrice()) >= 0) {
            userService.updateAccount(user,train.getPrice().negate());
            trainService.bookTheTicket(train);
            ticketService.saveTicket(ticket);
            return "redirect:/history";
        } else {
            model.addAttribute("ticket", ticket);
            model.addAttribute("user", user);
            model.addAttribute("errorPay", "Not enough money in the account");
            return "cart";
        }
    }

}

