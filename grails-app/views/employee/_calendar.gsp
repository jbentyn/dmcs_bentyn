<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
	<head>		
		<link rel="stylesheet" href="<g:resource dir="js/fullcalendar-2.2.3" file="fullcalendar.css" />" type="text/css">
		<g:javascript src="moment/moment-with-locales.min.js" />
		<g:javascript src="fullcalendar-2.2.3/fullcalendar.min.js" />

<script>
function showMessageDialog(header, message){
	 $( "#dialog" ).html(message);
	
	 $( "#dialog" ).dialog({
         resizable: false,
         height:200,
         width:500,
         modal: true,
         title: header,
         buttons: {
                    OK: function() {
                        $("#dialog").dialog( "close" );
                    },
                    
                  }
    });
}

function showInputDialog(header,label,okFunction){
	$( "#dialog" ).html('<span class="property-label">'+label+'</span><input id="dialogInput" type="text" name="dialog.input"/>');
	$( "#dialog" ).dialog({
        resizable: false,
        height:200,
        width:500,
        modal: true,
        title: header,
        buttons: {
                   OK: okFunction,
                   'CANCEL': function(){$( "#dialog" ).dialog("close");}
                 }
   });
}
<g:if test="${calendarEditable}" >

function updateEvent(event, delta, revertFunc){
	var updateUrl = '<g:createLink url="[action:'update',controller:'event']" />';
	var isAllDay=!event.start.hasTime();
    	 
    		$.ajax({
				url: updateUrl,
				method: 'POST',
				data : {
					'id':event.id,
					'startDate': event.start.format("YYYY-MM-DD HH:mm:ss"),
					'endDate': event.end.format("YYYY-MM-DD HH:mm:ss"),
					'employee': ${employeeInstance.id},
					//changeable
    				'title': event.title,
					'allDay': isAllDay,
					'color' : event.color,
					'repeatable': event.repeatable
					}
				})
				 .done(function(result) {

					event.title=result.title;
					event.allDay=result.allDay;
					event.color=result.color;
					event.repeatable=result.repeatable;
					
					$('#calendar').fullCalendar('updateEvent', event);
				})
				.fail(function() {
					showMessageDialog( "Error", "Error updating event"+event.title );
					revertFunc();
				});
     
}
</g:if>

	$(document).ready(function() {
		var getUrl = '<g:createLink url="[action:'getEvents',controller:'event']" />';
		getUrl+= "/${employeeInstance.id}"
		var createUrl = '<g:createLink url="[action:'create',controller:'event']" />';
		var deleteUrl = '<g:createLink url="[action:'delete',controller:'event']" />';

	 $('#calendar').fullCalendar({
	
		editable : ${calendarEditable},
		selectable: ${calendarEditable},
		selectHelper: ${calendarEditable},
		theme : true,
		firstDay : 1,
		defaultView : 'agendaWeek',
		bussinesHours : {start:'8:00', end :'20:00' },
		slotDuration : "1:00:00",
		minTime : "8:00:00",
		maxTime : "21:00:00",
		timeFormat:{agenda:'H:mm','':'H:mm'} , 
		height:550,

		// getAllEvents
		events: {
	        url: getUrl,
	        type: 'POST',
	        error: function() {
	        	showMessageDialog("Error",'there was an error while fetching events!');
	        },
	    },
	    <g:if test="${calendarEditable}" >
	    //creating by selecting range
		select: function(start, end, jsEvent,view){
			var isAllDay=!start.hasTime();
			showInputDialog('New event','Enter event title' ,
					
			function(){
					var title = $('#dialogInput').val();
					if (title)
					{
					
						$.ajax({
							url: createUrl,
							method: 'POST',
							data : {'title': title,
								'startDate': start.format("YYYY-MM-DD HH:mm:ss"),
								'endDate': end.format("YYYY-MM-DD HH:mm:ss"),
								'allDay': isAllDay,
								'repeatable': false,
								'color': 'blue',
								'employee': ${employeeInstance.id}}
							})
							 .done(function(result) {
								//create new event
							
								$('#calendar').fullCalendar('renderEvent',
										{id:result.id, title: title,start: start,end: end,allDay: isAllDay,color:'blue'}
										,false );
								showMessageDialog( "Added","Event " +title+" added");
							})
							.fail(function() {
								showMessageDialog("Error","Error adding event" );
							});
					}
				});
			
			$('#calendar').fullCalendar('unselect');
		},

		// delete by clicking on event
		eventClick: function(event, jsEvent, view) {

           var id = event.id;
           	$( "#dialog" ).html('What you want to do?');
            $( "#dialog" ).dialog({
                  resizable: false,
                  height:400,
                  width:500,
                  modal: true,
                  title: 'Edit event?',
                  buttons: {
                             CLOSE: function() {
                                 $("#dialog").dialog( "close" );
                             },

                             "CHNAGE_TITLE": function(){
                         		showInputDialog('Change name','Enter event title' ,function(){
                         			var title = $('#dialogInput').val();
                					if (title)
                					{
                    					event.title=title;
                    					updateEvent(event, null, null);
                    					$("#dialog").dialog( "close" );
                         			}
                         		});
                             },
                             "CHNAGE_TYPE": function(){
                          		if (event.allDay){
                          			showMessageDialog( "Change type", "Can't change  all day event type" );
                              	}
                          		else{
                              		event.repeatable = !event.repeatable;
                              		updateEvent(event, null, null);
                              		 $("#dialog").dialog( "close" );
                                }
                              },
                             
                             "DELETE": function() {
                                 // removing 
                            	 $.ajax({
                 					url: deleteUrl,
                 					method: 'POST',
                 					data : {'id': id}
                            	 	})
                 					 .done(function() {
                 						showMessageDialog( "Removed", "Event: "+event.title+" removed" );
                 						$('#calendar').fullCalendar('removeEvents',id);
                 					})
                 					.fail(function() {
                 						alert( "Error removing event" );
                 					});
              					
                            	 $("#dialog").dialog( "close" );
                             }
                           
                             
                           }
             });
       },
		// update when moving and resize event
       eventDrop:function(event, delta, revertFunc) { updateEvent(event, delta, revertFunc)},
       eventResize:function(event, delta, revertFunc) { updateEvent(event, delta, revertFunc) } 
  		</g:if>
	});
});
</script>
		
		
</head>

<body>
<h2>Timetable</h2>
<div id='calendar'></div>
<div id="dialog"  style="display:none;"></div>
</body>
</html>