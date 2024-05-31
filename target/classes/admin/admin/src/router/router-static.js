import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
    import news from '@/views/modules/news/list'
    import aboutus from '@/views/modules/aboutus/list'
    import discussxianshihuodong from '@/views/modules/discussxianshihuodong/list'
    import tiyuyongpin from '@/views/modules/tiyuyongpin/list'
    import shangjia from '@/views/modules/shangjia/list'
    import systemintro from '@/views/modules/systemintro/list'
    import yonghu from '@/views/modules/yonghu/list'
    import chat from '@/views/modules/chat/list'
    import yongpinfenlei from '@/views/modules/yongpinfenlei/list'
    import discusstiyuyongpin from '@/views/modules/discusstiyuyongpin/list'
    import xianshihuodong from '@/views/modules/xianshihuodong/list'
    import messages from '@/views/modules/messages/list'
    import orders from '@/views/modules/orders/list'
    import config from '@/views/modules/config/list'
import forum from '@/views/modules/forum/list'
import zhanneihuodong from '@/views/modules/zhanneihuodong/list'


//2.配置路由   注意：名字
const routes = [{
    path: '/index',
    name: '系统首页',
    component: Index,
    children: [{
      // 这里不设置值，是把main作为默认页面
      path: '/',
      name: '系统首页',
      component: Home,
      meta: {icon:'', title:'center'}
    }, {
      path: '/updatePassword',
      name: '修改密码',
      component: UpdatePassword,
      meta: {icon:'', title:'updatePassword'}
    }, {
      path: '/pay',
      name: '支付',
      component: pay,
      meta: {icon:'', title:'pay'}
    }, {
      path: '/center',
      name: '个人信息',
      component: center,
      meta: {icon:'', title:'center'}
    } ,{
      path: '/forum',
      name: '交流论坛',
      component: forum
    }
      ,{
	path: '/news',
        name: '公告信息',
        component: news
      }
      ,{
	path: '/aboutus',
        name: '关于我们',
        component: aboutus
      }
      ,{
	path: '/discussxianshihuodong',
        name: '限时活动评论',
        component: discussxianshihuodong
      }
      ,{
	path: '/tiyuyongpin',
        name: '甜品',
        component: tiyuyongpin
      }
      ,{
	path: '/shangjia',
        name: '商户',
        component: shangjia
      }
      ,{
            path: '/zhanneihuodong',
            name: '站内活动',
            component: zhanneihuodong
        },{
	path: '/systemintro',
        name: '系统简介',
        component: systemintro
      }
      ,{
	path: '/yonghu',
        name: '用户',
        component: yonghu
      }
      ,{
	path: '/chat',
        name: '在线客服',
        component: chat
      }
      ,{
	path: '/yongpinfenlei',
        name: '甜品类型',
        component: yongpinfenlei
      }
      ,{
	path: '/discusstiyuyongpin',
        name: '甜品评论',
        component: discusstiyuyongpin
      }
      ,{
	path: '/xianshihuodong',
        name: '限时活动',
        component: xianshihuodong
      }
      ,{
	path: '/messages',
        name: '意见反馈',
        component: messages
      }
      ,{
        path: '/orders/:status',
        name: '订单管理',
        component: orders
      }
      ,{
	path: '/config',
        name: '轮播图管理',
        component: config
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {icon:'', title:'login'}
  },
  {
    path: '/register',
    name: 'register',
    component: register,
    meta: {icon:'', title:'register'}
  },
  {
    path: '/',
    name: '系统首页',
    redirect: '/index'
  }, /*默认跳转路由*/
  {
    path: '*',
    component: NotFound
  }
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
  mode: 'hash',
  /*hash模式改为history*/
  routes // （缩写）相当于 routes: routes
})
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
   return originalPush.call(this, location).catch(err => err)
}
export default router;
