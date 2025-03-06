class com.rockstargames.gtav.Multiplayer.BLIMP_TEXT extends com.rockstargames.ui.core.BaseScreenLayout
{
   var texts;
   var CONTENT;
   var inverseScrollSpeed;
   var hudColor;
   static var MESSAGE_SPACING = 100;
   static var DEFAULT_SCROLL_SPEED = 100;
   static var DEFAULT_COLOUR = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE;
   function BLIMP_TEXT()
   {
      super();
   }
   function initialise(mc)
   {
      super.INITIALISE(mc);
      this.texts = [this.CONTENT.scroller.txt0];
      this.texts[0].label.autoSize = "left";
      this.texts[0].label.antiAliasType = "normal";
      this.inverseScrollSpeed = 1 / com.rockstargames.gtav.Multiplayer.BLIMP_TEXT.DEFAULT_SCROLL_SPEED;
      this.hudColor = new com.rockstargames.ui.utils.HudColour();
      this.SET_COLOUR(com.rockstargames.gtav.Multiplayer.BLIMP_TEXT.DEFAULT_COLOUR);
   }
   function SET_SCROLL_SPEED(scrollSpeed)
   {
      this.inverseScrollSpeed = 1 / scrollSpeed;
   }
   function SET_COLOUR(colour)
   {
      com.rockstargames.ui.utils.Colour.setHudColour(colour,this.hudColor);
      this.CONTENT.scroller.transform.colorTransform = new flash.geom.ColorTransform(1,1,1,1,this.hudColor.r,this.hudColor.g,this.hudColor.b,0);
   }
   function SET_MESSAGE(message)
   {
      var _loc3_ = 1;
      while(_loc3_ < this.texts.length)
      {
         this.texts[_loc3_].removeMovieClip();
         _loc3_ = _loc3_ + 1;
      }
      this.texts.length = 1;
      this.texts[0].label.text = message;
      var _loc4_ = this.texts[0]._width + com.rockstargames.gtav.Multiplayer.BLIMP_TEXT.MESSAGE_SPACING;
      var _loc7_ = _loc4_ * this.inverseScrollSpeed;
      var _loc5_ = Stage.width + _loc4_;
      _loc3_ = 1;
      do
      {
         var _loc2_ = this.texts[0].duplicateMovieClip("txt" + _loc3_,_loc3_);
         _loc2_._x = _loc3_ * _loc4_;
         _loc2_.label.autoSize = "left";
         _loc2_.label.antiAliasType = "normal";
         _loc2_.label.text = message;
         this.texts[_loc3_] = _loc2_;
         _loc3_ = _loc3_ + 1;
      }
      while(this.CONTENT.scroller._width < _loc5_);
      
      this.startScroll(- _loc4_,_loc7_);
   }
   function startScroll(goalX, duration)
   {
      this.CONTENT.scroller._x = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.scroller,duration,{_x:goalX,onCompleteScope:this,onComplete:this.startScroll,onCompleteArgs:arguments});
   }
}
