//jquery form序列化转换为json对象
(function($){
    $.fn.serializeJson=function(){
        var serializeObj={};
        var array=this.serializeArray();
        var str=this.serialize();
        $(array).each(function(){
            if(serializeObj[this.name]){
                if($.isArray(serializeObj[this.name])){
                    serializeObj[this.name].push(this.value);
                }else{
                    serializeObj[this.name]=[serializeObj[this.name],this.value];
                }
            }else{
                serializeObj[this.name]=this.value;
            }
        });
        return serializeObj;
    };
})(jQuery);

function formToJson(formId) {
    var paramArray = $('#' + formId).serializeArray();
    var jsonObj={};
    $(paramArray).each(function(){
        jsonObj[this.name]=this.value;
    });
    return jsonObj;
}
