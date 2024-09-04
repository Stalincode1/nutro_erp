package com.nutro.nutro_delivery;

import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.slf4j.Logger;
import com.nutro.nutro_delivery.configuration.CustomApplicationStartInitialization;
import com.nutro.nutro_delivery.constant.Constants;

@SpringBootApplication
public class NutroDeliveryApplication {

	public static void main(String[] args) {
		new SpringApplicationBuilder(NutroDeliveryApplication.class)
				.initializers(new CustomApplicationStartInitialization()).run(args);
		System.out.println("Nutro Delivery");
		Constants.logger.info("successfully Logger Added");

	}

}
