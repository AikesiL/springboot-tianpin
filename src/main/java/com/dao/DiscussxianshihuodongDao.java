package com.dao;

import com.entity.DiscussxianshihuodongEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.DiscussxianshihuodongVO;
import com.entity.view.DiscussxianshihuodongView;


/**
 * 限时活动评论表
 * 
 * @author 
 * @email 
 * @date 2023-02-23 18:18:25
 */
public interface DiscussxianshihuodongDao extends BaseMapper<DiscussxianshihuodongEntity> {
	
	List<DiscussxianshihuodongVO> selectListVO(@Param("ew") Wrapper<DiscussxianshihuodongEntity> wrapper);
	
	DiscussxianshihuodongVO selectVO(@Param("ew") Wrapper<DiscussxianshihuodongEntity> wrapper);
	
	List<DiscussxianshihuodongView> selectListView(@Param("ew") Wrapper<DiscussxianshihuodongEntity> wrapper);

	List<DiscussxianshihuodongView> selectListView(Pagination page,@Param("ew") Wrapper<DiscussxianshihuodongEntity> wrapper);
	
	DiscussxianshihuodongView selectView(@Param("ew") Wrapper<DiscussxianshihuodongEntity> wrapper);
	

}
