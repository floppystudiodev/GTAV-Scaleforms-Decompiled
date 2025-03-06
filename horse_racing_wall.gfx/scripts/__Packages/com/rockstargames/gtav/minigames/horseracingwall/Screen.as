class com.rockstargames.gtav.minigames.horseracingwall.Screen
{
   var app;
   var navigation;
   var view;
   static var WALL_WIDTH = 2999;
   static var WALL_HEIGHT = 902;
   static var WALL_CENTRE_X = 0.5 * com.rockstargames.gtav.minigames.horseracingwall.Screen.WALL_WIDTH;
   static var WALL_CENTRE_Y = 0.5 * com.rockstargames.gtav.minigames.horseracingwall.Screen.WALL_HEIGHT;
   function Screen(app, viewContainer, viewLinkage, navigation)
   {
      this.app = app;
      this.navigation = navigation;
      var _loc2_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc2_);
   }
   function handleAccept()
   {
   }
   function handleCancel()
   {
   }
   function dispose()
   {
      this.app = null;
      this.navigation.reset();
      this.navigation = null;
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
