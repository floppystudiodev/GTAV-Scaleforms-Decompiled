class com.rockstargames.gtav.levelDesign.FEED_REPLAY extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
   var CONTENT;
   var actionReplayToggleIconMC;
   var attachMovie;
   var createEmptyMovieClip;
   var defaultBgHeight;
   var defaultSubtitleHeight;
   var dynamicButtonMC;
   var getNextHighestDepth;
   var iconTF;
   var isCircleAccept;
   var progressColourHex;
   var progressMC;
   var recordingIconBGMC;
   var recordingSpinnerMC;
   var shouldStayOnFeedBottom;
   var spinnerMC;
   var startStopRecordingIconMC;
   var subtitleTF;
   var titleTF;
   static var TYPE_DIRECTOR_RECORDING = 0;
   static var TYPE_BUTTON_ICON = 1;
   static var TYPE_ACTION_REPLAY = 2;
   static var RECORDING_BUFFER_ICON = 0;
   static var RECORDING_START_STOP_ICON = 1;
   static var PROGRESS_RADIUS = 12;
   function FEED_REPLAY()
   {
      super();
   }
   function INITIALISE(bgR, bgG, bgB, _flashAlpha, _flashRate, _bIsWideScreen, _bIsAsianLanguage, bgColor)
   {
      super.INITIALISE(bgR,bgG,bgB,_flashAlpha,_flashRate,_bIsWideScreen,_bIsAsianLanguage,bgColor);
      this.recordingIconBGMC._visible = this.recordingSpinnerMC._visible = this.spinnerMC._visible = this.actionReplayToggleIconMC._visible = false;
      this.progressMC = this.createEmptyMovieClip("progressMC",this.getNextHighestDepth());
      this.progressMC.swapDepths(this.recordingSpinnerMC);
      this.progressMC._x = 18;
      this.progressMC._y = 18;
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED,_loc3_);
      this.progressColourHex = com.rockstargames.ui.utils.Colour.RGBToHex(_loc3_.r,_loc3_.g,_loc3_.b);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.recordingSpinnerMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_REDDARK);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.recordingIconBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_REDDARK);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.startStopRecordingIconMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.actionReplayToggleIconMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
      this.defaultBgHeight = this.CONTENT.Background._height;
      this.defaultSubtitleHeight = this.subtitleTF._height;
   }
   function SET_DISPLAY_CONFIG_OBJECT(dc)
   {
      this.isCircleAccept = dc.isCircleAccept;
   }
   function SET_FEED_COMPONENT(eType, sTitle, sSubtitle, iIcon, pctComplete, bFlash, sIcon)
   {
      this.subtitleTF.multiline = true;
      this.subtitleTF.autoSize = "left";
      this.subtitleTF.wordWrap = true;
      this.subtitleTF.htmlText = sSubtitle;
      var _loc9_ = this.defaultBgHeight + (this.subtitleTF._height - this.defaultSubtitleHeight);
      if(_loc9_ > this.defaultBgHeight)
      {
         this.CONTENT.Background._height = this.CONTENT.BackgroundHighlight._height = _loc9_;
      }
      var _loc13_;
      var _loc15_;
      if(sSubtitle == "")
      {
         _loc13_ = sTitle.split("<br>");
         _loc15_ = _loc13_.join(" ");
         this.titleTF.htmlText = _loc15_;
         if(this.titleTF.textWidth > this.titleTF._width)
         {
            this.titleTF.multiline = true;
            this.titleTF.htmlText = sTitle;
            this.titleTF.autoSize = "left";
         }
         this.titleTF._y = Math.round((this.CONTENT.Background._height - this.titleTF._height) * 0.5);
      }
      else
      {
         this.titleTF.text = sTitle;
         if(this.titleTF.textWidth >= this.titleTF._width)
         {
            this.titleTF.textAutoSize = "shrink";
         }
      }
      var _loc6_;
      var _loc4_;
      var _loc7_;
      var _loc8_;
      var _loc3_;
      var _loc5_;
      var _loc10_;
      var _loc2_;
      if(eType == com.rockstargames.gtav.levelDesign.FEED_REPLAY.TYPE_DIRECTOR_RECORDING)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.spinnerMC);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.startStopRecordingIconMC);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.progressMC);
         this.spinnerMC._visible = false;
         this.recordingSpinnerMC._visible = false;
         switch(iIcon)
         {
            case com.rockstargames.gtav.levelDesign.FEED_REPLAY.RECORDING_BUFFER_ICON:
               this.progressMC._visible = true;
               this.shouldStayOnFeedBottom = true;
               this.progressMC.clear();
               this.progressMC.moveTo(0,0);
               this.progressMC.beginFill(this.progressColourHex,100);
               _loc6_ = Math.min(pctComplete * 360,360);
               _loc4_ = 0;
               _loc7_ = 0.5;
               while(_loc4_ <= _loc6_)
               {
                  this.lineToPtOnWheel(_loc4_);
                  _loc4_ += _loc7_;
               }
               if(_loc4_ < _loc6_ + _loc7_)
               {
                  this.lineToPtOnWheel(_loc6_);
               }
               this.progressMC.lineTo(0,0);
               this.progressMC.endFill();
               this.recordingIconBGMC._visible = true;
               this.startStopRecordingIconMC._visible = false;
               this.actionReplayToggleIconMC._visible = false;
               if(bFlash)
               {
                  this.pulseMC(true,this.progressMC);
                  this.rotateSpinner(this.recordingSpinnerMC);
                  this.recordingSpinnerMC._visible = true;
               }
               break;
            case com.rockstargames.gtav.levelDesign.FEED_REPLAY.RECORDING_START_STOP_ICON:
               this.progressMC._visible = false;
               this.recordingIconBGMC._visible = false;
               this.actionReplayToggleIconMC._visible = false;
               this.startStopRecordingIconMC._visible = true;
               this.pulseMC(true,this.startStopRecordingIconMC);
            default:
               return;
         }
      }
      else if(eType == com.rockstargames.gtav.levelDesign.FEED_REPLAY.TYPE_BUTTON_ICON)
      {
         this.startStopRecordingIconMC._visible = false;
         if(sIcon == "")
         {
            if(iIcon == com.rockstargames.ui.game.InstructionalButtonEnums.ICON_SPINNER)
            {
               this.spinnerMC._y += (_loc9_ - this.defaultBgHeight) * 0.5;
               this.spinnerMC._visible = true;
               this.rotateSpinner(this.spinnerMC);
            }
            else
            {
               this.spinnerMC._visible = false;
               com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.spinnerMC);
               if(this.dynamicButtonMC)
               {
                  this.dynamicButtonMC.removeMovieClip();
               }
               _loc8_ = iIcon;
               if(this.isCircleAccept)
               {
                  if(_loc8_ == 30)
                  {
                     _loc8_ = 31;
                  }
                  else if(_loc8_ == 31)
                  {
                     _loc8_ = 30;
                  }
               }
               this.dynamicButtonMC = this.attachMovie("TEXTBTN_" + _loc8_,"dynamicButtonMC",this.getNextHighestDepth(),{_x:18,_y:18,_width:28,_height:28});
            }
         }
         else
         {
            if(this.dynamicButtonMC)
            {
               this.dynamicButtonMC.removeMovieClip();
            }
            this.dynamicButtonMC = this.createEmptyMovieClip("dynamicButton",this.getNextHighestDepth(),{_x:18,_y:18,_width:28,_height:28});
            _loc3_ = 20;
            _loc5_ = 1;
            _loc10_ = new com.rockstargames.ui.utils.Text();
            _loc10_.setTextWithIcons(sIcon,this.dynamicButtonMC,this.iconTF,0,20,1,false);
            while(this.iconTF.textWidth > this.iconTF._width && _loc3_ > _loc5_)
            {
               _loc3_ -= _loc5_;
               _loc2_ = this.iconTF.getTextFormat();
               _loc2_.size = _loc3_;
               this.iconTF.setTextFormat(_loc2_);
            }
            if(_loc3_ != 20)
            {
               _loc10_.setTextWithIcons(sIcon,this.dynamicButtonMC,this.iconTF,0,_loc3_,1,false);
            }
            this.dynamicButtonMC._x = (this.iconTF._width - this.dynamicButtonMC._width) * 0.5 - 1;
            this.dynamicButtonMC._y = (this.iconTF._height - this.dynamicButtonMC._height) * 0.5;
            this.iconTF._visible = false;
         }
      }
      else if(eType == com.rockstargames.gtav.levelDesign.FEED_REPLAY.TYPE_ACTION_REPLAY)
      {
         this.progressMC._visible = false;
         this.recordingIconBGMC._visible = false;
         this.startStopRecordingIconMC._visible = false;
         this.actionReplayToggleIconMC._visible = true;
      }
   }
   function rotateSpinner(spinnerMC)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(spinnerMC,1.75,{_rotation:360,onCompleteScope:this,onComplete:this.rotateSpinner,onCompleteArgs:[spinnerMC]});
   }
   function pulseMC(bFadeOut, mc)
   {
      var _loc2_ = !bFadeOut ? 100 : 50;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(mc,0.875,{_alpha:_loc2_,onCompleteScope:this,onComplete:this.pulseMC,onCompleteArgs:[!bFadeOut,mc]});
   }
   function lineToPtOnWheel(angle)
   {
      this.progressMC.lineTo(Math.sin(angle * com.rockstargames.ui.utils.MathStar.PI_OVER_180) * com.rockstargames.gtav.levelDesign.FEED_REPLAY.PROGRESS_RADIUS,(- Math.cos(angle * com.rockstargames.ui.utils.MathStar.PI_OVER_180)) * com.rockstargames.gtav.levelDesign.FEED_REPLAY.PROGRESS_RADIUS);
   }
   function onCleanup()
   {
      super.onCleanup();
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.spinnerMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.startStopRecordingIconMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.progressMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.recordingSpinnerMC);
   }
}
