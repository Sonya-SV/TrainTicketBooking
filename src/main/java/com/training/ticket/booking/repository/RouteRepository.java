package com.training.ticket.booking.repository;

import com.training.ticket.booking.entity.Route;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RouteRepository extends JpaRepository<Route, Long> {
    Route findByDepartureAndArrival(String departure, String arrival);
}
