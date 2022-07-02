package com.softcon.apisoftcon;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
 
    private final AtomicLong counter = new AtomicLong();

    @GetMapping("/getUsers")
    public User getUsers(){
       return new User(counter.incrementAndGet(), "Ali", "19", "SCSJ", "KTDI", "A18CSXX01");
       //TaskItem(counter.incrementAndGet(),String.format(titlee, name));
    
    };

}
