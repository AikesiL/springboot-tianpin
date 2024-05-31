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


import com.dao.XianshihuodongDao;
import com.entity.XianshihuodongEntity;
import com.service.XianshihuodongService;
import com.entity.vo.XianshihuodongVO;
import com.entity.view.XianshihuodongView;

@Service("xianshihuodongService")
public class XianshihuodongServiceImpl extends ServiceImpl<XianshihuodongDao, XianshihuodongEntity> implements XianshihuodongService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<XianshihuodongEntity> page = this.selectPage(
                new Query<XianshihuodongEntity>(params).getPage(),
                new EntityWrapper<XianshihuodongEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<XianshihuodongEntity> wrapper) {
		  Page<XianshihuodongView> page =new Query<XianshihuodongView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<XianshihuodongVO> selectListVO(Wrapper<XianshihuodongEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public XianshihuodongVO selectVO(Wrapper<XianshihuodongEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<XianshihuodongView> selectListView(Wrapper<XianshihuodongEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public XianshihuodongView selectView(Wrapper<XianshihuodongEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
