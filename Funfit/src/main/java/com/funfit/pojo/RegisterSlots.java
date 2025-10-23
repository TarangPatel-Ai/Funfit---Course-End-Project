package com.funfit.pojo;

public class RegisterSlots {
	
	private int    id;        // auto-generated primary key
    private int    slotId;    // FK → slots.id
    private String userEmail; // FK → user.email
    private String date;      // convenience – copied from slots table
    private String time;      // convenience – copied from slots table
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSlotId() {
		return slotId;
	}
	public void setSlotId(int slotId) {
		this.slotId = slotId;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
    
    
	
}
