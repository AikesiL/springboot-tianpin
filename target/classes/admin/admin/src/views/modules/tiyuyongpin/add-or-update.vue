<template>
    <div class="addEdit-block" style="width: 100%;">
        <el-form
                :style='{"padding":"30px","boxShadow":"0px 4px 10px 0px rgba(0,0,0,0.3020)","margin":"0 auto","borderColor":"rgba(230, 242, 254, 1)","borderRadius":"6px","borderWidth":"30px 0 0 0","width":"90%","borderStyle":"solid"}'
                class="add-update-preview"
                ref="ruleForm"
                :model="ruleForm"
                :rules="rules"
                label-width="140px"
        >
            <template>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="input"
                              v-if="type!='info'" label="甜品编号" prop="yongpinbianhao">
                    <el-input v-model="ruleForm.yongpinbianhao" placeholder="甜品编号" readonly></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="input"
                              v-else-if="ruleForm.yongpinbianhao" label="甜品编号" prop="yongpinbianhao">
                    <el-input v-model="ruleForm.yongpinbianhao" placeholder="甜品编号" readonly></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="input"
                              v-if="type!='info'" label="甜品名称" prop="yongpinmingcheng">
                    <el-input v-model="ruleForm.yongpinmingcheng" placeholder="甜品名称" clearable
                              :readonly="ro.yongpinmingcheng"></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' v-else
                              class="input" label="甜品名称" prop="yongpinmingcheng">
                    <el-input v-model="ruleForm.yongpinmingcheng" placeholder="甜品名称" readonly></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="select"
                              v-if="type!='info'" label="甜品类型" prop="yongpinfenlei">
                    <el-select :disabled="ro.yongpinfenlei" v-model="ruleForm.yongpinfenlei" placeholder="请选择甜品类型">
                        <el-option
                                v-for="(item,index) in yongpinfenleiOptions"
                                v-bind:key="index"
                                :label="item"
                                :value="item">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' v-else
                              class="input" label="甜品类型" prop="yongpinfenlei">
                    <el-input v-model="ruleForm.yongpinfenlei"
                              placeholder="甜品类型" readonly></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="input"
                              v-if="type!='info'" label="口味" prop="pinpai">
                    <el-input v-model="ruleForm.pinpai" placeholder="口味" clearable :readonly="ro.pinpai"></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' v-else
                              class="input" label="口味" prop="pinpai">
                    <el-input v-model="ruleForm.pinpai" placeholder="口味" readonly></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="upload"
                              v-if="type!='info' && !ro.yongpintupian" label="甜品图片" prop="yongpintupian">
                    <file-upload
                            tip="点击上传甜品图片"
                            action="file/upload"
                            :limit="3"
                            :multiple="true"
                            :fileUrls="ruleForm.yongpintupian?ruleForm.yongpintupian:''"
                            @change="yongpintupianUploadChange"
                    ></file-upload>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="upload"
                              v-else-if="ruleForm.yongpintupian" label="甜品图片" prop="yongpintupian">
                    <img v-if="ruleForm.yongpintupian.substring(0,4)=='http'" class="upload-img"
                         style="margin-right:20px;" v-bind:key="index" :src="ruleForm.yongpintupian.split(',')[0]"
                         width="100" height="100">
                    <img v-else class="upload-img" style="margin-right:20px;" v-bind:key="index"
                         v-for="(item,index) in ruleForm.yongpintupian.split(',')" :src="$base.url+item" width="100"
                         height="100">
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="input"
                              v-if="type!='info'" label="商户账号" prop="shangjiazhanghao">
                    <el-input v-model="ruleForm.shangjiazhanghao" placeholder="商户账号" clearable
                              :readonly="ro.shangjiazhanghao"></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' v-else
                              class="input" label="商户账号" prop="shangjiazhanghao">
                    <el-input v-model="ruleForm.shangjiazhanghao" placeholder="商户账号" readonly></el-input>
                </el-form-item>


                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="input"
                              v-if="type!='info'" label="成分" prop="chengfen">
                    <el-input v-model="ruleForm.chengfen" placeholder="成分" clearable
                              :readonly="ro.chengfen"></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' v-else
                              class="input" label="成分" prop="chengfen">
                    <el-input v-model="ruleForm.chengfen" placeholder="成分" readonly></el-input>
                </el-form-item>










                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="input"
                              v-if="type!='info'" label="店铺名称" prop="dianpumingcheng">
                    <el-input v-model="ruleForm.dianpumingcheng" placeholder="店铺名称" clearable
                              :readonly="ro.dianpumingcheng"></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' v-else
                              class="input" label="店铺名称" prop="dianpumingcheng">
                    <el-input v-model="ruleForm.dianpumingcheng" placeholder="店铺名称" readonly></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="input"
                              v-if="type!='info'" label="单限" prop="onelimittimes">
                    <el-input v-model="ruleForm.onelimittimes" placeholder="单限" clearable
                              :readonly="ro.onelimittimes"></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' v-else
                              class="input" label="单限" prop="onelimittimes">
                    <el-input v-model="ruleForm.onelimittimes" placeholder="单限" readonly></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="input"
                              v-if="type!='info'" label="库存" prop="alllimittimes">
                    <el-input v-model="ruleForm.alllimittimes" placeholder="库存" clearable
                              :readonly="ro.alllimittimes"></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' v-else
                              class="input" label="库存" prop="alllimittimes">
                    <el-input v-model="ruleForm.alllimittimes" placeholder="库存" readonly></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' class="input"
                              v-if="type!='info'" label="价格" prop="price">
                    <el-input v-model="ruleForm.price" placeholder="价格" clearable :readonly="ro.price"></el-input>
                </el-form-item>
                <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' v-else
                              class="input" label="价格" prop="price">
                    <el-input v-model="ruleForm.price" placeholder="价格" readonly></el-input>
                </el-form-item>
            </template>
            <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}' v-if="type!='info'"
                          label="制作方法" prop="shangpinjianjie">
                <editor
                        style="min-width: 200px; max-width: 600px;"
                        v-model="ruleForm.shangpinjianjie"
                        class="editor"
                        action="file/upload">
                </editor>
            </el-form-item>
            <el-form-item :style='{"width":"45%","margin":"0 2% 20px 0","display":"inline-block"}'
                          v-else-if="ruleForm.shangpinjianjie" label="制作方法" prop="shangpinjianjie">
                <span :style='{"fontSize":"14px","lineHeight":"40px","color":"#333","fontWeight":"500","display":"inline-block"}'
                      v-html="ruleForm.shangpinjianjie"></span>
            </el-form-item>
            <el-form-item :style='{"padding":"0","margin":"0"}' class="btn">
                <el-button
                        :style='{"border":"0","cursor":"pointer","padding":"0","margin":"0 20px 0 0","outline":"none","color":"#333","borderRadius":"4px","background":"rgba(185, 216, 255, 1)","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}'
                        v-if="type!='info'" type="primary" class="btn-success" @click="onSubmit">提交
                </el-button>
                <el-button
                        :style='{"border":"0px solid rgba(64, 158, 255, 1)","cursor":"pointer","padding":"0","margin":"0","outline":"none","color":"#fff","borderRadius":"4px","background":"rgba(198, 205, 214, 1)","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}'
                        v-if="type!='info'" class="btn-close" @click="back()">取消
                </el-button>
                <el-button
                        :style='{"border":"0px solid rgba(64, 158, 255, 1)","cursor":"pointer","padding":"0","margin":"0","outline":"none","color":"#fff","borderRadius":"4px","background":"rgba(198, 205, 214, 1)","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}'
                        v-if="type=='info'" class="btn-close" @click="back()">返回
                </el-button>
            </el-form-item>
        </el-form>


    </div>
</template>
<script>
    // 数字，邮件，手机，url，身份证校验
    import {isNumber, isIntNumer, isEmail, isPhone, isMobile, isURL, checkIdCard} from "@/utils/validate";

    export default {
        data() {
            let self = this
            var validateIdCard = (rule, value, callback) => {
                if (!value) {
                    callback();
                } else if (!checkIdCard(value)) {
                    callback(new Error("请输入正确的身份证号码"));
                } else {
                    callback();
                }
            };
            var validateUrl = (rule, value, callback) => {
                if (!value) {
                    callback();
                } else if (!isURL(value)) {
                    callback(new Error("请输入正确的URL地址"));
                } else {
                    callback();
                }
            };
            var validateMobile = (rule, value, callback) => {
                if (!value) {
                    callback();
                } else if (!isMobile(value)) {
                    callback(new Error("请输入正确的手机号码"));
                } else {
                    callback();
                }
            };
            var validatePhone = (rule, value, callback) => {
                if (!value) {
                    callback();
                } else if (!isPhone(value)) {
                    callback(new Error("请输入正确的电话号码"));
                } else {
                    callback();
                }
            };
            var validateEmail = (rule, value, callback) => {
                if (!value) {
                    callback();
                } else if (!isEmail(value)) {
                    callback(new Error("请输入正确的邮箱地址"));
                } else {
                    callback();
                }
            };
            var validateNumber = (rule, value, callback) => {
                if (!value) {
                    callback();
                } else if (!isNumber(value)) {
                    callback(new Error("请输入数字"));
                } else {
                    callback();
                }
            };
            var validateIntNumber = (rule, value, callback) => {
                if (!value) {
                    callback();
                } else if (!isIntNumer(value)) {
                    callback(new Error("请输入整数"));
                } else {
                    callback();
                }
            };
            return {
                id: '',
                type: '',


                ro: {
                    yongpinbianhao: false,
                    yongpinmingcheng: false,
                    yongpinfenlei: false,
                    pinpai: false,
                    yongpintupian: false,
                    shangpinjianjie: false,
                    shangjiazhanghao: false,
                    dianpumingcheng: false,
                    onelimittimes: false,
                    alllimittimes: false,
                    clicktime: false,
                    clicknum: false,
                    price: false,
                },


                ruleForm: {
                    yongpinbianhao: this.getUUID(),
                    yongpinmingcheng: '',
                    yongpinfenlei: '',
                    pinpai: '',
                    yongpintupian: '',
                    shangpinjianjie: '',
                    shangjiazhanghao: '',
                    dianpumingcheng: '',
                    onelimittimes: '-1',
                    alllimittimes: '-1',
                    clicktime: '',
                    price: '',
                },

                yongpinfenleiOptions: [],

                rules: {
                    yongpinbianhao: [],
                    yongpinmingcheng: [],
                    yongpinfenlei: [],
                    pinpai: [],
                    yongpintupian: [],
                    shangpinjianjie: [],
                    shangjiazhanghao: [],
                    dianpumingcheng: [],
                    onelimittimes: [
                        {validator: validateIntNumber, trigger: 'blur'},
                    ],
                    alllimittimes: [
                        {validator: validateIntNumber, trigger: 'blur'},
                    ],
                    clicktime: [],
                    clicknum: [
                        {validator: validateIntNumber, trigger: 'blur'},
                    ],
                    price: [
                        {required: true, message: '价格不能为空', trigger: 'blur'},
                        {validator: validateNumber, trigger: 'blur'},
                    ],
                }
            };
        },
        props: ["parent"],
        computed: {},
        created() {
        },
        methods: {

            // 下载
            download(file) {
                window.open(`${file}`)
            },
            // 初始化
            init(id, type) {
                if (id) {
                    this.id = id;
                    this.type = type;
                }
                if (this.type == 'info' || this.type == 'else') {
                    this.info(id);
                } else if (this.type == 'logistics') {
                    this.logistics = false;
                    this.info(id);
                } else if (this.type == 'cross') {
                    var obj = this.$storage.getObj('crossObj');
                    for (var o in obj) {
                        if (o == 'yongpinbianhao') {
                            this.ruleForm.yongpinbianhao = obj[o];
                            this.ro.yongpinbianhao = true;
                            continue;
                        }
                        if (o == 'yongpinmingcheng') {
                            this.ruleForm.yongpinmingcheng = obj[o];
                            this.ro.yongpinmingcheng = true;
                            continue;
                        }
                        if (o == 'yongpinfenlei') {
                            this.ruleForm.yongpinfenlei = obj[o];
                            this.ro.yongpinfenlei = true;
                            continue;
                        }
                        if (o == 'pinpai') {
                            this.ruleForm.pinpai = obj[o];
                            this.ro.pinpai = true;
                            continue;
                        }
                        if (o == 'yongpintupian') {
                            this.ruleForm.yongpintupian = obj[o];
                            this.ro.yongpintupian = true;
                            continue;
                        }
                        if (o == 'shangpinjianjie') {
                            this.ruleForm.shangpinjianjie = obj[o];
                            this.ro.shangpinjianjie = true;
                            continue;
                        }
                        if (o == 'shangjiazhanghao') {
                            this.ruleForm.shangjiazhanghao = obj[o];
                            this.ro.shangjiazhanghao = true;
                            continue;
                        }
                        if (o == 'dianpumingcheng') {
                            this.ruleForm.dianpumingcheng = obj[o];
                            this.ro.dianpumingcheng = true;
                            continue;
                        }
                        if (o == 'onelimittimes') {
                            this.ruleForm.onelimittimes = obj[o];
                            this.ro.onelimittimes = true;
                            continue;
                        }
                        if (o == 'alllimittimes') {
                            this.ruleForm.alllimittimes = obj[o];
                            this.ro.alllimittimes = true;
                            continue;
                        }
                        if (o == 'clicktime') {
                            this.ruleForm.clicktime = obj[o];
                            this.ro.clicktime = true;
                            continue;
                        }
                        if (o == 'clicknum') {
                            this.ruleForm.clicknum = obj[o];
                            this.ro.clicknum = true;
                            continue;
                        }
                        if (o == 'price') {
                            this.ruleForm.price = obj[o];
                            this.ro.price = true;
                            continue;
                        }
                    }


                    this.ruleForm.onelimittimes = '-1'

                    this.ruleForm.alllimittimes = '-1'


                }


                // 获取用户信息
                this.$http({
                    url: `${this.$storage.get('sessionTable')}/session`,
                    method: "get"
                }).then(({data}) => {
                    if (data && data.code === 0) {

                        var json = data.data;
                        if (((json.shangjiazhanghao != '' && json.shangjiazhanghao) || json.shangjiazhanghao == 0) && this.$storage.get("role") != "管理员") {
                            this.ruleForm.shangjiazhanghao = json.shangjiazhanghao
                            this.ro.shangjiazhanghao = true;
                        }
                        if (((json.dianpumingcheng != '' && json.dianpumingcheng) || json.dianpumingcheng == 0) && this.$storage.get("role") != "管理员") {
                            this.ruleForm.dianpumingcheng = json.dianpumingcheng
                            this.ro.dianpumingcheng = true;
                        }
                    } else {
                        this.$message.error(data.msg);
                    }
                });

                this.$http({
                    url: `option/yongpinfenlei/yongpinfenlei`,
                    method: "get"
                }).then(({data}) => {
                    if (data && data.code === 0) {
                        this.yongpinfenleiOptions = data.data;
                    } else {
                        this.$message.error(data.msg);
                    }
                });

            },
            // 多级联动参数

            info(id) {
                this.$http({
                    url: `tiyuyongpin/info/${id}`,
                    method: "get"
                }).then(({data}) => {
                    if (data && data.code === 0) {
                        this.ruleForm = data.data;
                        //解决前台上传图片后台不显示的问题
                        let reg = new RegExp('../../../upload', 'g')//g代表全部
                        this.ruleForm.shangpinjianjie = this.ruleForm.shangpinjianjie.replace(reg, '../../../springboot4op8n/upload');
                    } else {
                        this.$message.error(data.msg);
                    }
                });
            },


            // 提交
            onSubmit() {


                if (this.ruleForm.yongpintupian != null) {
                    this.ruleForm.yongpintupian = this.ruleForm.yongpintupian.replace(new RegExp(this.$base.url, "g"), "");
                }


                var objcross = this.$storage.getObj('crossObj');

                //更新跨表属性
                var crossuserid;
                var crossrefid;
                var crossoptnum;
                if (this.type == 'cross') {
                    var statusColumnName = this.$storage.get('statusColumnName');
                    var statusColumnValue = this.$storage.get('statusColumnValue');
                    if (statusColumnName != '') {
                        var obj = this.$storage.getObj('crossObj');
                        if (statusColumnName && !statusColumnName.startsWith("[")) {
                            for (var o in obj) {
                                if (o == statusColumnName) {
                                    obj[o] = statusColumnValue;
                                }
                            }
                            var table = this.$storage.get('crossTable');
                            this.$http({
                                url: `${table}/update`,
                                method: "post",
                                data: obj
                            }).then(({data}) => {
                            });
                        } else {
                            crossuserid = this.$storage.get('userid');
                            crossrefid = obj['id'];
                            crossoptnum = this.$storage.get('statusColumnName');
                            crossoptnum = crossoptnum.replace(/\[/, "").replace(/\]/, "");
                        }
                    }
                }
                this.$refs["ruleForm"].validate(valid => {
                    if (valid) {
                        if (crossrefid && crossuserid) {
                            this.ruleForm.crossuserid = crossuserid;
                            this.ruleForm.crossrefid = crossrefid;
                            let params = {
                                page: 1,
                                limit: 10,
                                crossuserid: this.ruleForm.crossuserid,
                                crossrefid: this.ruleForm.crossrefid,
                            }
                            this.$http({
                                url: "tiyuyongpin/page",
                                method: "get",
                                params: params
                            }).then(({
                                         data
                                     }) => {
                                if (data && data.code === 0) {
                                    if (data.data.total >= crossoptnum) {
                                        this.$message.error(this.$storage.get('tips'));
                                        return false;
                                    } else {
                                        this.$http({
                                            url: `tiyuyongpin/${!this.ruleForm.id ? "save" : "update"}`,
                                            method: "post",
                                            data: this.ruleForm
                                        }).then(({data}) => {
                                            if (data && data.code === 0) {
                                                this.$message({
                                                    message: "操作成功",
                                                    type: "success",
                                                    duration: 1500,
                                                    onClose: () => {
                                                        this.parent.showFlag = true;
                                                        this.parent.addOrUpdateFlag = false;
                                                        this.parent.tiyuyongpinCrossAddOrUpdateFlag = false;
                                                        this.parent.search();
                                                        this.parent.contentStyleChange();
                                                    }
                                                });
                                            } else {
                                                this.$message.error(data.msg);
                                            }
                                        });

                                    }
                                } else {
                                }
                            });
                        } else {
                            this.$http({
                                url: `tiyuyongpin/${!this.ruleForm.id ? "save" : "update"}`,
                                method: "post",
                                data: this.ruleForm
                            }).then(({data}) => {
                                if (data && data.code === 0) {
                                    this.$message({
                                        message: "操作成功",
                                        type: "success",
                                        duration: 1500,
                                        onClose: () => {
                                            this.parent.showFlag = true;
                                            this.parent.addOrUpdateFlag = false;
                                            this.parent.tiyuyongpinCrossAddOrUpdateFlag = false;
                                            this.parent.search();
                                            this.parent.contentStyleChange();
                                        }
                                    });
                                } else {
                                    this.$message.error(data.msg);
                                }
                            });
                        }
                    }
                });
            },
            // 获取uuid
            getUUID() {
                return new Date().getTime();
            },
            // 返回
            back() {
                this.parent.showFlag = true;
                this.parent.addOrUpdateFlag = false;
                this.parent.tiyuyongpinCrossAddOrUpdateFlag = false;
                this.parent.contentStyleChange();
            },
            yongpintupianUploadChange(fileUrls) {
                this.ruleForm.yongpintupian = fileUrls;
            },
        }
    };
</script>
<style lang="scss" scoped>
    .amap-wrapper {
        width: 100%;
        height: 500px;
    }

    .search-box {
        position: absolute;
    }

    .el-date-editor.el-input {
        width: auto;
    }

    .add-update-preview .el-form-item /deep/ .el-form-item__label {
        padding: 0 20px 0 0;
        color: #666;
        font-weight: 500;
        width: 140px;
        font-size: 14px;
        line-height: 40px;
        text-align: right;
    }

    .add-update-preview .el-form-item /deep/ .el-form-item__content {
        margin-left: 140px;
    }

    .add-update-preview .el-input /deep/ .el-input__inner {
        border: 2px solid rgba(198, 205, 214, 1);
        border-radius: 4px;
        padding: 0 12px;
        outline: none;
        color: #333;
        width: 250px;
        font-size: 14px;
        height: 40px;
    }

    .add-update-preview .el-select /deep/ .el-input__inner {
        border: 2px solid rgba(198, 205, 214, 1);
        border-radius: 4px;
        padding: 0 10px;
        outline: none;
        color: #333;
        width: 200px;
        font-size: 14px;
        height: 40px;
    }

    .add-update-preview .el-date-editor /deep/ .el-input__inner {
        border: 2px solid rgba(198, 205, 214, 1);
        border-radius: 4px;
        padding: 0 10px 0 30px;
        outline: none;
        color: #333;
        width: 200px;
        font-size: 14px;
        height: 40px;
    }

    .add-update-preview /deep/ .el-upload--picture-card {
        background: transparent;
        border: 0;
        border-radius: 0;
        width: auto;
        height: auto;
        line-height: initial;
        vertical-align: middle;
    }

    .add-update-preview /deep/ .upload .upload-img {
        border: 2px dashed rgba(198, 205, 214, 1);
        cursor: pointer;
        border-radius: 6px;
        color: rgba(198, 205, 214, 1);
        width: 150px;
        font-size: 32px;
        line-height: 150px;
        text-align: center;
        height: 150px;
    }

    .add-update-preview /deep/ .el-upload-list .el-upload-list__item {
        border: 2px dashed rgba(198, 205, 214, 1);
        cursor: pointer;
        border-radius: 6px;
        color: rgba(198, 205, 214, 1);
        width: 150px;
        font-size: 32px;
        line-height: 150px;
        text-align: center;
        height: 150px;
    }

    .add-update-preview /deep/ .el-upload .el-icon-plus {
        border: 2px dashed rgba(198, 205, 214, 1);
        cursor: pointer;
        border-radius: 6px;
        color: rgba(198, 205, 214, 1);
        width: 150px;
        font-size: 32px;
        line-height: 150px;
        text-align: center;
        height: 150px;
    }

    .add-update-preview .el-textarea /deep/ .el-textarea__inner {
        border: 2px dashed rgba(198, 205, 214, 1);
        border-radius: 4px;
        padding: 12px;
        outline: none;
        color: #333;
        width: 300px;
        font-size: 14px;
        height: 120px;
    }
</style>
