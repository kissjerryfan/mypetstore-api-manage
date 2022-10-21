package org.csu.mypetstore.api;

import org.csu.mypetstore.api.persistence.CategoryMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("org.csu.mypetstore.api.persistence")
public class MypetstoreApiManageApplication {

    public static void main(String[] args) {
        SpringApplication.run(MypetstoreApiManageApplication.class, args);
    }

}
