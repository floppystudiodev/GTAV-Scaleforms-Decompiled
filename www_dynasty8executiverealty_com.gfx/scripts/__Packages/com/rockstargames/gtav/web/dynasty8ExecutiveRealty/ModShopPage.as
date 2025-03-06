class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.ModShopPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var slideshow;
   var view;
   var progressPanel;
   var summaryPageName;
   function ModShopPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"modShopPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
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
      if(this.website.garage3Equipped == -1)
      {
         this.website.garage3Equipped = 0;
      }
      if(this.website.garage3Style == -1)
      {
         this.website.garage3Style = 0;
      }
      if(this.website.garage3Lighting == -1)
      {
         this.website.garage3Lighting = 0;
      }
      if(this.website.garage3Number == -1)
      {
         this.website.garage3Number = 0;
      }
      if(this.website.modShopEquipped == -1)
      {
         this.website.modShopEquipped = 0;
      }
      if(this.website.modShop == -1)
      {
         this.website.modShop = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GARAGE_3_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUMMARY_PAGE.name;
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      this.initModShopButtons();
      this.updateSelectedItem();
      var _loc6_ = this.website.purchasedModShopEquipped == 1;
      var _loc3_ = this.view.unequipButton.buyLevelLabel;
      var _loc5_ = this.view.unequipButton.left;
      var _loc2_ = this.view.unequipButton.centre;
      var _loc4_ = this.view.unequipButton.right;
      _loc3_.autoSize = "left";
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(_loc3_,"DYN8_EXEC_UNEQUIP_MODSHOP");
      if(_loc6_)
      {
         _loc5_.gotoAndStop("grey");
         _loc2_.gotoAndStop("grey");
         _loc4_.gotoAndStop("grey");
      }
      _loc2_._width = _loc3_.textWidth + 2;
      _loc3_._x = _loc2_._x = _loc4_._x - _loc4_._width - _loc2_._width + 1;
      _loc5_._x = _loc2_._x - _loc5_._width + 1;
      this.progressPanel.show();
      this.progressPanel.initGarageProgress(4);
      this.initEquipButtons();
      this.view.equipButton._y = this.view.bodyText._y;
      this.view.modShopButtons._y = this.view.unequipButton._y + this.view.unequipButton._height + 20;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.title,"DYN8_EXEC_MOD_SHOP",false);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initModShopButtons()
   {
      var _loc3_ = 0;
      while(_loc3_ < 20)
      {
         var _loc2_ = this.view.modShopButtons["modShopButton_" + _loc3_];
         _loc2_.onColour = 16777215;
         _loc2_.offColour = 16777215;
         _loc2_.swatch.gotoAndStop(_loc3_ + 1);
         _loc2_.selected._visible = false;
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc3_ = _loc3_ + 1;
      }
   }
   function initEquipButtons()
   {
      this.view.equipButton.onColour = 16777215;
      this.view.equipButton.offColour = 16777215;
      if(this.website.purchasedModShopEquipped == 1)
      {
         this.view.equipButton._visible = false;
         this.view.unequipButton._visible = false;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.equipButton.btnTxt,"DYN8_EXEC_ADD_MODSHOP",false);
         this.website.dataTextScope.push(this.view.equipButton.btnTxt);
         this.website.dataTextScope.push(this.view.unequipButton.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "equipButton":
            this.website.modShopEquipped = 1;
            this.updateSelectedItem();
            break;
         case "unequipButton":
            this.website.modShopEquipped = 0;
            this.updateSelectedItem();
            break;
         case "modShopButton":
            if(this.website.modShopEquipped)
            {
               this.website.modShop = parseInt(id);
            }
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      var _loc4_ = this.website.modShopEquipped == 1;
      this.view.modShopButtons._visible = _loc4_;
      this.view.equipButton._visible = !_loc4_;
      this.view.equipButton.disabled = _loc4_;
      this.view.unequipButton._visible = _loc4_ && this.website.purchasedModShopEquipped != 1;
      this.view.unequipButton.disabled = !_loc4_ || this.website.purchasedModShopEquipped == 1;
      this.view.bodyText._visible = !_loc4_;
      this.progressPanel.updateGarageCosts();
      var _loc3_ = 0;
      while(_loc3_ < 20)
      {
         var _loc2_ = this.view.modShopButtons["modShopButton_" + _loc3_];
         if(this.website.modShopEquipped)
         {
            _loc2_.disabled = false;
            _loc2_.selected._visible = _loc3_ == this.website.modShop;
         }
         else
         {
            _loc2_.disabled = true;
            _loc2_.selected._visible = false;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.slideshow.show("DYN_GARAGE",["MODSHOP_" + this.website.modShop]);
   }
   function handleLB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.prevPageName);
   }
   function handleRB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
   }
   function dispose()
   {
      this.slideshow.dispose();
      super.dispose();
   }
}
