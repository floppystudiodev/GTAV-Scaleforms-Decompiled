class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.GaragePage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var activeTab;
   var buttonsY;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var view;
   var website;
   function GaragePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"garagePage",pageName,isFirstPage,progressPanel,header);
   }
   function init(numberSwatchOffset, garageIsOwned, isLevel1, unequipLabel)
   {
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      this.buttonsY = this.view.styleButtons._y;
      this.initButtonSet(this.view.styleButtons,"styleButton_",4,0);
      this.initButtonSet(this.view.lightingButtons,"lightingButton_",9,0);
      this.initButtonSet(this.view.numberButtons,"numberButton_",9,numberSwatchOffset);
      this.initTabs();
      var _loc4_ = this.view.unequipButton.buyLevelLabel;
      var _loc6_ = this.view.unequipButton.left;
      var _loc3_ = this.view.unequipButton.centre;
      var _loc5_ = this.view.unequipButton.right;
      _loc4_.autoSize = "left";
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(_loc4_,unequipLabel);
      if(garageIsOwned)
      {
         _loc6_.gotoAndStop("grey");
         _loc3_.gotoAndStop("grey");
         _loc5_.gotoAndStop("grey");
      }
      _loc3_._width = _loc4_.textWidth + 2;
      _loc4_._x = _loc3_._x = _loc5_._x - _loc5_._width - _loc3_._width + 1;
      _loc6_._x = _loc3_._x - _loc6_._width + 1;
      var _loc2_;
      if(this.view.description.text != "")
      {
         this.view.unequipButton._y = this.view.description._y + this.view.description.textHeight + 10;
      }
      _loc2_ = this.view.unequipButton._y;
      if(this.view.unequipButton._visible || garageIsOwned && !isLevel1)
      {
         _loc2_ += this.view.unequipButton._height;
      }
      this.view.styleTab._y = this.view.lightingTab._y = this.view.numberTab._y = _loc2_;
      _loc2_ += this.view.styleTab._height + 2;
      this.view.styleTabPrices._y = this.view.lightingTabPrices._y = this.view.numberTabPrices._y = _loc2_;
      _loc2_ += this.view.styleTabPrices._height + 10;
      this.view.styleButtons._y = this.view.lightingButtons._y = this.view.numberButtons._y = _loc2_;
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initButtonSet(container, name, count, offset)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < count)
      {
         _loc3_ = container[name + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 1 + offset);
         _loc3_.selected._visible = false;
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
   }
   function initTabs()
   {
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.styleTab.btnTxt,"DYN8_EXEC_GARAGE_STYLE");
      this.website.dataTextScope.push(this.view.styleTab.btnTxt);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.lightingTab.btnTxt,"DYN8_EXEC_LIGHTING");
      this.website.dataTextScope.push(this.view.lightingTab.btnTxt);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.numberTab.btnTxt,"DYN8_EXEC_NUMBERS");
      this.website.dataTextScope.push(this.view.numberTab.btnTxt);
   }
   function selectTab(tab, isEquipped)
   {
      var _loc2_;
      _loc2_ = tab == this.view.styleTab;
      this.view.styleTab.selected._visible = _loc2_;
      this.view.styleButtons._visible = _loc2_ && isEquipped;
      this.view.styleButtons._y = !(_loc2_ && isEquipped) ? - this.view.styleButtons._height - 100 : this.buttonsY;
      var _loc3_ = 0;
      while(_loc3_ < 4)
      {
         this.view.styleButtons["styleButton_" + _loc3_].disabled = !_loc2_ || !isEquipped;
         _loc3_ = _loc3_ + 1;
      }
      _loc2_ = tab == this.view.lightingTab;
      this.view.lightingTab.selected._visible = _loc2_;
      this.view.lightingButtons._visible = _loc2_ && isEquipped;
      this.view.lightingButtons._y = !(_loc2_ && isEquipped) ? - this.view.lightingButtons._height - 100 : this.buttonsY;
      _loc3_ = 0;
      while(_loc3_ < 9)
      {
         this.view.lightingButtons["lightingButton_" + _loc3_].disabled = !_loc2_ || !isEquipped;
         _loc3_ = _loc3_ + 1;
      }
      _loc2_ = tab == this.view.numberTab;
      this.view.numberTab.selected._visible = _loc2_;
      this.view.numberButtons._visible = _loc2_ && isEquipped;
      this.view.numberButtons._y = !(_loc2_ && isEquipped) ? - this.view.numberButtons._height - 100 : this.buttonsY;
      _loc3_ = 0;
      while(_loc3_ < 9)
      {
         this.view.numberButtons["numberButton_" + _loc3_].disabled = !_loc2_ || !isEquipped;
         _loc3_ = _loc3_ + 1;
      }
      this.activeTab = tab;
   }
   function updateEquipped(isEquipped, isAlreadyPurchased, styleIndex, lightingIndex, numberIndex)
   {
      this.progressPanel.updateGarageCosts();
      this.view.styleTab._visible = isEquipped;
      this.view.styleTab.disabled = !isEquipped;
      this.view.lightingTab._visible = isEquipped;
      this.view.lightingTab.disabled = !isEquipped;
      this.view.numberTab._visible = isEquipped;
      this.view.numberTab.disabled = !isEquipped;
      this.view.equipButton._visible = !isEquipped;
      this.view.equipButton.disabled = isEquipped;
      this.view.unequipButton._visible = isEquipped && !isAlreadyPurchased;
      this.view.unequipButton.disabled = !isEquipped || isAlreadyPurchased;
      this.view.bodyText._visible = !isEquipped;
      var _loc2_;
      if(isEquipped || isAlreadyPurchased)
      {
         _loc2_ = 0;
         while(_loc2_ < 4)
         {
            this.view.styleButtons["styleButton_" + _loc2_].disabled = false;
            this.view.styleButtons["styleButton_" + _loc2_].selected._visible = _loc2_ == styleIndex;
            this.view.styleButtons._y = this.buttonsY;
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < 9)
         {
            this.view.lightingButtons["lightingButton_" + _loc2_].disabled = false;
            this.view.lightingButtons["lightingButton_" + _loc2_].selected._visible = _loc2_ == lightingIndex;
            this.view.lightingButtons._y = this.buttonsY;
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < 9)
         {
            this.view.numberButtons["numberButton_" + _loc2_].disabled = false;
            this.view.numberButtons["numberButton_" + _loc2_].selected._visible = _loc2_ == numberIndex;
            this.view.numberButtons._y = this.buttonsY;
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         _loc2_ = 0;
         while(_loc2_ < 4)
         {
            this.view.styleButtons["styleButton_" + _loc2_].disabled = true;
            this.view.styleButtons["styleButton_" + _loc2_].selected._visible = false;
            this.view.styleButtons._y = - this.view.styleButtons._height - 100;
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < 9)
         {
            this.view.lightingButtons["lightingButton_" + _loc2_].disabled = true;
            this.view.lightingButtons["lightingButton_" + _loc2_].selected._visible = false;
            this.view.lightingButtons._y = - this.view.lightingButtons._height - 100;
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < 9)
         {
            this.view.numberButtons["numberButton_" + _loc2_].disabled = true;
            this.view.numberButtons["numberButton_" + _loc2_].selected._visible = false;
            this.view.numberButtons._y = - this.view.numberButtons._height - 100;
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function updateSelectedStyle(selectedIndex)
   {
      this.progressPanel.updateGarageCosts();
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 4)
      {
         _loc3_ = this.view.styleButtons["styleButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == selectedIndex;
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateSelectedLighting(selectedIndex)
   {
      this.progressPanel.updateGarageCosts();
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 9)
      {
         _loc3_ = this.view.lightingButtons["lightingButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == selectedIndex;
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateSelectedNumber(selectedIndex)
   {
      this.progressPanel.updateGarageCosts();
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 9)
      {
         _loc3_ = this.view.numberButtons["numberButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == selectedIndex;
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateTab(tabView, originalPrice, salePrice)
   {
      if(salePrice >= 0 && originalPrice > 0)
      {
         tabView.price.text = "";
         tabView.originalPrice.text = "$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(originalPrice);
         if(salePrice == 0)
         {
            com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(tabView.salePrice,"DYN8_EXEC_FREE",false);
         }
         else
         {
            tabView.salePrice.text = "$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(salePrice);
         }
         tabView.salePrice._x = tabView.originalPrice.textWidth + 10;
         tabView.strikethrough._x = tabView.originalPrice._x;
         tabView.strikethrough._width = tabView.originalPrice.textWidth + 4;
         tabView.strikethrough._visible = true;
      }
      else
      {
         tabView.price.text = originalPrice > 0 ? "$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(originalPrice) : "";
         tabView.salePrice.text = "";
         tabView.originalPrice.text = "";
         tabView.strikethrough._visible = false;
      }
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
