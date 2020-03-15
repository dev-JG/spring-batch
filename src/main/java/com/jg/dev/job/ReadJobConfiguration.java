package com.jg.dev.job;

import com.jg.dev.batch.UserProcessor;
import com.jg.dev.batch.UserReader;
import com.jg.dev.batch.UserWriter;
import com.jg.dev.listener.UserListener;
import com.jg.dev.model.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.support.RunIdIncrementer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@RequiredArgsConstructor
@EnableBatchProcessing
@Configuration
public class ReadJobConfiguration {

    public static final String JOB_NAME = "readJob";

    private final JobBuilderFactory jobBuilderFactory;
    private final StepBuilderFactory stepBuilderFactory;

    private final UserListener userListener;
    private final UserReader userReader;
    private final UserProcessor userProcessor;
    private final UserWriter userWriter;

    @Bean
    public Job readJob() {
        return jobBuilderFactory.get(JOB_NAME)
                .listener(userListener)
                .start(step())
                .incrementer(new RunIdIncrementer())
                .build();
    }

    @Bean
    public Step step() {
        return stepBuilderFactory.get("step")
                .<User, String>chunk(1)
                .reader(userReader)
                .processor(userProcessor)
                .writer(userWriter)
                .build();
    }
}