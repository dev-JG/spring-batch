package com.jg.dev.jobs;

import com.jg.dev.job.ReadJobConfiguration;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.test.JobLauncherTestUtils;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource(properties = {"job.name=" + ReadJobConfiguration.JOB_NAME})
public class JobTests {

    private JobLauncherTestUtils jobLauncherTestUtils;

    @Test
    public void 배치테스트() throws Exception{
        try {
            JobParameters jobParameters = new JobParametersBuilder()
                    .addString("startTxDate", "2020-03")
                    .addString("nextTxDate", "2020-03-15")
                    .addLong("time", System.currentTimeMillis())
                    .toJobParameters();

            JobExecution jobExecution = jobLauncherTestUtils.launchJob(jobParameters);
            log.info(">>>>>>>>>>> jobExecution.getId = {}", jobExecution.getId());
            assertNotNull(jobExecution.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
