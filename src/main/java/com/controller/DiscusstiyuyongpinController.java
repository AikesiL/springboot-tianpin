package com.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.DiscusstiyuyongpinEntity;
import com.entity.view.DiscusstiyuyongpinView;

import com.service.DiscusstiyuyongpinService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 甜品评论表
 * 后端接口
 * @author 
 * @email 
 * @date 2023-02-23 18:18:25
 */
@RestController
@RequestMapping("/discusstiyuyongpin")
public class DiscusstiyuyongpinController {
    @Autowired
    private DiscusstiyuyongpinService discusstiyuyongpinService;


    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DiscusstiyuyongpinEntity discusstiyuyongpin,
		HttpServletRequest request){
        EntityWrapper<DiscusstiyuyongpinEntity> ew = new EntityWrapper<DiscusstiyuyongpinEntity>();

		PageUtils page = discusstiyuyongpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discusstiyuyongpin), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,DiscusstiyuyongpinEntity discusstiyuyongpin, 
		HttpServletRequest request){
        EntityWrapper<DiscusstiyuyongpinEntity> ew = new EntityWrapper<DiscusstiyuyongpinEntity>();

		PageUtils page = discusstiyuyongpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discusstiyuyongpin), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DiscusstiyuyongpinEntity discusstiyuyongpin){
       	EntityWrapper<DiscusstiyuyongpinEntity> ew = new EntityWrapper<DiscusstiyuyongpinEntity>();
      	ew.allEq(MPUtil.allEQMapPre( discusstiyuyongpin, "discusstiyuyongpin")); 
        return R.ok().put("data", discusstiyuyongpinService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DiscusstiyuyongpinEntity discusstiyuyongpin){
        EntityWrapper< DiscusstiyuyongpinEntity> ew = new EntityWrapper< DiscusstiyuyongpinEntity>();
 		ew.allEq(MPUtil.allEQMapPre( discusstiyuyongpin, "discusstiyuyongpin")); 
		DiscusstiyuyongpinView discusstiyuyongpinView =  discusstiyuyongpinService.selectView(ew);
		return R.ok("查询甜品评论表成功").put("data", discusstiyuyongpinView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DiscusstiyuyongpinEntity discusstiyuyongpin = discusstiyuyongpinService.selectById(id);
        return R.ok().put("data", discusstiyuyongpin);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DiscusstiyuyongpinEntity discusstiyuyongpin = discusstiyuyongpinService.selectById(id);
        return R.ok().put("data", discusstiyuyongpin);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DiscusstiyuyongpinEntity discusstiyuyongpin, HttpServletRequest request){
    	discusstiyuyongpin.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(discusstiyuyongpin);
        discusstiyuyongpinService.insert(discusstiyuyongpin);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody DiscusstiyuyongpinEntity discusstiyuyongpin, HttpServletRequest request){
    	discusstiyuyongpin.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(discusstiyuyongpin);
        discusstiyuyongpinService.insert(discusstiyuyongpin);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody DiscusstiyuyongpinEntity discusstiyuyongpin, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discusstiyuyongpin);
        discusstiyuyongpinService.updateById(discusstiyuyongpin);//全部更新
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        discusstiyuyongpinService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<DiscusstiyuyongpinEntity> wrapper = new EntityWrapper<DiscusstiyuyongpinEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = discusstiyuyongpinService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	









}
