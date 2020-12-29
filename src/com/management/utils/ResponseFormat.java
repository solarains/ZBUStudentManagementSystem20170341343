package com.management.utils;

import java.util.Map;

public class ResponseFormat {
    private String errmsg = "";
    private Integer errcode = 0;
    private Map data;

    public ResponseFormat(String errmsg, Integer errcode, Map data) {
        this.errmsg = errmsg;
        this.errcode = errcode;
        this.data = data;
    }

    public ResponseFormat(String errmsg, Integer errcode) {
        this.errmsg = errmsg;
        this.errcode = errcode;
    }
}
