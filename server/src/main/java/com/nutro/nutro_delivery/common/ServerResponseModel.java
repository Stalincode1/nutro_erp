package com.nutro.nutro_delivery.common;

public class ServerResponseModel {

    private int status;
    private Object data;
    private String message;
    private String devMessage;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDevMessage() {
        return devMessage;
    }

    public void setDevMessage(String devMessage) {
        this.devMessage = devMessage;
    }

    @Override
    public String toString() {
        return "ServerResponseModel [status=" + status + ", data=" + data + ", message=" + message + ", devMessage="
                + devMessage + "]";
    }

}
