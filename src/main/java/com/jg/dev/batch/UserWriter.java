package com.jg.dev.batch;

import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.item.ItemWriter;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
public class UserWriter implements ItemWriter {

    @Override
    public void write(List list) throws Exception {
        log.info(">>>>>> write()");
        log.info(">>>>>> list = {}", list);
    }
}
