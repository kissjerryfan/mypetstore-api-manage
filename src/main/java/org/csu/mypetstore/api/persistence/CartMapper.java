package org.csu.mypetstore.api.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.mypetstore.api.entity.CartItem;
import org.springframework.stereotype.Repository;

import java.util.stream.BaseStream;

@Repository
public interface CartMapper extends BaseMapper<CartItem> {
}
