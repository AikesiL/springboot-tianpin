package com.dao;

import com.entity.XianshihuodongEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.XianshihuodongVO;
import com.entity.view.XianshihuodongView;


/**
 * 限时活动
 * 
 * @author 
 * @email 
 * @date 2023-02-23 18:18:24
 */
public interface XianshihuodongDao extends BaseMapper<XianshihuodongEntity> {
	
	List<XianshihuodongVO> selectListVO(@Param("ew") Wrapper<XianshihuodongEntity> wrapper);
	
	XianshihuodongVO selectVO(@Param("ew") Wrapper<XianshihuodongEntity> wrapper);
	
	List<XianshihuodongView> selectListView(@Param("ew") Wrapper<XianshihuodongEntity> wrapper);

	List<XianshihuodongView> selectListView(Pagination page,@Param("ew") Wrapper<XianshihuodongEntity> wrapper);
	
	XianshihuodongView selectView(@Param("ew") Wrapper<XianshihuodongEntity> wrapper);
	

}
