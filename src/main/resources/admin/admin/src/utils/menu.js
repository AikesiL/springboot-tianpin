const menu = {
    list() {
        return [{
            "backMenu": [{
                "child": [{
                    "appFrontIcon": "cuIcon-link",
                    "buttons": ["新增", "查看", "修改", "删除", "审核"],
                    "menu": "商户",
                    "menuJump": "列表",
                    "tableName": "shangjia"
                }], "menu": "商户管理"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-news",
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "用户",
                    "menuJump": "列表",
                    "tableName": "yonghu"
                }], "menu": "用户管理"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-list",
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "甜品类型",
                    "menuJump": "列表",
                    "tableName": "yongpinfenlei"
                }], "menu": "甜品类型管理"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-skin",
                    "buttons": ["查看", "修改", "删除", "查看评论"],
                    "menu": "甜品",
                    "menuJump": "列表",
                    "tableName": "tiyuyongpin"
                }], "menu": "甜品管理"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-skin",
                    "buttons": ["查看", "修改", "删除", "查看评论"],
                    "menu": "限时活动",
                    "menuJump": "列表",
                    "tableName": "xianshihuodong"
                }], "menu": "限时活动管理"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-message",
                    "buttons": ["查看", "修改", "回复", "删除"],
                    "menu": "意见反馈",
                    "tableName": "messages"
                }], "menu": "意见反馈"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-group",
                    "buttons": ["查看", "修改", "删除", "查看评论"],
                    "menu": "交流论坛",
                    "tableName": "forum"
                }], "menu": "交流论坛"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-news",
                    "buttons": ["新增", "查看", "修改", "删除" ],
                    "menu": "站内活动",
                    "menuJump": "列表",
                    "tableName": "zhanneihuodong"
                }], "menu": "站内活动管理"
            },{
                "child": [{
                    "appFrontIcon": "cuIcon-qrcode",
                    "buttons": ["查看", "修改"],
                    "menu": "关于我们",
                    "tableName": "aboutus"
                }, {
                    "appFrontIcon": "cuIcon-news",
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "公告信息",
                    "tableName": "news"
                }, {
                    "appFrontIcon": "cuIcon-circle",
                    "buttons": ["查看", "修改"],
                    "menu": "系统简介",
                    "tableName": "systemintro"
                }, {
                    "appFrontIcon": "cuIcon-service",
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "在线客服",
                    "tableName": "chat"
                }, {"appFrontIcon": "cuIcon-medal", "buttons": ["查看", "修改"], "menu": "轮播图管理", "tableName": "config"}],
                "menu": "系统管理"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-medal",
                    "buttons": ["查看",  "日销量", "品销量", "日销额", "品销额"],
                    "menu": "已完成订单",
                    "tableName": "orders/已完成"
                }, {
                    "appFrontIcon": "cuIcon-copy",
                    "buttons": ["查看"],
                    "menu": "已取消订单",
                    "tableName": "orders/已取消"
                }, {
                    "appFrontIcon": "cuIcon-news",
                    "buttons": ["查看"],
                    "menu": "已退款订单",
                    "tableName": "orders/已退款"
                }, {
                    "appFrontIcon": "cuIcon-circle",
                    "buttons": ["查看"],
                    "menu": "未支付订单",
                    "tableName": "orders/未支付"
                }, {
                    "appFrontIcon": "cuIcon-keyboard",
                    "buttons": ["查看"],
                    "menu": "已发货订单",
                    "tableName": "orders/已发货"
                }, {
                    "appFrontIcon": "cuIcon-circle",
                    "buttons": ["查看", "发货"],
                    "menu": "已支付订单",
                    "tableName": "orders/已支付"
                }], "menu": "订单管理"
            }],
            "frontMenu": [{
                "child": [{
                    "appFrontIcon": "cuIcon-keyboard",
                    "buttons": ["查看"],
                    "menu": "甜品列表",
                    "menuJump": "列表",
                    "tableName": "tiyuyongpin"
                }], "menu": "甜品模块"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-present",
                    "buttons": ["查看"],
                    "menu": "限时活动列表",
                    "menuJump": "列表",
                    "tableName": "xianshihuodong"
                }], "menu": "限时活动模块"
            }],
            "hasBackLogin": "是",
            "hasBackRegister": "否",
            "hasFrontLogin": "否",
            "hasFrontRegister": "否",
            "roleName": "管理员",
            "tableName": "users"
        }, {
            "backMenu": [{
                "child": [{
                    "appFrontIcon": "cuIcon-skin",
                    "buttons": ["新增", "查看", "修改", "删除", "查看评论","库存图表"],
                    "menu": "甜品",
                    "menuJump": "列表",
                    "tableName": "tiyuyongpin"
                }], "menu": "甜品管理"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-skin",
                    "buttons": ["新增", "查看", "修改", "删除", "查看评论"],
                    "menu": "限时活动",
                    "menuJump": "列表",
                    "tableName": "xianshihuodong"
                }], "menu": "限时活动管理"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-news",
                    "buttons": ["查看"],
                    "menu": "已退款订单",
                    "tableName": "orders/已退款"
                }, {
                    "appFrontIcon": "cuIcon-circle",
                    "buttons": ["查看"],
                    "menu": "未支付订单",
                    "tableName": "orders/未支付"
                }, {
                    "appFrontIcon": "cuIcon-keyboard",
                    "buttons": ["查看", "物流"],
                    "menu": "已发货订单",
                    "tableName": "orders/已发货"
                }, {
                    "appFrontIcon": "cuIcon-circle",
                    "buttons": ["查看", "发货"],
                    "menu": "已支付订单",
                    "tableName": "orders/已支付"
                }, {
                    "appFrontIcon": "cuIcon-medal",
                    "buttons": ["查看", "物流", "日销量", "品销量", "日销额", "品销额"],
                    "menu": "已完成订单",
                    "tableName": "orders/已完成"
                }, {"appFrontIcon": "cuIcon-copy", "buttons": ["查看"], "menu": "已取消订单", "tableName": "orders/已取消"}],
                "menu": "订单管理"
            }],
            "frontMenu": [{
                "child": [{
                    "appFrontIcon": "cuIcon-keyboard",
                    "buttons": ["查看"],
                    "menu": "甜品列表",
                    "menuJump": "列表",
                    "tableName": "tiyuyongpin"
                }], "menu": "甜品模块"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-present",
                    "buttons": ["查看"],
                    "menu": "限时活动列表",
                    "menuJump": "列表",
                    "tableName": "xianshihuodong"
                }], "menu": "限时活动模块"
            }],
            "hasBackLogin": "是",
            "hasBackRegister": "是",
            "hasFrontLogin": "否",
            "hasFrontRegister": "否",
            "roleName": "商户",
            "tableName": "shangjia"
        }, {
            "backMenu": [],
            "frontMenu": [{
                "child": [{
                    "appFrontIcon": "cuIcon-keyboard",
                    "buttons": ["查看"],
                    "menu": "甜品列表",
                    "menuJump": "列表",
                    "tableName": "tiyuyongpin"
                }], "menu": "甜品模块"
            }, {
                "child": [{
                    "appFrontIcon": "cuIcon-present",
                    "buttons": ["查看"],
                    "menu": "限时活动列表",
                    "menuJump": "列表",
                    "tableName": "xianshihuodong"
                }], "menu": "限时活动模块"
            }],
            "hasBackLogin": "否",
            "hasBackRegister": "否",
            "hasFrontLogin": "是",
            "hasFrontRegister": "是",
            "roleName": "用户",
            "tableName": "yonghu"
        }]
    }
}
export default menu;
