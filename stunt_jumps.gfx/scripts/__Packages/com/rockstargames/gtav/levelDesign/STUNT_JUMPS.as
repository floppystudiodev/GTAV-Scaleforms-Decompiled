class com.rockstargames.gtav.levelDesign.STUNT_JUMPS extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var CONTENT;
   var BigMessageMaster;
   function STUNT_JUMPS()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("GENERIC_SECONDARY_INFO","GENERIC_SECONDARY_INFO",10);
      this.CONTENT._x = 640;
   }
   function SET_STUNT_JUMP_TITLE_AND_DESCRIPTION(stuntJumpTitle, stuntJumpDescription, stuntJumpProgress)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.textHolderMC.MESSAGE_TEXT);
      this.CONTENT.TITLE.textAutoSize = "shrink";
      this.CONTENT.TITLE.htmlText = stuntJumpTitle;
      this.CONTENT.DESCRIPTION.htmlText = stuntJumpProgress;
      this.CONTENT.DESCRIPTION_BLACK.htmlText = stuntJumpProgress;
      this.CONTENT._visible = true;
   }
   function SET_STUNT_JUMP_COLOR(hudColourId)
   {
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.TITLE,hudColourId);
   }
   function SET_VISIBLE(isVisible)
   {
      this.CONTENT._visible = isVisible;
      if(this.BigMessageMaster)
      {
         this.BigMessageMaster._visible = isVisible;
      }
   }
   function debug()
   {
      this.SET_STUNT_JUMP_TITLE_AND_DESCRIPTION("Stunt Jump complete","Success!","21 Stunt Jumps left to do");
   }
   function OVERRIDE_Y_POSITION(newYPosition)
   {
      this.CONTENT._y = newYPosition * this.screenHeightPixels;
   }
   function SHOW_SHARD_STUNT_JUMP(bigText, msgText)
   {
      if(this.BigMessageMaster != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster);
         this.BigMessageMaster.removeMovieClip();
      }
      var _loc6_ = 100;
      this.BigMessageMaster = this.TIMELINE.attachMovie("SHARD_MESSAGE","SHARD_MESSAGE",_loc6_,{_x:640});
      this.SHARD_SET_TEXT(bigText,msgText);
      var _loc7_ = 30;
      this.BigMessageMaster.bgMC._y = this.BigMessageMaster.textHolderMC._y + this.BigMessageMaster.textHolderMC._height / 2;
      this.BigMessageMaster.bgMC._height = this.BigMessageMaster.textHolderMC._height + _loc7_ * 2;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      this.CONTENT._visible = false;
      var _loc3_ = false;
      var _loc2_ = 0;
      while(_loc2_ < bigText.length)
      {
         if(bigText.charCodeAt(_loc2_) > 11263)
         {
            _loc3_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc3_)
      {
         _loc2_ = 0;
         while(_loc2_ < msgText.length)
         {
            if(msgText.charCodeAt(_loc2_) > 11263)
            {
               _loc3_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(_loc3_)
      {
         this.BigMessageMaster.textHolderMC.titleMC.BIG_TEXT._y -= 3;
         this.BigMessageMaster.textHolderMC.MESSAGE_TEXT._y += 3;
      }
   }
   function SHARD_SET_TEXT(bigText, msgText)
   {
      var _loc3_ = this.BigMessageMaster.textHolderMC.titleMC.BIG_TEXT;
      var _loc2_ = this.BigMessageMaster.textHolderMC.MESSAGE_TEXT;
      if(bigText == "")
      {
         _loc3_._visible = false;
      }
      else
      {
         _loc3_.textAutoSize = "shrink";
         _loc3_.htmlText = "<font color=\'#FFFFFF\'>" + bigText + "</font>";
         _loc3_._visible = true;
      }
      if(msgText == "" || msgText == undefined)
      {
         _loc2_._visible = false;
         _loc2_._y = 0;
      }
      else
      {
         _loc2_.htmlText = msgText;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.autoSize = true;
         if(_loc3_._visible == true)
         {
            _loc2_._y = _loc3_.textHeight;
         }
         _loc2_._visible = true;
         _loc2_._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.35,{_alpha:100});
      }
   }
   function SHARD_ANIM_OUT(colID, animTime)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.textHolderMC.MESSAGE_TEXT);
      this.BigMessageMaster._y = 0;
      this.BigMessageMaster._alpha = 100;
      if(animTime == undefined)
      {
         animTime = 0.33;
      }
      if(colID == undefined)
      {
         colID = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.bgMC,colID);
      var _loc3_ = - this.BigMessageMaster.textHolderMC._y;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster,animTime,{ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT,_y:_loc3_,_alpha:0});
   }
}
