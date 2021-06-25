package com.elantsev.netology.jdbstask1.repository;

import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.stream.Collectors;

@Repository
public class ProductRepository {
    private final JdbcTemplate jdbcTemplate;
    private static final String SCRIPT_PATH = "getProductNames.sql";

    public ProductRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public String getProductName(String name) {
        var script = read(SCRIPT_PATH);
        var resultString = new StringBuffer(" Список товаров, заказаных пользователем ")
                .append(name)
                .append(": ");

        SqlRowSet resultSet = jdbcTemplate.queryForRowSet(script, name);
        while (resultSet.next()) {
            resultString.append(resultSet.getString("product_name"))
                    .append(" ");
        }
        return resultString.toString().trim();
    }

    private static String read(String scriptFileName) {
        try (InputStream is = new ClassPathResource(scriptFileName).getInputStream();
             BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is))) {
            return bufferedReader.lines().collect(Collectors.joining("\n"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
