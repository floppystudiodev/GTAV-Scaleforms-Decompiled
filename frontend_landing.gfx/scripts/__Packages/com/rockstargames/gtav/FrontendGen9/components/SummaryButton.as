class com.rockstargames.gtav.FrontendGen9.components.SummaryButton extends MovieClip
{
   var black;
   var highlight;
   var summaryButtonBG;
   var textTF;
   var white;
   function SummaryButton()
   {
      super();
      this.white = new com.rockstargames.ui.utils.HudColour();
      this.black = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,this.white);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,this.black);
      this.highlight._visible = false;
   }
   function SET_BUTTON_TEXT(btnText)
   {
      this.textTF.text = btnText;
   }
   function SET_STATE(state)
   {
      if(state == 0)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.highlight);
         this.highlight._visible = false;
      }
      if(state == 1)
      {
         this.breatheIn();
         this.highlight._visible = true;
      }
   }
   function SET_ENABLED(isEnabled)
   {
      if(isEnabled)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.textTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         com.rockstargames.ui.utils.Colour.Colourise(this.summaryButtonBG,this.white.r,this.white.g,this.white.b,100);
         this.breatheIn();
         this.highlight._visible = true;
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.textTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
         com.rockstargames.ui.utils.Colour.Colourise(this.summaryButtonBG,this.black.r,this.black.g,this.black.b,100);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.highlight);
         this.highlight._visible = false;
      }
   }
   function breatheIn()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.highlight,0.5,{_alpha:100,onComplete:this.breatheOut,onCompleteScope:this});
   }
   function breatheOut()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.highlight,0.5,{_alpha:25,onComplete:this.breatheIn,onCompleteScope:this});
   }
   function ANIMATE_IN(sequenceIndex)
   {
      var _loc2_ = 0.367;
      var _loc3_ = 0.1 * sequenceIndex;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc2_,{_alpha:100,delay:_loc3_});
   }
}
