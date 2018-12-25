var app = new Vue({
    el: "#app-1",
    data: {
        message:"go die!!!!"
    }
});

var app2=new Vue({
    el:"#app-2",
    data:{
        message:'页面加载于' + new Date().toLocaleString()
    }
});

var app3 = new Vue({
    el:'#app-3',
    data:{
        seen1:false,
        seen2:true,
    }
});

var app4 = new Vue({
    el: '#app-4',
    data: {
        todos:[
            {text: '学习Javascript'},
            {text: '学习 Vue'},
            {text: '整个牛项目'},
        ]
    }
});

var app5 = new Vue({
    el:'#app-5',
    data:{
        message:"Vue.js"
    },
    methods:{
        reverseMessage:function () {
            this.message = this.message.split('').reverse().join('');
        }
    }
});

var app6 = new Vue({
    el:'#app-6',
    data:{
        message:'这里写上面都无所谓啦'
    }
});

// 定义一个名为todo-item的新组件
Vue.component('todo-item', {
    template:"<li>这是一个新组件</li>"
});

var app7 = new Vue({
    el:'#app-7',

    // 这里挂载了但是并没有使用，而不挂载就算定义了组件也用不了，为什么？？？

});



// 为什么先注册了再挂载？？？

Vue.component('new-todo-item',{
    // new-todo-item组件现在接受一个“piops”，类似于一个自定义特性。
    // 这个prop名为todo。
    props: ['todo'],
    // 这里的todo.text是前台接受todo对象，然后这个对象的text属性，
    // 这里的todo为HTML里面lists遍历出来的item
    template: '<li>{{ todo.text }}</li>'
});

var app8 = new Vue({
    el:'#app-8',
    data:{
        lists:[      //这里是数组不是Object
            {id: 0, text: '水果'},
            {id: 1, text: '西瓜'},
            {id: 2, text: '随便其它什么人吃的对象'}
        ]
    }
});
