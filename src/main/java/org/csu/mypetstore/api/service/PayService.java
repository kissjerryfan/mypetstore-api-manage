package org.csu.mypetstore.api.service;

import com.alipay.api.AlipayApiException;
import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.AliPayBean;
import org.csu.mypetstore.api.entity.Alipay;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public interface PayService {
    public CommonResponse<String> aliPay(AliPayBean aliPayBean) throws AlipayApiException;
}


