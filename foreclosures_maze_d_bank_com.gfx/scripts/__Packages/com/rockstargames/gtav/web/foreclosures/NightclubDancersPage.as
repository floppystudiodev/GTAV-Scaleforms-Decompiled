class com.rockstargames.gtav.web.foreclosures.NightclubDancersPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var dancerStyle;
   var dancerGender;
   var progressPanel;
   var view;
   var slideshow;
   var buttonOnColorTransform;
   var buttonOffColorTransform;
   static var TXD = "FORECLOSURES_CLUB";
   function NightclubDancersPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"nightclubDancersPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.nightclubStyle == -1)
      {
         this.website.nightclubStyle = 0;
      }
      if(this.website.nightclubLighting == -1)
      {
         this.website.nightclubLighting = 0;
      }
      if(this.website.nightclubName == -1)
      {
         this.website.nightclubName = 0;
      }
      if(this.website.nightclubStorage == -1)
      {
         this.website.nightclubStorage = 0;
      }
      if(this.website.nightclubGarage == -1)
      {
         this.website.nightclubGarage = 0;
      }
      if(this.website.nightclubDancers == -1)
      {
         this.website.nightclubDancers = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_STORAGE_PAGE.name;
      var _loc2_ = this.website.getSelectedNightclub();
      if(this.website.purchasedNightclubDryIce != 1 || !_loc2_.isOwned)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_DRY_ICE_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_SUMMARY_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_SUMMARY_PAGE.name;
      if(this.website.nightclubDancers == 0)
      {
         this.dancerStyle = 0;
         this.dancerGender = 0;
      }
      else
      {
         this.dancerStyle = int((this.website.nightclubDancers - 1) / 3);
         this.dancerGender = (this.website.nightclubDancers - 1) % 3;
      }
      this.progressPanel.show();
      this.progressPanel.initNightclubProgress(5);
      this.initSlideshow();
      this.initDancersButton(this.view.dancersButton);
      this.initOptionButtons();
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initDancersButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(buttonView.btnTxt,"FCCLUB_DNC",false);
      if(!this.website.getSelectedNightclub().isOwned || this.website.purchasedNightclubDancers == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function initOptionButtons()
   {
      var _loc2_ = 1;
      while(_loc2_ <= 3)
      {
         var _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(_loc3_.swatch.label,"FCCLUB_DNC_STY_" + _loc2_);
         _loc3_.swatch.label.textAutoSize = "shrink";
         _loc3_.swatch.label.shadowDistance = 1;
         _loc3_.swatch.label.shadowColor = 0;
         _loc3_.swatch.label.shadowAlpha = 0.5;
         _loc3_.swatch.label.shadowStrength = 4;
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = ["FCCLUB_DNC_FF","FCCLUB_DNC_MM","FCCLUB_DNC_FM"];
      _loc2_ = 4;
      while(_loc2_ <= 6)
      {
         _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.btnTxt.textAutoSize = "shrink";
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(_loc3_.label,_loc4_[_loc2_ - 4]);
         _loc3_.gender.gotoAndStop(_loc2_ - 3);
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      this.buttonOnColorTransform = new flash.geom.ColorTransform();
      this.buttonOnColorTransform.rgb = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      this.buttonOffColorTransform = new flash.geom.ColorTransform();
      this.view.optionButtons._y = this.view.dancersButton._y + this.view.dancersButton._height + 10;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "dancersButton":
            this.website.nightclubDancers = this.website.nightclubDancers != 0 ? 0 : 1;
            this.dancerStyle = 0;
            this.dancerGender = 0;
            this.updateSelectedItem();
            break;
         case "optionButton":
            var _loc2_ = parseInt(id);
            if(_loc2_ <= 3)
            {
               this.dancerStyle = _loc2_ - 1;
            }
            else
            {
               this.dancerGender = _loc2_ - 4;
            }
            this.website.nightclubDancers = this.dancerStyle * 3 + this.dancerGender + 1;
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      this.view.dancersButton.tick._visible = this.website.nightclubDancers != 0;
      var _loc2_ = 1;
      while(_loc2_ <= 6)
      {
         var _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         if(_loc2_ <= 3)
         {
            _loc3_.selected._visible = _loc2_ == this.dancerStyle + 1;
         }
         else
         {
            var _loc4_ = _loc3_.label.getTextFormat();
            _loc4_.color = _loc2_ != this.dancerGender + 4 ? 0 : com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
            _loc3_.label.setTextFormat(_loc4_);
            _loc3_.gender.transform.colorTransform = _loc2_ != this.dancerGender + 4 ? this.buttonOffColorTransform : this.buttonOnColorTransform;
            _loc3_.selected._visible = _loc2_ == this.dancerGender + 4;
         }
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCCLUB_DNC_DESC_" + this.website.nightclubDancers,false);
      var _loc5_ = Math.max(1,this.website.nightclubDancers);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.NightclubDancersPage.TXD],["dancers" + _loc5_]);
      this.setDisabledButtons();
      this.progressPanel.updateNightclubCosts();
   }
   function setDisabledButtons()
   {
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      if(this.website.nightclubDancers == 0)
      {
         _loc5_ = 0;
         _loc4_ = true;
      }
      else
      {
         _loc5_ = 100;
         _loc4_ = false;
      }
      var _loc2_ = 1;
      while(_loc2_ <= 6)
      {
         var _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_._alpha = _loc5_;
         _loc3_.disabled = _loc4_;
         _loc2_ = _loc2_ + 1;
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
