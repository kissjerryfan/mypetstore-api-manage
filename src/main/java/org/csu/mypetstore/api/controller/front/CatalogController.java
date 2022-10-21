package org.csu.mypetstore.api.controller.front;

import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.Category;
import org.csu.mypetstore.api.entity.Item;
import org.csu.mypetstore.api.entity.Product;
import org.csu.mypetstore.api.service.CatalogService;
import org.csu.mypetstore.api.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/catalog/")
public class CatalogController {
    @Autowired
    private CatalogService catalogService;

    @GetMapping("categories")
    @ResponseBody//把Object变为json对象传到前端去，调用的是一个叫做fastjson的插件
    public CommonResponse<List<Category>> getCategoryList() {
        return catalogService.getCategoryList();
    }

    @GetMapping("categories/{id}")
    @ResponseBody//把Object变为json对象传到前端去，调用的是一个叫做fastjson的插件
    public CommonResponse<Category> getCategory(@PathVariable("id") String categoryId) {
        return catalogService.getCategory(categoryId);
    }

    @GetMapping("categories/{id}/products")
    @ResponseBody//把Object变为json对象传到前端去，调用的是一个叫做fastjson的插件
    public CommonResponse<List<Product>> getProdcutListByCategoryId(@PathVariable("id") String categoryId) {
        return catalogService.getProdcutListByCategoryId(categoryId);
    }

    @GetMapping("products/{id}")
    @ResponseBody//把Object变为json对象传到前端去，调用的是一个叫做fastjson的插件
    public CommonResponse<Product> getProductById(@PathVariable("id") String productId) {
        return catalogService.getProductById(productId);
    }

    @GetMapping("products/{id}/items")
    @ResponseBody//把Object变为json对象传到前端去，调用的是一个叫做fastjson的插件
    public CommonResponse<List<ItemVO>> getItemsByProductId(@PathVariable("id") String productId) {
        return catalogService.getItemsByProductId(productId);
    }

    @GetMapping("/items/{id}")
    @ResponseBody//把Object变为json对象传到前端去，调用的是一个叫做fastjson的插件
    public CommonResponse<ItemVO> getItemByItemId(@PathVariable("id") String itemId) {
        return catalogService.getItemById(itemId);
    }

    @PostMapping("search")
    @ResponseBody
    public CommonResponse<List<Product>> getSearchResult(String key){
        return catalogService.searchByKey(key);
    }
}
