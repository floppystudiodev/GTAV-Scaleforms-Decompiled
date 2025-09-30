class com.rockstargames.gtav.levelDesign.hangarCargo.SellScreen extends com.rockstargames.gtav.levelDesign.hangarCargo.Screen
{
   var _buttons;
   var activeButtons;
   var app;
   var cursor;
   var overlay;
   var sellAllButton;
   var sellItems;
   var showing;
   var view;
   static var ELEMENT_FADE_IN_DURATION = 0.5;
   static var ELEMENT_FADE_IN_STEP = 0.1;
   static var NUM_COLS = 4;
   function SellScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"sellScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.view.sellTab.gotoAndStop("on");
      this.showing = false;
      this.activeButtons = [];
      this.sellItems = [];
      var _loc3_ = 1;
      while(_loc3_ <= com.rockstargames.gtav.levelDesign.HANGAR_CARGO.NUM_CARGO_TYPES)
      {
         this.sellItems.push(new com.rockstargames.gtav.levelDesign.hangarCargo.SellItem(this.view["sellItem" + _loc3_],_loc3_));
         _loc3_ = _loc3_ + 1;
      }
      this.sellAllButton = new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO.SELL_TYPE_0,this.view.sellAllButton,"HC_SELL_ALL");
      this.view.sellAllButton._alpha = 0;
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
      this.updateStats();
      this.updateCargos();
      this.updateCooldown();
      this.initFadeIn();
   }
   function initFadeIn()
   {
      var _loc3_ = {_alpha:25,delay:0,onCompleteScope:this,onComplete:this.itemFadeInComplete};
      var _loc2_ = 0;
      var _loc4_ = this.sellItems.length;
      while(_loc2_ < _loc4_)
      {
         _loc3_.onCompleteArgs = [_loc2_];
         _loc3_.delay = (!com.rockstargames.gtav.levelDesign.HANGAR_CARGO.fadeDirection ? com.rockstargames.gtav.levelDesign.hangarCargo.SellScreen.NUM_COLS - 1 - _loc2_ % com.rockstargames.gtav.levelDesign.hangarCargo.SellScreen.NUM_COLS : _loc2_ % com.rockstargames.gtav.levelDesign.hangarCargo.SellScreen.NUM_COLS) * com.rockstargames.gtav.levelDesign.hangarCargo.SellScreen.ELEMENT_FADE_IN_STEP;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.sellItems[_loc2_].view,0.25 * com.rockstargames.gtav.levelDesign.hangarCargo.SellScreen.ELEMENT_FADE_IN_DURATION,_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      _loc3_.delay += com.rockstargames.gtav.levelDesign.hangarCargo.SellScreen.ELEMENT_FADE_IN_STEP;
      _loc3_.onComplete = this.fadeInComplete;
      _loc3_._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.sellAllButton,com.rockstargames.gtav.levelDesign.hangarCargo.SellScreen.ELEMENT_FADE_IN_DURATION,_loc3_);
      com.rockstargames.gtav.levelDesign.HANGAR_CARGO.fadeDirection ^= 1;
   }
   function itemFadeInComplete(index)
   {
      var _loc3_ = this.sellItems[index];
      var _loc4_;
      var _loc2_ = 0;
      while(_loc2_ < this.app.cargos.length)
      {
         if(this.app.cargos[_loc2_].type == index + 1)
         {
            _loc4_ = this.app.cargos[_loc2_];
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc6_;
      if(_loc4_ != undefined)
      {
         _loc6_ = _loc3_.update(_loc4_);
         if(_loc6_)
         {
            _loc2_ = 0;
            while(_loc2_ < this.activeButtons.length)
            {
               if(this.activeButtons[_loc2_] == _loc3_.button)
               {
                  return undefined;
               }
               _loc2_ = _loc2_ + 1;
            }
            this.activeButtons.push(_loc3_.button);
         }
         if(!this.overlay.isShowing)
         {
            this.cursor.setTargetRects(this.buttons);
         }
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_.view,0.75 * com.rockstargames.gtav.levelDesign.hangarCargo.SellScreen.ELEMENT_FADE_IN_DURATION,{_alpha:100});
   }
   function fadeInComplete()
   {
      this.showing = true;
   }
   function updateStats()
   {
      if(this.app.sellAllPrice != undefined)
      {
         this.view.sellAllButton.price.text = "$" + com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatNumber(this.app.sellAllPrice);
      }
   }
   function updateCargos()
   {
      if(!this.showing)
      {
         return undefined;
      }
      this.activeButtons.length = 0;
      var _loc4_ = 0;
      var _loc7_ = this.sellItems.length;
      while(_loc4_ < _loc7_)
      {
         this.sellItems[_loc4_].reset();
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      _loc7_ = this.app.cargos.length;
      var _loc5_;
      var _loc3_;
      var _loc8_;
      var _loc6_;
      var _loc2_;
      while(_loc4_ < _loc7_)
      {
         _loc5_ = this.app.cargos[_loc4_];
         if(_loc5_.type > 0)
         {
            _loc3_ = this.sellItems[_loc5_.type - 1];
            if(_loc3_)
            {
               _loc8_ = _loc3_.update(_loc5_);
               if(_loc8_)
               {
                  _loc6_ = false;
                  _loc2_ = 0;
                  while(_loc4_ < this.activeButtons.length)
                  {
                     if(this.activeButtons[_loc2_] == _loc3_.button)
                     {
                        _loc6_ = true;
                     }
                     _loc2_ = _loc2_ + 1;
                  }
                  if(!_loc6_)
                  {
                     this.activeButtons.push(_loc3_.button);
                  }
               }
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      if(!this.overlay.isShowing)
      {
         this.cursor.setTargetRects(this.buttons);
      }
   }
   function updateCooldown()
   {
      var _loc3_ = false;
      var _loc2_;
      if(this.app.sellRemainingCooldown > 0)
      {
         _loc2_ = 100;
         if(this.app.sellTotalCooldown > 0)
         {
            _loc2_ = 100 * this.app.sellRemainingCooldown / this.app.sellTotalCooldown;
            if(_loc2_ > 100)
            {
               _loc2_ = 100;
            }
         }
         this.view.cooldownOverlay.meterBar._xscale = _loc2_;
         this.view.cooldownOverlay.title.label.text = com.rockstargames.gtav.levelDesign.HANGAR_CARGO.formatTime(this.app.sellRemainingCooldown);
         com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(this.view.cooldownOverlay.message,"HC_COOLDOWN");
         _loc3_ = !this.view.cooldownOverlay._visible;
         this.view.cooldownOverlay._visible = true;
      }
      else
      {
         _loc3_ = this.view.cooldownOverlay._visible;
         this.view.cooldownOverlay._visible = false;
      }
      if(_loc3_)
      {
         if(!this.overlay.isShowing)
         {
            this.cursor.setTargetRects(this.buttons);
         }
      }
   }
   function get buttons()
   {
      if(this.view.cooldownOverlay._visible)
      {
         return this._buttons;
      }
      return [this.sellAllButton].concat(this._buttons).concat(this.activeButtons);
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.ACCEPT:
            this.handleAcceptButton(this.app.GET_CURRENT_SELECTION());
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.LB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.STEAL_SCREEN);
            }
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.CANCEL:
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.RB:
         default:
            return;
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
         default:
            return;
      }
   }
   function onTargetChange(targetID)
   {
      var _loc2_;
      var _loc4_;
      var _loc3_;
      if(this.overlay.isShowing)
      {
         this.overlay.updateSelectedButton(targetID);
      }
      else
      {
         _loc2_ = 0;
         _loc4_ = this.buttons.length;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = this.buttons[_loc2_];
            _loc3_.view.gotoAndStop(_loc3_.id != targetID ? "off" : "on");
            _loc2_ = _loc2_ + 1;
         }
         this.view.sellTab.gotoAndStop("on");
      }
   }
   function dispose()
   {
      var _loc3_ = 0;
      var _loc4_ = this.sellItems.length;
      while(_loc3_ < _loc4_)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.sellItems[_loc3_].view);
         this.sellItems[_loc3_].dispose();
         _loc3_ = _loc3_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.sellAllButton);
      this.sellItems = null;
      this.activeButtons = null;
      this.sellAllButton = null;
      super.dispose();
   }
}
