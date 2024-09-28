package com.nutro.nutro_delivery.dto.response;

public class CartResponseDto {
    Long id;
    ProductResponseDto product;
    Integer quantity;
    Boolean isdeleted;
    Boolean isCheckout;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public ProductResponseDto getProduct() {
        return product;
    }

    public void setProduct(ProductResponseDto product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Boolean getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(Boolean isdeleted) {
        this.isdeleted = isdeleted;
    }

    public Boolean getIsCheckout() {
        return isCheckout;
    }

    public void setIsCheckout(Boolean isCheckout) {
        this.isCheckout = isCheckout;
    }

}
