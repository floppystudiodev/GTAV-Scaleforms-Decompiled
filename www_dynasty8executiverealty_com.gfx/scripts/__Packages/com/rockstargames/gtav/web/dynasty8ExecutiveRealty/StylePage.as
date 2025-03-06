class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.StylePage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var view;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   static var TXD = "DYN8_EXEC_DEFAULT";
   static var IMAGES = [["DECOR_EXEC_RICH_1","DECOR_EXEC_RICH_2","DECOR_EXEC_RICH_n"],["DECOR_EXEC_COOL_1","DECOR_EXEC_COOL_2","DECOR_EXEC_COOL_n"],["DECOR_EXEC_CONTRAST_1","DECOR_EXEC_CONTRAST_2","DECOR_EXEC_CONTRAST_n"],["DECOR_OLDSPICE_WARM_1","DECOR_OLDSPICE_WARM_2","DECOR_OLDSPICE_WARM_n"],["DECOR_OLDSPICE_CLASSICAL_1","DECOR_OLDSPICE_CLASSICAL_2","DECOR_OLDSPICE_CLASSICAL_n"],["DECOR_OLDSPICE_VINTAGE_1","DECOR_OLDSPICE_VINTAGE_2","DECOR_OLDSPICE_VINTAGE_n"],["DECOR_POWER_ICE_1","DECOR_POWER_ICE_2","DECOR_POWER_ICE_n"],["DECOR_POWER_CONSERVATIVE_1","DECOR_POWER_CONSERVATIVE_2","DECOR_POWER_CONSERVATIVE_n"],["DECOR_POWER_POLISHED_1","DECOR_POWER_POLISHED_2","DECOR_POWER_POLISHED_n"]];
   function StylePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"stylePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.style == -1)
      {
         this.website.style = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.MAP_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PERSONNEL_PAGE.name;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,"DYN8_EXEC_STYLE_DESCRIPTION",false);
      this.progressPanel.show();
      this.progressPanel.initProgress(1);
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      this.initStyleButtons();
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initStyleButtons()
   {
      var _loc3_ = 0;
      while(_loc3_ < 9)
      {
         var _loc2_ = this.view.styleButtons["styleButton_" + _loc3_];
         _loc2_.onColour = 16777215;
         _loc2_.offColour = 16777215;
         _loc2_.swatch.gotoAndStop(_loc3_ + 1);
         _loc2_.selected._visible = false;
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc3_ = _loc3_ + 1;
      }
      this.view.styleButtons._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "styleButton":
            this.website.style = parseInt(id);
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      this.progressPanel.updateCosts();
      var _loc2_ = 0;
      while(_loc2_ < 9)
      {
         var _loc3_ = this.view.styleButtons["styleButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.style;
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = [].concat(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.StylePage.IMAGES[this.website.style]);
      var _loc5_ = this.website.getSelectedOffice();
      _loc4_[2] = _loc4_[2].substring(0,_loc4_[2].lastIndexOf("_") + 1) + _loc5_.id;
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.StylePage.TXD,_loc4_);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.label,"DYN8_EXEC_STYLE_" + this.website.style);
      if(this.website.styleWhenLastOnSignagePage != -1 && this.website.styleWhenLastOnSignagePage != this.website.style)
      {
         this.progressPanel.showSignageExclamation();
      }
      else
      {
         this.progressPanel.hideSignageExclamation();
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
