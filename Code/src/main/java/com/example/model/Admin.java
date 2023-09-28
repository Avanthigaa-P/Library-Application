package com.example.model;

public class Admin extends Member {
    private String name;
    private String password;

    public Admin(String username, String password) {
        super(username, password, "admin");
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