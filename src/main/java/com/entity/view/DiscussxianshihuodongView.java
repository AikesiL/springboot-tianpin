package com.entity.view;

import com.entity.DiscussxianshihuodongEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 限时活动评论表
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-02-23 18:18:25
 */
@TableName("discussxianshihuodong")
public class DiscussxianshihuodongView  extends DiscussxianshihuodongEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DiscussxianshihuodongView(){
	}
 
 	public DiscussxianshihuodongView(DiscussxianshihuodongEntity discussxianshihuodongEntity){
 	try {
			BeanUtils.copyProperties(this, discussxianshihuodongEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
