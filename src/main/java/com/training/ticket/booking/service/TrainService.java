package com.training.ticket.booking.service;

import com.training.ticket.booking.entity.Route;
import com.training.ticket.booking.entity.Train;
import com.training.ticket.booking.repository.TrainRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class TrainService {
    @Autowired
    private TrainRepository trainRepository;

    public List<Train> findAll(){

        return trainRepository.findAll();
    }
    public Set<Train> getAllFreeTrainsByRouteAndDate(Route route, LocalDate date, LocalTime time){
        return trainRepository.findAllByRouteAndDepartureDateAndDepartureTimeGreaterThanEqual(route, date, time)
                .stream()
                .filter(train-> train.getFreePlaces()>0)
                .collect(Collectors.toSet());
    }

    public void bookTheTicket(Train train){
        train.setFreePlaces(train.getFreePlaces()-1);
        trainRepository.save(train);
    }

}
