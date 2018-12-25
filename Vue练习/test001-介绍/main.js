var app1 = new Vue({
    el: '#app-1',
    data: {
        message: '这是一个声明式渲染'
    }
});
var app2 = new Vue({
    el: '#app-2',
    data: {
        message: '页面加载于>>>' + new Date().toLocaleString()
    }
});
var app3 = new Vue({
    el: '#app-3',
    data: {
        seen1: false,
        seen2: true,
    }
});
var app4 = new Vue({
    el: '#app-4',
    data: {
        items:[
            {message: '西红柿'},
            {message: '西红'},
            {message: '西'},
        ]
    }
});
var app5 = new Vue({
    el: '#app-5',
    data: {
        message: '这里显示点什么'
    },
    methods: {
        some_thing_for_nothing: function(){
            this.message = this.message.split('').reverse().join('');
        }
    }
});
var app6 = new Vue({
    el:'#app-6',
    data: {
        message: 'v-model双向绑定'
    }
});
//先注册组件然后绑定
Vue.component('todo',{template: '<li>这是死的</li>'});
var app7 = new Vue({
    el: '#app-7',
});
Vue.component('todoitem',{
    props: ['todo'],
    template: "<li>{{todo.message}}</li>"
});
var app8 = new Vue({
    el:'#app-8',
    data:{
        lists:[
            {id:3,message: '活的葡萄'},
            {id:4,message: '活的西瓜'},
            {id:2,message: '活的随便什么'},
        ]
    }
});
