package com.example.model;

public class Student extends Member {
    private String name;
    private String password;

    public Student(String username, String password) {
        super(username, password, "student");
        this.name = username;
        this.password = password;
    }

    public String getUsername() {
        return name;

    }

    public String getPassword() {
        return password;
    }


}