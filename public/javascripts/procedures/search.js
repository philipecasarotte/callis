$(document).ready(function() {
	$("#q").click(function(){
		if ($(this).val() == "digite aqui sua palavra-chave") {
			$(this).val("");
		};
	});
	
	$("#q").blur(function(){
		if ($(this).val() == "") {
			$(this).val("digite aqui sua palavra-chave");
		};
	});
});
