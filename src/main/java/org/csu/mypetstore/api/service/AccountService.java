package org.csu.mypetstore.api.service;

import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.Account;
import org.csu.mypetstore.api.entity.BannerData;
import org.csu.mypetstore.api.entity.Profile;
import org.csu.mypetstore.api.entity.SignOn;
import org.csu.mypetstore.api.vo.AccountVO;
import org.springframework.web.bind.annotation.PathVariable;

public interface AccountService {
    CommonResponse<AccountVO> getAccount(String username,String password);
    CommonResponse<AccountVO> getAccount(String username);
    CommonResponse<String> insertAccount (Account account,Profile profile,SignOn signOn);
    CommonResponse<Account> existAccount(String username);
    CommonResponse<AccountVO> updateAccounnt(@PathVariable("id") String id, Account account, Profile profile, SignOn signOn);
}
