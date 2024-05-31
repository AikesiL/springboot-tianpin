package com.dao;

import com.entity.ZhanneihuodongEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ZhanneihuodongVO;
import com.entity.view.ZhanneihuodongView;


/**
 * 成果分类
 * 
 * @author 
 * @email 
 * @date 2022-04-01 11:52:03
 */
public interface ZhanneihuodongDao extends BaseMapper<ZhanneihuodongEntity> {
	
	List<ZhanneihuodongVO> selectListVO(@Param("ew") Wrapper<ZhanneihuodongEntity> wrapper);
	
	ZhanneihuodongVO selectVO(@Param("ew") Wrapper<ZhanneihuodongEntity> wrapper);
	
	List<ZhanneihuodongView> selectListView(@Param("ew") Wrapper<ZhanneihuodongEntity> wrapper);

	List<ZhanneihuodongView> selectListView(Pagination page,@Param("ew") Wrapper<ZhanneihuodongEntity> wrapper);
	
	ZhanneihuodongView selectView(@Param("ew") Wrapper<ZhanneihuodongEntity> wrapper);
	

}
