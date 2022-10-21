package org.csu.mypetstore.api.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.mypetstore.api.entity.BannerData;
import org.springframework.stereotype.Repository;

@Repository
public interface BannnerDataMapper extends BaseMapper<BannerData> {
}
