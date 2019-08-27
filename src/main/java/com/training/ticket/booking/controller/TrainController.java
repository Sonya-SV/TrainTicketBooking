package com.training.ticket.booking.controller;

import com.training.ticket.booking.entity.Train;
import com.training.ticket.booking.service.RouteService;
import com.training.ticket.booking.service.TrainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.PostConstruct;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Map;
import java.util.TimeZone;

@Controller
public class TrainController {
    @Autowired
    private TrainService trainService;

    @Autowired
    private RouteService routeService;

    @PostConstruct
    public void init() {
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
    }

    @ModelAttribute
    LocalDate initLocalDate() {
        return LocalDate.now();
    }
    @ModelAttribute
    LocalTime initLocalTime() {
        return LocalTime.now();
    }
    @GetMapping("/train-tickets")
    public String getTrainList(Model model,
                               String departure,
                               String arrival,
                               LocalDate date,
                               LocalTime time) {

            model.addAttribute("trains", trainService.getAllFreeTrainsByRouteAndDate(
                    routeService.getRouteByDepartureAndArrival(departure, arrival), date, time));
            model.addAttribute("departure", departure);
            model.addAttribute("arrival", arrival);
        return "train-tickets";
    }

    @PostMapping("/train-tickets")
    public String findTrainTickets(@RequestParam String departure,
                                   @RequestParam String arrival,
                                   @RequestParam  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
                                   @RequestParam  @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime time,
                                   Map<String, Object> model
    ) {

        Iterable<Train> trainsByRoute = trainService.getAllFreeTrainsByRouteAndDate(
                routeService.getRouteByDepartureAndArrival(departure, arrival), date, time);
        model.put("trains", trainsByRoute);
        model.put("departure", departure);
        model.put("arrival", arrival);
        return "train-tickets";
    }
}
