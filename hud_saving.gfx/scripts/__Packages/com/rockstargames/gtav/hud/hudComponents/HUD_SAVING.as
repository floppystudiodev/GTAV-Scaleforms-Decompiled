class com.rockstargames.gtav.hud.hudComponents.HUD_SAVING extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var CONTENT;
   var _HUD;
   var _enumID;
   var hidden = true;
   var SAVEGAME_ICON_STYLE_NONE = 0;
   var SAVEGAME_ICON_STYLE_WORKING = 1;
   var SAVEGAME_ICON_STYLE_SUCCESS = 2;
   var SAVEGAME_ICON_STYLE_FAILED = 3;
   var SAVEGAME_ICON_STYLE_CLOUD_WORKING = 4;
   var LOADING = 5;
   var textPadding = 5;
   function HUD_SAVING()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.READY();
   }
   function READY(id)
   {
      super.READY(id);
      this.CONTENT._alpha = 0;
      this.hidden = true;
   }
   function SET_SAVING_TEXT_STANDALONE(iconEnum, saveStr)
   {
      this.READY(com.rockstargames.gtav.constants.HudComponentConstants.HUD_SAVING_GAME);
      this.SET_SAVING_TEXT([iconEnum,saveStr]);
   }
   function SET_SAVING_TEXT(params)
   {
      var _loc3_ = params[0];
      var _loc2_ = params[1];
      this.CONTENT.dialogMC.iconMC.spinnerMC._visible = false;
      this.CONTENT.dialogMC.iconMC.starMC._visible = false;
      this.CONTENT.dialogMC.iconMC.SAVING._visible = false;
      if(_loc3_ == this.SAVEGAME_ICON_STYLE_WORKING)
      {
         this.CONTENT.dialogMC.iconMC.SAVING._visible = true;
      }
      if(_loc3_ == this.SAVEGAME_ICON_STYLE_CLOUD_WORKING)
      {
         this.CONTENT.dialogMC.iconMC.starMC._visible = true;
      }
      if(_loc3_ == this.LOADING)
      {
         this.CONTENT.dialogMC.iconMC.spinnerMC._visible = true;
      }
      if(_loc2_ != undefined && _loc2_ != "" && _loc2_ != null)
      {
         this.CONTENT.dialogMC.saveTF.htmlText = _loc2_;
         this.CONTENT.dialogMC.saveTF.autoSize = "right";
         this.CONTENT.dialogMC.saveTF._x = 369 - (this.CONTENT.dialogMC.saveTF.htmlText._width + this.textPadding);
         this.CONTENT.dialogMC.background._width = 400 - this.CONTENT.dialogMC.saveTF._x + this.textPadding;
         this.CONTENT.dialogMC.background._x = 400 - this.CONTENT.dialogMC.background._width;
      }
      else
      {
         this.CONTENT.dialogMC.saveTF.htmlText = "";
         this.CONTENT.dialogMC.background._x = 369;
         this.CONTENT.dialogMC.background._width = 31;
      }
      this.SHOW();
   }
   function SHOW()
   {
      if(this.hidden)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 2000,{_alpha:100});
         this.hidden = false;
      }
   }
   function STAY_ON_SCREEN()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.ON_SCREEN_DURATION / 1000,{onComplete:this.HIDE_SAVING,onCompleteScope:this});
   }
   function HIDE_SAVING()
   {
      this.CONTENT._alpha = 0;
      this.hidden = true;
      this.REMOVE();
   }
   function REMOVE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
}
