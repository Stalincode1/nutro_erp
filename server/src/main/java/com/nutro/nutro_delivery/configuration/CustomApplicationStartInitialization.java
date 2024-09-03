package com.nutro.nutro_delivery.configuration;

import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;

import org.springframework.core.env.Environment;

import com.nutro.nutro_delivery.constant.Constants;

public class CustomApplicationStartInitialization
        implements ApplicationContextInitializer<ConfigurableApplicationContext> {

    public CustomApplicationStartInitialization() {
        super();
    }

    @Override
    public void initialize(ConfigurableApplicationContext applicationContext) {
        Environment environment = applicationContext.getEnvironment();

        String appName = environment.getProperty("spring.application.name");
        String profile = environment.getActiveProfiles().length > 0 ? environment.getActiveProfiles()[0] : "default";

        Constants.logger.info("Initializing application with the following settings:");
        Constants.logger.info("Application Name: {}", appName);
        Constants.logger.info("Active Profile: {}", profile);
        Constants.logger.info("Log File: {}", environment.getProperty("LOG_FILE"));
        Constants.logger.debug("Log Directory: {}", environment.getProperty("LOG_DIR"));
    }

}
