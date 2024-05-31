package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.MessagesEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.MessagesVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.MessagesView;


/**
 * 意见反馈
 *
 * @author 
 * @email 
 * @date 2023-02-23 18:18:25
 */
public interface MessagesService extends IService<MessagesEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<MessagesVO> selectListVO(Wrapper<MessagesEntity> wrapper);
   	
   	MessagesVO selectVO(@Param("ew") Wrapper<MessagesEntity> wrapper);
   	
   	List<MessagesView> selectListView(Wrapper<MessagesEntity> wrapper);
   	
   	MessagesView selectView(@Param("ew") Wrapper<MessagesEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<MessagesEntity> wrapper);
   	

}

