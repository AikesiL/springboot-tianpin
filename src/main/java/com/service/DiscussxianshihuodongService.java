package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DiscussxianshihuodongEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.DiscussxianshihuodongVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.DiscussxianshihuodongView;


/**
 * 限时活动评论表
 *
 * @author 
 * @email 
 * @date 2023-02-23 18:18:25
 */
public interface DiscussxianshihuodongService extends IService<DiscussxianshihuodongEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DiscussxianshihuodongVO> selectListVO(Wrapper<DiscussxianshihuodongEntity> wrapper);
   	
   	DiscussxianshihuodongVO selectVO(@Param("ew") Wrapper<DiscussxianshihuodongEntity> wrapper);
   	
   	List<DiscussxianshihuodongView> selectListView(Wrapper<DiscussxianshihuodongEntity> wrapper);
   	
   	DiscussxianshihuodongView selectView(@Param("ew") Wrapper<DiscussxianshihuodongEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DiscussxianshihuodongEntity> wrapper);
   	

}

