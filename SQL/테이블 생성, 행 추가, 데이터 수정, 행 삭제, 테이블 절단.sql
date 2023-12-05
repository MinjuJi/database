/*
1. 테이블 생성하기
    
    CREATE TABLE 테이블 (
        컬럼명 테이터타입,
        컬럼명 데이터타입 제약조건,
        컬럼명 데이터타입(사이즈),
        컬럼명 데이터타입 DEFAULT 기본값
    );

2. 테이블에 행 추가하기
    
    방법1 - 주로 사용하는 방법
        INSERT INTO 테이블명 
        (컬럼명, 컬럼명, 컬럼명, ...)
        VALUES 
        (값, 값, 값, ...)
    
    방법2
        INSERT INTO 테이블명 
        VALUES (값, 값, 값, ...)
    
    * 저장할 값이 없으면 NULL을 명시적으로 적는다.
    
3. 데이터 수정하기
    
    UPDATE 테이블명
    SET
        컬렴명 = 값,
        컬럼명 = 값,
    WHERE 조건식;
    
    * WHERE절을 생략하면 테이블의 모든 행에 대해서 지정된 컬럼의 값이 변경된다.
    * WHERE절이 있는 경우 조건식을 만족하는 행에 대해서만 지정된 컬럼의 값이 변경된다
    
4. 테이블의 행 삭제하기

    DELETE FROM 테이블명
    WHERE 조건식
    
    * WHERE절을 생략하면 테이블의 모든 행이 삭제된다.
    * WHERE절이 있으면 조건식을 만족하는 행만 삭제된다.
    * WHERE절의 조건식은 언제나 특정 행 하나만 삭제되도록 조건식을 작성하는 것이 좋다.
      (특정 행 하나만 삭제되도록 하기 위해서는 조건식은 해당 테이블에서 기본키 컬럼이 검색조건으로 사용되어야 한다) 

5. 테이블 절단하기
    
    TRUNCATE TABLE 테이블명;
    
    * 테이블의 데이터를 전부 삭제하고, 사용하고 있던 공간을 반납한다.
    * 최초 테이블 생성 시점과 동일한 상태가 된다.

*/

-- 책 정보 테이블 생성
CREATE TABLE sample_books (
    book_no        NUMBER(6) PRIMARY KEY,
    book_title     VARCHAR2(255) NOT NULL,
    book_writer    VARCHAR2(255),
    book_price     NUMBER(7, 0) NOT NULL,
    book_stock     NUMBER(3, 0) DEFAULT 10,
    booik_reg_date DATE DEFAULT sysdate
);

-- 신규 책 정보 추가
INSERT INTO sample_books
(book_no, book_title, book_writer, book_price)
VALUES
(10, '자바의 정석', '남궁성', 32000);

INSERT INTO sample_books
(book_no, book_title, book_writer, book_price, book_stock)
VALUES
(12, '이것이 자바다', '신용군', 35000, 25);

INSERT INTO sample_books
VALUES (14, '이펙티브 자바', '심재철', 18000, 10, sysdate);

-- INSERT 구문의 실행결과를 데이터베이스에 영구적으로 저장시킨다.
COMMIT; 

-- 도서 테이블에서 책번호가 10인 책의 재고수량을 9권으로 변경하기
UPDATE sample_books
SET 
    book_stock = 9
WHERE book_no = 10;

-- 도서 테이블에서 책번호가 12인 책의 가격을 10% 할인하고, 재고수량을 1 감소시킨다.
UPDATE sample_books
SET 
    book_price = book_price*0.9,
    book_stock = book_stock -1
WHERE book_no = 12;

-- 도서 테이블에서 책번호가 10번인 책정보(행)를 삭제하기
DELETE FROM sample_books
WHERE book_no = 10;

-- 도서 테이블의 모든 데이터 절단하기
TRUNCATE TABLE sample_books;
