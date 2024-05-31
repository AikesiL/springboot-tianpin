package com.entity.view;

import com.entity.TiyuyongpinEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 甜品
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-02-23 18:18:24
 */
@TableName("tiyuyongpin")
public class TiyuyongpinView  extends TiyuyongpinEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public TiyuyongpinView(){
	}
 
 	public TiyuyongpinView(TiyuyongpinEntity tiyuyongpinEntity){
 	try {
			BeanUtils.copyProperties(this, tiyuyongpinEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
