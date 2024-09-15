package com.nutro.nutro_delivery;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import com.nutro.nutro_delivery.configuration.CustomApplicationStartInitialization;

@SpringBootApplication
public class NutroDeliveryApplication {

	public static void main(String[] args) {
		new SpringApplicationBuilder(NutroDeliveryApplication.class)
				.initializers(new CustomApplicationStartInitialization()).run(args);

		System.out.println("Nutro Delivery");
	}

}
