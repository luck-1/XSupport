package com.xsupport.system.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import java.util.concurrent.Executors;

/**
 * @author lxc
 * @date 2019/4/28
 * @description
 */
@EnableAsync
@Configuration
public class AsyncTaskConfig implements SchedulingConfigurer {

    private static final int MAX_POOL = 5;

    @Override
    public void configureTasks(ScheduledTaskRegistrar scheduledTaskRegistrar) {
        scheduledTaskRegistrar.setScheduler(Executors.newScheduledThreadPool(MAX_POOL));
    }
}
