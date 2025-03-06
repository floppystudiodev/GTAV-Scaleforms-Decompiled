class com.rockstargames.gtav.levelDesign.FEED_TOOLTIPS extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
   var CONTENT;
   var blipLayer;
   var DEFAULT_PT_SIZE = 13;
   function FEED_TOOLTIPS()
   {
      super();
   }
   function INITIALISE(bgR, bgG, bgB, _flashAlpha, _flashRate, _bIsWideScreen, _bIsAsianLanguage, bgColor)
   {
      super.INITIALISE(bgR,bgG,bgB,_flashAlpha,_flashRate,_bIsWideScreen,_bIsAsianLanguage,bgColor);
   }
   function SET_FEED_COMPONENT(bodyStr, isImportant)
   {
      this.important = isImportant;
      this.CONTENT.bodyTF.autoSize = true;
      var _loc3_ = !this.bIsAsianLanguage ? this.DEFAULT_PT_SIZE : 16;
      if(!this.bIsWideScreen)
      {
         _loc3_ += 1;
      }
      if(this.blipLayer)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.CONTENT.createEmptyMovieClip("blipLayer",1000);
      var _loc5_ = new com.rockstargames.ui.utils.Text();
      var _loc4_ = !this.bIsAsianLanguage ? 1 : 5;
      _loc5_.setTextWithIcons(bodyStr,this.blipLayer,this.CONTENT.bodyTF,0,_loc3_,_loc4_,false);
      var _loc2_ = this.CONTENT.bodyTF.getTextFormat();
      _loc2_.size = _loc3_;
      _loc2_.leading = _loc4_;
      this.CONTENT.bodyTF.setTextFormat(_loc2_);
      this.CONTENT.Background._alpha = 85;
      this.CONTENT.Background._height = this.CONTENT.bodyTF._y + this.CONTENT.bodyTF._height + 5;
      this.CONTENT.BackgroundFlash._height = this.CONTENT.Background._height;
   }
   function CLEAR_TXD()
   {
      this.blipLayer.removeMovieClip();
   }
}
