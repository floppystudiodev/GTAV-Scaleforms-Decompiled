class com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.Screen
{
   var app;
   var cursor;
   var overlay;
   var heistData;
   var colourScheme;
   var view;
   var _buttons;
   static var STAGE_WIDTH = 2048;
   static var STAGE_HEIGHT = 1152;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.Screen.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.Screen.STAGE_HEIGHT;
   function Screen(app, viewContainer, cursor, overlay, heistData, colourScheme, viewLinkage)
   {
      this.app = app;
      this.cursor = cursor;
      this.overlay = overlay;
      this.heistData = heistData;
      this.colourScheme = colourScheme;
      var _loc2_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc2_);
   }
   function handleButtonInput(inputID)
   {
   }
   function get buttons()
   {
      return this._buttons;
   }
   function dispose()
   {
      this.app = null;
      this.cursor.setChangeListener(null);
      this.cursor.setTargetRects([]);
      this.cursor = null;
      this.overlay = null;
      this.heistData = null;
      this.colourScheme = null;
      this._buttons = null;
      this.view.removeMovieClip();
      this.view = null;
   }
   function init()
   {
      this._buttons = [];
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
   }
   function onTargetChange(targetID)
   {
      if(this.overlay.isShowing)
      {
         this.overlay.updateSelectedButton(targetID);
      }
      else
      {
         var _loc3_ = 0;
         var _loc4_ = this._buttons.length;
         while(_loc3_ < _loc4_)
         {
            var _loc2_ = this._buttons[_loc3_];
            if(_loc2_.enabled)
            {
               _loc2_.setState(_loc2_.id == targetID);
            }
            _loc3_ = _loc3_ + 1;
         }
      }
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
