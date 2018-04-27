package com.oracle.util;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.core.convert.converter.Converter;



/**
 * 全局日期处理类
 * Convert<T,S>
 *         泛型T:代表客户端提交的参数 String
 *         泛型S:通过convert转换的类型
   
 */
public class DateConvert implements Converter<String, Date> {

    @Override
    public Date convert(String stringDate) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return new Date(simpleDateFormat.parse(stringDate).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

}