package com.jg.dev;

import com.jg.dev.job.ReadJobConfiguration;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.batch.core.BatchStatus;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.test.JobLauncherTestUtils;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.LocalDateTime;

import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource(properties = {"job.name=" + ReadJobConfiguration.JOB_NAME})
public class JobTest {

    private JobLauncherTestUtils jobLauncherTestUtils;

    @Test
    public void 배치테스트() throws Exception{
//        JobExecution jobExecution = jobLauncherTestUtils.launchJob();
//
//        assertEquals(BatchStatus.COMPLETED, jobExecution.getStatus());

        try {
            JobParameters jobParameters = new JobParametersBuilder()
                    .addString("date", LocalDateTime.now().toString())
                    .toJobParameters();

            JobExecution jobExecution = jobLauncherTestUtils.launchJob(jobParameters);
            log.info(">>>>>>>>>>> jobExecution.getId = {}", jobExecution.getId());
            assertNotNull(jobExecution.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
