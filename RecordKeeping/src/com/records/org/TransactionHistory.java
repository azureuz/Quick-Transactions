package com.records.org;

import java.util.ArrayList;
import java.util.HashMap;

public class TransactionHistory {
	
ArrayList<String> sender = new ArrayList<String>();
ArrayList<String> receiver = new ArrayList<String>();
ArrayList<Integer> ammount = new ArrayList<Integer>();
HashMap<ArrayList<String>, ArrayList<Integer>> senderMap = new HashMap<ArrayList<String>,ArrayList<Integer>>();
HashMap<ArrayList<String>, ArrayList<Integer>> receiverMap = new HashMap<ArrayList<String>,ArrayList<Integer>>();

//HashMap<Long, String> transactionTime = new HashMap<Long, String>();
//	
//	public void transact(String s, java.util.Date dt) {
//		long newDt = dt.getTime();
//		transactionTime.put(newDt,s);
//	}
	
	

	public void putHistory(String send, String receive, int amount) {
		sender.add(send);
		receiver.add(receive);
		ammount.add(amount);
		senderMap.put(sender, ammount);
		receiverMap.put(receiver,ammount);
	}
	
	
	public void showHistory() {
		
		for(String s: sender) {
			System.out.println(s);
		}
		for(String s: receiver) {
			System.out.println(s);
		}
		for(int s: ammount) {
			System.out.println(s);
		}
		
	}
	
}
