package com.softcon.apisoftcon;

public class TaskItem {

    private  long id;
    private String title;
    private String description;
    private String date;
    private String priority;
    private String notification;
    public TaskItem() {
    }

    public TaskItem( long id, String title, String date, String priority, String description, String notification) {
        this.id = id;
        this.title = title;
        this.date = date;
        this.priority = priority;
        this.description = description;
        this.notification = notification;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public String getNotifcation() {
        return notification;
    }

    public void setNotification(String notification) {
        this.notification = notification;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


}
