package com.training.ticket.booking.repository;

import com.training.ticket.booking.entity.Route;
import com.training.ticket.booking.entity.Train;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Set;

@Repository
public interface TrainRepository extends JpaRepository<Train,Long> {
    Set<Train> findAllByRoute(Route route);
    Set<Train> findAllByRouteAndDepartureDateAndDepartureTimeGreaterThanEqual(Route route, LocalDate date, LocalTime time);


}
