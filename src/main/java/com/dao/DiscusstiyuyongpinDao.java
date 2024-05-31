package com.dao;

import com.entity.DiscusstiyuyongpinEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.DiscusstiyuyongpinVO;
import com.entity.view.DiscusstiyuyongpinView;


/**
 * 甜品评论表
 * 
 * @author 
 * @email 
 * @date 2023-02-23 18:18:25
 */
public interface DiscusstiyuyongpinDao extends BaseMapper<DiscusstiyuyongpinEntity> {
	
	List<DiscusstiyuyongpinVO> selectListVO(@Param("ew") Wrapper<DiscusstiyuyongpinEntity> wrapper);
	
	DiscusstiyuyongpinVO selectVO(@Param("ew") Wrapper<DiscusstiyuyongpinEntity> wrapper);
	
	List<DiscusstiyuyongpinView> selectListView(@Param("ew") Wrapper<DiscusstiyuyongpinEntity> wrapper);

	List<DiscusstiyuyongpinView> selectListView(Pagination page,@Param("ew") Wrapper<DiscusstiyuyongpinEntity> wrapper);
	
	DiscusstiyuyongpinView selectView(@Param("ew") Wrapper<DiscusstiyuyongpinEntity> wrapper);
	

}
