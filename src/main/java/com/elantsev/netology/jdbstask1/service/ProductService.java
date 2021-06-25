package com.elantsev.netology.jdbstask1.service;

import com.elantsev.netology.jdbstask1.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public String getProductName(String name) {
        return productRepository.getProductName(name);
    }
}
