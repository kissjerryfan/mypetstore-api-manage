package org.csu.mypetstore.api.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.csu.mypetstore.api.common.CommonResponse;
import org.csu.mypetstore.api.entity.Account;
import org.csu.mypetstore.api.entity.BannerData;
import org.csu.mypetstore.api.entity.Profile;
import org.csu.mypetstore.api.entity.SignOn;
import org.csu.mypetstore.api.persistence.AccountMapper;
import org.csu.mypetstore.api.persistence.BannnerDataMapper;
import org.csu.mypetstore.api.persistence.ProfileMapper;
import org.csu.mypetstore.api.persistence.SignOnMapper;
import org.csu.mypetstore.api.service.AccountService;
import org.csu.mypetstore.api.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountMapper accountMapper;
    @Autowired
    private BannnerDataMapper bannnerDataMapper;
    @Autowired
    private ProfileMapper profileMapper;
    @Autowired
    private SignOnMapper signOnMapper;

    @Override
    public CommonResponse<AccountVO> getAccount(String username, String password) {
        QueryWrapper<SignOn> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",username);
        queryWrapper.eq("password",password);
        SignOn signOn = signOnMapper.selectOne(queryWrapper);
        if(signOn == null) {
            return CommonResponse.creatForError("用户名或密码不正确");
        }
        return getAccount(username);
    }

    @Override
    public CommonResponse<AccountVO> getAccount(String username) {
        Account account = accountMapper.selectById(username);
        Profile profile = profileMapper.selectById(username);
        BannerData bannerData = bannnerDataMapper.selectById(profile.getFavouriteCategoryId());
        if(account == null) {
            CommonResponse.creatForError("获取用户信息失败");
        }
        AccountVO accountVO = entityToVO(account,profile,bannerData);
        return CommonResponse.creatForSuccess(accountVO);
    }

    @Override
    public CommonResponse<String> insertAccount(Account account,Profile profile,SignOn signOn) {
        //判断账号在数据库中是否已存在
        Account userAccount=accountMapper.selectById(account.getUsername());
        if(userAccount!=null){
            return CommonResponse.creatForError("账户已存在");
        }
        //对数据库插入操作
        accountMapper.insert(account);
        profileMapper.insert(profile);
        signOnMapper.insert(signOn);
        return CommonResponse.creatForSuccessMessage("账户创建成功");
    }

    @Override
    public CommonResponse<Account> existAccount(String username) {
        Account account = accountMapper.selectById(username);
        return CommonResponse.creatForSuccess(account);
    }

    @Override
    public CommonResponse<AccountVO> updateAccounnt(String id,Account account, Profile profile, SignOn signOn) {
        //对数据库更新操作
        QueryWrapper<Account> accountQueryWrapper = new QueryWrapper<>();
        accountQueryWrapper.eq("userid",id);
        accountMapper.update(account,accountQueryWrapper);

        QueryWrapper<Profile> profileQueryWrapper = new QueryWrapper<>();
        profileQueryWrapper.eq("userid",id);
        profileMapper.update(profile,profileQueryWrapper);

        QueryWrapper<SignOn> signOnQueryWrapper = new QueryWrapper<>();
        signOnQueryWrapper.eq("username",id);
        signOnMapper.update(signOn,signOnQueryWrapper);

        BannerData bannerData = new BannerData();
        AccountVO accountVO = new AccountVO();
        if(profile.getBannerOption()==1) {
            accountVO.setFavouriteCategoryId(profile.getFavouriteCategoryId());
            accountVO.setBannerName(bannerData.getBannerName());
        } else {
            accountVO.setFavouriteCategoryId("");
            accountVO.setBannerName("");
        }

        accountVO=entityToVO(account,profile,bannerData);
        return CommonResponse.creatForSuccess(accountVO);
    }

    private AccountVO entityToVO(Account account,Profile profile,BannerData bannerData) {
        AccountVO accountVO = new AccountVO();
        accountVO.setUsername(account.getUsername());
        accountVO.setPassword("");
        accountVO.setEmail(account.getEmail());
        accountVO.setFirstName(account.getFirstName());
        accountVO.setLastName(account.getLastName());
        accountVO.setStatus(account.getStatus());
        accountVO.setAddress1(account.getAddress1());
        accountVO.setAddress2(account.getAddress2());
        accountVO.setCity(account.getCity());
        accountVO.setState(account.getState());
        accountVO.setCountry(account.getCountry());
        accountVO.setZip(account.getZip());
        accountVO.setPhone(account.getPhone());

        accountVO.setLanguagePreference(profile.getLanguagePreference());
        accountVO.setBannerOption(profile.getBannerOption()==1);
        accountVO.setListOption(profile.getListOption()==1);
        if(profile.getBannerOption()==1) {
            accountVO.setFavouriteCategoryId(profile.getFavouriteCategoryId());
            accountVO.setBannerName(bannerData.getBannerName());
        } else {
            accountVO.setFavouriteCategoryId("");
            accountVO.setBannerName("");
        }
        return accountVO;
    }
}
