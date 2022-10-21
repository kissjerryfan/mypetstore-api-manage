package org.csu.mypetstore.api.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CartVo {
    //cart
    private String username;
    private String itemId;
    private int quantity;
    private boolean inStock;
    private BigDecimal totalCost;
    private boolean pay;

    //item
    private String productId;
    private BigDecimal listPrice;
    private String attribute1;

    //product
    private String name;
}
