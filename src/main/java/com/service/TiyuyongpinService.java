package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.TiyuyongpinEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.TiyuyongpinVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.TiyuyongpinView;


/**
 * 甜品
 *
 * @author 
 * @email 
 * @date 2023-02-23 18:18:24
 */
public interface TiyuyongpinService extends IService<TiyuyongpinEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<TiyuyongpinVO> selectListVO(Wrapper<TiyuyongpinEntity> wrapper);
   	
   	TiyuyongpinVO selectVO(@Param("ew") Wrapper<TiyuyongpinEntity> wrapper);
   	
   	List<TiyuyongpinView> selectListView(Wrapper<TiyuyongpinEntity> wrapper);
   	
   	TiyuyongpinView selectView(@Param("ew") Wrapper<TiyuyongpinEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<TiyuyongpinEntity> wrapper);
   	

}

