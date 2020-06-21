<%@ page import="java.util.*"%>
<%!
	class Record {
		Date data;
		String message;
		Record(Date data, String message){
			this.data = data;
			this.message = message;
		}				
	};
	ArrayList<Record> records = new ArrayList<Record>();
%>		
<%
	if(records.size() == 0) {
	records.add(new Record(new Date(2020 - 1900, 6, 15, 8, 30),
		"Good morning)"));
	records.add(new Record(new Date(2020 - 1900, 6, 15, 8, 33),
		"Good morning!"));
	records.add(new Record(new Date(2020 - 1900, 6, 15, 8, 40),
		"I go to the job"));
	}
	String message = request.getParameter("message");
	if (message != null && message.trim().length()!=0) {
		records.add(new Record(new Date(), message));
	}
%>
<%
	out.println("[");
	for (Record r : records) {
		out.println("{data: \"" + r.data + "\", message: \"" + r.message + "\"},");
	}
	out.println("]");			
%>