package com.jg.dev.batch;

import com.jg.dev.model.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
public class UserProcessor implements ItemProcessor {

    @Override
    public List<User> process(Object o) throws Exception {
        log.info(">>>>>> process()");
        log.info(">>>>>> Object = {}", (List<User>) o);
        return (List<User>) o;
    }
}
