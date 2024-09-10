package com.nutro.nutro_delivery.dto.request;

public class UserRequestDto {
    private Long id;
    private String name;
    private String phoneNo;
    private String email;
    private Boolean isAdmin;
    private String gender;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getIsAdmin() {
        return isAdmin;
    }

    @Override
    public String toString() {
        return "UserRequestDto [id=" + id + ", name=" + name + ", phoneNo=" + phoneNo + ", email=" + email
                + ", isAdmin=" + isAdmin + ", gender=" + gender + "]";
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

}
