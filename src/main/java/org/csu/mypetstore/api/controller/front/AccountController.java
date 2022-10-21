package org.csu.mypetstore.api.controller.front;

import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.common.ResponseCode;
import org.csu.mypetstore.api.entity.Account;
import org.csu.mypetstore.api.entity.BannerData;
import org.csu.mypetstore.api.entity.Profile;
import org.csu.mypetstore.api.entity.SignOn;
import org.csu.mypetstore.api.service.AccountService;
import org.csu.mypetstore.api.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account/")
public class AccountController {
    @Autowired
    private AccountService accountService;

    @PostMapping("login")//登录这里不满足restful api，一般跟用户相关的，统一使用postmapping
    @ResponseBody
    public CommonResponse<AccountVO> login(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session){
        CommonResponse<AccountVO> response = accountService.getAccount(username, password);
        if(response.isSuccess()) {
            session.setAttribute("login_account",response.getData());
        }
        return response;
    }


    @PostMapping("get_login_account_info")
    @ResponseBody
    public CommonResponse<AccountVO> getLoginAccountInfo(HttpSession session) {
        AccountVO loginAccount = (AccountVO)session.getAttribute("login_account");
        if(loginAccount != null) {
            return CommonResponse.creatForSuccess(loginAccount);
        }
        //return CommonResponse.creatForError(ResponseCode.NEED_LOGIN.getCode(),"用户未登录，不能获取用户信息");
        return CommonResponse.creatForError("用户未登录，不能获取用户信息");
    }

    public CommonResponse<Account> existAccount(String username){
        return accountService.existAccount(username);
    }

    @GetMapping("signOff")
    @ResponseBody
    public CommonResponse<String> signOff(HttpSession session){
        AccountVO loginAccount = new AccountVO();
        session.setAttribute("login_account",loginAccount);
        return CommonResponse.creatForSuccessMessage("用户退出登录");
    }

    @PostMapping("register")
    @ResponseBody
    public CommonResponse<String> insertAccount(
            @RequestParam String username,
            @RequestParam String password
            ){
        Account account = new Account();
        SignOn signOn = new SignOn();
        Profile profile = new Profile();
        signOn.setUsername(username);
        signOn.setPassword(password);
        account.setUsername(username);
        account.setFirstName("David");
        account.setLastName("lastname");
        account.setEmail("123456@qq.com");
        account.setPhone("12345678");
        account.setAddress1("cs.road");
        account.setAddress2("");
        account.setCity("CS");
        account.setState("");
        account.setStatus("");
        account.setZip("111111");
        account.setCountry("China");
        profile.setUsername(username);
        profile.setBannerOption(1);
        profile.setListOption(1);
        profile.setLanguagePreference("Chinese");
        profile.setFavouriteCategoryId("BIRDS");

        return accountService.insertAccount(account,profile,signOn);
    }

    @PostMapping("edit/{id}")
    @ResponseBody
    public CommonResponse<AccountVO> updateAccount(
            @PathVariable("id") String id,
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam String email,
            @RequestParam String phone,
            @RequestParam String address1,
            @RequestParam String address2,
            @RequestParam String city,
            @RequestParam String state,
            @RequestParam String status,
            @RequestParam String zip,
            @RequestParam String country,
            @RequestParam String languagePreference,
            @RequestParam String favouriteCategoryId,
            @RequestParam int bannerOption,
            @RequestParam int listOption,
            HttpSession session){
        AccountVO loginAccount = (AccountVO)session.getAttribute("login_account");
        Account account = new Account();
        Profile profile = new Profile();
        SignOn signOn = new SignOn();
        signOn.setUsername(username);
        signOn.setPassword(password);
        account.setUsername(username);
        account.setFirstName(firstName);
        account.setLastName(lastName);
        account.setEmail(email);
        account.setPhone(phone);
        account.setAddress1(address1);
        account.setAddress2(address2);
        account.setCity(city);
        account.setState(state);
        account.setStatus(status);
        account.setZip(zip);
        account.setCountry(country);
        profile.setUsername(username);
        profile.setBannerOption(bannerOption);
        profile.setListOption(listOption);
        profile.setLanguagePreference(languagePreference);
        profile.setFavouriteCategoryId(favouriteCategoryId);

        if(signOn.getPassword()==null){
            return CommonResponse.creatForError(ResponseCode.ERROR.getCode(), "密码不能为空");
        }
        CommonResponse<AccountVO> response = accountService.updateAccounnt(id,account,profile,signOn);
        session.setAttribute("login_account",response.getData());
        return response;
    }

    @PostMapping("logout")
    @ResponseBody
    public CommonResponse<String> logout(HttpSession session) {
        AccountVO loginAccount = (AccountVO)session.getAttribute("login_account");
        if(loginAccount != null) {
            session.removeAttribute("login_account");
            return CommonResponse.creatForSuccessMessage("成功退出登录");
        }
//        return CommonResponse.creatForError(ResponseCode.NEED_LOGIN.getCode(),"用户未登录，不能获取用户信息");
        return CommonResponse.creatForError("用户未登录，不用退出登录状态");
    }

}
