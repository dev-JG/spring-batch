package com.jg.dev.model;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Data;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class User implements Serializable{

    private static final long serialVersionUID = 1L;

    private int userNo;

    private String userId;

    private String userType;

    private String userName;

    private String pwd;

    private String status;

    private LocalDateTime createDate;
}
