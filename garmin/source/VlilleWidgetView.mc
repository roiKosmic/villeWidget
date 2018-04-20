using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using VlilleCst;
using Toybox.Timer as Timer;

class VlilleWidgetView extends Ui.View {
	
	
	var parking_ = true;
	var circles;
	var circleUpR;
	var circleUpL;
	var circleDownR;
	var circleDownL;
	var title;
	var type;
	var type2;
	var logo;
	hidden var upRmMessage;
	hidden var upLmMessage;
	hidden var dwRmMessage;
	hidden var dwLmMessage;
    function initialize() {
        View.initialize();
        //circles = new Rez.Drawables.circles();
    }

    // Load your resources here
    function onLayout(dc) {
        
         var myTimer = new Timer.Timer();
    	 myTimer.start(method(:timerCallback), 1000, true);
         circleUpR =  Application.getApp().getProperty("circleUpRName");
         circleUpL = Application.getApp().getProperty("circleUpLName");
         circleDownR = Application.getApp().getProperty("circleDownRName");
         circleDownL = Application.getApp().getProperty("circleDownLName");
         title = Ui.loadResource( Rez.Strings.title );
         type = Ui.loadResource(Rez.Strings.parking);
         logo = Ui.loadResource(Rez.Drawables.vlilleLogo);
      	 type2 = Ui.loadResource(Rez.Strings.retrait);
     	 upRmMessage = "-";
		 upLmMessage = "-";
		 dwRmMessage = "-";
		 dwLmMessage = "-";
         setLayout(Rez.Layouts.MainLayout(dc));
            
        }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout	
        View.onUpdate(dc);
        dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT );
        dc.drawText(105,0,Gfx.FONT_MEDIUM,title,Gfx.TEXT_JUSTIFY_CENTER);
        if(parking_){
        	dc.drawText(105,20,Gfx.FONT_SMALL,type,Gfx.TEXT_JUSTIFY_CENTER);
        }else{
        	dc.drawText(105,20,Gfx.FONT_SMALL,type2,Gfx.TEXT_JUSTIFY_CENTER);
        }
       
     
        
        var view = View.findDrawableById("circleUpL");
        view.setText(circleUpL);
         view = View.findDrawableById("circleUpR");
        view.setText(circleUpR);
        
         view = View.findDrawableById("circleDownL");
        view.setText(circleDownL);
        
        
         view = View.findDrawableById("circleDownR");
        view.setText(circleDownR);
        
        
      
        
         view = View.findDrawableById("upLmMessage");
        view.setText(upLmMessage);
         view = View.findDrawableById("upRmMessage");
        view.setText(upRmMessage);
        
         view = View.findDrawableById("dwLmMessage");
        view.setText(dwLmMessage);
        
        
         view = View.findDrawableById("dwRmMessage");
        view.setText(dwRmMessage);
        
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
     function onReceive(args,circleSw,parking) {
     	parking_ = parking;
     	var sargs;
     	
        if (!(args instanceof Lang.String)) {
        	sargs = args.toString();
        
        }else{
        	sargs = args;
        }
            if(circleSw == VlilleCst.UP_LEFT){
            	upLmMessage = sargs;
            }else if(circleSw == VlilleCst.UP_RIGHT){
            	upRmMessage = sargs;
            }else if(circleSw == VlilleCst.DW_RIGHT){
            	dwRmMessage = sargs;
            }else if (circleSw == VlilleCst.DW_LEFT){
            	dwLmMessage = sargs;
            }else if (circleSw == VlilleCst.ALL){
            	upLmMessage = sargs;
            	upRmMessage= sargs;
            	dwRmMessage = sargs;
            	dwLmMessage = sargs;
            }
        
        
      
    }
    
    function timerCallback() {
    	Ui.requestUpdate();
    }
}
    


