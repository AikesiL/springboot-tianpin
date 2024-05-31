package com.dao;

import com.entity.TiyuyongpinEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.TiyuyongpinVO;
import com.entity.view.TiyuyongpinView;


/**
 * 甜品
 * 
 * @author 
 * @email 
 * @date 2023-02-23 18:18:24
 */
public interface TiyuyongpinDao extends BaseMapper<TiyuyongpinEntity> {
	
	List<TiyuyongpinVO> selectListVO(@Param("ew") Wrapper<TiyuyongpinEntity> wrapper);
	
	TiyuyongpinVO selectVO(@Param("ew") Wrapper<TiyuyongpinEntity> wrapper);
	
	List<TiyuyongpinView> selectListView(@Param("ew") Wrapper<TiyuyongpinEntity> wrapper);

	List<TiyuyongpinView> selectListView(Pagination page,@Param("ew") Wrapper<TiyuyongpinEntity> wrapper);
	
	TiyuyongpinView selectView(@Param("ew") Wrapper<TiyuyongpinEntity> wrapper);
	

}
