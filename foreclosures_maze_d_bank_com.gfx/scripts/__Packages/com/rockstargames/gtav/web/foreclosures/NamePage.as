class com.rockstargames.gtav.web.foreclosures.NamePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var view;
   var progressPanel;
   var summaryPageName;
   static var TXD = "FORECLOSURES_SIGNAGE";
   static var FONT_LABELS = ["FC_FONT_1","FC_FONT_2","FC_FONT_3","FC_FONT_4","FC_FONT_5","FC_FONT_6","FC_FONT_7","FC_FONT_8","FC_FONT_9","FC_FONT_10","FC_FONT_11","FC_FONT_12","FC_FONT_13"];
   static var SIGNAGE_INSTRUCTIONS = "FORECLOSURES_SIGNAGE_INSTRUCTIONS";
   function NamePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"namePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.mural == -1)
      {
         this.website.mural = 0;
      }
      if(this.website.wall == -1)
      {
         this.website.wall = 0;
      }
      if(this.website.hanging == -1)
      {
         this.website.hanging = 0;
      }
      if(this.website.furniture == -1)
      {
         this.website.furniture = 0;
      }
      if(this.website.font == -1)
      {
         this.website.font = 0;
      }
      if(this.website.fontColour == -1)
      {
         this.website.fontColour = 0;
      }
      if(this.website.hideSignage == -1)
      {
         this.website.hideSignage = 0;
      }
      var _loc2_ = this.website.getSelectedClubhouse();
      if(this.website.emblem == -1)
      {
         this.website.emblem = !(this.website.crewEmblem != "" && _loc2_.getBaseCost() > 0) ? 1 : 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.EMBLEM_PAGE.name;
      if(!_loc2_.isOwned || this.website.purchasedGunLocker != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.GUN_LOCKER_PAGE.name;
      }
      else if(this.website.purchasedBikeShop != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BIKE_SHOP_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUMMARY_PAGE.name;
      }
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.NamePage.TXD,"SIGNAGE_BG_" + this.website.getSelectedClubhouseType() + "_" + this.website.mural,this.view.emblemBackground);
      this.progressPanel.show();
      this.progressPanel.initProgress(4);
      this.initSignageButtons();
      this.initFontSelect();
      this.initColourSelect();
      this.view.description.autoSize = "left";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_NAME_DESCRIPTION",false);
      this.view.signageButton._y = this.view.description._y + this.view.description.textHeight + 20;
      this.view.showSignageButton._y = this.view.signageButton._y;
      this.view.fontSelect._y = this.view.signageButton._y + this.view.signageButton._height + 20;
      this.view.colourButtons._y = this.view.fontSelect._y + this.view.fontSelect._height + 20;
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.pollSignageChange();
   }
   function initSignageButtons()
   {
      this.view.signageButton.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      this.view.signageButton.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      this.updateShowSignage();
      this.view.signageButton._y = this.view.showSignageButton._y = this.view.description._y + this.view.description.textHeight + 20;
      this.website.dataTextScope.push(this.view.signageButton.btnTxt);
      this.website.dataTextScope.push(this.view.showSignageButton.btnTxt);
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
      this.view.emblemImage.label.textAutoSize = "fit";
      this.view.emblemImage.label.verticalAlign = "center";
      this.updateFont();
   }
   function initColourSelect()
   {
      this.view.colourButtons._y = this.view.fontSelect._y + this.view.fontSelect._height + 10;
      var _loc2_ = 0;
      while(_loc2_ < 8)
      {
         var _loc4_ = this.view.colourButtons["colourButton_" + _loc2_];
         var _loc3_ = parseInt("0x" + com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.COLOURS[_loc2_]);
         _loc4_.swatch.transform.colorTransform = new flash.geom.ColorTransform(0,0,0,1,_loc3_ >> 16 & 0xFF,_loc3_ >> 8 & 0xFF,_loc3_ & 0xFF,0);
         _loc4_.selected._visible = _loc2_ == this.website.fontColour;
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
            if(this.website.hideSignage != 1)
            {
               this.website.font = (this.website.font - 1 + com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.FONTS.length) % com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.FONTS.length;
               this.updateFont();
               this.progressPanel.updateCosts();
            }
            break;
         case "nextFontButton":
            if(this.website.hideSignage != 1)
            {
               this.website.font = (this.website.font + 1) % com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.FONTS.length;
               this.updateFont();
               this.progressPanel.updateCosts();
            }
            break;
         case "colourButton":
            if(this.website.hideSignage != 1)
            {
               this.website.fontColour = parseInt(id);
               this.updateColourSelect();
               this.updateFont();
               this.progressPanel.updateCosts();
            }
            break;
         case "showSignageButton":
            this.website.hideSignage ^= 1;
            this.updateShowSignage();
      }
   }
   function updateShowSignage()
   {
      this.view.showSignageButton.tick._visible = this.website.hideSignage != 1;
      this.view.showSignageButton.cross._visible = this.website.hideSignage == 1;
      this.view.emblemImage.label._visible = this.website.hideSignage != 1;
      this.view.signageButton._alpha = this.website.hideSignage != 1 ? 100 : 30;
      this.view.fontSelect._alpha = this.website.hideSignage != 1 ? 100 : 30;
      this.view.colourButtons._alpha = this.website.hideSignage != 1 ? 100 : 30;
   }
   function updateColourSelect()
   {
      var _loc2_ = 0;
      while(_loc2_ < 8)
      {
         var _loc3_ = this.view.colourButtons["colourButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.fontColour;
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateFont()
   {
      var _loc3_ = !this.website.fontsSupported ? "$Font2" : com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.FONTS[this.website.font];
      var _loc4_ = "#" + com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.COLOURS[this.website.fontColour];
      var _loc2_ = this.website.signage;
      if(_loc2_ == "")
      {
         _loc2_ = this.website.purchasedSignage;
      }
      this.view.emblemImage.label.htmlText = "<font face=\'" + _loc3_ + "\' color=\'" + _loc4_ + "\'>" + _loc2_ + "</font>";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.fontSelect.label,com.rockstargames.gtav.web.foreclosures.NamePage.FONT_LABELS[this.website.font]);
   }
   function pollSignageChange()
   {
      if(this.website.signage == "" && this.website.purchasedSignage == "")
      {
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(this.view.signageButton.btnTxt,com.rockstargames.gtav.web.foreclosures.NamePage.SIGNAGE_INSTRUCTIONS);
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
      super.dispose();
   }
}
