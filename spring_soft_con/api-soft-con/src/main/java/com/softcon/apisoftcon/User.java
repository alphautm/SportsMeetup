package com.softcon.apisoftcon;

public class User {
    private  long id;
    private String name;
    private String age;
    private String course;
    private String college;
    private String matric;

    public User() {
    }

    public User( long id, String name, String age, String course, String college, String matric) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.course = course;
        this.college = college;
        this.matric = matric;
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

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getMatric() {
        return matric;
    }

    public void setMatric(String matric) {
        this.matric = matric;
    }

}
