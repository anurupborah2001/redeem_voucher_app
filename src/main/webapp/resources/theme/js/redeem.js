/**
 * 
 */
 $(function() {
	 var GET_DETAILS_DATA = "x890";
	 var SAVE_REDEEM = "x098h";
	 var defaultAjaxAction = "POST";
	 var spanDetailsURL = $("#detailurlId");
	 var spanSaveRedeemUrl = $("#redeemurlId");
	 var csrfToken = $("meta[name='_csrf']").attr("content");
	 var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	 var baseUrl =  $("#baseUrl").attr("data-url")
	 var LogoUrl =  $("#logoPath").attr("data-logourl");
	 
	 var ajaxArr = [];
	 ajaxArr["type"] = defaultAjaxAction;
	 ajaxArr["stringify"] = false;
	
    // Setting focus
    $('input[name="email"]').focus();

    // Setting width of the alert box
    var alert = $('.alert');
    var formWidth = $('.bootstrap-admin-login-form').innerWidth();
    var alertPadding = parseInt($('.alert').css('padding'));

    if(isNaN(alertPadding)){
        alertPadding = parseInt($(alert).css('padding-left'));
    }
    
    function showModal(elem){
    	elem.modal('show');
    }
    
    function hideModal(elem){
    	elem.modal('hide');
    }
    
    function copyAllDataAttributes(destELem,sourceElem){
    	if((sourceElem.length > 0) && (destELem.length > 0)){
    		$.each(sourceElem.data(), function (name, value) {
    			destELem.attr("data-"+name,value);
	    	});
    	}
    }

    //$('.alert').width(formWidth - 2 * alertPadding);
    
    function createModalJWTable(response){
    	var c = [];
    	var shopName = "";
		 $.each(response, function(i, item) {
			 shopName = item.shop.shop_name;
			 c.push("<tr><td>" + item.jwt_deal_code + "</td>");
			 c.push("<td><img width=\"50\" height=\"50\" src="+ LogoUrl + item.jwt_deal_long_logo  + " /></td>");
			 c.push("<td>" + item.shop.shop_name + "</td>");
			 c.push("<td>" + item.jwt_deal_long_desc + "</td>");
			 c.push("<td>" + item.jwt_deal_shop_location + "</td>");
			 c.push("<td>" + item.jwt_deal_quota + "</td>");
	      });
		 $("#redeemModalLabel").text(shopName);
		 $('#redeemtd').html(c.join(""));
		 showModal($("#redeemModal"));
	}
    
    function performAfterAjaxOperation(data){
    	if(ajaxArr["action"] == GET_DETAILS_DATA){
    		createModalJWTable(data);
    	}else if(ajaxArr["action"] == SAVE_REDEEM){
    		if(data=="false"){
    			$("#failMsg").show();
    		}else{
    			$("#successMsg").show();
    			$("#getredeem").remove();
    			setTimeout(function(){ window.location.reload(); }, 500);
    		}
    	}else{
    		if(data=="1"){
          	  $(".success-msg").show();
          	  window.location.href=document.URL;
            }
    		 $(".error-msg").show();
        }
    }
    
    
    function makeAjaxCall(ajaxdata){
		if(ajaxArr["stringify"]==true){
			ajaxArr["data"] = JSON.stringify(ajaxArr["data"]);
		}
		var action = action;
		$.ajax({
            url : ajaxArr["url"],
            data: ajaxArr["data"],
            type: ajaxArr["type"],
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.setRequestHeader(csrfHeader, csrfToken);
              },
            success : function(data) {
            	var response=jQuery.type(data);
            	performAfterAjaxOperation(data);
            }
        });
	}
    
    $(".dealDetails").click(function(){
    	var getId = $(this).data("id");
    	var data = {"dealid" : getId };
    	var url  = spanDetailsURL.data("url");
    	ajaxArr["url"] = url + "/" + getId;
    	ajaxArr["data"] = data;
    	ajaxArr["action"] =  GET_DETAILS_DATA;
    	makeAjaxCall(ajaxArr);
    });
    
    $("#redeem-btn").click(function(){
    	//$("#getredeem").copyAllElementAttributes($(this));
    	copyAllDataAttributes($("#getredeem"),$(this))
    	$("#shopName").text($(this).data("shopname"));
    	showModal($("#redeemSubmission"));
    });
    
    $("#getredeem").click(function(){
    	var data = {"uid" : $(this).data("uid"),"deal_id" : $(this).data("id") };
    	ajaxArr["url"] = spanSaveRedeemUrl.data("url");
    	ajaxArr["data"] = data;
    	ajaxArr["stringify"] = true;
    	ajaxArr["action"] =  SAVE_REDEEM;
    	makeAjaxCall(ajaxArr);
    });
});