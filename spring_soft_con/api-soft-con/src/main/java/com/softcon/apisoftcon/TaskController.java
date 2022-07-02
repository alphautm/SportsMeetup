package com.softcon.apisoftcon;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.fasterxml.jackson.databind.ObjectMapper; 
import com.fasterxml.jackson.databind.ObjectWriter; 

@RestController
public class TaskController {
    
    private static final String titlee = "hello";
    private final AtomicLong counter = new AtomicLong();

    // @GetMapping("/getTasks")
    // public TaskItem getTasks(@RequestParam(value = "name", defaultValue = "world")String name){
    //    return new TaskItem(counter.incrementAndGet(), "Hari Kesukanan KTDI", "2202-02-02 14:22:12", "High", "Pertandingan Lumbar Lari", "off");
    //    //TaskItem(counter.incrementAndGet(),String.format(titlee, name));
    
    // };


    @PostMapping("/addTasks")
    public ResponseEntity<List<TaskItem>> getAllTask(@RequestParam (required = false) String title, String date, String priority, String description, String notification) {
     

       List<TaskItem> newTaskItem = new ArrayList<>();

       TaskItem taskItem = new TaskItem(counter.incrementAndGet(), title, date, priority,description, notification);

       TaskItem taskItem1 = new TaskItem(counter.incrementAndGet(), "Hari Kesukanan KTDI", "2202-02-02 14:22:12", "High", "Pertandingan Lumbar Lari", "off");

       newTaskItem.add(taskItem);
       newTaskItem.add(taskItem1);
       return new ResponseEntity<>(newTaskItem, HttpStatus.OK);
    }
    @GetMapping("/getTasks")
    public TaskItem[] getTasks(@RequestParam(value = "name", defaultValue = "world")String name){
      
        TaskItem[] arr = new TaskItem[]{new TaskItem(counter.incrementAndGet(), "Hari Kesukanan KTDI", "2202-02-02 14:22:12", "High", "Pertandingan Lumbar Lari", "off")};
        // for (int i = 0; i < 1; i++){
        //     JSONObject jsonList = TaskItem(counter.incrementAndGet(),String.format(titlee, name));

            return arr;
       //TaskItem(counter.incrementAndGet(),String.format(titlee, name));
    
    };

  
    

}
