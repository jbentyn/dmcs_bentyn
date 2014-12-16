package com.dmcs.bentyn

import java.sql.Types;

import com.dmcs.bentyn.Employee;

class Event {	
	Long id;
	String title;
	Date startDate;
	Date endDate;
	Boolean allDay;
	Boolean repeatable;
	
	static belongsTo = [employee:Employee]
	
	
    static constraints = {
    }
}
