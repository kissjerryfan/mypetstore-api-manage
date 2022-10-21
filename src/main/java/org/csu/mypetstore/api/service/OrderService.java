package org.csu.mypetstore.api.service;

import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.LineItem;
import org.csu.mypetstore.api.entity.OrderStatus;
import org.csu.mypetstore.api.entity.Orders;
import org.csu.mypetstore.api.vo.OrderVO;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface OrderService {
    CommonResponse<List<Orders>>  getOrdersByUsername(@PathVariable("id") String username);
    CommonResponse<OrderVO> getOrder(@PathVariable("orderid")int orderId);
    void insertOrder(Orders orders,List<LineItem>lineItemList);
}
