package com.example.model;

public class Member {
    private Integer id;
    private String username;
    private String password;
    private String role;

    public Member(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public Member(Integer id ,String username, String password, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public Integer getId(){
        return id;
    }

    public String getUsername(){
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getRole(){
        return role;
    }

    public void setId(int id) {
        this.id = id;
    }
}