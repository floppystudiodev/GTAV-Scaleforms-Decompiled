class com.rockstargames.gtav.FrontendGen9.components.Text extends com.rockstargames.gtav.FrontendGen9.components.BaseItem
{
   var _alpha;
   var blipLayer;
   var createEmptyMovieClip;
   var fmt;
   var initialSize;
   var textColour;
   var textTF;
   var _fontStyle = 0;
   var _pointSize = 16;
   var _leading = 0;
   static var FONT_STYLE_STANDARD = 0;
   static var FONT_STYLE_CURSIVE = 1;
   static var FONT_STYLE_ROCKSTAR_TAG = 2;
   static var FONT_STYLE_LEADERBOARD = 3;
   static var FONT_STYLE_CONDENSED = 4;
   static var FONT_STYLE_FIXED_WIDTH_NUMBERS = 5;
   static var FONT_STYLE_CONDENSED_NOT_GAMERNAME = 6;
   static var FONT_STYLE_PRICEDOWN = 7;
   static var TEXT_TYPE_STANDARD = 0;
   static var TEXT_TYPE_BLIPS = 1;
   static var TEXT_TYPE_LABEL = 2;
   static var MEMBERSHIP_MODE = false;
   static var isAsian = false;
   function Text()
   {
      super();
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.textTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.Colourise(this,this.textColour.r,this.textColour.g,this.textColour.b,100);
      this.fmt = this.textTF.getTextFormat();
      this.initialSize = this.fmt.size;
   }
   function SET_TEXT(str, isRichText)
   {
      if(str == "")
      {
         return undefined;
      }
      this.clearBlipLayer();
      if(com.rockstargames.gtav.FrontendGen9.components.Text.MEMBERSHIP_MODE)
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,str,this.textTF,true);
      }
      else if(isRichText)
      {
         com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,str,this.blipLayer,this.textTF,this._fontStyle,this._pointSize,0,false,false);
      }
      else
      {
         this.textTF.text = str;
      }
   }
   function CLEAR_TEXT()
   {
      this.textTF.text = "";
   }
   function clearBlipLayer()
   {
      if(this.blipLayer != undefined)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.createEmptyMovieClip("blipLayer",1000);
   }
   function resizeAsianText()
   {
      this.fmt.size = this.initialSize * 0.8;
      this.textTF.setTextFormat(this.fmt);
   }
   function ANIMATE_IN(sequenceIndex)
   {
      var _loc2_ = 0.367;
      var _loc3_ = 0.1 * sequenceIndex;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc2_,{_alpha:100,delay:_loc3_});
   }
   function getTextHeight()
   {
      this.textTF.autoSize = true;
      return this.textTF.textHeight;
   }
}
