package org.outdu.outduconfigserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class OutduConfigServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(OutduConfigServerApplication.class, args);
    }

}
