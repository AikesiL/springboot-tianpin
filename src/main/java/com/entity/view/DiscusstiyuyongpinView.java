package com.entity.view;

import com.entity.DiscusstiyuyongpinEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 甜品评论表
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-02-23 18:18:25
 */
@TableName("discusstiyuyongpin")
public class DiscusstiyuyongpinView  extends DiscusstiyuyongpinEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DiscusstiyuyongpinView(){
	}
 
 	public DiscusstiyuyongpinView(DiscusstiyuyongpinEntity discusstiyuyongpinEntity){
 	try {
			BeanUtils.copyProperties(this, discusstiyuyongpinEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
