$('a#favorite').click(function(e) {
	 var self = $(this),
  	      arr = $('a#favorite').attr('href').split("/"),
         leng = arr.length,
       params = { list_id: arr[leng - 1] };
  	$.ajax( { 
				url: "/favorite",
  		        type: "post",
  		        data: params,
  		        dataType: "json"
  		    } )

  			.success( function(data) { self.parent().html("") } )
   			.fail( function(data) { alert("error: " + data); } );
	e.preventDefault();
})