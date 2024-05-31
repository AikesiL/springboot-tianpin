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

import com.baomidou.mybatisplus.plugins.Page;
import com.entity.*;
import com.service.*;
import com.utils.*;
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

import com.entity.view.TiyuyongpinView;

import java.io.IOException;
import java.util.stream.Collectors;

/**
 * 甜品
 * 后端接口
 * @author 
 * @email 
 * @date 2023-02-23 18:18:24
 */
@RestController
@RequestMapping("/tiyuyongpin")
public class TiyuyongpinController {
    @Autowired
    private TiyuyongpinService tiyuyongpinService;

    @Autowired
    private StoreupService storeupService;

    @Autowired
    private OrdersService ordersService;

    /**
     * 后端列表
     */
    @RequestMapping("/tongji")
    public R tongji(@RequestParam Map<String, Object> params,TiyuyongpinEntity tiyuyongpin,
                  @RequestParam(required = false) Double pricestart,
                  @RequestParam(required = false) Double priceend,
                  HttpServletRequest request){
        String tableName = request.getSession().getAttribute("tableName").toString();
        if(tableName.equals("shangjia")) {
            tiyuyongpin.setShangjiazhanghao((String)request.getSession().getAttribute("yonghuname"));
        }
        EntityWrapper<TiyuyongpinEntity> ew = new EntityWrapper<TiyuyongpinEntity>();
        if(pricestart!=null) ew.ge("price", pricestart);
        if(priceend!=null) ew.le("price", priceend);

        List<TiyuyongpinEntity> list = tiyuyongpinService.selectList(MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, tiyuyongpin), params), params));
        Map<String, Integer> collect = list.stream().collect(Collectors.groupingBy(TiyuyongpinEntity::getYongpinmingcheng, Collectors.summingInt(TiyuyongpinEntity::getAlllimittimes)));

        return R.ok().put("data", collect);
    }

    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,TiyuyongpinEntity tiyuyongpin,
                @RequestParam(required = false) Double pricestart,
                @RequestParam(required = false) Double priceend,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("shangjia")) {
			tiyuyongpin.setShangjiazhanghao((String)request.getSession().getAttribute("yonghuname"));
		}
        EntityWrapper<TiyuyongpinEntity> ew = new EntityWrapper<TiyuyongpinEntity>();
                if(pricestart!=null) ew.ge("price", pricestart);
                if(priceend!=null) ew.le("price", priceend);

		PageUtils page = tiyuyongpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, tiyuyongpin), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,TiyuyongpinEntity tiyuyongpin, 
                @RequestParam(required = false) Double pricestart,
                @RequestParam(required = false) Double priceend,
		HttpServletRequest request){
        EntityWrapper<TiyuyongpinEntity> ew = new EntityWrapper<TiyuyongpinEntity>();
                if(pricestart!=null) ew.ge("price", pricestart);
                if(priceend!=null) ew.le("price", priceend);

		PageUtils page = tiyuyongpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, tiyuyongpin), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( TiyuyongpinEntity tiyuyongpin){
       	EntityWrapper<TiyuyongpinEntity> ew = new EntityWrapper<TiyuyongpinEntity>();
      	ew.allEq(MPUtil.allEQMapPre( tiyuyongpin, "tiyuyongpin")); 
        return R.ok().put("data", tiyuyongpinService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(TiyuyongpinEntity tiyuyongpin){
        EntityWrapper< TiyuyongpinEntity> ew = new EntityWrapper< TiyuyongpinEntity>();
 		ew.allEq(MPUtil.allEQMapPre( tiyuyongpin, "tiyuyongpin")); 
		TiyuyongpinView tiyuyongpinView =  tiyuyongpinService.selectView(ew);
		return R.ok("查询甜品成功").put("data", tiyuyongpinView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        TiyuyongpinEntity tiyuyongpin = tiyuyongpinService.selectById(id);
		tiyuyongpin.setClicknum(tiyuyongpin.getClicknum()+1);
		tiyuyongpin.setClicktime(new Date());
		tiyuyongpinService.updateById(tiyuyongpin);
        return R.ok().put("data", tiyuyongpin);
    }

 


    @Autowired
    private DiscusstiyuyongpinService discusstiyuyongpinService;

    @Autowired
    private YonghuService yonghuService;


    /**
     * 后端列表
     */
    @RequestMapping("/tuijian")
    public R tuijian(@RequestParam Map<String, Object> params, TiyuyongpinEntity tiyuyongpin,
                     HttpServletRequest request){

        List<TiyuyongpinEntity> tiyuyongpinEntities = tiyuyongpinService.selectList(null);
        List<Long> lingshiids = tiyuyongpinEntities.stream().map(TiyuyongpinEntity::getId).collect(Collectors.toList());
        List<YonghuEntity> yonghuEntities = yonghuService.selectList(null);
        List<Long> userids = yonghuEntities.stream().map(YonghuEntity::getId).collect(Collectors.toList());
        double[][] pingfenjuzheng = new double[userids.size()][lingshiids.size()];


        // 初始化二维数组
        for (int i = 0; i < lingshiids.size(); i++) {
            for (int j = 0; j < userids.size(); j++) {
                pingfenjuzheng[i][j] = 0;
            }
        }

        // 打印二维数组
        for (double[] row : pingfenjuzheng) {
            for (double num : row) {
                System.out.print(num + " ");
            }
            System.out.println();
        }

        List<DiscusstiyuyongpinEntity> discusstiyuyongpinEntities = discusstiyuyongpinService
                .selectList(null);
        for (int i = 0 ; i < discusstiyuyongpinEntities.size() ; i ++){
            DiscusstiyuyongpinEntity storeupEntity  = discusstiyuyongpinEntities.get(i);
            Long goodid = storeupEntity.getRefid();
            Long userid = storeupEntity.getUserid();
            int i2 = lingshiids.indexOf(goodid);
            int i1 = userids.indexOf(userid);

            pingfenjuzheng[i1][i2] = pingfenjuzheng[i1][i2]+1;
        }


        List<StoreupEntity> storeupEntities = storeupService.selectList(new EntityWrapper<StoreupEntity>().eq("type",1).eq("tablename","tiyuyongpin"));
        for (int i = 0 ; i < storeupEntities.size() ; i ++){
            StoreupEntity storeupEntity  = storeupEntities.get(i);
            Long goodid = storeupEntity.getRefid();
            Long userid = storeupEntity.getUserid();
            int i2 = lingshiids.indexOf(goodid);
            int i1 = userids.indexOf(userid);

            pingfenjuzheng[i1][i2] = pingfenjuzheng[i1][i2]+1;
        }




        List<StoreupEntity> dianzanEntities = storeupService.selectList(new EntityWrapper<StoreupEntity>().eq("type",21).eq("tablename","tiyuyongpin"));
        for (int i = 0 ; i < dianzanEntities.size() ; i ++){
            StoreupEntity storeupEntity  = dianzanEntities.get(i);
            Long goodid = storeupEntity.getRefid();
            Long userid = storeupEntity.getUserid();
            int i2 = lingshiids.indexOf(goodid);
            int i1 = userids.indexOf(userid);

            pingfenjuzheng[i1][i2] = pingfenjuzheng[i1][i2]+1;
        }

        List<StoreupEntity> buxihuanEntities = storeupService.selectList(new EntityWrapper<StoreupEntity>().eq("type",22).eq("tablename","tiyuyongpin"));
        for (int i = 0 ; i < buxihuanEntities.size() ; i ++){
            StoreupEntity storeupEntity  = buxihuanEntities.get(i);
            Long goodid = storeupEntity.getRefid();
            Long userid = storeupEntity.getUserid();
            int i2 = lingshiids.indexOf(goodid);
            int i1 = userids.indexOf(userid);
            if(pingfenjuzheng[i1][i2] >0.5){
                pingfenjuzheng[i1][i2] = pingfenjuzheng[i1][i2]-1*0.5;
            }
        }










        Long userId = (Long)request.getSession().getAttribute("userId");
        YonghuEntity yonghuEntity = yonghuService.selectById(userId);








        // 打印二维数组
        for (double[] row : pingfenjuzheng) {
            for (double num : row) {
                System.out.print(num + " ");
            }
            System.out.println();
        }


        List<Integer> recommend = CollaborativeFiltering.recommend(userids.indexOf(userId), pingfenjuzheng);

        double[] tuijianshangpin = new double[userids.size()];
        for(int i = 0 ; i < userids.size() ; i ++){
            tuijianshangpin[i] = 0;
        }
        for(int i = 0; i < recommend.size() ; i ++){
            double[] temp = pingfenjuzheng[recommend.get(i)];

            //两个数组相加
            for (int j = 0; j < tuijianshangpin.length; j++) {
                tuijianshangpin[j] = tuijianshangpin[j] + temp[j];
            }
        }

        List<Integer> shangpin_index = new ArrayList<>();
        for (int i = 0 ; i < tuijianshangpin.length ; i ++){

            if(tuijianshangpin[i]>0.1){
                shangpin_index.add(i);
            }
        }


        List<Long> tuijianid = new ArrayList<>();
        for(int i = 0 ; i < shangpin_index.size() ; i++){

            Long aLong = lingshiids.get(shangpin_index.get(i));
            tuijianid.add(aLong);
        }
        List<TiyuyongpinEntity> tiyuyongpinEntities1 = new ArrayList<>();

        if(tuijianid.size()>0){
            tiyuyongpinEntities1 = tiyuyongpinService.selectBatchIds(tuijianid);
        }

        Page<TiyuyongpinEntity> page =new Query<TiyuyongpinEntity>(params).getPage();
        page.setRecords(tiyuyongpinEntities1);
        PageUtils pageUtil = new PageUtils(page);
        return R.ok().put("data", pageUtil);
    }




    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        TiyuyongpinEntity tiyuyongpin = tiyuyongpinService.selectById(id);
		tiyuyongpin.setClicknum(tiyuyongpin.getClicknum()+1);
		tiyuyongpin.setClicktime(new Date());
		tiyuyongpinService.updateById(tiyuyongpin);
        return R.ok().put("data", tiyuyongpin);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody TiyuyongpinEntity tiyuyongpin, HttpServletRequest request){
    	tiyuyongpin.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(tiyuyongpin);
        tiyuyongpinService.insert(tiyuyongpin);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody TiyuyongpinEntity tiyuyongpin, HttpServletRequest request){
    	tiyuyongpin.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(tiyuyongpin);
        tiyuyongpinService.insert(tiyuyongpin);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody TiyuyongpinEntity tiyuyongpin, HttpServletRequest request){
        //ValidatorUtils.validateEntity(tiyuyongpin);
        tiyuyongpinService.updateById(tiyuyongpin);//全部更新
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        tiyuyongpinService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<TiyuyongpinEntity> wrapper = new EntityWrapper<TiyuyongpinEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("shangjia")) {
			wrapper.eq("shangjiazhanghao", (String)request.getSession().getAttribute("yonghuname"));
		}

		int count = tiyuyongpinService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	/**
     * 前端智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,TiyuyongpinEntity tiyuyongpin, HttpServletRequest request,String pre){
        EntityWrapper<TiyuyongpinEntity> ew = new EntityWrapper<TiyuyongpinEntity>();
        Map<String, Object> newMap = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
		Iterator<Map.Entry<String, Object>> it = param.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = it.next();
			String key = entry.getKey();
			String newKey = entry.getKey();
			if (pre.endsWith(".")) {
				newMap.put(pre + newKey, entry.getValue());
			} else if (StringUtils.isEmpty(pre)) {
				newMap.put(newKey, entry.getValue());
			} else {
				newMap.put(pre + "." + newKey, entry.getValue());
			}
		}
		params.put("sort", "clicknum");
        params.put("order", "desc");
		PageUtils page = tiyuyongpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, tiyuyongpin), params), params));
        return R.ok().put("data", page);
    }


        /**
     * 协同算法（按用户购买推荐）
     */
    @RequestMapping("/autoSort2")
    public R autoSort2(@RequestParam Map<String, Object> params,TiyuyongpinEntity tiyuyongpin, HttpServletRequest request){
        String userId = request.getSession().getAttribute("userId").toString();
        String goodtypeColumn = "yongpinfenlei";
        List<OrdersEntity> orders = ordersService.selectList(new EntityWrapper<OrdersEntity>().eq("userid", userId).eq("tablename", "tiyuyongpin").orderBy("addtime", false));
        List<String> goodtypes = new ArrayList<String>();
        Integer limit = params.get("limit")==null?10:Integer.parseInt(params.get("limit").toString());
        List<TiyuyongpinEntity> tiyuyongpinList = new ArrayList<TiyuyongpinEntity>();
	//去重
    	List<OrdersEntity> ordersDist = new ArrayList<OrdersEntity>();
    	for(OrdersEntity o1 : orders) {
    		boolean addFlag = true;
    		for(OrdersEntity o2 : ordersDist) {
    			if(o1.getGoodid()==o2.getGoodid() || o1.getGoodtype().equals(o2.getGoodtype())) {
    				addFlag = false;
    				break;
    			}
    		}
    		if(addFlag) ordersDist.add(o1);
    	}
        if(ordersDist!=null && ordersDist.size()>0) {
                for(OrdersEntity o : ordersDist) {
                        tiyuyongpinList.addAll(tiyuyongpinService.selectList(new EntityWrapper<TiyuyongpinEntity>().eq(goodtypeColumn, o.getGoodtype())));
                }
        }
        EntityWrapper<TiyuyongpinEntity> ew = new EntityWrapper<TiyuyongpinEntity>();
        params.put("sort", "id");
        params.put("order", "desc");
        PageUtils page = tiyuyongpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, tiyuyongpin), params), params));
        List<TiyuyongpinEntity> pageList = (List<TiyuyongpinEntity>)page.getList();
        if(tiyuyongpinList.size()<limit) {
                int toAddNum = (limit-tiyuyongpinList.size())<=pageList.size()?(limit-tiyuyongpinList.size()):pageList.size();
                for(TiyuyongpinEntity o1 : pageList) {
                    boolean addFlag = true;
                    for(TiyuyongpinEntity o2 : tiyuyongpinList) {
                        if(o1.getId().intValue()==o2.getId().intValue()) {
                            addFlag = false;
                            break;
                        }
                    }
                    if(addFlag) {
                        tiyuyongpinList.add(o1);
                        if(--toAddNum==0) break;
                    }   
                }
        } else if(tiyuyongpinList.size()>limit) {
            tiyuyongpinList = tiyuyongpinList.subList(0, limit);
        }
        page.setList(tiyuyongpinList);
        return R.ok().put("data", page);
    }







}
