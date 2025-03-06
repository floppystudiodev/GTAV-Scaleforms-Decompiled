class com.rockstargames.gtav.levelDesign.nightclub.screens.UpgradesScreen extends com.rockstargames.gtav.levelDesign.nightclub.screens.Screen
{
   var persistentContent;
   var upgradeButtons;
   var view;
   var app;
   var _buttons;
   var overlay;
   function UpgradesScreen(app, viewContainer, cursor, persistentContent, overlay)
   {
      super(app,viewContainer,cursor,persistentContent,overlay,"upgradesScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.persistentContent.updateNav(4);
      this.persistentContent.setPopularityMeterVisible(false);
      this.persistentContent.resetPopularityMeter();
      this.initUpgradeButtons();
      this.update();
   }
   function initUpgradeButtons()
   {
      this.upgradeButtons = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_UPGRADES)
      {
         var _loc3_ = this.view["upgradeButton" + _loc2_];
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(_loc3_.title,"CLUB_UPG_" + _loc2_);
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(_loc3_.description,"CLUB_UPG_DESC_" + _loc2_);
         _loc3_.image.gotoAndStop(_loc2_ * 3 + this.app.clubStyle + 1);
         var _loc4_ = new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs["UPGRADE_" + _loc2_],_loc3_);
         this._buttons.push(_loc4_);
         this.upgradeButtons.push(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function update()
   {
      this.updateUpgradeButtons();
   }
   function updateUpgradeButtons()
   {
      var _loc4_ = 0;
      while(_loc4_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_UPGRADES)
      {
         var _loc2_ = this.upgradeButtons[_loc4_].view;
         var _loc3_ = this.app.upgrades[_loc4_];
         if(_loc3_.availability == com.rockstargames.gtav.levelDesign.nightclub.structs.Upgrade.LOCKED)
         {
            _loc2_.locked._visible = true;
            _loc2_.purchasedTick._visible = false;
            this.updateCost(_loc2_,_loc3_.isOnSale,_loc3_.cost,_loc3_.saleCost);
         }
         else if(_loc3_.availability == com.rockstargames.gtav.levelDesign.nightclub.structs.Upgrade.AVAILABLE)
         {
            _loc2_.locked._visible = false;
            _loc2_.purchasedTick._visible = false;
            this.updateCost(_loc2_,_loc3_.isOnSale,_loc3_.cost,_loc3_.saleCost);
         }
         else if(_loc3_.availability == com.rockstargames.gtav.levelDesign.nightclub.structs.Upgrade.PURCHASED)
         {
            _loc2_.locked._visible = false;
            _loc2_.purchasedTick._visible = true;
            _loc2_.strikethrough._visible = false;
            com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(_loc2_.cost,"CLUB_EQUIPPED");
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function updateCost(panel, isOnSale, originalCost, saleCost)
   {
      panel.cost.textAutoSize = "none";
      panel.strikethrough._x = panel.cost._x;
      if(isOnSale)
      {
         var _loc2_ = "$" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(originalCost);
         var _loc3_ = saleCost <= 0 ? "  " + com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(panel.cost,"CLUB_FREE") : "  $" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(saleCost);
         panel.cost.text = _loc2_ + _loc3_;
         if(panel.cost.textWidth > panel.cost._width)
         {
            panel.cost.textAutoSize = "shrink";
            panel.strikethrough._width = panel.cost._x + panel.cost.getExactCharBoundaries(_loc2_.length - 1).right + 4;
         }
         else
         {
            panel.cost.text = _loc2_;
            panel.strikethrough._width = panel.cost.textWidth + 4;
            panel.cost.appendText(_loc3_);
         }
         panel.strikethrough._visible = true;
      }
      else if(originalCost <= 0)
      {
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(panel.cost,"CLUB_FREE");
         panel.strikethrough._visible = false;
      }
      else
      {
         panel.cost.text = "$" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(originalCost);
         panel.strikethrough._visible = false;
      }
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.ACCEPT:
            this.handleAcceptButton(this.app.GET_CURRENT_SELECTION());
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.CANCEL:
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.LB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.SELL_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.RB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.HOME_SCREEN);
            }
      }
   }
   function handleAcceptButton(id)
   {
      this.checkNavigationButtons(id);
   }
   function dispose()
   {
      this.upgradeButtons = null;
      super.dispose();
   }
}
