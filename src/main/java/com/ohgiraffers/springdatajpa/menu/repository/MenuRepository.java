package com.ohgiraffers.springdatajpa.menu.repository;

import com.ohgiraffers.springdatajpa.menu.entity.Menu;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/* <엔티티, Id타입> */
public interface MenuRepository extends JpaRepository<Menu, Integer> {

    /* 파라미터로 전달 받은 가격을 초과하는 메뉴 목록 조회 */
    List<Menu> findByMenuPriceGreaterThan(Integer menuPrice);

    /* 가격 초과 메뉴 목록 가격순 조회 */
    List<Menu> findByMenuPriceGreaterThanOrderByMenuPrice(Integer menuPrice);

    /* 가격을 초과 메뉴 목록 정렬 기준 조회 */
    List<Menu> findByMenuPriceGreaterThan(Integer menuPrice, Sort sort);

}
