package com.dmcs.bentyn



import static org.springframework.http.HttpStatus.*

import java.text.SimpleDateFormat;

import com.sun.beans.decoder.TrueElementHandler;
import com.sun.org.apache.bcel.internal.generic.RETURN;

import grails.converters.JSON;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	
	@Transactional
	@Secured(['ROLE_USER','ROLE_ADMIN'])
    def create() {
		Event event = parseEvent(new Event(),params);
		event.save flush:true
		render event as JSON
    }


    @Transactional
	@Secured(['ROLE_USER','ROLE_ADMIN'])
    def update() {
		Event eventInstance = Event.get(Long.parseLong (params.id))
        eventInstance = parseEvent(eventInstance,params);

		if (eventInstance == null) {
            return
        }
        eventInstance.save flush:true
		render eventInstance as JSON
    }

    @Transactional
	@Secured(['ROLE_USER','ROLE_ADMIN'])
    def delete() {
		Event eventInstance = Event.get(Long.parseLong (params.id))
        if (eventInstance == null) {
            return
        }

        eventInstance.delete flush:true
		render eventInstance as JSON
    }

	
	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def getEvents(Employee employeeInstance){

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date start = format.parse(params.start);
		Date end = format.parse(params.end);
		def events=Event.findAllByEmployeeAndStartDateGreaterThanEqualsAndEndDateLessThanEqualsAndRepeatable(employeeInstance,start,end,false);
		events += getRepeatable(employeeInstance,start)
		if (events == null) {
			return null;
		}else{
			render events as JSON;
		}
	}
	
	protected def getRepeatable(Employee employeeInstance,Date start){
		def repeatable = Event.findAllByEmployeeAndRepeatable(employeeInstance,true);
	
		repeatable.each()  {Event event->
			event.startDate=moveDateToWeek(event.startDate,start)
			event.endDate=moveDateToWeek(event.endDate,start)
		}
		return repeatable
	}
	
	
	private Date moveDateToWeek(Date dateToMove,Date startDate){
		Calendar startCal = Calendar.getInstance();
		Calendar toMoveCal = Calendar.getInstance();
		startCal.setTime(startDate)
		toMoveCal.setTime(dateToMove)

		addDaysToWeekStart(toMoveCal,startCal)
		startCal.set(Calendar.HOUR_OF_DAY, toMoveCal.get(Calendar.HOUR_OF_DAY))
		startCal.set(Calendar.MINUTE, toMoveCal.get(Calendar.MINUTE))
		startCal.getTime()
		
	}
	
	private void addDaysToWeekStart(Calendar toMoveCal,Calendar startWeekCal){
		int toAdd;
		switch (toMoveCal.get(Calendar.DAY_OF_WEEK)) {
			case Calendar.MONDAY :
				toAdd=0;
				break;
			case Calendar.TUESDAY :
				toAdd=1;
				break;
			case Calendar.WEDNESDAY :
				toAdd=2;
				break;
			case Calendar.THURSDAY :
				toAdd=3;
				break;
			case Calendar.FRIDAY :
				toAdd=4;
				break;
			case Calendar.SATURDAY :
				toAdd=5;
				break;
			case Calendar.SUNDAY :
				toAdd=6;
				break;

		}
		startWeekCal.set(Calendar.DAY_OF_MONTH, startWeekCal.get(Calendar.DAY_OF_MONTH)+toAdd);
	}
	
	protected Event parseEvent(Event event, params){
		event.title=params.title;
		event.employee=Employee.get(Long.parseLong (params.employee));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		format.setTimeZone(TimeZone.getTimeZone("UTC"))
		event.startDate = format.parse(params.startDate);
		event.endDate = format.parse(params.endDate);
		event.allDay=Boolean.parseBoolean(params.allDay);
		event.repeatable=Boolean.parseBoolean(params.repeatable);
		
		return event;
	}
	
	
	
}
