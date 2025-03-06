class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var slideshow;
   var view;
   var progressPanel;
   var summaryPageName;
   static var TXD = "DYN8_EXEC_DEFAULT";
   static var IMAGES = ["SIGNAGE_EXEC_RICH","SIGNAGE_EXEC_COOL","SIGNAGE_EXEC_CONTRAST","SIGNAGE_OLDSPICE_WARM","SIGNAGE_OLDSPICE_CLASSICAL","SIGNAGE_OLDSPICE_VINTAGE","SIGNAGE_POWER_ICE","SIGNAGE_POWER_CONSERVATIVE","SIGNAGE_POWER_POLISHED"];
   static var FONT_LABELS = ["DYN8_FONT_1","DYN8_FONT_2","DYN8_FONT_3","DYN8_FONT_4","DYN8_FONT_5","DYN8_FONT_6","DYN8_FONT_7","DYN8_FONT_8","DYN8_FONT_9","DYN8_FONT_10","DYN8_FONT_11","DYN8_FONT_12","DYN8_FONT_13"];
   static var FONTS = ["$Machine","$Stencil","$Lubalin","$Bookman","$Stenberg","$Mistral","$HelveticaBLK","$HelveticaBLKI","$Times","$TradeGothic","$AnnaSC","$EngraversOldEnglish","$Bauhaus"];
   static var SIGNAGE_INSTRUCTIONS = "DYN8_EXEC_SIGNAGE_INSTRUCTIONS";
   function SignagePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"signagePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.style == -1)
      {
         this.website.style = 0;
      }
      if(this.website.personnel == -1)
      {
         this.website.personnel = 0;
      }
      if(this.website.font == -1)
      {
         this.website.font = 0;
      }
      if(this.website.colour == -1)
      {
         this.website.colour = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.PERSONNEL_PAGE.name;
      var _loc2_ = this.website.getSelectedOffice();
      if(!_loc2_.isOwned || this.website.purchasedGunLocker != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GUN_LOCKER_PAGE.name;
      }
      else if(this.website.purchasedVault != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.VAULT_PAGE.name;
      }
      else if(this.website.purchasedBed != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.BED_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUMMARY_PAGE.name;
      }
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage.TXD,[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage.IMAGES[this.website.style]]);
      this.progressPanel.show();
      this.progressPanel.initProgress(3);
      this.progressPanel.hideSignageExclamation();
      this.initSignageButton();
      this.initFontSelect();
      this.initColourSelect();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.pollSignageChange();
      this.website.styleWhenLastOnSignagePage = this.website.style;
   }
   function onDisplayImage(buttonView, index)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.imageReveal,0.25,{_alpha:0});
   }
   function initSignageButton()
   {
      this.view.signageButton.onColour = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.DROP_DOWN_GREEN;
      this.view.signageButton.offColour = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.DROP_DOWN_GREEN;
      this.website.dataTextScope.push(this.view.signageButton.btnTxt);
      this.view.signageButton._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function initFontSelect()
   {
      if(this.website.fontsSupported)
      {
         this.website.dataTextScope.push(this.view.fontSelect.prevFontButton.btnTxt);
         this.website.dataTextScope.push(this.view.fontSelect.nextFontButton.btnTxt);
         this.view.fontSelect._y = this.view.signageButton._y + this.view.signageButton._height + 10;
      }
      else
      {
         this.view.fontSelect._y = this.view.signageButton._y;
         this.view.fontSelect._visible = false;
      }
      this.view.slideshow.imageFront.label.textAutoSize = "fit";
      this.view.slideshow.imageFront.label.verticalAlign = "center";
      this.view.slideshow.imageBack.label.textAutoSize = "fit";
      this.view.slideshow.imageBack.label.verticalAlign = "center";
      this.updateFont();
   }
   function initColourSelect()
   {
      this.view.colourButtons._y = this.view.fontSelect._y + this.view.fontSelect._height + 10;
      var _loc2_ = 0;
      while(_loc2_ < 8)
      {
         var _loc4_ = this.view.colourButtons["colourButton_" + _loc2_];
         var _loc3_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.getColour(this.website.style,_loc2_);
         _loc4_.swatch.transform.colorTransform = new flash.geom.ColorTransform(0,0,0,1,_loc3_ >> 16 & 0xFF,_loc3_ >> 8 & 0xFF,_loc3_ & 0xFF,0);
         _loc4_.selected._visible = _loc2_ == this.website.colour;
         this.website.dataTextScope.push(_loc4_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
            break;
         case "prevFontButton":
            this.website.font = (this.website.font - 1 + com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage.FONTS.length) % com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage.FONTS.length;
            this.updateFont();
            this.progressPanel.updateCosts();
            break;
         case "nextFontButton":
            this.website.font = (this.website.font + 1) % com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage.FONTS.length;
            this.updateFont();
            this.progressPanel.updateCosts();
            break;
         case "colourButton":
            this.website.colour = parseInt(id);
            this.updateColourSelect();
            this.updateFont();
            this.progressPanel.updateCosts();
      }
   }
   function updateColourSelect()
   {
      var _loc2_ = 0;
      while(_loc2_ < 8)
      {
         var _loc3_ = this.view.colourButtons["colourButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.colour;
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateFont()
   {
      var _loc3_ = !this.website.fontsSupported ? "$Font2" : com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage.FONTS[this.website.font];
      var _loc4_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.getColourString(this.website.style,this.website.colour);
      var _loc2_ = this.website.signage;
      if(_loc2_ == "")
      {
         _loc2_ = this.website.purchasedSignage;
      }
      this.view.slideshow.imageFront.label.htmlText = "<font face=\'" + _loc3_ + "\' color=\'" + _loc4_ + "\'>" + _loc2_ + "</font>";
      this.view.slideshow.imageBack.label.htmlText = "<font face=\'" + _loc3_ + "\' color=\'" + _loc4_ + "\'>" + _loc2_ + "</font>";
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.fontSelect.label,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage.FONT_LABELS[this.website.font]);
   }
   function pollSignageChange()
   {
      if(this.website.signage == "" && this.website.purchasedSignage == "")
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.signageButton.btnTxt,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SignagePage.SIGNAGE_INSTRUCTIONS);
      }
      else if(this.website.signage != "")
      {
         this.view.signageButton.btnTxt.text = this.website.signage;
      }
      else
      {
         this.view.signageButton.btnTxt.text = this.website.purchasedSignage;
      }
      this.progressPanel.updateCosts();
      this.updateFont();
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.signageButton,0.5,{onCompleteScope:this,onComplete:this.pollSignageChange});
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
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.signageButton);
      this.slideshow.dispose();
      super.dispose();
   }
}
