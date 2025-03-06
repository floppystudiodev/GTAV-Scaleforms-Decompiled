class com.rockstargames.gtav.levelDesign.hangarCargo.StealScreen extends com.rockstargames.gtav.levelDesign.hangarCargo.Screen
{
   var view;
   var stealButtons;
   var _buttons;
   var cursor;
   var app;
   var overlay;
   static var ELEMENT_FADE_IN_DURATION = 0.5;
   static var ELEMENT_FADE_IN_STEP = 0.1;
   static var NUM_COLS = 4;
   static var fadeDirection = 1;
   function StealScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"stealScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.view.stealTab.gotoAndStop("on");
      this.stealButtons = [];
      var _loc3_ = 1;
      while(_loc3_ <= com.rockstargames.gtav.levelDesign.HANGAR_CARGO.NUM_CARGO_TYPES)
      {
         this.initStealItem(_loc3_);
         _loc3_ = _loc3_ + 1;
      }
      this._buttons.push(new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO.STEAL_TYPE_0,this.view.stealAllButton,"HC_STEAL_ALL"));
      this.view.stealAllButton._alpha = 0;
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
      this.updateCooldown();
      this.initFadeIn();
   }
   function initStealItem(type)
   {
      var _loc2_ = this.view["stealItem" + type];
      _loc2_._alpha = 0;
      com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(_loc2_.label,"HC_CARGO_" + type);
      _loc2_.swatch.gotoAndStop(type);
      var _loc3_ = new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO["STEAL_TYPE_" + type],_loc2_.button,"HC_SELECT");
      this.stealButtons.push(_loc3_);
      this._buttons.push(_loc3_);
   }
   function initFadeIn()
   {
      var _loc4_ = {_alpha:100,delay:0};
      var _loc2_ = 0;
      var _loc3_ = this.stealButtons.length;
      while(_loc2_ < _loc3_)
      {
         _loc4_.delay = (!com.rockstargames.gtav.levelDesign.HANGAR_CARGO.fadeDirection ? com.rockstargames.gtav.levelDesign.hangarCargo.StealScreen.NUM_COLS - 1 - _loc2_ % com.rockstargames.gtav.levelDesign.hangarCargo.StealScreen.NUM_COLS : _loc2_ % com.rockstargames.gtav.levelDesign.hangarCargo.StealScreen.NUM_COLS) * com.rockstargames.gtav.levelDesign.hangarCargo.StealScreen.ELEMENT_FADE_IN_STEP;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.stealButtons[_loc2_].view._parent,com.rockstargames.gtav.levelDesign.hangarCargo.StealScreen.ELEMENT_FADE_IN_DURATION,_loc4_);
         _loc2_ = _loc2_ + 1;
      }
      _loc4_.delay += com.rockstargames.gtav.levelDesign.hangarCargo.StealScreen.ELEMENT_FADE_IN_STEP;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.stealAllButton,com.rockstargames.gtav.levelDesign.hangarCargo.StealScreen.ELEMENT_FADE_IN_DURATION,_loc4_);
      com.rockstargames.gtav.levelDesign.HANGAR_CARGO.fadeDirection ^= 1;
   }
   function updateCooldown()
   {
      var _loc3_ = 0;
      var _loc5_ = this.stealButtons.length;
      while(_loc3_ < _loc5_)
      {
         var _loc4_ = this.app.stealCooldown[_loc3_];
         var _loc2_ = this.stealButtons[_loc3_].view;
         if(_loc4_ > 0)
         {
            _loc2_._alpha = 50;
            _loc2_.label.text = com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatTime(_loc4_);
         }
         else if(_loc2_._alpha != 100)
         {
            _loc2_._alpha = 100;
            com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(_loc2_.label,"HC_SELECT");
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.ACCEPT:
            this.handleAcceptButton(this.app.GET_CURRENT_SELECTION());
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.CANCEL:
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.LB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.OVERVIEW_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.RB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.SELL_SCREEN);
            }
      }
   }
   function handleAcceptButton(id)
   {
      switch(id)
      {
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.OVERVIEW_TAB:
            this.app.showScreen(this.app.OVERVIEW_SCREEN);
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.STEAL_TAB:
            this.app.showScreen(this.app.STEAL_SCREEN);
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.SELL_TAB:
            this.app.showScreen(this.app.SELL_SCREEN);
      }
   }
   function onTargetChange(targetID)
   {
      if(this.overlay.isShowing)
      {
         this.overlay.updateSelectedButton(targetID);
      }
      else
      {
         var _loc2_ = 0;
         var _loc4_ = this._buttons.length;
         while(_loc2_ < _loc4_)
         {
            var _loc3_ = this._buttons[_loc2_];
            _loc3_.view.gotoAndStop(_loc3_.id != targetID ? "off" : "on");
            _loc2_ = _loc2_ + 1;
         }
         this.view.stealTab.gotoAndStop("on");
      }
   }
   function dispose()
   {
      var _loc3_ = 0;
      var _loc4_ = this.stealButtons.length;
      while(_loc3_ < _loc4_)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.stealButtons[_loc3_].view._parent);
         _loc3_ = _loc3_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.stealAllButton);
      this.stealButtons = null;
      super.dispose();
   }
}
