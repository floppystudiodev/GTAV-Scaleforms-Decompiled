class com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen extends com.rockstargames.gtav.levelDesign.nightclub.screens.Screen
{
   var _buttons;
   var app;
   var buyerButtons;
   var cursor;
   var overlay;
   var persistentContent;
   var stockButtons;
   var view;
   static var ON_PRICE_COLOUR = new flash.geom.ColorTransform();
   static var OFF_PRICE_COLOUR = new flash.geom.ColorTransform(0,0,0,1,102,51,153,0);
   static var ALPHA_ENABLED = 100;
   static var ALPHA_DISABLED = 50;
   function SellScreen(app, viewContainer, cursor, persistentContent, overlay)
   {
      super(app,viewContainer,cursor,persistentContent,overlay,"sellScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.persistentContent.updateNav(5);
      this.persistentContent.setPopularityMeterVisible(false);
      this.persistentContent.resetPopularityMeter();
      this.stockButtons = [];
      var _loc4_ = 0;
      var _loc3_;
      var _loc5_;
      while(_loc4_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES)
      {
         _loc3_ = this.view["stockButton" + _loc4_];
         _loc3_.label.textAutoSize = "shrink";
         _loc3_.sellFor.autoSize = "left";
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(_loc3_.sellFor,"CLUB_SELLFOR");
         _loc3_.price._x = _loc3_.sellFor._x + _loc3_.sellFor.textWidth;
         _loc5_ = new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs["SELL_" + _loc4_],_loc3_,"CLUB_STOCK" + _loc4_,false);
         this._buttons.push(_loc5_);
         this.stockButtons.push(_loc5_);
         _loc4_ = _loc4_ + 1;
      }
      this._buttons.push(new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.SELL_ALL,this.view.allButton,"CLUB_SELLALL",false));
      this.buyerButtons = [];
      _loc4_ = 0;
      while(_loc4_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_BUYERS)
      {
         _loc3_ = this.view["buyerButton" + _loc4_];
         _loc3_.label.textAutoSize = "shrink";
         _loc3_.type0.textAutoSize = "shrink";
         _loc3_.type1.textAutoSize = "shrink";
         _loc3_.type2.textAutoSize = "shrink";
         _loc3_.sellFor.autoSize = "left";
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(_loc3_.sellFor,"CLUB_SELLFOR");
         _loc3_.price._x = _loc3_.sellFor._x + _loc3_.sellFor.textWidth;
         _loc5_ = new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs["BUYER_" + _loc4_],_loc3_);
         this._buttons.push(_loc5_);
         this.buyerButtons.push(_loc5_);
         _loc4_ = _loc4_ + 1;
      }
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.specialBuyersLabel,"CLUB_BUYERS");
      this.update();
      this.onTargetChange(this.cursor.getTargetIDUnderCursor());
   }
   function update()
   {
      var _loc12_ = 0;
      var _loc5_;
      var _loc8_;
      while(_loc12_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES)
      {
         _loc5_ = this.stockButtons[_loc12_].view;
         _loc8_ = this.app.stock[_loc12_];
         _loc5_.price.label.text = " $" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(_loc8_.sellPrice);
         _loc5_.stockLevel.text = _loc8_.currLevel + "/" + _loc8_.maxLevel;
         _loc5_.price.label._visible = _loc8_.canSell;
         _loc5_.sellFor._visible = _loc8_.canSell;
         _loc5_._alpha = !_loc8_.canSell ? com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen.ALPHA_DISABLED : com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen.ALPHA_ENABLED;
         _loc12_ = _loc12_ + 1;
      }
      if(this.app.totalStockValue > 0)
      {
         this.view.allButton.price.label.text = "$" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.totalStockValue);
         this.view.allButton._alpha = com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen.ALPHA_ENABLED;
      }
      else
      {
         this.view.allButton.price.label.text = "";
         this.view.allButton._alpha = com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen.ALPHA_DISABLED;
      }
      _loc12_ = 0;
      var _loc7_;
      var _loc6_;
      var _loc2_;
      var _loc9_;
      var _loc3_;
      var _loc4_;
      var _loc10_;
      var _loc11_;
      while(_loc12_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_BUYERS)
      {
         _loc7_ = this.app.buyers[_loc12_];
         _loc5_ = this.buyerButtons[_loc12_].view;
         _loc6_ = true;
         _loc5_.label.text = _loc7_.name;
         _loc5_.price.label.text = " $" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(_loc7_.price);
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            _loc9_ = _loc7_["cargoType" + _loc2_];
            _loc3_ = _loc7_["cargoAmount" + _loc2_];
            _loc4_ = this.app.stock[_loc9_].currLevel;
            if(_loc4_ > _loc3_)
            {
               _loc4_ = _loc3_;
            }
            _loc6_ = _loc6_ && _loc4_ == _loc3_;
            _loc5_["amount" + _loc2_].text = _loc4_ + "/" + _loc3_;
            _loc10_ = _loc5_["type" + _loc2_];
            _loc11_ = "CLUB_STOCK" + _loc9_;
            com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(_loc10_,_loc11_);
            _loc2_ = _loc2_ + 1;
         }
         _loc5_.price.label._visible = _loc6_;
         _loc5_.sellFor._visible = _loc6_;
         _loc5_._alpha = !_loc6_ ? com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen.ALPHA_DISABLED : com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen.ALPHA_ENABLED;
         _loc12_ = _loc12_ + 1;
      }
      if(this.app.sellCooldown == 0)
      {
         this.view.cooldown.label.text = "";
         this.view.cooldown._visible = false;
      }
      else
      {
         this.view.cooldown.label.text = com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatTime(this.app.sellCooldown);
         this.view.cooldown._visible = true;
      }
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.ACCEPT:
            this.handleAcceptButton(this.app.GET_CURRENT_SELECTION());
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.LB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.WAREHOUSE_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.RB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.UPGRADES_SCREEN);
            }
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.CANCEL:
         default:
            return;
      }
   }
   function handleAcceptButton(id)
   {
      this.checkNavigationButtons(id);
   }
   function onTargetChange(targetID)
   {
      var _loc3_;
      var _loc4_;
      var _loc2_;
      if(this.overlay.isShowing)
      {
         this.overlay.updateSelectedButton(targetID);
      }
      else
      {
         _loc3_ = 0;
         _loc4_ = this._buttons.length;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this._buttons[_loc3_];
            if(_loc2_.enabled)
            {
               _loc2_.view.gotoAndStop(_loc2_.id != targetID ? "off" : "on");
               if(_loc2_.view.price)
               {
                  _loc2_.view.price.transform.colorTransform = _loc2_.id != targetID ? com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen.OFF_PRICE_COLOUR : com.rockstargames.gtav.levelDesign.nightclub.screens.SellScreen.ON_PRICE_COLOUR;
               }
            }
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function dispose()
   {
      this.stockButtons = null;
      this.buyerButtons = null;
      super.dispose();
   }
}
