class com.rockstargames.gtav.web.arena.pages.SummaryPage extends com.rockstargames.gtav.web.arena.Page
{
   var website;
   var prevPageName;
   var progressPanel;
   var view;
   function SummaryPage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"summaryPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      if(this.website.purchasedPersonalQuarters != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.PERSONAL_QUARTERS_PAGE.name;
      }
      else if(this.website.purchasedMechanicA != 1 || this.website.purchasedMechanicB != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.MECHANIC_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.EXPANSION_FLOOR_B2_PAGE.name;
      }
      if(this.website.styleOption == -1)
      {
         this.website.styleOption = 0;
      }
      if(this.website.graphicsOption == -1)
      {
         this.website.graphicsOption = 0;
      }
      if(this.website.colourOption == -1)
      {
         this.website.colourOption = 0;
      }
      if(this.website.expansionFloorB1Option == -1)
      {
         this.website.expansionFloorB1Option = 0;
      }
      if(this.website.expansionFloorB2Option == -1)
      {
         this.website.expansionFloorB2Option = 0;
      }
      if(this.website.mechanicA == -1)
      {
         this.website.mechanicA = 0;
      }
      if(this.website.mechanicB == -1)
      {
         this.website.mechanicB = 0;
      }
      if(this.website.personalQuarters == -1)
      {
         this.website.personalQuarters = 0;
      }
      this.progressPanel.show(false);
      this.progressPanel.setProgress(8);
      this.initTitle();
      this.initSummaryText();
      this.initBuyNowButton();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(com.rockstargames.gtav.web.arena.Page.BASE_PAGE_HEIGHT);
   }
   function initTitle()
   {
      this.view.title.autoSize = "left";
      this.view.title.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.title,"MBA_SUMMARY").toUpperCase();
      this.view.titleGradient._width = this.view.title._width;
      this.view.titleGradientMask.autoSize = "left";
      this.view.titleGradientMask.text = this.view.title.text;
   }
   function initSummaryText()
   {
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.styleOptionLabel,"MBA_STYLE");
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.graphicsOptionLabel,"MBA_GRAPHICS");
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.colourOptionLabel,"MBA_COLOUR");
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.expansionFloorB1Label,"MBA_FLOOR_B1");
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.expansionFloorB2Label,"MBA_FLOOR_B2");
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.mechanicLabel,"MBA_MECHANIC");
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.personalQuartersLabel,"MBA_QUARTERS");
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.styleOption,"MBA_STYLE_" + (this.website.styleOption + 1));
      this.view.graphicsSwatch.swatch.gotoAndStop(this.website.graphicsOption + 1);
      this.view.colourSwatch.swatch.gotoAndStop(this.website.colourOption + 1);
      if(this.website.expansionFloorB1Option == 0)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.expansionFloorB1,"MBA_NO");
         this.view.expansionFloorB1Swatch._visible = false;
      }
      else
      {
         this.view.expansionFloorB1.text = "";
         this.view.expansionFloorB1Swatch.swatch.gotoAndStop(this.website.expansionFloorB1Option);
      }
      if(this.website.expansionFloorB2Option == 0)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.expansionFloorB2,"MBA_NO");
         this.view.expansionFloorB2Swatch._visible = false;
      }
      else
      {
         this.view.expansionFloorB2.text = "";
         this.view.expansionFloorB2Swatch.swatch.gotoAndStop(this.website.expansionFloorB2Option);
      }
      this.view.mechanic1.gotoAndStop(2);
      this.view.mechanic1._alpha = this.website.mechanicA != 1 ? 40 : 100;
      this.view.mechanic2.gotoAndStop(3);
      this.view.mechanic2._alpha = this.website.mechanicB != 1 ? 40 : 100;
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.personalQuarters,this.website.personalQuarters != 1 ? "MBA_NO" : "MBA_YES");
   }
   function initBuyNowButton()
   {
      var _loc3_ = this.progressPanel.getTotal();
      var _loc2_ = this.progressPanel.getSaleTotal();
      var _loc4_ = _loc2_ >= 0 && _loc2_ < _loc3_;
      this.updateLeftAlignedCost(this.view.buyNowButton.btnTxt,this.view.buyNowButton.strikethrough,_loc4_,_loc3_,_loc2_);
      this.view.buyNowButton.buyNow.autoSize = "left";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.buyNowButton.buyNow,"MBA_PURCHASE");
      this.view.buyNowButton.buyNow._x = this.view.buyNowButton._width - this.view.buyNowButton.buyNow._width - 25;
      this.view.buyNowButton.buyNowBackground._x = this.view.buyNowButton.buyNow._x - 25;
      this.view.buyNowButton.buyNowBackground._width = this.view.buyNowButton._width - this.view.buyNowButton.buyNowBackground._x;
      this.view.buyNowButton.onColour = 16777215;
      this.view.buyNowButton.offColour = 13421772;
      this.website.dataTextScope.push(this.view.buyNowButton.btnTxt);
      if(this.website.propertyIsOwned && this.website.styleOption == this.website.purchasedStyleOption && this.website.graphicsOption == this.website.purchasedGraphicsOption && this.website.colourOption == this.website.purchasedColourOption && this.website.expansionFloorB1Option == this.website.purchasedExpansionFloorB1Option && this.website.expansionFloorB2Option == this.website.purchasedExpansionFloorB2Option && this.website.mechanicA == this.website.purchasedMechanicA && this.website.mechanicB == this.website.purchasedMechanicB && this.website.personalQuarters == this.website.purchasedPersonalQuarters)
      {
         this.view.buyNowButton.disabled = true;
         this.view.buyNowButton._alpha = 50;
      }
   }
   function handleClick(type, id)
   {
      if(type == "buyNowButton")
      {
         this.website.dispatchPropertySelections();
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.PROPERTY_PURCHASE_PROCESSING_PAGE.name);
      }
   }
   function handleLB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.prevPageName);
   }
   function updateLeftAlignedCost(tf, strikethrough, isOnSale, originalCost, saleCost)
   {
      tf.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(tf,"MBA_TOTAL") + " ";
      var _loc2_ = tf.textWidth;
      strikethrough._x = tf._x + _loc2_;
      tf.text += "$" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(originalCost) + " ";
      if(isOnSale)
      {
         strikethrough._width = tf.textWidth - _loc2_;
         tf.text += " $" + com.rockstargames.gtav.web.WWW_ARENAWAR_TV.formatNumber(saleCost);
      }
      else
      {
         strikethrough._visible = false;
      }
   }
}
