class com.rockstargames.gtav.web.WEB_BROWSER_PARENT extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var MOUSE_MODE = false;
   var cursorSpeedMultiplier = 1.5;
   var analogSpeedDivisor = 15;
   var usingLeftAnalog = false;
   var safeFrameX = 72;
   var safeFrameY = 48;
   var contentY = com.rockstargames.gtav.web.WEB_BROWSER_PARENT.prototype.safeFrameY + 45;
   var contentX = 0;
   var keyboardYposition = 360;
   var _currentSelection = -1;
   var buttonState = "OFF";
   var cursorState = "ARROW";
   static var streamResponseHash = {};
   var nextID = 0;
   var loadingWebPage = false;
   static var homeWebsite = "WWW_EYEFIND_INFO";
   var browserHistory = [];
   var browserHistoryIndex = 0;
   var browserHistoryStatus = "new";
   var browserHistoryCanStore = [];
   var browserHistorySearchArgs = [];
   var pageHeight = 0;
   var resetToPrevContentY = false;
   var keyboardFocus = "";
   var BROWSER_KEYBOARD_SET = ["1","2","3","4","5","6","7","8","9","0","Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","BACKSPACE","Z","X","C","V","B","N","M",".","-","ENTER","WWW.",">",".COM",">"," ",">",".NET",">",".ORG",">"];
   var _isWideScreen = true;
   var isLastWebsite = false;
   var CanStoreThisPage = false;
   var DebugTextContent = false;
   var defaultBrowserOnColour = 16010;
   var defaultBrowserOffColour = 0;
   var WEB_BROWSER_FILENAME = "WEB_BROWSER";
   var shutdown = false;
   var resetScroll = true;
   var isJapanese = false;
   var suppressBackButton = false;
   var enterKeyConsumed = false;
   var _isGen9 = false;
   function WEB_BROWSER_PARENT()
   {
      super();
   }
}
