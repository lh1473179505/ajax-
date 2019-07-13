package cn.sjxy.mrbbs.domain;

import java.util.HashMap;
import java.util.Map;

public class PageDate {

	public String status;
	public String msg;
	public Map<String,Object> date=new HashMap<String,Object>();
	

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getDate() {
		return date;
	}
	public void setDate(Map<String, Object> date) {
		this.date = date;
	}
	
	public static PageDate success() {
		PageDate pageDate =new PageDate();
		pageDate.setStatus("200");
		pageDate.setMsg("成功");
		return pageDate;
	}
	
	public static PageDate fail() {
		PageDate pageDate =new PageDate();
		pageDate.setStatus("100");
		pageDate.setMsg("失败");
		return pageDate;
	}
	
	public void addDate(String key,Object value) {
		this.getDate().put(key, value);
	}
}
