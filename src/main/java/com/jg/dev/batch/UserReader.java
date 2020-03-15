package com.jg.dev.batch;

import com.jg.dev.model.User;
import com.jg.dev.repository.DevRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.NonTransientResourceException;
import org.springframework.batch.item.ParseException;
import org.springframework.batch.item.UnexpectedInputException;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class UserReader implements ItemReader {

    private final DevRepository devRepository;

    /**
     * 값이 없을경우 null을 리턴해줘야 무한반복에 빠지지 않는듯
     * */
    @Override
    public Object read() throws Exception, UnexpectedInputException, ParseException, NonTransientResourceException {
        log.info(">>>>>> read()");
        List<User> userList = devRepository.selectList();
        log.info(">>>>>> userList = {}", userList);

        return userList;
    }
}
