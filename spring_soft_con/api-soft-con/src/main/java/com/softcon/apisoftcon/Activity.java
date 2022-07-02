package com.softcon.apisoftcon;

public class Activity {
    private  long id;
    private String name;
    private String description;
    private String venue;
    private String time;
    private String date;

    public Activity() {
    }

    public Activity( long id, String name, String description, String venue, String time, String date) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.venue = venue;
        this.time = time;
        this.date = date;
    }

    public long getID() {
        return id;
    }

    public void setID(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }


    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
