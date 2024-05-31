package com.entity.view;

import com.entity.XianshihuodongEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 限时活动
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-02-23 18:18:24
 */
@TableName("xianshihuodong")
public class XianshihuodongView  extends XianshihuodongEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public XianshihuodongView(){
	}
 
 	public XianshihuodongView(XianshihuodongEntity xianshihuodongEntity){
 	try {
			BeanUtils.copyProperties(this, xianshihuodongEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
