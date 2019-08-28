package com.training.ticket.booking.service;

import com.training.ticket.booking.entity.Ticket;
import com.training.ticket.booking.entity.Train;
import com.training.ticket.booking.entity.User;
import com.training.ticket.booking.repository.TicketRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.Set;

@Slf4j
@Service
public class TicketService {

    @Autowired
    private TicketRepository ticketRepository;

    public Set<Ticket> findAllByPassenger(User passenger){
        return ticketRepository.findAllByPassengerOrderByIdDesc(passenger);
    }

    public void saveTicket(Ticket ticket)throws DataIntegrityViolationException {
        try {
            ticketRepository.save(ticket);
        }catch (DataIntegrityViolationException e){
            log.info("can`t save ticket");
        }
    }
    public Set<Ticket> findAllTicketsByTrain(Train train){
        return ticketRepository.findAllByTrain(train);
    }

}
