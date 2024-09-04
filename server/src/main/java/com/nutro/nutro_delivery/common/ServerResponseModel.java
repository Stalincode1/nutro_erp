package com.nutro.nutro_delivery.common;

public class ServerResponseModel {

    private int statusCode;
    private Object responseData;
    private boolean error = false;
    private String responseMessage;
    private String additionalInfo = "";

    public int getStatusCode() {
        return statusCode;
    }

    @Override
    public String toString() {
        return "ServerResponseModel [statusCode=" + statusCode + ", responseData=" + responseData + ", error=" + error
                + ", responseMessage=" + responseMessage + ", additionalInfo=" + additionalInfo + "]";
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public Object getResponseData() {
        return responseData;
    }

    public void setResponseData(Object responseData) {
        this.responseData = responseData;
    }

    public boolean isError() {
        return error;
    }

    public void setError(boolean error) {
        this.error = error;
    }

    public String getResponseMessage() {
        return responseMessage;
    }

    public void setResponseMessage(String responseMessage) {
        this.responseMessage = responseMessage;
    }

    public String getAdditionalInfo() {
        return additionalInfo;
    }

    public void setAdditionalInfo(String additionalInfo) {
        this.additionalInfo = additionalInfo;
    }

}
