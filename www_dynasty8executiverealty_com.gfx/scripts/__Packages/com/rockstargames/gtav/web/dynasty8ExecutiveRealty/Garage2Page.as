class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Garage2Page extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.GaragePage
{
   var website;
   var prevPageName;
   var nextPageName;
   var view;
   var progressPanel;
   var activeTab;
   var summaryPageName;
   var slideshow;
   function Garage2Page(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,pageName,isFirstPage,progressPanel,header);
      this.init(9,website.purchasedGarage2Equipped == 1,false,"DYN8_EXEC_UNEQUIP_2");
   }
   function init(numberSwatchOffset, garageIsOwned, isLevel1, unequipLabel)
   {
      if(this.website.garage1Equipped != 1)
      {
         this.website.garage1Equipped = 1;
      }
      if(this.website.garage1Style == -1)
      {
         this.website.garage1Style = 0;
      }
      if(this.website.garage1Lighting == -1)
      {
         this.website.garage1Lighting = 0;
      }
      if(this.website.garage1Number == -1)
      {
         this.website.garage1Number = 0;
      }
      if(this.website.garage2Equipped == -1)
      {
         this.website.garage2Equipped = 0;
      }
      if(this.website.garage2Style == -1)
      {
         this.website.garage2Style = 0;
      }
      if(this.website.garage2Lighting == -1)
      {
         this.website.garage2Lighting = 0;
      }
      if(this.website.garage2Number == -1)
      {
         this.website.garage2Number = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GARAGE_1_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GARAGE_3_PAGE.name;
      this.view.description.text = "";
      this.progressPanel.show();
      this.progressPanel.initGarageProgress(2);
      this.initEquipButtons();
      super.init(numberSwatchOffset,garageIsOwned,isLevel1,unequipLabel);
      this.updateEquipped(this.website.garage2Equipped == 1,this.website.purchasedGarage2Equipped == 1,this.website.garage2Style,this.website.garage2Lighting,this.website.garage2Number);
      if(this.website.garage2Equipped == 1)
      {
         this.updateSelectedStyle(this.website.garage2Style);
      }
      this.selectTab(this.view.styleTab,this.website.garage2Equipped == 1);
      this.view.equipButton._y = this.view.bodyText._y;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.title,"DYN8_EXEC_FLOOR_2",false);
      this.updateDisplay();
   }
   function initEquipButtons()
   {
      this.view.equipButton.onColour = 16777215;
      this.view.equipButton.offColour = 16777215;
      if(this.website.purchasedGarage2Equipped == 1)
      {
         this.view.equipButton._visible = false;
         this.view.unequipButton._visible = false;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.equipButton.btnTxt,"DYN8_EXEC_ADD_FLOOR_2",false);
         this.website.dataTextScope.push(this.view.equipButton.btnTxt);
         this.website.dataTextScope.push(this.view.unequipButton.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "styleTab":
         case "lightingTab":
         case "numberTab":
            this.selectTab(this.view[type],this.website.garage2Equipped == 1);
            this.updateSlideshow();
            break;
         case "equipButton":
            this.website.garage2Equipped = 1;
            this.updateEquipped(true,this.website.purchasedGarage2Equipped == 1,this.website.garage2Style,this.website.garage2Lighting,this.website.garage2Number);
            this.updateDisplay();
            this.selectTab(this.activeTab,true);
            break;
         case "unequipButton":
            this.website.garage2Equipped = 0;
            if(this.website.garage3Equipped == 1)
            {
               this.website.garage3Equipped = 0;
               this.progressPanel.showGarage3Exclamation();
            }
            this.updateEquipped(false,this.website.purchasedGarage2Equipped == 1,this.website.garage2Style,this.website.garage2Lighting,this.website.garage2Number);
            this.updateDisplay();
            this.selectTab(this.activeTab,false);
            break;
         case "styleButton":
            this.website.garage2Style = parseInt(id);
            this.updateSelectedStyle(this.website.garage2Style);
            this.updateDisplay();
            break;
         case "lightingButton":
            this.website.garage2Lighting = parseInt(id);
            this.updateSelectedLighting(this.website.garage2Lighting);
            this.updateDisplay();
            break;
         case "numberButton":
            this.website.garage2Number = parseInt(id);
            this.updateSelectedNumber(this.website.garage2Number);
            this.updateDisplay();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateDisplay()
   {
      this.updateSlideshow();
      if(this.website.garage2Equipped)
      {
         var _loc2_ = this.website.getSelectedOffice();
         var _loc3_ = undefined;
         var _loc4_ = undefined;
         _loc3_ = _loc2_.getGarage2StyleCost(this.website.garage2Style,this.website.purchasedGarage2Style);
         _loc4_ = _loc2_.getGarage2StyleRawSaleCost(this.website.garage2Style);
         this.updateTab(this.view.styleTabPrices,_loc3_,_loc4_);
         _loc3_ = _loc2_.getGarage2LightingCost(this.website.garage2Lighting,this.website.purchasedGarage2Lighting);
         _loc4_ = _loc2_.getGarage2LightingRawSaleCost(this.website.garage2Lighting);
         this.updateTab(this.view.lightingTabPrices,_loc3_,_loc4_);
         _loc3_ = _loc2_.getGarage2NumberCost(this.website.garage2Number,this.website.purchasedGarage2Number);
         _loc4_ = _loc2_.getGarage2NumberRawSaleCost(this.website.garage2Number);
         this.updateTab(this.view.numberTabPrices,_loc3_,_loc4_);
      }
      else
      {
         this.updateTab(this.view.styleTabPrices,-1,-1);
         this.updateTab(this.view.lightingTabPrices,-1,-1);
         this.updateTab(this.view.numberTabPrices,-1,-1);
      }
   }
   function updateSlideshow()
   {
      switch(this.activeTab)
      {
         case this.view.styleTab:
            this.slideshow.show("DYN_GARAGE",["INTERIOR_" + this.website.garage2Style]);
            break;
         case this.view.lightingTab:
            this.slideshow.show("DYN_GARAGE",["LIGHTING_" + this.website.garage2Lighting]);
            break;
         case this.view.numberTab:
            this.slideshow.show("DYN_GARAGE",["SIGNAGE_2_" + this.website.garage2Number]);
      }
   }
}
