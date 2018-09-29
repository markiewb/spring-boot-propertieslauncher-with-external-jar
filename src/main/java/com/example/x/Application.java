package com.example.x;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

import java.lang.reflect.Constructor;

@SpringBootApplication
public class Application
{

    public static void main(String[] args)
    {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public CommandLineRunner commandLineRunner(ApplicationContext ctx)
    {
        return args ->
        {
            System.out.println("Try to use external driver");

            Class<?> aClass = Class.forName("org.h2.Driver");

            Constructor c = aClass.getConstructor();
            java.sql.Driver driver = (java.sql.Driver) c.newInstance();

            System.out.println("-------------> Found driver h2 " + driver.getMajorVersion() + "." +driver.getMinorVersion());
        };
    }
}
