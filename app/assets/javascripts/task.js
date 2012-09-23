$('a#new_task').click(function(e) {
	var tr = $('<tr>'),
		td = $('<td colspan="2">'),
		input = $("<input id='task_name' type='text' />");
	td.append( input );
	tr.append( td );
	$('table#tasks tr:last').after(tr);
	input.focus();
	attachEvent();
	e.preventDefault();
})

function attachEvent() {
	$('input#task_name').off('keydown');
	$('input#task_name').keydown( function(e){
		
		if (e.which == 13) {
			 var self = $(this),
	  	  	    value = self.val(),
	  	  	      url = $('a#new_task').attr('href'),
	           params = { task: { name: value } };
	  	  	$.ajax( { 
						url: url + "/tasks",
	  	  		        type: "post",
	  	  		        data: params,
	  	  		        dataType: "json"
	  	  		    } )
	
	  	  			.success( function(data) { 
						self.parent().html(data.name) } )
						
	  	   			.fail( function(data) { alert("error: "+data); } );
			e.preventDefault();
		}
	});
}