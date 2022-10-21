package org.csu.mypetstore.api.controller.front;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayOpenAuthTokenAppRequest;
import com.alipay.api.response.AlipayOpenAuthTokenAppResponse;
import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.Account;
import org.csu.mypetstore.api.entity.BannerData;
import org.csu.mypetstore.api.entity.Profile;
import org.csu.mypetstore.api.entity.SignOn;
import org.csu.mypetstore.api.service.AccountService;
import org.csu.mypetstore.api.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping("/alipay")
public class AlipayController {
    @Autowired
    private AccountService accountService;

    @Value("${app.privateKey}")
    String privateKey;
    @Value("${app.publicKey}")
    String publicKey;
    @Value("${app.appId}")
    String appId;

    @RequestMapping(value = "/auth", method = RequestMethod.GET)
    public Object auth(HttpServletRequest request, HttpServletResponse response, HttpSession session)
        throws UnsupportedEncodingException, AlipayApiException {
        // 获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);

            // 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
            // 支付宝用户号
            String app_id = new String(request.getParameter("app_id").getBytes("ISO-8859-1"), "UTF-8");
            System.out.println("app_id:" + app_id + "\n");

            // 获取第三方登录授权
            String alipay_app_auth = new String(request.getParameter("source").getBytes("ISO-8859-1"), "UTF-8");
            System.out.println("alipay_app_auth:" + alipay_app_auth + "\n");

            // 第三方授权code
            String app_auth_code = new String(request.getParameter("app_auth_code").getBytes("ISO-8859-1"), "UTF-8");// 获的第三方登录用户授权app_auth_code
            System.out.println("app_auth_code:" + app_auth_code + "\n");


            // 支付宝的公钥，不是自己本地生成的公钥

            // 使用auth_code换取接口access_token及用户userId
//             AlipayClient alipayClient = new
//             DefaultAlipayClient("https://openapi.alipay.com/gateway.do","应用APPID",privateKey,"json","UTF-8",publicKey,"RSA2");//正常环境下的网关
            AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipaydev.com/gateway.do",
                    appId, privateKey, "json", "UTF-8", publicKey, "RSA2");// 沙箱下的网关

            AlipayOpenAuthTokenAppRequest requestLogin1 = new AlipayOpenAuthTokenAppRequest();
            requestLogin1.setBizContent(
                    "{" + "\"grant_type\":\"authorization_code\"," + "\"code\":\"" + app_auth_code + "\"" + "}");

            //第三方授权
            AlipayOpenAuthTokenAppResponse responseToken = alipayClient.execute(requestLogin1);
            if (responseToken.isSuccess()) {
                System.out.println("<br/>调用成功" + "\n");

                System.out.println(responseToken.getAuthAppId() + "\n");
                System.out.println(responseToken.getAppAuthToken() + "\n");
                System.out.println(responseToken.getUserId() + "\n");

                String user_id = responseToken.getUserId().substring(12, responseToken.getUserId().length());
                String psw = "123456";
                Account account = accountService.existAccount(user_id).getData();
                AccountVO accountVo = new AccountVO();
                if (account == null) {
                    //register
                    account = new Account();
                    Profile profile = new Profile();
                    SignOn signOn = new SignOn();

                    signOn.setUsername(user_id);
                    signOn.setPassword(psw);
                    account.setUsername(user_id);
                    account.setFirstName("XXX");
                    account.setLastName("XXX");
                    account.setEmail("88888888@qq.com");
                    account.setPhone("888888");
                    account.setAddress1("address1");
                    account.setAddress2("address2");
                    account.setCity("xx");
                    account.setState("x");
                    account.setZip("x");
                    account.setCountry("x");
                    profile.setUsername(user_id);
                    profile.setFavouriteCategoryId("BIRDS");
                    profile.setLanguagePreference("Chinese");

                    //accountVo:
                    accountVo.setUsername(user_id);
                    accountVo.setPassword(psw);
                    accountVo.setUsername(user_id);
                    accountVo.setFirstName("XXX");
                    accountVo.setLastName("XXX");
                    accountVo.setEmail("88888888@qq.com");
                    accountVo.setPhone("888888");
                    accountVo.setAddress1("address1");
                    accountVo.setAddress2("address2");
                    accountVo.setCity("xx");
                    accountVo.setState("x");
                    accountVo.setZip("x");
                    accountVo.setCountry("x");
                    accountVo.setUsername(user_id);
                    accountVo.setFavouriteCategoryId("BIRDS");
                    accountVo.setLanguagePreference("Chinese");
                    accountService.insertAccount(account, profile, signOn);
                    session.setAttribute("login_account",accountVo);
                    return CommonResponse.creatForSuccess("已成功创建新账户");
                } else {
                    accountVo = accountService.getAccount(user_id).getData();
                }
                session.setAttribute("login_account",accountVo);
                return "redirect:http://localhost:8888/view/catalog-main.html";
            }
        }
        return "redirect:http://localhost:8888/view/account-login.html";
    }
}
