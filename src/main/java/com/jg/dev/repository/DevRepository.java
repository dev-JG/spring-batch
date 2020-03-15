package com.jg.dev.repository;

import com.jg.dev.model.User;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@RequiredArgsConstructor
@Repository
public class DevRepository {

    protected static final String NAMESPACE = "com.jg.dev.batch.";

    private final SqlSession sqlSession;

    public List<User> selectList(){
        return sqlSession.selectList(NAMESPACE + "selectList");
    }
}
