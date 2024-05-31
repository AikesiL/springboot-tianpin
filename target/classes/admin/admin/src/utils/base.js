const base = {
    get() {
        return {
            url : "http://localhost:8080/springboot4op8n/",
            name: "springboot4op8n",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/springboot4op8n/front/dist/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "基于协同过滤算法的甜品类美食推荐系统的设计与实现"
        } 
    }
}
export default base
