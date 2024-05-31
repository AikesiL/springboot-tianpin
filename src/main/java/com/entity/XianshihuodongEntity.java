package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 限时活动
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2023-02-23 18:18:24
 */
@TableName("xianshihuodong")
public class XianshihuodongEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public XianshihuodongEntity() {
		
	}
	
	public XianshihuodongEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	private String chengfen;
	/**
	 * 甜品编号
	 */
					
	private String yongpinbianhao;
	
	/**
	 * 甜品名称
	 */
					
	private String yongpinmingcheng;
	
	/**
	 * 甜品类型
	 */
					
	private String yongpinfenlei;
	
	/**
	 * 口味
	 */
					
	private String pinpai;
	
	/**
	 * 甜品图片
	 */
					
	private String yongpintupian;
	
	/**
	 * 制作方法
	 */
					
	private String shangpinjianjie;
	
	/**
	 * 商户账号
	 */
					
	private String shangjiazhanghao;
	
	/**
	 * 店铺名称
	 */
					
	private String dianpumingcheng;
	
	/**
	 * 单限
	 */
					
	private Integer onelimittimes;
	
	/**
	 * 库存
	 */
					
	private Integer alllimittimes;
	
	/**
	 * 倒计结束时间
	 */
				
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 		
	private Date reversetime;
	
	/**
	 * 价格
	 */
					
	private Float price;
	
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：甜品编号
	 */
	public void setYongpinbianhao(String yongpinbianhao) {
		this.yongpinbianhao = yongpinbianhao;
	}
	/**
	 * 获取：甜品编号
	 */
	public String getYongpinbianhao() {
		return yongpinbianhao;
	}
	/**
	 * 设置：甜品名称
	 */
	public void setYongpinmingcheng(String yongpinmingcheng) {
		this.yongpinmingcheng = yongpinmingcheng;
	}
	/**
	 * 获取：甜品名称
	 */
	public String getYongpinmingcheng() {
		return yongpinmingcheng;
	}
	/**
	 * 设置：甜品类型
	 */
	public void setYongpinfenlei(String yongpinfenlei) {
		this.yongpinfenlei = yongpinfenlei;
	}
	/**
	 * 获取：甜品类型
	 */
	public String getYongpinfenlei() {
		return yongpinfenlei;
	}
	/**
	 * 设置：口味
	 */
	public void setPinpai(String pinpai) {
		this.pinpai = pinpai;
	}
	/**
	 * 获取：口味
	 */
	public String getPinpai() {
		return pinpai;
	}
	/**
	 * 设置：甜品图片
	 */
	public void setYongpintupian(String yongpintupian) {
		this.yongpintupian = yongpintupian;
	}
	/**
	 * 获取：甜品图片
	 */
	public String getYongpintupian() {
		return yongpintupian;
	}
	/**
	 * 设置：制作方法
	 */
	public void setShangpinjianjie(String shangpinjianjie) {
		this.shangpinjianjie = shangpinjianjie;
	}
	/**
	 * 获取：制作方法
	 */
	public String getShangpinjianjie() {
		return shangpinjianjie;
	}
	/**
	 * 设置：商户账号
	 */
	public void setShangjiazhanghao(String shangjiazhanghao) {
		this.shangjiazhanghao = shangjiazhanghao;
	}
	/**
	 * 获取：商户账号
	 */
	public String getShangjiazhanghao() {
		return shangjiazhanghao;
	}
	/**
	 * 设置：店铺名称
	 */
	public void setDianpumingcheng(String dianpumingcheng) {
		this.dianpumingcheng = dianpumingcheng;
	}
	/**
	 * 获取：店铺名称
	 */
	public String getDianpumingcheng() {
		return dianpumingcheng;
	}
	/**
	 * 设置：单限
	 */
	public void setOnelimittimes(Integer onelimittimes) {
		this.onelimittimes = onelimittimes;
	}
	/**
	 * 获取：单限
	 */
	public Integer getOnelimittimes() {
		return onelimittimes;
	}
	/**
	 * 设置：库存
	 */
	public void setAlllimittimes(Integer alllimittimes) {
		this.alllimittimes = alllimittimes;
	}
	/**
	 * 获取：库存
	 */
	public Integer getAlllimittimes() {
		return alllimittimes;
	}
	/**
	 * 设置：倒计结束时间
	 */
	public void setReversetime(Date reversetime) {
		this.reversetime = reversetime;
	}
	/**
	 * 获取：倒计结束时间
	 */
	public Date getReversetime() {
		return reversetime;
	}
	/**
	 * 设置：价格
	 */
	public void setPrice(Float price) {
		this.price = price;
	}
	/**
	 * 获取：价格
	 */
	public Float getPrice() {
		return price;
	}

	public String getChengfen() {
		return chengfen;
	}

	public void setChengfen(String chengfen) {
		this.chengfen = chengfen;
	}
}
