//
// Copyright 2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.Communications as Comm;
using Toybox.WatchUi as Ui;
using VlilleCst;

class WebRequestDelegate extends Ui.BehaviorDelegate {
    var notify;
    var parking = true;
	var upLCircleId = Application.getApp().getProperty("circleUpLId");
	var dwLCircleId = Application.getApp().getProperty("circleDownLId");
	var dwRCircleId = Application.getApp().getProperty("circleDownRId");
	var upRCircleId = Application.getApp().getProperty("circleUpRId");
    // Handle menu button press
    function onMenu() {
      	makeAllRequest();
        return true;
    }

    function onSelect() {
    	parking = !parking;
        makeAllRequest();
        return true;
    }


	function makeAllRequest(){
		notify.invoke("...",VlilleCst.ALL,parking);
		makeRequest(upLCircleId);
		makeRequest(dwLCircleId);
		makeRequest(dwRCircleId);
		makeRequest(upRCircleId);
		return true;
	
	}
    function makeRequest(id) {
        

        Comm.makeWebRequest(
            "http://www.chicon.fr/vlille/vlilleWS.php",
            {
                "id" => id
            },
            {
                "Content-Type" => Comm.REQUEST_CONTENT_TYPE_URL_ENCODED
            },
            method(:onReceiveWR)
        );
    }

    // Set up the callback to the view
    function initialize(handler) {
        Ui.BehaviorDelegate.initialize();
        notify = handler;
        self.makeAllRequest();
        
    }

    // Receive the data from the web request
    function onReceiveWR(responseCode, data) {
    	var circleSw = 0;
        if (responseCode == 200) {
        	var borneId = data["id"].toNumber(); 
        	if(borneId == upLCircleId){
        		circleSw = VlilleCst.UP_LEFT;
        	}else if(borneId == dwLCircleId){
        		circleSw = VlilleCst.DW_LEFT;
        	}else if (borneId == upRCircleId){
        		circleSw = VlilleCst.UP_RIGHT;
        	}else if (borneId == dwRCircleId){
        		circleSw = VlilleCst.DW_RIGHT;
        	}	
	    	if(parking){
	    		notify.invoke(data["attachs"],circleSw,parking);
	    	}else{
	    	
	    		notify.invoke(data["bikes"],circleSw,parking);
	    	}
        } else {
            notify.invoke("Er",VlilleCst.ALL,parking);
        }
    }
}