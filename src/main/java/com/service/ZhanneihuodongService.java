package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ZhanneihuodongEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.ZhanneihuodongVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.ZhanneihuodongView;


/**
 * 成果分类
 *
 * @author 
 * @email 
 * @date 2022-04-01 11:52:03
 */
public interface ZhanneihuodongService extends IService<ZhanneihuodongEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ZhanneihuodongVO> selectListVO(Wrapper<ZhanneihuodongEntity> wrapper);
   	
   	ZhanneihuodongVO selectVO(@Param("ew") Wrapper<ZhanneihuodongEntity> wrapper);
   	
   	List<ZhanneihuodongView> selectListView(Wrapper<ZhanneihuodongEntity> wrapper);
   	
   	ZhanneihuodongView selectView(@Param("ew") Wrapper<ZhanneihuodongEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ZhanneihuodongEntity> wrapper);
   	

}

