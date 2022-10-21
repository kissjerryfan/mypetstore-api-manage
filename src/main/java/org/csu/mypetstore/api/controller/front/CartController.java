package org.csu.mypetstore.api.controller.front;


import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.CartItem;
import org.csu.mypetstore.api.entity.Category;
import org.csu.mypetstore.api.service.CartService;
import org.csu.mypetstore.api.vo.AccountVO;
import org.csu.mypetstore.api.vo.CartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/cart/")
public class CartController {
    @Autowired
    private CartService cartService;

    @GetMapping("cartView/{id}")
    @ResponseBody
    public CommonResponse<List<CartVo>> getCartListByUsername(@PathVariable("id")String username){
        return cartService.getCartListByUsername(username);
    }

    @GetMapping("user_cartView")
    @ResponseBody
    public CommonResponse<List<CartVo>> getCartListByLoginUser(HttpSession session){
        AccountVO accountVO=(AccountVO) session.getAttribute("login_account");
        if(accountVO!=null){
            return cartService.getCartListByUsername(accountVO.getUsername());
        }
        return CommonResponse.creatForError("用户未登录，请先登录");
    }

    @GetMapping("removeItem/{itemId}")
    @ResponseBody
    public CommonResponse<List<CartVo>> removeItemByItemId(@PathVariable("itemId")String itemId,HttpSession session){
        AccountVO accountVO=(AccountVO) session.getAttribute("login_account");
        if(accountVO!=null){
            return cartService.removeItemByItemId(accountVO.getUsername(),itemId);
        }
        return CommonResponse.creatForError("用户未登录，请先登录");
    }

    @GetMapping("updateCart")
    @ResponseBody
    public CommonResponse<List<CartVo>> updateCart(HttpSession session){
        AccountVO accountVO=(AccountVO) session.getAttribute("login_account");
        if(accountVO!=null){
            return cartService.updateCart(accountVO.getUsername());
        }
        return CommonResponse.creatForError("用户未登录，请先登录");
    }

    @PostMapping("updateNum/{itemId}/{quantity}")
    @ResponseBody
    public CommonResponse<List<CartVo>> updateNum(@PathVariable("quantity") int quantity, @PathVariable("itemId")String itemId,HttpSession session){
        AccountVO accountVO=(AccountVO) session.getAttribute("login_account");
        if(accountVO!=null){
            return cartService.updateNum(accountVO.getUsername(),itemId,quantity);
        }
        return CommonResponse.creatForError("用户未登录，请先登录");
    }

    @PostMapping("addItem/{itemId}")
    @ResponseBody
    public CommonResponse<List<CartVo>> addItem(@PathVariable("itemId")String itemId,HttpSession session){
        AccountVO accountVO=(AccountVO) session.getAttribute("login_account");
        if(accountVO!=null){
            return cartService.addItem(accountVO.getUsername(),itemId);
        }
        return CommonResponse.creatForError("用户未登录，请先登录");
    }

    @PostMapping("clearCart")
    @ResponseBody
    public CommonResponse<List<CartVo>> clearCart(HttpSession session){
        AccountVO accountVO=(AccountVO) session.getAttribute("login_account");
        if(accountVO!=null){
            return cartService.clearCart(accountVO.getUsername());
        }
        return CommonResponse.creatForError("用户未登录，请先登录");
    }

    @GetMapping("returnTotalCost")
    @ResponseBody
    public CommonResponse<BigDecimal> returnTotalCost(HttpSession session){
        AccountVO accountVO=(AccountVO) session.getAttribute("login_account");
        if(accountVO!=null){
            return cartService.returnTotalCost(accountVO.getUsername());
        }
        return CommonResponse.creatForError("用户未登录，请先登录");
    }
}
