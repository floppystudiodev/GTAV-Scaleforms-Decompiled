class com.rockstargames.gtav.FrontendGen9.components.Cash extends com.rockstargames.gtav.FrontendGen9.components.Text
{
   var _alpha;
   var _fontStyle;
   var _pointSize;
   var blipLayer;
   var clearBlipLayer;
   var textTF;
   function Cash()
   {
      super();
   }
   function SET_TEXT(str, isRichText)
   {
      this._fontStyle = com.rockstargames.gtav.FrontendGen9.components.Text.FONT_STYLE_PRICEDOWN;
      this._pointSize = 20;
      this.clearBlipLayer();
      if(isRichText)
      {
         com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,str,this.blipLayer,this.textTF,this._fontStyle,this._pointSize,2.65,false,false);
      }
      else
      {
         this.textTF.text = str;
      }
      this.textTF.autoSize = true;
      this.textTF._x = - this.textTF.textWidth;
      this.blipLayer._x = - this.textTF.textWidth;
   }
   function CLEAR_TEXT()
   {
      this.textTF.text = "";
   }
   function ANIMATE_IN(sequenceIndex)
   {
      var _loc2_ = 0.367;
      var _loc3_ = 0.1 * sequenceIndex;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc2_,{_alpha:100,delay:_loc3_});
   }
}
