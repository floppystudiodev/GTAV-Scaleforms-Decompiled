class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar extends MovieClip
{
   var mc;
   static var DEFAULT_TWEEN_DURATION = 0.175;
   var w = 125;
   function PauseMenuColourBar(_mc)
   {
      super();
      if(_mc == undefined)
      {
         this.mc = this;
      }
      else
      {
         this.mc = _mc;
      }
   }
   function init(hudColourEnum, width, height)
   {
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(hudColourEnum,_loc2_);
      this.initCustom(_loc2_,width,height);
   }
   function initCustom(hudColour, width, height)
   {
      com.rockstargames.ui.utils.Colour.Colourise(this.mc.barfillMC,hudColour.r,hudColour.g,hudColour.b,hudColour.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.mc.baralphaMC,hudColour.r,hudColour.g,hudColour.b,30);
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.mc.blackMC,_loc3_.r,_loc3_.g,_loc3_.b,50);
      if(width != undefined)
      {
         this.w = width;
         this.mc.barfillMC._width = this.mc.baralphaMC._width = this.mc.blackMC._width = this.w;
      }
      if(height != undefined)
      {
         this.mc.barfillMC._height = this.mc.baralphaMC._height = this.mc.blackMC._height = height;
      }
   }
   function setBarAlpha(fillA, unfilledA)
   {
      this.mc.barfillMC._alpha = fillA;
      this.mc.baralphaMC._alpha = unfilledA;
   }
   function setFillX(x)
   {
      this.mc.barfillMC._x = x;
   }
   function percent(p, tween)
   {
      this.setPercentageBar(p,tween,0,100);
   }
   function percentDecimal(pDec, tween)
   {
      this.setPercentageBar(pDec,tween,0,1);
   }
   function setPercentageBar(pVal, tween, min, max)
   {
      var _loc3_ = Math.max(min,Math.min(pVal,max));
      var _loc2_ = Math.round(this.w * (_loc3_ / max));
      if(tween)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.mc.barfillMC,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar.DEFAULT_TWEEN_DURATION,{_width:_loc2_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
      }
      else
      {
         this.mc.barfillMC._width = _loc2_;
      }
   }
}
