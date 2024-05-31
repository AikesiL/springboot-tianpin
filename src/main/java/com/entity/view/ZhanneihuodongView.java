package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.ZhanneihuodongEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;


/**
 * 科室信息
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-03-22 23:22:56
 */
@TableName("zhanneihuodong")
public class ZhanneihuodongView extends ZhanneihuodongEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public ZhanneihuodongView(){
	}
 
 	public ZhanneihuodongView(ZhanneihuodongEntity keshixinxiEntity){
 	try {
			BeanUtils.copyProperties(this, keshixinxiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
