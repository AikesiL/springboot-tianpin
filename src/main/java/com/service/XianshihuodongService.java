package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.XianshihuodongEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.XianshihuodongVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.XianshihuodongView;


/**
 * 限时活动
 *
 * @author 
 * @email 
 * @date 2023-02-23 18:18:24
 */
public interface XianshihuodongService extends IService<XianshihuodongEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<XianshihuodongVO> selectListVO(Wrapper<XianshihuodongEntity> wrapper);
   	
   	XianshihuodongVO selectVO(@Param("ew") Wrapper<XianshihuodongEntity> wrapper);
   	
   	List<XianshihuodongView> selectListView(Wrapper<XianshihuodongEntity> wrapper);
   	
   	XianshihuodongView selectView(@Param("ew") Wrapper<XianshihuodongEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<XianshihuodongEntity> wrapper);
   	

}

