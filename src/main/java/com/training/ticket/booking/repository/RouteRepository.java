package com.training.ticket.booking.repository;

import com.training.ticket.booking.entity.Route;
import com.training.ticket.booking.entity.Train;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface RouteRepository extends JpaRepository<Route, Long> {
    Route findByDepartureAndArrival(String departure, String arrival);
    Set<Train> findTrainsByDepartureAndArrival(String departure, String arrival);
}
