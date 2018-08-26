CREATE TABLE appointment
(
    book_id BIGINT NOT NULL
    COMMENT '图书ID',
    student_id BIGINT NOT NULL
    COMMENT '学号',
    appoint_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
    ON UPDATE CURRENT_TIMESTAMP
    COMMENT '预约时间',
    PRIMARY KEY (book_id, student_id)
)
    COMMENT '预约图书表'
    ENGINE = InnoDB;

CREATE INDEX idx_appoint_time
    ON appointment (appoint_time);

CREATE TABLE book
(
    book_id BIGINT AUTO_INCREMENT
    COMMENT '图书ID'
        PRIMARY KEY,
    name VARCHAR(100) NOT NULL
    COMMENT '图书名称',
    introd VARCHAR(1000) NOT NULL
    COMMENT '简介',
    number INT NOT NULL
    COMMENT '馆藏数量'
)
    COMMENT '图书表'
    ENGINE = InnoDB;

CREATE TABLE student
(
    student_id BIGINT NOT NULL
    COMMENT '学生ID'
        PRIMARY KEY,
    password BIGINT NOT NULL
    COMMENT '密码'
)
    COMMENT '学生统计表'
    ENGINE = InnoDB;