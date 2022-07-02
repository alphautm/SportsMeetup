package com.softcon.apisoftcon;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ActivitiesController {
    private final AtomicLong counter = new AtomicLong();

    @GetMapping("/getActivities")
    public Activity getActivity(){
       return new Activity(counter.incrementAndGet(), "Ping Pong", "Exhibition Match", "Dewan KTDI", "1500", "25-06-2022");
       //TaskItem(counter.incrementAndGet(),String.format(titlee, name));
    
    };

    // @Get
}
