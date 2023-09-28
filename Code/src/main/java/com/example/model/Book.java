package com.example.model;

public class Book {
    private int id;
    private String title;
    private String author;
    private String publicationDate;
    private String availability;

    public Book() {
    }

    public Book(String title, String author, String publicationDate, String availability) {
        this.title = title;
        this.author = author;
        this.publicationDate = publicationDate;
        this.availability = availability;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(String publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String isAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }
    public String getAvailability() {
        return availability;
    }



}