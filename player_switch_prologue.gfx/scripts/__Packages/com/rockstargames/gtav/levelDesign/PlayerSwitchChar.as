class com.rockstargames.gtav.levelDesign.PlayerSwitchChar extends MovieClip
{
   var characterImageMC;
   var counterMC;
   var damageMC;
   var hintedMC;
   var mc;
   var stateMC;
   var charID = -1;
   var bHighlighted = false;
   var bHinted = false;
   var bDamaged = false;
   var bPlayingDamageAnim = false;
   var hintedAlpha = 60;
   function PlayerSwitchChar()
   {
      super();
   }
   function init(i)
   {
      this.characterImageMC = this.mc.imagesMC;
   }
   function setSlot(params)
   {
      var _loc2_ = params[0];
      var _loc5_ = [com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MICHAEL,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TREVOR,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FRANKLIN,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_CHOP,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_CHOP,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_CHOP,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MICHAEL,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MICHAEL,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TREVOR,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TREVOR];
      var _loc4_ = _loc5_[_loc2_];
      if(this.charID != _loc2_)
      {
         this.charID = _loc2_;
         this.characterImageMC.gotoAndStop(this.charID + 1);
         this.stateMC = this.characterImageMC.stateMC;
         this.counterMC = this.stateMC.counterMC;
         this.damageMC = this.stateMC.damage;
         this.hintedMC = this.stateMC.hintedMC;
         this.hintedMC._alpha = this.hintedAlpha;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.stateMC.charColourBGMC,_loc4_);
         this.stateMC.charColourBGMC._alpha = 40;
      }
      this.stateMC.bgMC._visible = true;
      this.highlighted(this.bHighlighted);
      if(params[2])
      {
         this.stateMC.selectedMC._visible = true;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.stateMC.selectedMC,_loc4_);
      }
      else
      {
         this.stateMC.selectedMC._visible = false;
      }
      this.hintedMC._visible = false;
      if(params[3] != undefined)
      {
         this.hinted(params[3]);
      }
   }
   function showDamageIndicator(bVisible, bFlash)
   {
      this.bDamaged = bVisible;
      this.damageMC._visible = bVisible;
      this.hintedMC._visible = !bVisible;
      if(bVisible)
      {
         if(bFlash)
         {
            if(!this.bPlayingDamageAnim)
            {
               this.bPlayingDamageAnim = true;
               this.damageMC.gotoAndPlay("anim");
            }
         }
         else
         {
            this.bPlayingDamageAnim = false;
            this.damageMC.gotoAndStop("anim");
         }
      }
      else
      {
         this.bPlayingDamageAnim = false;
         this.damageMC.gotoAndStop(1);
      }
   }
   function hinted(h)
   {
      this.bHinted = h;
      this.hintedMC._visible = this.bHinted && !this.bDamaged;
      if(this.bHinted)
      {
         this.hintedMC.gotoAndPlay("anim");
      }
      else
      {
         this.hintedMC.gotoAndStop(1);
      }
      if(this.bHinted && this.bHighlighted)
      {
         this.hintedMC._alpha = 0;
         this.stateMC.bgMC._visible = true;
      }
   }
   function highlighted(h)
   {
      this.bHighlighted = h;
      this.stateMC.charColourBGMC._visible = h;
      this.stateMC.bgMC._alpha = !this.bHighlighted ? 0 : 10;
      if(this.bHinted && this.bHighlighted)
      {
         this.hintedMC._alpha = 0;
         this.stateMC.bgMC._visible = true;
      }
      if(this.bHinted && !this.bHighlighted)
      {
         this.hintedMC._alpha = this.hintedAlpha;
         this.hintedMC._visible = true;
         this.stateMC.bgMC._visible = false;
      }
   }
}
