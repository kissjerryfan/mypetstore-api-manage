package org.csu.mypetstore.api.controller.front;

import com.alipay.api.AlipayApiException;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.AliPayBean;
import org.csu.mypetstore.api.entity.CartItem;
import org.csu.mypetstore.api.entity.LineItem;
import org.csu.mypetstore.api.entity.Orders;
import org.csu.mypetstore.api.service.CartService;
import org.csu.mypetstore.api.service.OrderService;
import org.csu.mypetstore.api.service.PayService;
import org.csu.mypetstore.api.vo.CartVo;
import org.csu.mypetstore.api.vo.OrderVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/orders/")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private CartService cartService;
    @Autowired
    private PayService payService;

    @GetMapping("get/{id}")
    @ResponseBody
    public CommonResponse<List<Orders>> getOrdersByUsername(@PathVariable("id") String username){
        return orderService.getOrdersByUsername(username);
    }

    @GetMapping("{orderid}")
    @ResponseBody
    public CommonResponse<OrderVO> getOrder(@PathVariable("orderid")int orderId){
        return orderService.getOrder(orderId);
    }


    @PostMapping("insert/{id}")
    @ResponseBody
    public CommonResponse<String> insertOrder(
            @PathVariable("id") String username,
            @RequestParam Date orderDate,
            @RequestParam String shipAddress1,
            @RequestParam String shipAddress2,
            @RequestParam String shipCity,
            @RequestParam String shipState,
            @RequestParam String shipZip,
            @RequestParam String shipCountry,
            @RequestParam String shipToFirstName,
            @RequestParam String shipToLastName,
            @RequestParam String billAddress1,
            @RequestParam String billAddress2,
            @RequestParam String billCity,
            @RequestParam String billState,
            @RequestParam String billZip,
            @RequestParam String billCountry,
            @RequestParam String billToFirstName,
            @RequestParam String billToLastName,
            @RequestParam String courier,
            @RequestParam String creditCard,
            @RequestParam String expiryDate,
            @RequestParam String cardType,
            @RequestParam String locale,
            @RequestParam String status
    ){
        Orders orders = new Orders();
        orders.setOrderId(0);
        orders.setUsername(username);
        orders.setOrderDate(orderDate);
        orders.setShipAddress1(shipAddress1);
        orders.setShipAddress2(shipAddress2);
        orders.setShipCity(shipCity);
        orders.setShipCountry(shipCountry);
        orders.setShipState(shipState);
        orders.setShipZip(shipZip);
        orders.setShipToFirstName(shipToFirstName);
        orders.setShipToLastName(shipToLastName);
        orders.setBillAddress1(billAddress1);
        orders.setBillAddress2(billAddress2);
        orders.setBillCity(billCity);
        orders.setBillCountry(billCountry);
        orders.setBillState(billState);
        orders.setBillZip(billZip);
        orders.setBillToFirstName(billToFirstName);
        orders.setBillToLastName(billToLastName);
        orders.setTotalPrice(cartService.returnTotalCost(username).getData());
        orders.setCreditCard("999 999 999");
        orders.setExpiryDate("12/03");
        orders.setCardType("Visa");
        orders.setCourier("UPS");
        orders.setLocale("CA");

        List<LineItem> lineItemList = new ArrayList<>();
        List<CartVo> cartItemList = cartService.getCartListByUsername(username).getData();
        for(int i = 0;i<cartItemList.size();i++){
            LineItem lineItem = new LineItem();
            lineItem.setOrderId(0);//默认初始值
            lineItem.setItemId(cartItemList.get(i).getItemId());
            lineItem.setQuantity(cartItemList.get(i).getQuantity());
            lineItem.setUnitPrice(cartItemList.get(i).getListPrice());
            lineItem.setLineNumber(i);
            lineItemList.add(lineItem);
        }

        orderService.insertOrder(orders,lineItemList);

        return CommonResponse.creatForSuccessMessage("新建订单成功");
    }

    @PostMapping("pay/{orderid}")
    @ResponseBody
    public CommonResponse<String> alipay(@PathVariable("orderid")int orderId,HttpSession session) throws AlipayApiException {
        OrderVO orderVO = orderService.getOrder(orderId).getData();
        AliPayBean alipayBean = new AliPayBean();
        alipayBean.setOut_trade_no(String.valueOf(orderVO.getOrderId()));
        alipayBean.setSubject(String.valueOf(orderVO.getOrderId()));
        alipayBean.setTotal_amount(String.valueOf(orderVO.getTotalPrice().multiply(BigDecimal.valueOf(6))));
        alipayBean.setBody(String.valueOf(orderVO.getOrderId()));

        return payService.aliPay(alipayBean);
    }

}
