var objj = {message:"会变的"};

var vmt = new Vue({
    el: '#foo1',
    data:objj
});

var obj = {message:'不变的'};

Object.freeze(obj);

var vm = new Vue({
    el: "#foo2",
    data:obj
});
