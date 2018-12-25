var test1 = new Vue({
    el: "#test1",
    data: {
        message: "Try"
    }
});
var test1 = new Vue({
    el: "#test2",
    data:{
        message: "Try"
    }
});
var test3 = new Vue({
    el: "#test3",
    data: {
        useHTML:"<span style='color:red'>花儿为什么这样红</span>"
    }
});
var goal = document.getElementsByName("test3")[0]
var test3 = new Vue({
    el: goal,
    data: {
        testID:"test3",
        getIDis:" "
    },
    methods: {
        getID:function(){
            this.getIDis=goal.getAttribute("id");
        }
    }
});
