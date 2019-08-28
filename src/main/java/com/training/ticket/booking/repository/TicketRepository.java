package com.training.ticket.booking.repository;

import com.training.ticket.booking.entity.Ticket;
import com.training.ticket.booking.entity.Train;
import com.training.ticket.booking.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface TicketRepository extends JpaRepository<Ticket,Long> {
    Set<Ticket> findAllByPassengerOrderByIdDesc(User passenger);
    Set<Ticket> findAllByTrain(Train train);
}
