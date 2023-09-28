package com.example.model;

public class BookRequest {
    private String bookTitle;
    private String studentId;
    private String requestStatus;

    int requestId;

    public BookRequest() {
    }

    public BookRequest(String bookTitle, String studentId, String requestStatus) {
        this.bookTitle = bookTitle;
        this.studentId = studentId;
        this.requestStatus = requestStatus;
    }


    public int getId() {
        return requestId;
    }

    public void setId(int requestId) {
        this.requestId = requestId;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getRequestStatus() {
        return requestStatus;
    }

    public void setRequestStatus(String requestStatus) {
        this.requestStatus = requestStatus;
    }
}