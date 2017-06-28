//删除图片
function deleteImage(imageId){
	$.ajax({
        type: "POST",
        url: "/personal/deleteImage.html",
        data: {'imageId':imageId},       
        dataType: 'json',
        success: function(result) {
        	console.debug(result);
        	if(result=='success'){
        		$('#'+imageId).remove();
        	}else{
            	layer.msg('删除失败', {icon: 5	});
        	}
        },
        error:function(XMLHttpRequest, textStatus, errorThrown){
        	layer.msg('删除失败', {icon: 5	});
        }
    });
}