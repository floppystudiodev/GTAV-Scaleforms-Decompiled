class com.rockstargames.gtav.minigames.horseracingconsole.Screen
{
   var app;
   var cursor;
   var buttons;
   var view;
   static var CONSOLE_WIDTH = 1280;
   static var CONSOLE_HEIGHT = 720;
   static var CONSOLE_CENTRE_X = 0.5 * com.rockstargames.gtav.minigames.horseracingconsole.Screen.CONSOLE_WIDTH;
   static var CONSOLE_CENTRE_Y = 0.5 * com.rockstargames.gtav.minigames.horseracingconsole.Screen.CONSOLE_HEIGHT;
   function Screen(app, viewContainer, viewLinkage, cursor)
   {
      this.app = app;
      this.cursor = cursor;
      this.buttons = [];
      var _loc2_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc2_);
   }
   function handleAccept()
   {
   }
   function handleCancel()
   {
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
   }
   function handleMouseInput(x, y)
   {
   }
   function dispose()
   {
      this.buttons = null;
      this.app = null;
      this.cursor.setChangeListener(null);
      this.cursor.setTargetRects([]);
      this.cursor = null;
      this.view.removeMovieClip();
      this.view = null;
   }
   function init()
   {
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
}
