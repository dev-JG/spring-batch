package com.jg.dev.repository;

import com.jg.dev.DevApplicationTests;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

@Slf4j
@RequiredArgsConstructor
public class DevTests extends DevApplicationTests {

    @Autowired
    private DevRepository devRepository;

    @Test
    public void DB_테스트(){
        log.info(">>>>>>>>>>> {}", devRepository.selectList());
    }
}
