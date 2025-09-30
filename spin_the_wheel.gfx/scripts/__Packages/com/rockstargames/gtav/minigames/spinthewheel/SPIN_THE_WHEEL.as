class com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var displayConfig;
   var wheel;
   static var WHEEL_TYPES = [com.rockstargames.gtav.minigames.spinthewheel.HUDWheel,com.rockstargames.gtav.minigames.spinthewheel.TabletopWheel];
   static var WHEEL_X = [640,360];
   static var WHEEL_Y = [360,360];
   static var DEFAULT_WIN_PAUSE_DURATION = 10;
   function SPIN_THE_WHEEL()
   {
      super();
   }
   function initialise(mc)
   {
      _global.gfxExtensions = true;
      super.INITIALISE(mc);
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
   }
   function SET_WHEEL_STYLE(wheelType, numSegments, isSpectatorWheel)
   {
      if(wheelType >= 0 && wheelType < com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.WHEEL_TYPES.length)
      {
         if(this.wheel)
         {
            this.wheel.dispose();
         }
         this.wheel = new com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.WHEEL_TYPES[wheelType](this.CONTENT,numSegments,com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.WHEEL_X[wheelType],com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.WHEEL_Y[wheelType],isSpectatorWheel,this.displayConfig);
      }
   }
   function SET_SEGMENT(index, type, value)
   {
      if(this.wheel)
      {
         this.wheel.setSegment(index,type,value);
      }
   }
   function SPIN_WHEEL(targetSegment, numFullSpins, totalDuration, winPauseDuration, winIcon, winMessage)
   {
      if(winPauseDuration == undefined)
      {
         winPauseDuration = com.rockstargames.gtav.minigames.spinthewheel.SPIN_THE_WHEEL.DEFAULT_WIN_PAUSE_DURATION;
      }
      this.wheel.spin(targetSegment,numFullSpins,totalDuration,winPauseDuration,winIcon,winMessage);
   }
   function SET_LABEL_TEXT(text, isRedText)
   {
      this.wheel.setLabelText(text,isRedText);
   }
   static function formatNumber(value)
   {
      var _loc3_ = Math.abs(int(value)).toString();
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      var _loc1_ = _loc4_ % 3 || 3;
      var _loc5_ = (value >= 0 ? "" : "-") + _loc3_.slice(_loc2_,_loc1_);
      while(_loc1_ < _loc4_)
      {
         _loc2_ = _loc1_;
         _loc1_ += 3;
         _loc5_ += "," + _loc3_.slice(_loc2_,_loc1_);
      }
      return _loc5_;
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
}
