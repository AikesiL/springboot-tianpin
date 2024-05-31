import VueRouter from 'vue-router'

//引入组件
import Index from '../pages'
import Home from '../pages/home/home'
import Login from '../pages/login/login'
import Register from '../pages/register/register'
import Center from '../pages/center/center'
import Messages from '../pages/messages/list'
import Storeup from '../pages/storeup/list'
import AddrList from '../pages/shop-address/list'
import AddrAdd from '../pages/shop-address/addOrUpdate'
import Order from '../pages/shop-order/list'
import OrderConfirm from '../pages/shop-order/confirm'
import Cart from '../pages/shop-cart/list'
import News from '../pages/news/news-list'
import NewsDetail from '../pages/news/news-detail'



import Zhanneihuodong from '../pages/zhanneihuodong/news-list'
import ZhanneihuodongDetail from '../pages/zhanneihuodong/news-detail'






import shangjiaList from '../pages/shangjia/list'
import shangjiaDetail from '../pages/shangjia/detail'
import shangjiaAdd from '../pages/shangjia/add'
import yonghuList from '../pages/yonghu/list'
import yonghuDetail from '../pages/yonghu/detail'
import yonghuAdd from '../pages/yonghu/add'
import yongpinfenleiList from '../pages/yongpinfenlei/list'
import yongpinfenleiDetail from '../pages/yongpinfenlei/detail'
import yongpinfenleiAdd from '../pages/yongpinfenlei/add'
import tiyuyongpinList from '../pages/tiyuyongpin/list'
import tiyuyongpinDetail from '../pages/tiyuyongpin/detail'
import tiyuyongpinAdd from '../pages/tiyuyongpin/add'
import xianshihuodongList from '../pages/xianshihuodong/list'
import xianshihuodongDetail from '../pages/xianshihuodong/detail'
import xianshihuodongAdd from '../pages/xianshihuodong/add'
import aboutusList from '../pages/aboutus/list'
import aboutusDetail from '../pages/aboutus/detail'
import aboutusAdd from '../pages/aboutus/add'
import Forum from '../pages/forum/list'
import ForumAdd from '../pages/forum/add'
import ForumDetail from '../pages/forum/detail'
import MyForumList from '../pages/forum/myForumList'
import yongpintuijianList from '../pages/yongpintuijian/list'
import yongpintuijianDetail from '../pages/yongpintuijian/detail'
import yongpintuijianAdd from '../pages/yongpintuijian/add'


const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}

//配置路由
export default new VueRouter({
	routes:[
		{
      path: '/',
      redirect: '/index/home'
    },
		{
			path: '/index',
			component: Index,
			children:[
				{
					path: 'home',
					component: Home
				},
				{
					path: 'center',
					component: Center,
				},
				{
					path: 'messages',
					component: Messages
				},
				{
					path: 'storeup',
					component: Storeup
				},
                {
                    path: 'shop-address/list',
                    component: AddrList
                },
                {
                    path: 'shop-address/addOrUpdate',
                    component: AddrAdd
                },
				{
					path: 'shop-order/order',
					component: Order
				},
				{
					path: 'cart',
					component: Cart
				},
				{
					path: 'shop-order/orderConfirm',
					component: OrderConfirm
				},
				{
					path: 'news',
					component: News
				},
				{
					path: 'newsDetail',
					component: NewsDetail
				},


				{
					path: 'zhanneihuodong',
					component: Zhanneihuodong
				},
				{
					path: 'zhanneihuodongDetail',
					component: ZhanneihuodongDetail
				},





				{
					path: 'shangjia',
					component: shangjiaList
				},
				{
					path: 'shangjiaDetail',
					component: shangjiaDetail
				},
				{
					path: 'shangjiaAdd',
					component: shangjiaAdd
				},
				{
					path: 'yonghu',
					component: yonghuList
				},
				{
					path: 'yonghuDetail',
					component: yonghuDetail
				},
				{
					path: 'yonghuAdd',
					component: yonghuAdd
				},
				{
					path: 'yongpinfenlei',
					component: yongpinfenleiList
				},
				{
					path: 'yongpinfenleiDetail',
					component: yongpinfenleiDetail
				},
				{
					path: 'yongpinfenleiAdd',
					component: yongpinfenleiAdd
				},

				{
					path: 'forum',
					component: Forum
				},
				{
					path: 'forumAdd',
					component: ForumAdd
				},
				{
					path: 'forumDetail',
					component: ForumDetail
				},

				{
					path: 'myForumList',
					component: MyForumList
				},
				{
					path: 'yongpintuijian',
					component: yongpintuijianList
				},
				{
					path: 'yongpintuijianDetail',
					component: yongpintuijianDetail
				},
				{
					path: 'yongpintuijianAdd',
					component: yongpintuijianAdd
				},



				{
					path: 'tiyuyongpin',
					component: tiyuyongpinList
				},
				{
					path: 'tiyuyongpinDetail',
					component: tiyuyongpinDetail
				},
				{
					path: 'tiyuyongpinAdd',
					component: tiyuyongpinAdd
				},
				{
					path: 'xianshihuodong',
					component: xianshihuodongList
				},
				{
					path: 'xianshihuodongDetail',
					component: xianshihuodongDetail
				},
				{
					path: 'xianshihuodongAdd',
					component: xianshihuodongAdd
				},
				{
					path: 'aboutus',
					component: aboutusList
				},
				{
					path: 'aboutusDetail',
					component: aboutusDetail
				},
				{
					path: 'aboutusAdd',
					component: aboutusAdd
				},
			]
		},
		{
			path: '/login',
			component: Login
		},
		{
			path: '/register',
			component: Register
		},
	]
})
