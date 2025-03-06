class com.rockstargames.gtav.web.arena.ProgressPanel
{
   var view;
   var website;
   var initialised;
   var currTotal;
   var currSaleTotal;
   var buttonTargets;
   static var ON_ACTIVE_COLOUR = 39244;
   static var ON_INACTIVE_COLOUR = 31293;
   static var OFF_ACTIVE_COLOUR = 16777215;
   static var OFF_INACTIVE_COLOUR = 13421772;
   function ProgressPanel(view, website)
   {
      this.view = view;
      this.website = website;
      this.initialised = false;
      view._visible = false;
      this.currTotal = 0;
      this.currSaleTotal = 0;
   }
   function init()
   {
      this.buttonTargets = [com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.WORKSHOP_STYLE_PAGE.name,com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.WORKSHOP_GRAPHICS_PAGE.name,com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.WORKSHOP_COLOUR_PAGE.name,com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.EXPANSION_FLOOR_B1_PAGE.name,com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.EXPANSION_FLOOR_B2_PAGE.name,com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.MECHANIC_PAGE.name,com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.PERSONAL_QUARTERS_PAGE.name];
      var _loc4_ = ["MBA_STYLE","MBA_GRAPHICS","MBA_COLOUR","MBA_FLOOR_B1","MBA_FLOOR_B2","MBA_MECHANIC","MBA_QUARTERS"];
      var _loc3_ = 0;
      while(_loc3_ < this.buttonTargets.length)
      {
         var _loc2_ = this.view["progressButton_" + _loc3_];
         _loc2_.OFF_ACTIVE_COLOUR = 16777215;
         _loc2_.OFF_INACTIVE_COLOUR = 13421772;
         _loc2_.onColour = 268435455;
         _loc2_.offColour = 12961473;
         _loc2_.stepDot.exclamation._visible = false;
         _loc2_.stepDot.tick._visible = false;
         _loc2_.btnTxt.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(_loc2_.btnTxt,_loc4_[_loc3_]).toUpperCase();
         _loc2_.highlight._visible = false;
         if(this.website.displayConfig.isAsian)
         {
            com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(_loc2_.btnTxt);
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this.website.propertyIsOwned)
      {
         if(this.website.purchasedMechanicA == 1 && this.website.purchasedMechanicB == 1)
         {
            this.view.progressButton_5.stepDot.tick._visible = true;
            this.view.progressButton_5.disabled = true;
         }
         if(this.website.purchasedPersonalQuarters == 1)
         {
            this.view.progressButton_6.stepDot.tick._visible = true;
            this.view.progressButton_6.disabled = true;
         }
      }
      this.view.purchaseButton.selected._visible = false;
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.purchaseButton.btnTxt,"MBA_PURCHASE");
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(this.view.purchaseButton.btnTxt);
      }
   }
   function show(showPurchaseButton)
   {
      if(!this.initialised)
      {
         this.init();
         this.initialised = true;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.buttonTargets.length)
      {
         var _loc3_ = this.view["progressButton_" + _loc2_];
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      if(showPurchaseButton)
      {
         this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
         this.view.purchaseButton._visible = true;
      }
      else
      {
         this.view.purchaseButton._visible = false;
      }
      this.view._visible = true;
   }
   function hide()
   {
      this.view._visible = false;
   }
   function handleClick(type, id)
   {
      if(type == "progressButton")
      {
         this.website.browser.GO_TO_WEBPAGE(this.buttonTargets[parseInt(id)]);
         return true;
      }
      if(type == "purchaseButton")
      {
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.SUMMARY_PAGE.name);
         return true;
      }
      return false;
   }
   function setProgress(step)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttonTargets.length)
      {
         var _loc3_ = this.view["progressButton_" + _loc2_];
         _loc3_.stepDot.marker._visible = _loc2_ < step;
         _loc3_.highlight._visible = _loc2_ == step - 1;
         _loc2_ = _loc2_ + 1;
      }
   }
   function setExclamation(index, isShowing)
   {
      this.view["progressButton_" + index].stepDot.exclamation._visible = isShowing;
   }
   function setDisabledButtons()
   {
      if(this.website.propertyIsOwned)
      {
         if(this.website.purchasedMechanicA == 1 && this.website.purchasedMechanicB == 1)
         {
            this.view.progressButton_5.disabled = true;
         }
         if(this.website.purchasedPersonalQuarters == 1)
         {
            this.view.progressButton_6.disabled = true;
         }
      }
   }
   function getTotal()
   {
      return this.currTotal;
   }
   function getSaleTotal()
   {
      return this.currSaleTotal;
   }
   function updateCosts()
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc8_ = undefined;
      var _loc7_ = undefined;
      var _loc6_ = undefined;
      var _loc4_ = undefined;
      var _loc5_ = false;
      this.currTotal = this.website.getPropertyBaseCost(false);
      this.currSaleTotal = this.website.getPropertyBaseCost(true);
      if(this.website.styleOption != this.website.purchasedStyleOption && this.website.styleOption != -1)
      {
         _loc3_ = this.website.getStyleCost(this.website.styleOption,false);
         _loc2_ = this.website.getStyleCost(this.website.styleOption,true);
      }
      else
      {
         _loc3_ = -1;
         _loc2_ = -1;
      }
      this.updateCostStep(this.view.progressButton_0,_loc3_,_loc2_);
      if(this.website.graphicsOption != this.website.purchasedGraphicsOption && this.website.graphicsOption != -1)
      {
         _loc3_ = this.website.getGraphicsCost(this.website.graphicsOption,false);
         _loc2_ = this.website.getGraphicsCost(this.website.graphicsOption,true);
      }
      else
      {
         _loc3_ = -1;
         _loc2_ = -1;
      }
      this.updateCostStep(this.view.progressButton_1,_loc3_,_loc2_);
      if(this.website.colourOption != this.website.purchasedColourOption && this.website.colourOption != -1)
      {
         _loc3_ = this.website.getColourCost(this.website.colourOption,false);
         _loc2_ = this.website.getColourCost(this.website.colourOption,true);
      }
      else
      {
         _loc3_ = -1;
         _loc2_ = -1;
      }
      this.updateCostStep(this.view.progressButton_2,_loc3_,_loc2_);
      if(this.website.expansionFloorB1Option != this.website.purchasedExpansionFloorB1Option && this.website.expansionFloorB1Option > 0)
      {
         _loc3_ = this.website.getExpansionFloorB1Cost(this.website.expansionFloorB1Option,false);
         _loc2_ = this.website.getExpansionFloorB1Cost(this.website.expansionFloorB1Option,true);
      }
      else
      {
         _loc3_ = -1;
         _loc2_ = -1;
      }
      this.updateCostStep(this.view.progressButton_3,_loc3_,_loc2_);
      if(this.website.expansionFloorB2Option != this.website.purchasedExpansionFloorB2Option && this.website.expansionFloorB2Option > 0)
      {
         _loc3_ = this.website.getExpansionFloorB2Cost(this.website.expansionFloorB2Option,false);
         _loc2_ = this.website.getExpansionFloorB2Cost(this.website.expansionFloorB2Option,true);
      }
      else
      {
         _loc3_ = -1;
         _loc2_ = -1;
      }
      this.updateCostStep(this.view.progressButton_4,_loc3_,_loc2_);
      _loc5_ = false;
      if(this.website.mechanicA != this.website.purchasedMechanicA && this.website.mechanicA == 1)
      {
         _loc8_ = this.website.getMechanicACost(false);
         _loc6_ = this.website.getMechanicACost(true);
         _loc5_ = true;
      }
      else
      {
         _loc8_ = 0;
         _loc6_ = -1;
      }
      if(this.website.mechanicB != this.website.purchasedMechanicB && this.website.mechanicB == 1)
      {
         _loc7_ = this.website.getMechanicBCost(false);
         _loc4_ = this.website.getMechanicBCost(true);
         _loc5_ = true;
      }
      else
      {
         _loc7_ = 0;
         _loc4_ = -1;
      }
      if(_loc5_)
      {
         var _loc9_ = _loc6_ != -1 || _loc4_ != -1;
         _loc3_ = _loc8_ + _loc7_;
         _loc2_ = !_loc9_ ? -1 : 0;
         if(_loc9_)
         {
            _loc2_ += _loc6_ == -1 ? _loc8_ : _loc6_;
            _loc2_ += _loc4_ == -1 ? _loc7_ : _loc4_;
         }
         this.updateCostStep(this.view.progressButton_5,_loc3_,_loc2_);
      }
      else
      {
         this.updateCostStep(this.view.progressButton_5,-1,-1);
      }
      if(this.website.personalQuarters != this.website.purchasedPersonalQuarters && this.website.personalQuarters == 1)
      {
         _loc3_ = this.website.getPersonalQuartersCost(false);
         _loc2_ = this.website.getPersonalQuartersCost(true);
      }
      else
      {
         _loc3_ = -1;
         _loc2_ = -1;
      }
      this.updateCostStep(this.view.progressButton_6,_loc3_,_loc2_,true);
      this.updateTotalCost();
   }
   function updateCostStep(stepView, cost, saleCost)
   {
      if(saleCost >= 0 && saleCost < cost)
      {
         if(saleCost == 0)
         {
            com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(stepView.cost,"CLUB_FREE");
         }
         else
         {
            stepView.cost.text = "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(saleCost);
         }
         stepView.originalCost.text = "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(cost);
         stepView.strikethrough._width = stepView.originalCost.textWidth + 4;
         stepView.strikethrough._visible = true;
         this.currTotal += cost;
         this.currSaleTotal += saleCost;
      }
      else if(cost >= 0)
      {
         if(cost == 0)
         {
            com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(stepView.cost,"CLUB_FREE");
         }
         else
         {
            stepView.cost.text = "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(cost);
         }
         stepView.originalCost.text = "";
         stepView.strikethrough._visible = false;
         this.currTotal += cost;
         this.currSaleTotal += cost;
      }
      else
      {
         stepView.cost.text = "";
         stepView.originalCost.text = "";
         stepView.strikethrough._visible = false;
      }
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(stepView.cost);
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(stepView.originalCost);
      }
   }
   function updateTotalCost()
   {
      if(this.currSaleTotal < this.currTotal)
      {
         this.view.purchaseButton.gotoAndStop("sale");
         this.view.purchaseButton.cost.text = "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(this.currSaleTotal);
         this.view.purchaseButton.originalCost.text = "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(this.currTotal);
         this.view.purchaseButton.strikethrough._width = this.view.purchaseButton.originalCost.textWidth + 2;
         this.view.purchaseButton.strikethrough._x = this.view.purchaseButton.originalCost._x + this.view.purchaseButton.originalCost._width - this.view.purchaseButton.originalCost.textWidth - 2;
      }
      else
      {
         this.view.purchaseButton.gotoAndStop("normal");
         this.view.purchaseButton.cost.text = "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(this.currTotal);
      }
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(this.view.purchaseButton.cost);
      }
   }
   function dispose()
   {
      this.view = null;
      this.website = null;
      this.buttonTargets = null;
   }
}
