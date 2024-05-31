<template>
    <div>
        <div :style='{"padding":"12px","boxShadow":"0 0px 6px #999","margin":"0px auto","borderColor":"#fff","borderRadius":"0px","background":"linear-gradient(180deg, #eee 0%, #fff 32%, #eee 100%)","borderWidth":"1px 0 1px 0","width":"100%","borderStyle":"solid"}'
             class="breadcrumb-preview">
            <el-breadcrumb :separator="'Ξ'"
                           :style='{"width":"1200px","margin":"0 auto","fontSize":"14px","lineHeight":"1"}'>
                <el-breadcrumb-item>首页</el-breadcrumb-item>
                <el-breadcrumb-item v-for="(item, index) in breadcrumbItem" :key="index">{{item.name}}
                </el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div :style='{"padding":"12px","boxShadow":"0 0px 6px #999","margin":"0px auto","borderColor":"#fff","borderRadius":"0px","background":"linear-gradient(180deg, #eee 0%, #fff 32%, #eee 100%)","borderWidth":"1px 0 1px 0","width":"100%","borderStyle":"solid"}'
             class="breadcrumb-preview">
            <el-form :inline="true" :model="formSearch" class="list-form-pv"
                     style="justify-content: center;display: flex;">
                <div class="section-btn">
                    <el-form-item>
                        <el-input v-model="title" placeholder="标题"></el-input>
                    </el-form-item>
                    <el-button type="primary" @click="getNewsList(1)"><i class="el-icon-search"></i>查询</el-button>
                </div>
            </el-form>
        </div>

        <div class="zhanneihuodong-preview"
             :style='{"width":"100%","padding":"20px 0","position":"relative","background":"#fff"}'>


            <div class="list5 index-pv1"
                 :style='{"border":"1px solid #eee","padding":"20px","boxShadow":"0px 0px 0px #eee","margin":"0px auto 0 auto","overflow":"hidden","borderRadius":"4px","flexWrap":"wrap","background":"#fff","display":"flex","width":"1200px","justifyContent":"space-between","height":"auto"}'>
                <div :style='{"cursor":"pointer","padding":"0","boxShadow":"0px 0px 0px #ddd,inset 0px 0px 0px 0px #eee","margin":"0 0px 20px","borderRadius":"0","background":"#e6f5f6","display":"flex","width":"49%","position":"relative","height":"auto"}'
                     v-for="item in zhanneihuodongList" :key="item.id" @click="toNewsDetail(item)"
                     class="list-item animation-box">
                    <el-image
                            :style='{"width":"180px","objectFit":"cover","borderRadius":"0","display":"inline-block","height":"180px"}'
                            :src="baseUrl + item.picture" :fit="fill"></el-image>
                    <div class="item-info"
                         :style='{"width":"400px","padding":"10px","display":"inline-block","height":"auto"}'>
                        <div :style='{"whiteSpace":"nowrap","overflow":"hidden","color":"#333","lineHeight":"32px","fontSize":"14px","textOverflow":"ellipsis","fontWeight":"bold"}'
                             class="title ">{{item.title}}
                        </div>
                        <div :style='{"overflow":"hidden","color":"#666","background":"none","width":"calc(100% - 100px)","lineHeight":"24px","fontSize":"14px","textIndent":"2em","height":"196px"}'
                             class="introduction ">{{item.introduction}}
                        </div>
                        <div :style='{"color":"#999","top":"12px","textAlign":"center","width":"90px","lineHeight":"1.2","fontSize":"12px","position":"absolute","right":"10px"}'
                             class="time ">{{item.addtime}}
                        </div>
                        <div :style='{"padding":"0 10px","fontSize":"14px","lineHeight":"32px","color":"#fff","background":"#333","display":"none"}'
                             class="tags">新闻动态
                        </div>
                    </div>
                </div>
            </div>


            <el-pagination
                    background
                    class="pagination"
                    :pager-count="7"
                    :page-size="pageSize"
                    :page-sizes="pageSizes"
                    prev-text="<"
                    next-text=">"
                    :hide-on-single-page="true"
                    :layout='["total","prev","pager","next","sizes","jumper"].join()'
                    :total="total"
                    :style='{"padding":"0","margin":"10px auto","whiteSpace":"nowrap","color":"#333","width":"1200px","fontWeight":"500","order":"4"}'
                    @current-change="curChange"
                    @prev-click="prevClick"
                    @next-click="nextClick"
            ></el-pagination>
        </div>
    </div>
</template>

<script>
    export default {
        //数据集合
        data() {
            return {
                baseUrl: this.$config.baseUrl,
                breadcrumbItem: [
                    {
                        name: '公告信息'
                    }
                ],
                zhanneihuodongList: [],
                total: 1,
                pageSize: 10, pageSizes: [10, 20, 30, 50],
                totalPage: 1,
                layouts: '',
                title: '',
            }
        },
        created() {
            this.getNewsList(1);
        },
        //方法集合
        methods: {
            getNewsList(page) {
                let params = {page, limit: this.pageSize};
                let searchWhere = {};
                if (this.title != '') searchWhere.title = '%' + this.title + '%';
                this.$http.get('zhanneihuodong/list', {params: Object.assign(params, searchWhere)}).then(res => {
                    if (res.data.code == 0) {
                        this.zhanneihuodongList = res.data.data.list;
                        this.total = res.data.data.total;
                        this.pageSize = res.data.data.pageSize;
                        this.pageSizes = [this.pageSize, this.pageSize * 2, this.pageSize * 3, this.pageSize * 5];
                        this.totalPage = res.data.data.totalPage;
                    }
                });
            },
            curChange(page) {
                this.getNewsList(page);
            },
            prevClick(page) {
                this.getNewsList(page);
            },
            nextClick(page) {
                this.getNewsList(page);
            },
            toNewsDetail(item) {
                this.$router.push({path: '/index/zhanneihuodongDetail', query: {detailObj: JSON.stringify(item)}});
            }
        }
    }
</script>
<style rel="stylesheet/scss" lang="scss" scoped>
    .list-preview .list-form-pv .el-input {
        width: auto;
    }

    .breadcrumb-preview .el-breadcrumb /deep/ .el-breadcrumb__separator {
        margin: 0 9px;
        color: #ccc;
        font-weight: 500;
    }

    .breadcrumb-preview .el-breadcrumb /deep/ .el-breadcrumb__inner a {
        color: #333;
        display: inline-block;
    }

    .breadcrumb-preview .el-breadcrumb /deep/ .el-breadcrumb__inner {
        color: #999;
        display: inline-block;
    }

    .category-1 .item {
        cursor: pointer;
        border: 0px solid #ffd800;
        margin: 0 10px 0 -10px;
        color: #333;
        white-space: nowrap;
        font-size: 14px;
        line-height: 46px;
        text-overflow: ellipsis;
        border-radius: 0px;
        box-shadow: 0px 0px 0px #ceb44a;
        overflow: hidden;
        background: url(http://codegen.caihongy.cn/20221121/105dda983a8641cdb4b2e19309374203.png) no-repeat left top, url(http://codegen.caihongy.cn/20221121/2399c20d2b1642e7befa8c2a7aa12de3.png) no-repeat right bottom, linear-gradient(180deg, rgba(225, 240, 240, 1) 0%, rgba(225, 240, 240, 1) 50%, rgba(0, 173, 181, 1) 50%, rgba(0, 173, 181, 1) 100%);
        width: 140px;
        text-align: center;
    }

    .category-1 .item:hover {
        cursor: pointer;
        border: 0px solid #fcbc45;
        border-radius: 0px;
        margin: 0 10px 0 -10px;
        color: #333;
        background: url(http://codegen.caihongy.cn/20221121/105dda983a8641cdb4b2e19309374203.png) no-repeat left top, url(http://codegen.caihongy.cn/20221121/2399c20d2b1642e7befa8c2a7aa12de3.png) no-repeat right bottom, linear-gradient(0deg, rgba(225, 240, 240, 1) 0%, rgba(225, 240, 240, 1) 50%, rgba(0, 173, 181, 1) 50%, rgba(0, 173, 181, 1) 100%);
        width: 140px;
        font-size: 14px;
        line-height: 46px;
        text-align: center;
    }

    .category-1 .item.active {
        cursor: pointer;
        border: 0;
        border-radius: 0px;
        margin: 0 10px 0 -10px;
        color: #333;
        background: url(http://codegen.caihongy.cn/20221121/105dda983a8641cdb4b2e19309374203.png) no-repeat left top, url(http://codegen.caihongy.cn/20221121/2399c20d2b1642e7befa8c2a7aa12de3.png) no-repeat right bottom, linear-gradient(0deg, rgba(225, 240, 240, 1) 0%, rgba(225, 240, 240, 1) 50%, rgba(0, 173, 181, 1) 50%, rgba(0, 173, 181, 1) 100%);
        width: 140px;
        font-size: 14px;
        line-height: 46px;
        text-align: center;
    }

    .category-2 .item {
        cursor: pointer;
        border-radius: 4px;
        box-shadow: 0;
        margin: 0 0 10px 0;
        color: #fff;
        background: linear-gradient(135deg, rgba(17, 112, 210, 1) 0%, rgba(8, 179, 68, 1) 100%);
        width: 100%;
        font-size: 14px;
        line-height: 36px;
        text-align: center;
    }

    .category-2 .item:hover {
        cursor: pointer;
        border: 1px solid #1170d2;
        border-radius: 4px;
        box-shadow: 0;
        margin: 0 0 10px 0;
        color: #fff;
        background: linear-gradient(135deg, rgba(8, 179, 68, 1) 0%, rgba(17, 112, 210, 1) 100%);
        width: 100%;
        font-size: 14px;
        line-height: 36px;
        text-align: center;
    }

    .category-2 .item.active {
        cursor: pointer;
        border: 1px solid #1170d2;
        border-radius: 4px;
        box-shadow: 0;
        margin: 0 0 10px 0;
        color: #fff;
        background: linear-gradient(135deg, rgba(8, 179, 68, 1) 0%, rgba(17, 112, 210, 1) 100%);
        width: 100%;
        font-size: 14px;
        line-height: 36px;
        text-align: center;
    }

    .list-form-pv .el-input /deep/ .el-input__inner {
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 0 10px;
        box-shadow: 0px 0px 0px #ccc;
        margin: 0px;
        outline: none;
        color: #666;
        width: 140px;
        font-size: 14px;
        line-height: 40px;
        height: 40px;
    }

    .list-form-pv .el-select /deep/ .el-input__inner {
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 0 10px;
        box-shadow: 0px 0px 0px #ccc;
        margin: 0px;
        outline: none;
        color: #666;
        width: 140px;
        font-size: 14px;
        line-height: 40px;
        height: 40px;
    }

    .list-form-pv .el-date-editor /deep/ .el-input__inner {
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 0 30px;
        box-shadow: 0px 0px 0px #ccc;
        margin: 0px;
        outline: none;
        color: #666;
        width: 140px;
        font-size: 14px;
        line-height: 40px;
        height: 40px;
    }

    .list .index-pv1 .animation-box {
        transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
        z-index: initial;
    }

    .list .index-pv1 .animation-box:hover {
        -webkit-perspective: 1000px;
        perspective: 1000px;
        transition: 0.3s;
        z-index: 1;
    }

    .list .index-pv1 .animation-box img {
        transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
    }

    .list .index-pv1 .animation-box img:hover {
        filter: brightness(1.1);
        transform: rotate(0deg) scale(1.06);
        -webkit-perspective: 1000px;
        perspective: 1000px;
        transition: all 0.3s ease-in-out 0s;
    }

    .el-pagination /deep/ .el-pagination__total {
        margin: 0 10px 0 0;
        color: #666;
        font-weight: 400;
        display: inline-block;
        vertical-align: top;
        font-size: 13px;
        line-height: 28px;
        height: 28px;
    }

    .el-pagination /deep/ .btn-prev {
        border: none;
        border-radius: 2px;
        padding: 0;
        margin: 0 5px;
        color: #666;
        background: #f4f4f5;
        display: inline-block;
        vertical-align: top;
        font-size: 13px;
        line-height: 28px;
        min-width: 35px;
        height: 28px;
    }

    .el-pagination /deep/ .btn-next {
        border: none;
        border-radius: 2px;
        padding: 0;
        margin: 0 5px;
        color: #666;
        background: #f4f4f5;
        display: inline-block;
        vertical-align: top;
        font-size: 13px;
        line-height: 28px;
        min-width: 35px;
        height: 28px;
    }

    .el-pagination /deep/ .btn-prev:disabled {
        border: none;
        cursor: not-allowed;
        border-radius: 2px;
        padding: 0;
        margin: 0 5px;
        color: #C0C4CC;
        background: #f4f4f5;
        display: inline-block;
        vertical-align: top;
        font-size: 13px;
        line-height: 28px;
        height: 28px;
    }

    .el-pagination /deep/ .btn-next:disabled {
        border: none;
        cursor: not-allowed;
        border-radius: 2px;
        padding: 0;
        margin: 0 5px;
        color: #C0C4CC;
        background: #f4f4f5;
        display: inline-block;
        vertical-align: top;
        font-size: 13px;
        line-height: 28px;
        height: 28px;
    }

    .el-pagination /deep/ .el-pager {
        padding: 0;
        margin: 0;
        display: inline-block;
        vertical-align: top;
    }

    .el-pagination /deep/ .el-pager .number {
        cursor: pointer;
        padding: 0 4px;
        margin: 0 5px;
        color: #666;
        display: inline-block;
        vertical-align: top;
        font-size: 13px;
        line-height: 28px;
        border-radius: 2px;
        background: #f4f4f5;
        text-align: center;
        min-width: 30px;
        height: 28px;
    }

    .el-pagination /deep/ .el-pager .number:hover {
        cursor: pointer;
        padding: 0 4px;
        margin: 0 5px;
        color: #fff;
        display: inline-block;
        vertical-align: top;
        font-size: 13px;
        line-height: 28px;
        border-radius: 2px;
        background: #00adb5;
        text-align: center;
        min-width: 30px;
        height: 28px;
    }

    .el-pagination /deep/ .el-pager .number.active {
        cursor: default;
        padding: 0 4px;
        margin: 0 5px;
        color: #FFF;
        display: inline-block;
        vertical-align: top;
        font-size: 13px;
        line-height: 28px;
        border-radius: 2px;
        background: #00adb5;
        text-align: center;
        min-width: 30px;
        height: 28px;
    }

    .el-pagination /deep/ .el-pagination__sizes {
        display: inline-block;
        vertical-align: top;
        font-size: 13px;
        line-height: 28px;
        height: 28px;
    }

    .el-pagination /deep/ .el-pagination__sizes .el-input {
        margin: 0 5px;
        width: 100px;
        position: relative;
    }

    .el-pagination /deep/ .el-pagination__sizes .el-input .el-input__inner {
        border: 1px solid #DCDFE6;
        cursor: pointer;
        padding: 0 25px 0 8px;
        color: #606266;
        display: inline-block;
        font-size: 13px;
        line-height: 28px;
        border-radius: 3px;
        outline: 0;
        background: #FFF;
        width: 100%;
        text-align: center;
        height: 28px;
    }

    .el-pagination /deep/ .el-pagination__sizes .el-input span.el-input__suffix {
        top: 0;
        position: absolute;
        right: 0;
        height: 100%;
    }

    .el-pagination /deep/ .el-pagination__sizes .el-input .el-input__suffix .el-select__caret {
        cursor: pointer;
        color: #C0C4CC;
        width: 25px;
        font-size: 14px;
        line-height: 28px;
        text-align: center;
    }

    .el-pagination /deep/ .el-pagination__jump {
        margin: 0 0 0 24px;
        color: #606266;
        display: inline-block;
        vertical-align: top;
        font-size: 13px;
        line-height: 28px;
        height: 28px;
    }

    .el-pagination /deep/ .el-pagination__jump .el-input {
        border-radius: 3px;
        padding: 0 2px;
        margin: 0 2px;
        display: inline-block;
        width: 50px;
        font-size: 14px;
        line-height: 18px;
        position: relative;
        text-align: center;
        height: 28px;
    }

    .el-pagination /deep/ .el-pagination__jump .el-input .el-input__inner {
        border: 1px solid #DCDFE6;
        cursor: pointer;
        padding: 0 3px;
        color: #606266;
        display: inline-block;
        font-size: 14px;
        line-height: 28px;
        border-radius: 3px;
        outline: 0;
        background: #FFF;
        width: 100%;
        text-align: center;
        height: 28px;
    }
</style>
