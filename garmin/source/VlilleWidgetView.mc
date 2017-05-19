using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using VlilleCst;
class VlilleWidgetView extends Ui.View {
	
	
	var parking_ = true;
	var circles;
	var circleUpR;
	var circleUpL;
	var circleDownR;
	var circleDownL;
	var title;
	var type;
	hidden var upRmMessage = "-";
	hidden var upLmMessage = "-";
	hidden var dwRmMessage = "-";
	hidden var dwLmMessage = "-";
    function initialize() {
        View.initialize();
        circles = new Rez.Drawables.circles();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        
         circleUpR =  Application.getApp().getProperty("circleUpRName");
         circleUpL = Application.getApp().getProperty("circleUpLName");
         circleDownR = Application.getApp().getProperty("circleDownRName");
         circleDownL = Application.getApp().getProperty("circleDownLName");
         title = Ui.loadResource( Rez.Strings.title );
         type = Ui.loadResource(Rez.Strings.parking);
        }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
       
		dc.clear();
        View.onUpdate(dc);
        circles.draw(dc);
        dc.clear();
        dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT );
        dc.drawText(105,0,Gfx.FONT_MEDIUM,title,Gfx.TEXT_JUSTIFY_CENTER);
        if(parking_){
        	dc.drawText(105,20,Gfx.FONT_SMALL,type,Gfx.TEXT_JUSTIFY_CENTER);
        }else{
        	dc.drawText(105,20,Gfx.FONT_SMALL,Ui.loadResource(Rez.Strings.retrait),Gfx.TEXT_JUSTIFY_CENTER);
        }
        dc.drawText( 65, 85, Gfx.FONT_SMALL,circleUpL , Gfx.TEXT_JUSTIFY_VCENTER );
        dc.drawText( 200, 85, Gfx.FONT_SMALL, circleUpR, Gfx.TEXT_JUSTIFY_VCENTER );
        dc.drawText( 80, 155, Gfx.FONT_SMALL,circleDownL , Gfx.TEXT_JUSTIFY_RIGHT );
        dc.drawText( 135, 155, Gfx.FONT_SMALL,circleDownR , Gfx.TEXT_JUSTIFY_LEFT );
        
        
        dc.setColor(Graphics.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
        dc.clear();
        dc.drawText(40, 50, Graphics.FONT_LARGE, upLmMessage, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(175, 50, Graphics.FONT_LARGE, upRmMessage, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(40, 130, Graphics.FONT_LARGE, dwLmMessage, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(175, 130, Graphics.FONT_LARGE, dwRmMessage, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
     function onReceive(args,circleSw,parking) {
     	parking_ = parking;
        if (args instanceof Lang.String) {
            if(circleSw == VlilleCst.UP_LEFT){
            	upLmMessage = args;
            }else if(circleSw == VlilleCst.UP_RIGHT){
            	upRmMessage = args;
            }else if(circleSw == VlilleCst.DW_RIGHT){
            	dwRmMessage = args;
            }else if (circleSw == VlilleCst.DW_LEFT){
            	dwLmMessage = args;
            }else if (circleSw == VlilleCst.ALL){
            	upLmMessage = args;
            	upRmMessage= args;
            	dwRmMessage = args;
            	dwLmMessage = args;
            }
        }
        
        Ui.requestUpdate();
    }

}
