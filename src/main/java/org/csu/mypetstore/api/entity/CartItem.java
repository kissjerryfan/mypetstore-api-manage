package org.csu.mypetstore.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

@Data
@TableName("cart")
public class CartItem {
    @TableId(type = IdType.INPUT)
    private String username;
    private int quantity;
    @TableField(value = "instock")
    private boolean inStock;
    @TableField(value = "totalcost")
    private BigDecimal totalCost;
    private boolean pay;
    @TableField(value = "itemid")
    private String itemId;
}
