package com.nutro.nutro_delivery.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "add_to_cart")
public class AddToCart extends AuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "userid")
    private Long userId;

    @Column(name = "productid")
    private Long productId;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "isdeleted")
    private Boolean isDeleted = false;

    @Column(name = "ischeckout")
    private Boolean isCheckout = false;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Boolean getIsCheckout() {
        return isCheckout;
    }

    public void setIsCheckout(Boolean isCheckout) {
        this.isCheckout = isCheckout;
    }

    @Override
    public String toString() {
        return "AddToCart [id=" + id + ", userId=" + userId + ", productId=" + productId + ", quantity=" + quantity
                + ", isDeleted=" + isDeleted + ", isCheckout=" + isCheckout + "]";
    }

}
