package org.csu.mypetstore.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

@Data
@TableName("lineitem")
public class LineItem {
    @TableField(value = "orderid")
    private int orderId;
    @TableField(value = "linenum")
    private int lineNumber;
    @TableField(value = "quantity")
    private int quantity;
    @TableField(value = "itemid")
    private String itemId;
    @TableField(value = "unitprice")
    private BigDecimal unitPrice;
}
