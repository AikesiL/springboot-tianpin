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


import com.dao.ZhanneihuodongDao;
import com.entity.ZhanneihuodongEntity;
import com.service.ZhanneihuodongService;
import com.entity.vo.ZhanneihuodongVO;
import com.entity.view.ZhanneihuodongView;

@Service("zhanneihuodongService")
public class ZhanneihuodongServiceImpl extends ServiceImpl<ZhanneihuodongDao, ZhanneihuodongEntity> implements ZhanneihuodongService {
	

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ZhanneihuodongEntity> page = this.selectPage(
                new Query<ZhanneihuodongEntity>(params).getPage(),
                new EntityWrapper<ZhanneihuodongEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ZhanneihuodongEntity> wrapper) {
		  Page<ZhanneihuodongView> page =new Query<ZhanneihuodongView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<ZhanneihuodongVO> selectListVO(Wrapper<ZhanneihuodongEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ZhanneihuodongVO selectVO(Wrapper<ZhanneihuodongEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ZhanneihuodongView> selectListView(Wrapper<ZhanneihuodongEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ZhanneihuodongView selectView(Wrapper<ZhanneihuodongEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
