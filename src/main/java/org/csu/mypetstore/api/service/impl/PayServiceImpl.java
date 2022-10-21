package org.csu.mypetstore.api.service.impl;

import com.alipay.api.AlipayApiException;
import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.AliPayBean;
import org.csu.mypetstore.api.entity.Alipay;
import org.csu.mypetstore.api.service.PayService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.stream.events.Comment;

@Service("payService")
public class PayServiceImpl implements PayService {
    private static final Logger logger = LoggerFactory.getLogger(PayService.class);

    @Autowired
    private Alipay alipay;

    @Override
    public CommonResponse<String> aliPay(AliPayBean aliPayBean) throws AlipayApiException {
        logger.info("调用支付服务接口...");
        return CommonResponse.creatForSuccess(alipay.pay(aliPayBean));
    }
}
