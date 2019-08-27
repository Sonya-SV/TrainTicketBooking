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
//
//    @GetMapping
//    public String ticketList(@AuthenticationPrincipal User user,
//                             Model model) {
//        try {
//            model.addAttribute("tickets", ticketService.findAllByPassenger(user));
//        } catch (Exception e) {
////            model.addAttribute("tickets", "No tickets yet");
//        }
//        return "history";
//    }
//

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
            Model model
    ) {
        model.addAttribute("train", train);

        trainService.bookTheTicket(train);
//        TODO need to be
        return "cart";
    }
    @GetMapping("/history")
    public String getHistory(Model model,
                             @AuthenticationPrincipal User user) {
        try {
            model.addAttribute("tickets", ticketService.findAllByPassenger(user));
        } catch (Exception e) {
//            model.addAttribute("tickets", "No tickets yet");
        }
        return "history";
    }
    @PostMapping("/history")
    public String getticketList(@AuthenticationPrincipal User user,
                                Model model) {
        try {
            model.addAttribute("tickets", ticketService.findAllByPassenger(user));
        } catch (Exception e) {
//            model.addAttribute("tickets", "No tickets yet");
        }
        return "history";
    }


//    @RequestMapping(value="/addProduct/{id}",method = RequestMethod.GET)
//    public String addProduct(@PathVariable("id") Integer id){
//        Product product = bookService.getProductById(id);
//        bookService.addProductToBasket(product, 1);
//        return "redirect:/";
//    }


}
