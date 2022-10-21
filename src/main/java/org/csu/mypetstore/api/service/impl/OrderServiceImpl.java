package org.csu.mypetstore.api.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.*;
import org.csu.mypetstore.api.persistence.LineItemMapper;
import org.csu.mypetstore.api.persistence.OrderStatusMapper;
import org.csu.mypetstore.api.persistence.OrdersMapper;
import org.csu.mypetstore.api.persistence.SequenceMapper;
import org.csu.mypetstore.api.service.OrderService;
import org.csu.mypetstore.api.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.sound.sampled.Line;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private LineItemMapper lineItemMapper;
    @Autowired
    private SequenceMapper sequenceMapper;
    @Autowired
    private OrderStatusMapper orderStatusMapper;


    @Override
    public CommonResponse<List<Orders>>  getOrdersByUsername(String username) {
        QueryWrapper<Orders> ordersQueryWrapper= new QueryWrapper<>();
        ordersQueryWrapper.eq("userid",username);
        List<Orders> ordersList = ordersMapper.selectList(ordersQueryWrapper);
        if(ordersList.isEmpty()){
            return CommonResponse.creatForSuccessMessage("该用户下没有订单");
        }
        return CommonResponse.creatForSuccess(ordersList);
    }

    @Override
    public CommonResponse<OrderVO> getOrder(int orderId) {
        OrderVO orderVO = new OrderVO();
        Orders orders = ordersMapper.selectById(orderId);
        OrderStatus orderStatus = orderStatusMapper.selectById(orderId);
        orderVO=entityToVO(orders,orderStatus);
        if(orderVO==null){
            return CommonResponse.creatForSuccessMessage("该订单号不存在");
        }
        return CommonResponse.creatForSuccess(orderVO);
    }

    @Override
    public void insertOrder(Orders orders,List<LineItem>lineItemList) {
        orders.setOrderId(getNextId("ordernum"));
        OrderStatus orderStatus = new OrderStatus();
        orderStatus.setOrderid(orders.getOrderId());
        orderStatus.setLinenum(lineItemList.size());
        orderStatus.setTimestamp(orders.getOrderDate());
        orderStatus.setStatus("p");
        orderStatusMapper.insert(orderStatus);
        for (int i=0;i<lineItemList.size();i++){
            LineItem lineItem = lineItemList.get(i);
            lineItem.setOrderId(orders.getOrderId());
            lineItem.setLineNumber(i+1);
            lineItemMapper.insert(lineItem);
        }
        ordersMapper.insert(orders);

    }

    private OrderVO entityToVO(Orders orders, OrderStatus orderStatus){
        OrderVO orderVO = new OrderVO();
        orderVO.setOrderId(orders.getOrderId());
        orderVO.setUsername(orders.getUsername());
        orderVO.setOrderDate(orders.getOrderDate());
        orderVO.setShipAddress1(orders.getShipAddress1());
        orderVO.setShipAddress2(orders.getShipAddress2());
        orderVO.setShipCity(orders.getShipCity());
        orderVO.setShipState(orders.getShipState());
        orderVO.setShipZip(orders.getShipZip());
        orderVO.setShipCountry(orders.getShipCountry());
        orderVO.setShipToFirstName(orders.getShipToFirstName());
        orderVO.setShipToLastName(orders.getShipToLastName());
        orderVO.setBillAddress1(orders.getBillAddress1());
        orderVO.setBillAddress2(orders.getBillAddress2());
        orderVO.setBillCity(orders.getBillCity());
        orderVO.setBillState(orders.getBillState());
        orderVO.setBillZip(orders.getBillZip());
        orderVO.setBillCountry(orders.getBillCountry());
        orderVO.setBillToFirstName(orders.getBillToFirstName());
        orderVO.setBillToLastName(orders.getBillToLastName());
        orderVO.setCourier(orders.getCourier());
        orderVO.setTotalPrice(orders.getTotalPrice());
        orderVO.setCreditCard(orders.getCreditCard());
        orderVO.setExpiryDate(orders.getExpiryDate());
        orderVO.setCardType(orders.getCardType());
        orderVO.setLocale(orders.getLocale());
        orderVO.setStatus(orderStatus.getStatus());

        QueryWrapper<LineItem> lineItemQueryWrapper = new QueryWrapper<>();
        lineItemQueryWrapper.eq("orderid",orders.getOrderId());
        List<LineItem> lineItemList = lineItemMapper.selectList(lineItemQueryWrapper);
        orderVO.setLineItemList(lineItemList);

        return orderVO;
    }

    public int getNextId(String name) {
        Sequence sequence = sequenceMapper.selectById(name);
        if (sequence == null) {
            throw new RuntimeException("Error: A null sequence was returned from the database (could not get next " + name
                    + " sequence).");
        }
        QueryWrapper<Sequence> sequenceQueryWrapper = new QueryWrapper<>();
        sequenceQueryWrapper.eq("name",name);
        sequence.setNextId(sequence.getNextId()+1);
        sequenceMapper.update(sequence,sequenceQueryWrapper);
        return sequence.getNextId();
    }
}
