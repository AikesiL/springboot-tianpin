<template>
	<div>
		<div class="container"
			 :style='{"minHeight":"100vh","alignItems":"center","background":"url(http://codegen.caihongy.cn/20221123/41243b070df2408aa2d042419117b15f.jpg) no-repeat","display":"flex","width":"100%","backgroundSize":"100% 100%","backgroundPosition":"center center","backgroundRepeat":"no-repeat","justifyContent":"center"}'>
			<el-form ref="loginForm" :model="loginForm"
					 :style='{"padding":"40px 40px 40px 500px","boxShadow":"12px 12px 0px #9cd8da,inset 0px 0px 0px 0px #e0f8e8","margin":"20px 0 0 0","borderColor":"#00adb5  #00adb5 #00adb5 #00adb5","borderRadius":"0 0 20% 20%","background":"rgba(255,255,255,.2)","borderWidth":"4px","width":"1000px","borderStyle":"solid double double double","height":"auto"}'
					 :rules="rules">
				<div v-if="true"
					 :style='{"width":"100%","margin":"0 0 10px 0","fontSize":"24px","color":"#333","textAlign":"center","fontWeight":"bold"}'>
					USER / LOGIN
				</div>
				<div v-if="true"
					 :style='{"width":"100%","margin":"0 0 30px 0","fontSize":"24px","color":"#333","textAlign":"center","fontWeight":"bold"}'>
					基于协同过滤算法的甜品类美食推荐系统的设计与实现登录
                </div>
				<el-form-item v-if="loginType==1" class="list-item" :style='{"width":"80%","margin":"0 auto 24px"}'
							  prop="username">
					<div v-if="false" :style='{"width":"64px","lineHeight":"40px","fontSize":"14px","color":"#ffa100"}'>
						账号：
					</div>
					<input :style='{"border":"0px solid #eacb96","padding":"0 10px","boxShadow":"0px 2px 0px #a0d8db","color":"#999","borderRadius":"20px","background":"#fff","width":"100%","fontSize":"14px","height":"44px"}'
						   v-model="loginForm.username" placeholder="请输入账户">
				</el-form-item>
				<el-form-item v-if="loginType==1" class="list-item" :style='{"width":"80%","margin":"0 auto 24px"}'
							  prop="password">
					<div v-if="false" :style='{"width":"64px","lineHeight":"40px","fontSize":"14px","color":"#ffa100"}'>
						密码：
					</div>
					<input :style='{"border":"0px solid #eacb96","padding":"0 10px","boxShadow":"0px 2px 0px #a0d8db","color":"#999","borderRadius":"20px","background":"#fff","width":"100%","fontSize":"14px","height":"44px"}'
						   v-model="loginForm.password" placeholder="请输入密码" type="password">
				</el-form-item>
                <el-form-item v-if="roles.length>1" class="list-type" :style='{"width":"80%","margin":"20px auto"}'
                              prop="role">
                    <el-radio v-model="loginForm.tableName" :label="item.tableName" v-for="(item, index) in roles"
                              :key="index" @change.native="getCurrentRow(item)">{{item.roleName}}
                    </el-radio>
                </el-form-item>
                <el-form-item :style='{"width":"80%","margin":"20px auto"}'>
                    <el-button v-if="loginType==1"
                               :style='{"border":"0","cursor":"pointer","padding":"0px","boxShadow":"1px 2px 3px #aaa","margin":"0 5px","outline":"none","color":"#666","borderRadius":"20px","background":"radial-gradient(circle, rgba(255,236,157,1) 0%, rgba(255,200,0,1) 100%)","width":"128px","fontSize":"14px","height":"40px"}'
                               @click="submitForm('loginForm')">登录
                    </el-button>
                    <el-button v-if="loginType==1"
                               :style='{"border":"1px solid #bbb","cursor":"pointer","padding":"0px","boxShadow":"1px 2px 3px #ccc","margin":"0 5px","outline":"none","color":"#999","borderRadius":"20px","background":"#fff","width":"128px","fontSize":"14px","height":"40px"}'
                               @click="resetForm('loginForm')">重置
                    </el-button>
                    <el-upload v-if="loginType==2" :action="baseUrl + 'file/upload'" :show-file-list="false"
                               :on-success="faceLogin">
                        <el-button
                                :style='{"border":"0","cursor":"pointer","padding":"0px","boxShadow":"1px 2px 3px #aaa","margin":"0 5px","outline":"none","color":"#666","borderRadius":"20px","background":"radial-gradient(circle, rgba(255,236,157,1) 0%, rgba(255,200,0,1) 100%)","width":"128px","fontSize":"14px","height":"40px"}'>
                            人脸识别登录
                        </el-button>
                    </el-upload>
                </el-form-item>
                <div :style='{"width":"80%","margin":"20px auto"}'>
                    <router-link
                            :style='{"cursor":"pointer","margin":"0 5px","fontSize":"14px","textDecoration":"none","color":"#ffa100"}'
                            :to="{path: '/register', query: {role: item.tableName,pageFlag:'register'}}"
                            v-if="item.hasFrontRegister=='是'" v-for="(item, index) in roles" :key="index">
                        注册{{item.roleName.replace('注册','')}}
                    </router-link>
                </div>
            </el-form>
        </div>
    </div>
</template>

<script>

    export default {
        //数据集合
        data() {
            return {
                baseUrl: this.$config.baseUrl,
                loginType: 1,
                roleMenus: [{
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
                        }, {
                            "appFrontIcon": "cuIcon-medal",
                            "buttons": ["查看", "修改"],
                            "menu": "轮播图管理",
                            "tableName": "config"
                        }], "menu": "系统管理"
                    }, {
                        "child": [{
                            "appFrontIcon": "cuIcon-medal",
                            "buttons": ["查看"],
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
                            "buttons": ["新增", "查看", "修改", "删除", "查看评论"],
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
                        }, {
                            "appFrontIcon": "cuIcon-copy",
                            "buttons": ["查看"],
                            "menu": "已取消订单",
                            "tableName": "orders/已取消"
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
                }],
                loginForm: {
                    username: '',
                    password: '',
                    tableName: '',
                    code: '',
                },
                role: '',
                roles: [],
                rules: {
                    username: [
                        {required: true, message: '请输入账户', trigger: 'blur'}
                    ],
                    password: [
                        {required: true, message: '请输入密码', trigger: 'blur'}
                    ]
                },
                codes: [{
                    num: 1,
                    color: '#000',
                    rotate: '10deg',
                    size: '16px'
                }, {
                    num: 2,
                    color: '#000',
                    rotate: '10deg',
                    size: '16px'
                }, {
                    num: 3,
                    color: '#000',
                    rotate: '10deg',
                    size: '16px'
                }, {
                    num: 4,
                    color: '#000',
                    rotate: '10deg',
                    size: '16px'
                }]
            }
        },
        created() {
            for (let item in this.roleMenus) {
                if (this.roleMenus[item].hasFrontLogin == '是') {
                    this.roles.push(this.roleMenus[item]);
                }
            }
        },
        mounted() {
        },
        //方法集合
        methods: {
            randomString() {
                var len = 4;
                var chars = [
                    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
                    'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                    'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
                    'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2',
                    '3', '4', '5', '6', '7', '8', '9'
                ]
                var colors = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
                var sizes = ['14', '15', '16', '17', '18']

                var output = []
                for (var i = 0; i < len; i++) {
                    // 随机验证码
                    var key = Math.floor(Math.random() * chars.length)
                    this.codes[i].num = chars[key]
                    // 随机验证码颜色
                    var code = '#'
                    for (var j = 0; j < 6; j++) {
                        var key = Math.floor(Math.random() * colors.length)
                        code += colors[key]
                    }
                    this.codes[i].color = code
                    // 随机验证码方向
                    var rotate = Math.floor(Math.random() * 45)
                    var plus = Math.floor(Math.random() * 2)
                    if (plus == 1) rotate = '-' + rotate
                    this.codes[i].rotate = 'rotate(' + rotate + 'deg)'
                    // 随机验证码字体大小
                    var size = Math.floor(Math.random() * sizes.length)
                    this.codes[i].size = sizes[size] + 'px'
                }
            },
            getCurrentRow(row) {
                this.role = row.roleName;
            },
            submitForm(formName) {
                if (this.roles.length != 1) {
                    if (!this.role) {
                        this.$message.error("请选择登录用户类型");
                        return false;
                    }
                } else {
                    this.role = this.roles[0].roleName;
                    this.loginForm.tableName = this.roles[0].tableName;
                }
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$http.get(`${this.loginForm.tableName}/login`, {params: this.loginForm}).then(res => {
                            if (res.data.code === 0) {
                                localStorage.setItem('Token', res.data.token);
                                localStorage.setItem('UserTableName', this.loginForm.tableName);
                                localStorage.setItem('username', this.loginForm.username);
                                localStorage.setItem('adminName', this.loginForm.username);
                                localStorage.setItem('sessionTable', this.loginForm.tableName);
                                localStorage.setItem('role', this.role);
                                localStorage.setItem('keyPath', this.$config.indexNav.length + 2);
                                this.$router.push('/index/center');
                                this.$message({
                                    message: '登录成功',
                                    type: 'success',
                                    duration: 1500,
                                });
                            } else {
                                this.$message.error(res.data.msg);
                            }
                        });
                    } else {
                        return false;
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            }
        }
    }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
    .container {
        position: relative;
        background: url(http://codegen.caihongy.cn/20221117/4028956d321c4de892a3b7bc9df13600.jpg) no-repeat;

        .el-form-item {
            & /deep/ .el-form-item__content {
                width: 100%;
            }
        }

        .list-item /deep/ .el-input .el-input__inner {
            border: 1px solid #eacb96;
            border-radius: 8px;
            padding: 0 10px;
            box-shadow: 0px 2px 0px #eacb96;
            color: #999;
            background: -webkit-linear-gradient(top, #fff, #f8ecd8);
            width: 100%;
            font-size: 14px;
            height: 44px;
        }

        .list-code /deep/ .el-input .el-input__inner {
            border: 1px solid #eacb96;
            border-radius: 8px;
            padding: 0 10px;
            box-shadow: 0px 2px 0px #eacb96;
            outline: none;
            color: #999;
            background: -webkit-linear-gradient(top, #fff, #f8ecd8);
            display: inline-block;
            vertical-align: middle;
            width: calc(100% - 160px);
            font-size: 14px;
            height: 44px;
        }

        .list-type /deep/ .el-radio__input .el-radio__inner {
            background: rgba(53, 53, 53, 0);
            border-color: #666666;
        }

        .list-type /deep/ .el-radio__input.is-checked .el-radio__inner {
            background: #ffa100;
            border-color: #fd8a25;
        }

        .list-type /deep/ .el-radio__label {
            color: #666666;
            font-size: 14px;
        }

        .list-type /deep/ .el-radio__input.is-checked + .el-radio__label {
            color: #ffa100;
            font-size: 14px;
        }
    }
</style>
