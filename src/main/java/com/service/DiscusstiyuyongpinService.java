package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DiscusstiyuyongpinEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.DiscusstiyuyongpinVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.DiscusstiyuyongpinView;


/**
 * 甜品评论表
 *
 * @author 
 * @email 
 * @date 2023-02-23 18:18:25
 */
public interface DiscusstiyuyongpinService extends IService<DiscusstiyuyongpinEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DiscusstiyuyongpinVO> selectListVO(Wrapper<DiscusstiyuyongpinEntity> wrapper);
   	
   	DiscusstiyuyongpinVO selectVO(@Param("ew") Wrapper<DiscusstiyuyongpinEntity> wrapper);
   	
   	List<DiscusstiyuyongpinView> selectListView(Wrapper<DiscusstiyuyongpinEntity> wrapper);
   	
   	DiscusstiyuyongpinView selectView(@Param("ew") Wrapper<DiscusstiyuyongpinEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DiscusstiyuyongpinEntity> wrapper);
   	

}

