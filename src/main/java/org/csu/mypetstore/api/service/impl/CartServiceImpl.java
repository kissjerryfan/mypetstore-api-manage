package org.csu.mypetstore.api.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.CartItem;
import org.csu.mypetstore.api.entity.Item;
import org.csu.mypetstore.api.entity.Product;
import org.csu.mypetstore.api.persistence.CartMapper;
import org.csu.mypetstore.api.persistence.ItemMapper;
import org.csu.mypetstore.api.persistence.ProductMapper;
import org.csu.mypetstore.api.service.CartService;
import org.csu.mypetstore.api.vo.CartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.io.Console;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Service("cartService")
public class CartServiceImpl implements CartService {
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ItemMapper itemMapper;

    @Override
    public CommonResponse<List<CartVo>> getCartListByUsername(String username) {
        QueryWrapper<CartItem> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("username",username);
        List<CartItem> cartItemList=cartMapper.selectList(queryWrapper);
        if(cartItemList.isEmpty()){
            return CommonResponse.creatForSuccessMessage("当前用户购物车为空");
        }
        List<CartVo> cartVoList=new ArrayList<>();
        for(CartItem cartItem:cartItemList){
            Item item=itemMapper.selectById(cartItem.getItemId());
            Product product=productMapper.selectById(item.getProductId());
            CartVo cartVo=entityToCartVo(cartItem,item,product);
            cartVoList.add(cartVo);
        }
        return CommonResponse.creatForSuccess(cartVoList);
    }

    @Override
    public CommonResponse<List<CartVo>> removeItemByItemId(String username,String itemId) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("username", username);
        map.put("itemid", itemId);
        int result=cartMapper.deleteByMap(map);
        return getCartListByUsername(username);
    }

    @Override
    public CommonResponse<List<CartVo>> updateCart(String username) {
        return getCartListByUsername(username);
    }

    @Override
    public CommonResponse<List<CartVo>> updateNum(String username, String itemId,int quantity) {
        CartItem cartItem=selectItemByUsernameAndItemId(username,itemId);
        cartItem.setQuantity(quantity);
        Item item=itemMapper.selectById(itemId);
        BigDecimal total=new BigDecimal(0);
        for(int i=0;i<quantity;i++){
            total=total.add(item.getListPrice());
        }
        cartItem.setTotalCost(total);
        QueryWrapper<CartItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",username).eq("itemid",itemId);
        cartMapper.update(cartItem,queryWrapper);
        return getCartListByUsername(username);
    }

    @Override
    public CommonResponse<List<CartVo>> addItem(String username, String itemId) {
        CartItem inCartItem=selectItemByUsernameAndItemId(username, itemId);
        Item item=itemMapper.selectById(itemId);
        if(inCartItem!=null){
            int quantity=inCartItem.getQuantity();
            quantity++;
            inCartItem.setQuantity(quantity);
            inCartItem.setTotalCost(inCartItem.getTotalCost().add(item.getListPrice()));
            QueryWrapper<CartItem> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("username",username).eq("itemid",itemId);
            cartMapper.update(inCartItem,queryWrapper);
            return getCartListByUsername(username);
        }
        CartItem cartItem=new CartItem();
        cartItem.setUsername(username);
        cartItem.setItemId(itemId);
        cartItem.setPay(false);
        cartItem.setInStock(true);
        cartItem.setQuantity(1);
        cartItem.setTotalCost(item.getListPrice());
        cartMapper.insert(cartItem);
        return getCartListByUsername(username);
    }

    @Override
    public CommonResponse<List<CartVo>> clearCart(String username) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("username", username);
        cartMapper.deleteByMap(map);
        QueryWrapper<CartItem> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("username",username);
        List<CartItem> cartItemList=cartMapper.selectList(queryWrapper);
        if(cartItemList.isEmpty()){
            return CommonResponse.creatForSuccessMessage("已成功清空购物车");
        }
        return getCartListByUsername(username);
    }

    @Override
    public CommonResponse<BigDecimal> returnTotalCost(String username) {
        QueryWrapper<CartItem> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("username",username);
        List<CartItem> cartItemList= cartMapper.selectList(queryWrapper);
        BigDecimal total = new BigDecimal(0);
        for(CartItem cartItem:cartItemList){
            total=total.add(cartItem.getTotalCost());
        }
        return CommonResponse.creatForSuccess(total);
    }

    public CartItem selectItemByUsernameAndItemId(String username,String itemId){
        QueryWrapper<CartItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",username).eq("itemid",itemId);
        CartItem cartItem=cartMapper.selectOne(queryWrapper);
        return cartItem;
    }

    public CartVo entityToCartVo(CartItem cartItem,Item item,Product product){
        //cartItem
        CartVo cartVo=new CartVo();
        cartVo.setUsername(cartItem.getUsername());
        cartVo.setItemId(cartItem.getItemId());
        cartVo.setInStock(cartItem.isInStock());
        cartVo.setTotalCost(cartItem.getTotalCost());
        cartVo.setQuantity(cartItem.getQuantity());
        cartVo.setPay(cartItem.isPay());
        //Item
        cartVo.setProductId(item.getProductId());
        cartVo.setListPrice(item.getListPrice());
        cartVo.setAttribute1(item.getAttribute1());

        //product
        cartVo.setName(product.getName());

        return cartVo;
    }
}
