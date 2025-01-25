package org.csu.mypetstore.api.vo;

import lombok.Data;
import org.csu.mypetstore.api.entity.LineItem;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
public class OrderVO {
    private int orderId;
    private String username;
    private String orderDate;

    private String shipAddress1;
    private String shipAddress2;
    private String shipCity;
    private String shipState;
    private String shipZip;
    private String shipCountry;
    private String shipToFirstName;
    private String shipToLastName;

    private String billAddress1;
    private String billAddress2;
    private String billCity;
    private String billState;
    private String billZip;
    private String billCountry;
    private String billToFirstName;
    private String billToLastName;

    private String courier;
    private BigDecimal totalPrice;
    private String creditCard;
    private String expiryDate;
    private String cardType;
    private String locale;
    private String status;

    private List<LineItem> lineItemList;
}
