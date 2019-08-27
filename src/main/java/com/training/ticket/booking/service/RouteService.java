package com.training.ticket.booking.service;

import com.training.ticket.booking.entity.Route;
import com.training.ticket.booking.repository.RouteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RouteService {

    @Autowired
    private RouteRepository routeRepository;

    public Route getRouteByDepartureAndArrival(String departure, String arrival){
        return routeRepository.findByDepartureAndArrival(departure, arrival);
    }
}
