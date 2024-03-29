package com.training.ticket.booking.entity;

import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString


@Entity
@Table(name = "train",
        uniqueConstraints = {@UniqueConstraint(columnNames = {"number"})})
public class Train {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "number", nullable = false)
    private String number;

    @Column(name = "departure_date", nullable = false)
    private LocalDate departureDate;

    @Column(name = "arrival_date", nullable = false)
    private LocalDate arrivalDate;

    @Column(name = "departure_time", nullable = false)
    private LocalTime departureTime;

    @Column(name = "arrival_time", nullable = false)
    private LocalTime arrivalTime;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "route_id", nullable = false)
    private Route route;

    @Column(name = "free_places")
    private int freePlaces;

    @Column(name = "total_places")
    private int totalPlaces;

    @Column(name = "price")
    private BigDecimal price;

    @OneToMany( mappedBy = "train",  cascade = CascadeType.MERGE, fetch = FetchType.LAZY, orphanRemoval = true)
    private Set<Ticket> tickets;
}
