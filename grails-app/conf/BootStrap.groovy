import grails.converters.JSON;

import com.dmcs.bentyn.Event;
import com.dmcs.bentyn.EventColors;

class BootStrap {

    def init = { servletContext ->
		//JSON marshaler for events
		JSON.registerObjectMarshaller( Event ) { Event event ->
			def color=EventColors.BASIC.value ;
			if (event.repeatable){
				color=EventColors.REPEATABLE.value;
			}
			return [
			id : event.id,
			title : event.title,
			start : event.startDate,
			end : event.endDate,
			allDay : event.allDay,
			repeatable:event.repeatable,
			color:color
			]
		}
		
		TimeZone.setDefault(TimeZone.getTimeZone("UTC"))
    }
    def destroy = {
    }
}
