package org.iclass.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BookUser {	
	private String id;
	private String email;
	private String name;
	private String password;
	private int age;
	private Date regDate;
	private String birth;

}
// @AllArgsConstructor 는 새로운 변수가 클래스에 추가되면
// 기존에 사용하던 생성자는 오류가 생깁니다.(인자 갯수 일치하지 않는 문제)
// 생성자 대신에 Builder 를 사용하면 그 영향(오류)을 받지 않습니다.






