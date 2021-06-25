package com.elantsev.netology.jdbstask1.service;

import com.elantsev.netology.jdbstask1.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public String getProductName(String name){
        List<Map<String, Object>> list = productRepository.getProductName(name);
        StringBuilder sBuilder = new StringBuilder(" Список товаров, заказаных пользователем ")
                .append(name)
                .append(": ");
        for (Map<String, Object> map: list) {
            sBuilder.append(map.get("product_name"))
                    .append(" ");
        }
        return sBuilder.toString().trim();
    }
}
