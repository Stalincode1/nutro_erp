package com.nutro.nutro_delivery.configuration;

import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;

import org.springframework.core.env.Environment;



public class CustomApplicationStartInitialization
        implements ApplicationContextInitializer<ConfigurableApplicationContext> {

    public CustomApplicationStartInitialization() {
        super();
    }

    @Override
    public void initialize(ConfigurableApplicationContext applicationContext) {
        Environment environment = applicationContext.getEnvironment();
    }

}
