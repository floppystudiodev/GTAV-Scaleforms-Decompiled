class com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen extends com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen
{
   var animateResearchBar;
   var tooltipButton;
   var view;
   var app;
   var researchButton;
   var unlocksButton;
   var _buttons;
   var cursor;
   static var TXD = "UA_GENERIC";
   static var IMAGE = "UA_RESEARCH";
   static var METER_BAR_ANIMATION_DURATION = 2.2;
   static var PADLOCK_FADE_OUT_DURATION = 1;
   static var PADLOCK_ANIMATION_DURATION = 0.5;
   static var FADE_IN_TIME = 0.2;
   static var FADE_OUT_TIME = 0.5;
   static var FADE_IN_ARGS = {_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT};
   static var FADE_OUT_ARGS = {_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT};
   function ResearchScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"researchScreen");
      this.init();
   }
   function init()
   {
      this.animateResearchBar = false;
      super.init();
      this.tooltipButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.RESEARCH_TOOLTIP,this.view.tooltip,this.app.researchDescription,true);
      this.researchButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.RESEARCH,this.view.researchButton);
      this.unlocksButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.VIEW_UNLOCKS,this.view.unlocksButton);
      this.view.unlocksButton.line._visible = false;
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.unlocksButton.label,"UA_VIEW_UNLOCKS");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.title,"UA_RSCH_TITLE");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.subtitle,"UA_RSCH_SUB");
      this.view.tooltip._alpha = 0;
      this.view.padlock._visible = this.app.researchState == 1;
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.padlock.label,"RES_UNLCK_LCK");
      switch(this.app.researchState)
      {
         case 1:
            com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.imageHeading,"UA_CURR_PROJ");
            break;
         case 2:
            this.view.imageHeading.text = this.app.researchHeading;
            break;
         default:
            this.view.imageHeading.text = "";
      }
      this.view.inactiveLabel.text = "";
      if(this.app.researchState == 0)
      {
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.TXD,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.IMAGE,this.view.image);
         com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.inactiveLabel,"UA_INACTIVE");
      }
      else if(this.app.researchTexture != "" && this.app.researchTexture != undefined)
      {
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.TXD,this.app.researchTexture,this.view.image);
      }
      this._buttons = [this.researchButton,this.unlocksButton,this.tooltipButton];
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
      this.update();
   }
   function update()
   {
      super.update();
      this.researchButton.state = this.app.fastTrackState;
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.padlock.label,"RES_UNLCK_LCK");
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.padlock);
      this.view.padlock.icon.gotoAndStop(1);
      this.view.padlock._alpha = 100;
      this.view.padlock._visible = this.app.researchState == 1;
      this.view.tooltip.label.text = this.app.researchDescription;
      this.view.imageHeading.text = this.app.researchHeading;
      this.view.inactiveLabel.text = "";
      if(this.app.researchState == 0)
      {
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.TXD,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.IMAGE,this.view.image);
         com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.inactiveLabel,"UA_INACTIVE");
      }
      else if(this.app.researchTexture != "" && this.app.researchTexture != undefined)
      {
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.TXD,this.app.researchTexture,this.view.image);
      }
      if(this.app.fastTrackState == com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.ACTIVE)
      {
         if(this.app.fastTrackSaleCost >= 0)
         {
            this.view.researchButton.label.text = "$" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(this.app.fastTrackCost);
            this.view.researchButton.line._width = this.view.researchButton.label.textWidth + 4;
            this.view.researchButton.label.text = com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.researchButton.label,"UA_RSCH_FAST") + ": $" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(this.app.fastTrackCost);
            var _loc3_ = this.view.researchButton.label.textWidth;
            this.view.researchButton.line._x = 0.5 * (this.view.researchButton._width + _loc3_) - this.view.researchButton.line._width + 2;
            this.view.researchButton.label.text += " $" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(this.app.fastTrackSaleCost);
            this.view.researchButton.line._x -= 0.5 * (this.view.researchButton.label.textWidth - _loc3_);
            this.view.researchButton.line._visible = true;
         }
         else
         {
            this.view.researchButton.label.text = com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.researchButton.label,"UA_RSCH_FAST") + ": $" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(this.app.fastTrackCost);
            this.view.researchButton.line._visible = false;
         }
      }
      else
      {
         this.view.researchButton.label.text = com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.researchButton.label,"UA_RSCH_FAST");
         this.view.researchButton.line._visible = false;
      }
   }
   function updateStats()
   {
      var _loc2_ = undefined;
      switch(this.app.status)
      {
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STATUS_UNOWNED:
            _loc2_ = "UA_STATUS_UNOWNED";
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STATUS_ACTIVE:
            _loc2_ = "UA_STATUS_ACTIVE";
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STATUS_PENDING_RESTART:
            _loc2_ = "UA_STATUS_RESTART";
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STATUS_SUSPENDED:
            _loc2_ = "UA_STATUS_SUSPENDED";
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STATUS_NOT_SET_UP:
            _loc2_ = "UA_STATUS_NOT_SET_UP";
      }
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.status,_loc2_);
      this.view.status._x = this.view.statusLabel._x + this.view.statusLabel.textWidth + 10;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.view.stockMeter.bar,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.view.researchMeter.bar,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.view.suppliesMeter.bar,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_ORANGE);
      var _loc3_ = Math.max(0,Math.min(this.app.researchProgress,100));
      if(this.animateResearchBar)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.researchMeter.bar,0.5 * com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.METER_BAR_ANIMATION_DURATION,{_xscale:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      }
      else
      {
         this.view.researchMeter.bar._xscale = _loc3_;
      }
      this.view.stockMeter.bar._xscale = Math.max(0,Math.min(this.app.stockLevel,100));
      this.view.suppliesMeter.bar._xscale = Math.max(0,Math.min(this.app.suppliesLevel,100));
   }
   function handleButtonInput(inputID)
   {
      if(inputID == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.ACCEPT)
      {
         if(this.app.GET_CURRENT_SELECTION() == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.VIEW_UNLOCKS)
         {
            this.app.SHOW_SCREEN(this.app.UNLOCKS_SCREEN);
         }
      }
   }
   function activateFastTrack()
   {
      var _loc2_ = Math.max(0,Math.min(this.app.researchProgress,100));
      this.view.researchMeter.bar.gotoAndPlay("pulse");
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.researchMeter.bar,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.METER_BAR_ANIMATION_DURATION,{_xscale:_loc2_,onCompleteScope:this,onComplete:this.playUnlockAnimation,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      this.app.disableAllButtons();
   }
   function playUnlockAnimation()
   {
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.playSound("Research_Unlocked","DLC_GR_Disruption_Logistics_Sounds");
      this.view.padlock.label.text = "";
      this.view.padlock.icon.gotoAndPlay("open");
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.researchMeter.bar,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.PADLOCK_ANIMATION_DURATION,{onCompleteScope:this,onComplete:this.fastTrackComplete});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.padlock,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.PADLOCK_FADE_OUT_DURATION,{delay:com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.METER_BAR_ANIMATION_DURATION,_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
   }
   function fastTrackComplete()
   {
      this.view.researchMeter.bar.gotoAndStop("red");
      this.app.enableAllButtons();
   }
   function onTargetChange(id)
   {
      if(id == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.RESEARCH_TOOLTIP)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.tooltip,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.FADE_IN_TIME,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.FADE_IN_ARGS);
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.tooltip,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.FADE_OUT_TIME,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResearchScreen.FADE_OUT_ARGS);
      }
   }
   function dispose()
   {
      this.cursor.setChangeListener(null);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.tooltip);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.researchMeter.bar);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.padlock);
      super.dispose();
   }
}
