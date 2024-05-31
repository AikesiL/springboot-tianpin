package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.DiscussxianshihuodongDao;
import com.entity.DiscussxianshihuodongEntity;
import com.service.DiscussxianshihuodongService;
import com.entity.vo.DiscussxianshihuodongVO;
import com.entity.view.DiscussxianshihuodongView;

@Service("discussxianshihuodongService")
public class DiscussxianshihuodongServiceImpl extends ServiceImpl<DiscussxianshihuodongDao, DiscussxianshihuodongEntity> implements DiscussxianshihuodongService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DiscussxianshihuodongEntity> page = this.selectPage(
                new Query<DiscussxianshihuodongEntity>(params).getPage(),
                new EntityWrapper<DiscussxianshihuodongEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DiscussxianshihuodongEntity> wrapper) {
		  Page<DiscussxianshihuodongView> page =new Query<DiscussxianshihuodongView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<DiscussxianshihuodongVO> selectListVO(Wrapper<DiscussxianshihuodongEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public DiscussxianshihuodongVO selectVO(Wrapper<DiscussxianshihuodongEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<DiscussxianshihuodongView> selectListView(Wrapper<DiscussxianshihuodongEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DiscussxianshihuodongView selectView(Wrapper<DiscussxianshihuodongEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
