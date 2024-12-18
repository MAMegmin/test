package com.xq.tmall.service.impl;

import com.xq.tmall.dao.ReviewMapper;
import com.xq.tmall.entity.Review;
import com.xq.tmall.service.ReviewService;
import com.xq.tmall.util.OrderUtil;
import com.xq.tmall.util.PageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
    private final ReviewMapper reviewMapper;

    @Override
    public boolean add(Review review) {
        return reviewMapper.insertOne(review) > 0;
    }

    @Override
    public boolean update(Review review) {
        return reviewMapper.updateOne(review) > 0;
    }

    @Override
    public boolean deleteList(Integer[] review_id_list) {
        return reviewMapper.deleteList(review_id_list) > 0;
    }

    @Override
    public boolean deleteData(Integer id) {
        return reviewMapper.deleteData(id) > 0;
    }

    @Override
    public List<Review> getList(Review review, OrderUtil orderUtil, PageUtil pageUtil) {
        return reviewMapper.selectReviewList(review, orderUtil, pageUtil);
    }

    @Override
    public List<Review> getListByUserId(Integer user_id, PageUtil pageUtil) {
        return reviewMapper.selectByUserId(user_id, pageUtil);
    }

    @Override
    public List<Review> getListByProductId(Integer product_id, PageUtil pageUtil) {
        return reviewMapper.selectByProductId(product_id, pageUtil);
    }

    @Override
    public Review get(Integer review_id) {
        return reviewMapper.selectOne(review_id);
    }

    @Override
    public Integer getTotal(Review review) {
        return reviewMapper.selectTotal(review);
    }

    @Override
    public Integer getTotalByUserId(Integer user_id) {
        return reviewMapper.selectTotalByUserId(user_id);
    }

    @Override
    public Integer getTotalByProductId(Integer product_id) {
        return reviewMapper.selectTotalByProductId(product_id);
    }

    @Override
    public Integer getTotalByOrderItemId(Integer productOrderItem_id) {
        return reviewMapper.selectTotalByOrderItemId(productOrderItem_id);
    }
}
