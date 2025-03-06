class com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL_STATS extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   var _HUD;
   var STAT_TWEEN_DURATION = 0.175;
   function HUD_WEAPON_WHEEL_STATS()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
      this.CONTENT._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
   }
   function dbg(str)
   {
   }
   function UNLOAD_WEAPON_WHEEL_STATS()
   {
      this.CONTENT._visible = false;
      this.REMOVE();
   }
   function SHOW_ALL()
   {
      this.CONTENT._visible = true;
   }
   function REMOVE()
   {
      this._HUD.REMOVE_HUD_ITEM(com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_WHEEL_STATS);
   }
   function DoBar(bar, base, attachment)
   {
      if(attachment >= 0)
      {
         var _loc5_ = base / 100 * bar.bg._width;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.percentage,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.attPercentage,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.bg,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
         bar.bg._alpha = 50;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.percentage,this.STAT_TWEEN_DURATION,{_xscale:base,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.attPercentage,this.STAT_TWEEN_DURATION,{_x:_loc5_,_xscale:attachment,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
      }
      else
      {
         _loc5_ = (base + attachment) / 100 * bar.bg._width;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.percentage,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.attPercentage,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.bg,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
         bar.bg._alpha = 50;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.percentage,this.STAT_TWEEN_DURATION,{_xscale:base + attachment,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.attPercentage,this.STAT_TWEEN_DURATION,{_x:_loc5_,_xscale:attachment * -1,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
      }
   }
   function SET_STATS_LABELS_AND_VALUES(params)
   {
      this.CONTENT._visible = true;
      this.CONTENT.stat1.text = params[0];
      this.CONTENT.stat2.text = params[1];
      this.CONTENT.stat3.text = params[2];
      this.CONTENT.stat4.text = params[3];
      this.DoBar(this.CONTENT.statBar1,params[4],params[8]);
      this.DoBar(this.CONTENT.statBar2,params[5],params[9]);
      this.DoBar(this.CONTENT.statBar3,params[6],params[10]);
      this.DoBar(this.CONTENT.statBar4,params[7],params[11]);
   }
   function CLEAR_STATS_LABELS_AND_VALUES()
   {
      this.CONTENT.stat1.text = "";
      this.CONTENT.stat2.text = "";
      this.CONTENT.stat3.text = "";
      this.CONTENT.stat4.text = "";
   }
   function SET_STATS_VISIBILITY(params)
   {
      this.CONTENT._visible = params[0];
   }
}
