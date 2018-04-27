package com.oracle.util;

import java.lang.reflect.Field;
import java.util.List;

public class Select {

	StringBuffer options = new StringBuffer();

	/**
	 * 增加一个属性
	 * @param value
	 * @param name
	 */
	public void put(String value, String name) {
		options.append("<option value='" + value + "'>" + name + "</option>");
	}
	
	/**
	 * 增加一个属性
	 * @param value
	 * @param name
	 */
	public void put(String value, String name,String selected) {
		if(value.equals(selected)){
			options.append("<option value='" + value + "' selected>" + name + "</option>");
		}else{
			options.append("<option value='" + value + "'>" + name + "</option>");
		}	
	}

	/**
	 * 增加所有的option
	 * @param list
	 * @param value
	 * @param name
	 */
	public void putAll(List<?> list,String value,String name){
		for(Object obj:list){
			try {
				Field fname=obj.getClass().getDeclaredField(name);
				fname.setAccessible(true);
				String n=fname.get(obj).toString();
				
				Field fvalue=obj.getClass().getDeclaredField(value);
				fvalue.setAccessible(true);
				String v=fvalue.get(obj).toString();
				this.put(v, n);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 增加所有的option
	 * @param list
	 * @param value
	 * @param name
	 */
	public void putAll(List<?> list,String value,String name,String selected){
		for(Object obj:list){
			try {
				Field fname=obj.getClass().getDeclaredField(name);
				fname.setAccessible(true);
				String n=fname.get(obj).toString();
				
				Field fvalue=obj.getClass().getDeclaredField(value);
				fvalue.setAccessible(true);
				String v=fvalue.get(obj).toString();
				this.put(v, n,selected);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public String toString() {
		return options.toString();
	}
}
