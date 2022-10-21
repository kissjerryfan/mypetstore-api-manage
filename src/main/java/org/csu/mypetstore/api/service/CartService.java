package org.csu.mypetstore.api.service;

import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.CartItem;
import org.csu.mypetstore.api.vo.CartVo;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

public interface CartService {
    CommonResponse<List<CartVo>> getCartListByUsername(String username);
    CommonResponse<List<CartVo>> removeItemByItemId(String username,String itemId);
    CommonResponse<List<CartVo>> updateCart(String username);
    CommonResponse<List<CartVo>> updateNum(String username,String itemId,int quantity);
    CommonResponse<List<CartVo>> addItem(String username,String itemId);
    CommonResponse<List<CartVo>> clearCart(String username);
    CommonResponse<BigDecimal> returnTotalCost(String username);
}
