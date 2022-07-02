package com.softcon.apisoftcon;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class VenueControlller {
    private final AtomicLong counter = new AtomicLong();

    
    @GetMapping("/getVenue")
    public SportVenue getVenue(){
       return new SportVenue(counter.incrementAndGet(), "KTDI Basketball Court", "Kolej KTDI");
       //TaskItem(counter.incrementAndGet(),String.format(titlee, name));
    
    };

}
