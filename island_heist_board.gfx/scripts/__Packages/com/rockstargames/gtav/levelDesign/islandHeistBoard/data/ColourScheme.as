class com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ColourScheme
{
   var isDebug;
   var _light;
   var _mid;
   var _dark;
   static var DEFAULT_LIGHT = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
   static var DEFAULT_MID = new flash.geom.ColorTransform(1,0.23921568627450981,0,1,0,0,0,0);
   static var DEFAULT_DARK = new flash.geom.ColorTransform(0.03529411764705882,0.027450980392156862,0.027450980392156862,1,0,0,0,0);
   static var HARD_MODE_LIGHT = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
   static var HARD_MODE_MID = new flash.geom.ColorTransform(0.803921568627451,0.19215686274509805,0.19215686274509805,1,0,0,0,0);
   static var HARD_MODE_DARK = new flash.geom.ColorTransform(0.054901960784313725,0.0392156862745098,0.0392156862745098,1,0,0,0,0);
   static var DEBUG_LIGHT = new flash.geom.ColorTransform(0,1,0,1,0,0,0,0);
   static var DEBUG_MID = new flash.geom.ColorTransform(1,0,0,1,0,0,0,0);
   static var DEBUG_DARK = new flash.geom.ColorTransform(0,0,1,1,0,0,0,0);
   function ColourScheme()
   {
      this.isDebug = false;
      this.setScheme(false);
   }
   function setScheme(isHardMode)
   {
      if(this.isDebug)
      {
         return undefined;
      }
      if(isHardMode)
      {
         this._light = com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ColourScheme.HARD_MODE_LIGHT;
         this._mid = com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ColourScheme.HARD_MODE_MID;
         this._dark = com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ColourScheme.HARD_MODE_DARK;
      }
      else
      {
         this._light = com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ColourScheme.DEFAULT_LIGHT;
         this._mid = com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ColourScheme.DEFAULT_MID;
         this._dark = com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ColourScheme.DEFAULT_DARK;
      }
   }
   function debug()
   {
      this.isDebug = true;
      this._light = com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ColourScheme.DEBUG_LIGHT;
      this._mid = com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ColourScheme.DEBUG_MID;
      this._dark = com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ColourScheme.DEBUG_DARK;
   }
   function get light()
   {
      return this._light;
   }
   function get mid()
   {
      return this._mid;
   }
   function get dark()
   {
      return this._dark;
   }
}
