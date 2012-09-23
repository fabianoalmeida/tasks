$('a#unfavorite').click(function(e) {
	 var self = $(this),
  	      arr = $('a#unfavorite').attr('href').split("/"),
         leng = arr.length,
       params = { list_id: arr[leng - 1] };
  	$.ajax( { 
				url: "/unfavorite",
  		        type: "put",
  		        data: params,
  		        dataType: "json"
  		    } )

  			.success( function(data) { self.parent().parent().remove() } )
   			.fail( function(data) { alert("error: " + data); } );
	e.preventDefault();
})