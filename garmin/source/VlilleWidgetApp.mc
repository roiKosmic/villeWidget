using Toybox.Application as App;

class VlilleWidgetApp extends App.AppBase {
	hidden var mView;
	
    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
    	 mView = new VlilleWidgetView();
        return [ mView ,new WebRequestDelegate(mView.method(:onReceive))];
    }

}