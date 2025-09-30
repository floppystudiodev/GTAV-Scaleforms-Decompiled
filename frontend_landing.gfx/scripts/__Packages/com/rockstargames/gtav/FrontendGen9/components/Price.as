class com.rockstargames.gtav.FrontendGen9.components.Price extends com.rockstargames.gtav.FrontendGen9.components.Text
{
   var blipLayer;
   var fmt;
   var initialSize;
   var textColour;
   var textOutlineTF;
   var textTF;
   function Price()
   {
      super();
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.textTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
      com.rockstargames.ui.utils.Colour.Colourise(this,this.textColour.r,this.textColour.g,this.textColour.b,100);
      this.textOutlineTF.outline = 14;
   }
   function SET_TEXT(str, isRichText)
   {
      super.SET_TEXT(str,isRichText);
      this.textOutlineTF.text = this.textTF.text;
      this.textTF.autoSize = true;
      this.blipLayer._x = this.textTF._width - this.textTF.textWidth;
   }
   function resizeAsianText()
   {
      this.fmt.size = this.initialSize * 0.8;
      this.textTF.setTextFormat(this.fmt);
      var _loc2_ = this.textOutlineTF.getTextFormat();
      _loc2_.size = this.fmt.size;
      this.textOutlineTF.setTextFormat(_loc2_);
   }
}
