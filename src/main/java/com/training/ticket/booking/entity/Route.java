package com.training.ticket.booking.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString


@Entity
@Table(name = "route")
public class Route {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToMany( mappedBy = "route",  cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    private Set<Train> trains;

    @Column(name="departure", nullable = false)
    private String departure;

    @Column(name= "arrival", nullable = false)
    private String arrival;
}
