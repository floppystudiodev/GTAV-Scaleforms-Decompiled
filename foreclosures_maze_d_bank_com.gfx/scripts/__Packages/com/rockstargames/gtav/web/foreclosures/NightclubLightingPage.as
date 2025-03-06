class com.rockstargames.gtav.web.foreclosures.NightclubLightingPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var progressPanel;
   var view;
   var slideshow;
   static var TXD = "FORECLOSURES_CLUB";
   function NightclubLightingPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"nightclubLightingPage",pageName,isFirstPage,progressPanel,header);
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
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_STYLE_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_NAME_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initNightclubProgress(2);
      this.initSlideshow();
      this.initLightingButton(this.view.lightingButton);
      this.initOptionButtons();
      this.initPlayVideoButtons();
      this.updateSelectedItem(false);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initLightingButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(buttonView.btnTxt,"FCCLUB_LGHT",false);
      if(!this.website.getSelectedNightclub().isOwned || this.website.purchasedNightclubLighting == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
      else
      {
         this.website.dataTextScope.push(undefined);
      }
   }
   function initOptionButtons()
   {
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         var _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 1);
         _loc3_.selected._visible = false;
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
   }
   function initPlayVideoButtons()
   {
      var _loc4_ = {_x:this.view.playVideoButton0._x,_y:this.view.playVideoButton0._y};
      var _loc3_ = 0;
      while(_loc3_ < 4)
      {
         var _loc2_ = _loc3_ != 0 ? this.view.playVideoButton0.duplicateMovieClip("playVideoButton" + _loc3_,this.view.getNextHighestDepth(),_loc4_) : this.view.playVideoButton0;
         _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
         _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
         _loc2_.btnTxt.textAutoSize = "shrink";
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCCLUB_VIDEO",false);
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc3_ = _loc3_ + 1;
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "lightingButton":
            this.website.nightclubLighting = this.website.nightclubLighting != 0 ? 0 : 1;
            this.updateSelectedItem();
            break;
         case "optionButton":
            var _loc2_ = parseInt(id) + 1;
            var _loc3_ = _loc2_ != this.website.nightclubLighting;
            this.website.nightclubLighting = _loc2_;
            this.updateSelectedItem(_loc3_);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      this.view.lightingButton.tick._visible = this.website.nightclubLighting != 0;
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         var _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_._visible = this.website.nightclubLighting != 0;
         _loc3_.selected._visible = _loc2_ == this.website.nightclubLighting - 1;
         _loc3_.disabled = this.website.nightclubLighting == 0;
         _loc3_ = this.view["playVideoButton" + _loc2_];
         _loc3_.disabled = _loc2_ != this.website.nightclubLighting - 1;
         _loc3_._visible = _loc2_ == this.website.nightclubLighting - 1;
         _loc2_ = _loc2_ + 1;
      }
      this.view.description._width = this.website.nightclubLighting != 0 ? 248 : 486;
      if(this.website.videoDisabled && this.website.nightclubLighting != 0)
      {
         this.setDisabledButtons();
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.videoDisabled,"FCCLUB_NOVID",false);
      }
      else
      {
         this.view.videoDisabled.text = "";
      }
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.NightclubLightingPage.TXD],["lighting" + (this.website.nightclubLighting + 1)]);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCCLUB_LGHT_DESC_" + (this.website.nightclubLighting + 1),false);
      this.progressPanel.updateNightclubCosts();
   }
   function setDisabledButtons()
   {
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         var _loc3_ = this.view["playVideoButton" + _loc2_];
         _loc3_.disabled = _loc2_ != this.website.nightclubLighting - 1;
         if(this.website.videoDisabled)
         {
            _loc3_.disabled = true;
            _loc3_._visible = false;
         }
         _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.disabled = this.website.nightclubLighting == 0;
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
