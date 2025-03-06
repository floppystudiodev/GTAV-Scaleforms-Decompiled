class com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_LONG_AUDIO extends com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST
{
   var labelMC;
   var _isSelected;
   var animatedAudioIcon;
   function COL_TYPE_LIST_LONG_AUDIO()
   {
      super();
      this.SetAnimatedAudioVisibility(false);
      this.SetAnimatedAudioPlaying(false);
      this.MAX_CHARS_ITEM_WITH_OPTION = 60;
      this.labelMC.titleTF._width = 490;
      this.labelMC.optionTF._x = 520;
      this.labelMC.optionTF._width = 54;
   }
   function SetAnimatedAudioVisibility(isVisible)
   {
      if(this._isSelected)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.animatedAudioIcon,this.HUD_COLOUR_BLACK);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.animatedAudioIcon,this.HUD_COLOUR_WHITE);
      }
      this.animatedAudioIcon._visible = isVisible;
   }
   function SetAnimatedAudioPlaying(isPlaying)
   {
      if(isPlaying)
      {
         this.animatedAudioIcon.play();
      }
      else
      {
         this.animatedAudioIcon.gotoAndStop(0);
      }
   }
   function SetAsSelected(isSelected)
   {
      if(isSelected)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.animatedAudioIcon,this.HUD_COLOUR_BLACK);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.animatedAudioIcon,this.HUD_COLOUR_WHITE);
      }
      super.SetAsSelected(isSelected);
   }
}
