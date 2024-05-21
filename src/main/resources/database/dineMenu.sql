-- 데이터 베이스 생성
CREATE DATABASE dineMenu;
show databases;
GRANT ALL PRIVILEGES ON dineMenu.* TO 'ohgiraffers'@'%';
show grants for 'ohgiraffers'@'%';

-- 테이블 생성
CREATE TABLE IF NOT EXISTS dine_category
(
    category_code    INT AUTO_INCREMENT COMMENT '카테고리코드',
    category_name    VARCHAR(30) NOT NULL COMMENT '카테고리명',
    ref_category_code    INT COMMENT '상위카테고리코드',
    CONSTRAINT pk_category_code PRIMARY KEY (category_code),
    CONSTRAINT fk_ref_category_code FOREIGN KEY (ref_category_code) REFERENCES dine_category (category_code)
) ENGINE=INNODB COMMENT '카테고리';

CREATE TABLE IF NOT EXISTS dine_menu
(
    menu_code    INT AUTO_INCREMENT COMMENT '메뉴코드',
    menu_name    VARCHAR(30) NOT NULL COMMENT '메뉴명',
    menu_price    INT NOT NULL COMMENT '메뉴가격',
    category_code    INT NOT NULL COMMENT '카테고리코드',
    orderable_status    CHAR(1) NOT NULL COMMENT '주문가능상태',
    CONSTRAINT pk_menu_code PRIMARY KEY (menu_code),
    CONSTRAINT fk_category_code FOREIGN KEY (category_code) REFERENCES dine_category (category_code)
) ENGINE=INNODB COMMENT '메뉴';

CREATE TABLE IF NOT EXISTS dine_order
(
    order_code    INT AUTO_INCREMENT COMMENT '주문코드',
    order_date    DATE NOT NULL COMMENT '주문일자',
    order_time    TIME NOT NULL COMMENT '주문시간',
    total_order_price    INT NOT NULL COMMENT '총주문금액',
    CONSTRAINT pk_order_code PRIMARY KEY (order_code)
) ENGINE=INNODB COMMENT '주문';

CREATE TABLE IF NOT EXISTS dine_order_menu
(
    order_code INT COMMENT '주문코드',
    menu_code    INT COMMENT '메뉴코드',
    order_amount    INT NOT NULL COMMENT '주문수량',
    CONSTRAINT pk_comp_order_menu_code PRIMARY KEY (order_code, menu_code),
    CONSTRAINT fk_order_menu_order_code FOREIGN KEY (order_code) REFERENCES dine_order (order_code),
    CONSTRAINT fk_order_menu_menu_code FOREIGN KEY (menu_code) REFERENCES dine_menu (menu_code)
) ENGINE=INNODB COMMENT '주문별메뉴';

CREATE TABLE IF NOT EXISTS dine_payment
(
    payment_code    INT AUTO_INCREMENT COMMENT '결제코드',
    payment_date    DATE NOT NULL COMMENT '결제일',
    payment_time    TIME NOT NULL COMMENT '결제시간',
    payment_price    INT NOT NULL COMMENT '결제금액',
    payment_type    VARCHAR(20) NOT NULL COMMENT '결제구분',
    CONSTRAINT pk_payment_code PRIMARY KEY (payment_code)
) ENGINE=INNODB COMMENT '결제';

CREATE TABLE IF NOT EXISTS dine_payment_order
(
    order_code    INT NOT NULL COMMENT '주문코드',
    payment_code    INT NOT NULL COMMENT '결제코드',
    CONSTRAINT pk_comp_payment_order_code PRIMARY KEY (payment_code, order_code),
    CONSTRAINT fk_payment_order_order_code FOREIGN KEY (order_code) REFERENCES dine_order (order_code),
    CONSTRAINT fk_payment_order_payment_code FOREIGN KEY (payment_code) REFERENCES dine_payment (payment_code)
) ENGINE=INNODB COMMENT '결제별주문';

-- 데이터 추가
-- 여기에 데이터 추가하는 INSERT 문을 추가하세요.

COMMIT;
