class com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionSummaryPage extends com.rockstargames.gtav.web.prixluxuryrealestate.Page
{
   var progressPanel;
   var view;
   var website;
   function MansionSummaryPage(website, viewContainer, pageName)
   {
      super(website,viewContainer,"mansionSummaryPage",pageName);
      this.init();
   }
   function init()
   {
      var _loc3_ = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.titlebarLocaliser,"PLRE_TITLEBAR");
      this.website.browser.SET_TITLEBAR_TEXT(_loc3_,14474460);
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern == -1)
      {
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern = 0;
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor == -1)
      {
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor = 0;
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint == -1)
      {
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint = 0;
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory == -1)
      {
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory = 0;
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade == -1)
      {
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade = 0;
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium == -1)
      {
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium = 0;
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop == -1)
      {
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop = 0;
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio == -1)
      {
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio = 0;
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security == -1)
      {
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security = 0;
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai == -1)
      {
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai = 0;
      }
      this.view.totalLabel.verticalAlign = "center";
      this.view.purchaseButton.btnTxt.verticalAlign = "center";
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.heading,"PLRE_STEP4");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step0Label,"PLRE_STEP0");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step0Option0Label,"PLRE_SUMMARY_STYLE0");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step0Option0,"PLRE_TINT" + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step0Option1Label,"PLRE_SUMMARY_STYLE1");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step0Option1,"PLRE_PATTERN" + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step0Option2Label,"PLRE_SUMMARY_STYLE2");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step0Option2,"PLRE_STYLE" + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step1Label,"PLRE_STEP1");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step1Option0Label,"PLRE_OPTIONS_TAB0");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step1Option1Label,"PLRE_OPTIONS_TAB1");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step1Option2Label,"PLRE_OPTIONS_TAB2");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step1Option3Label,"PLRE_OPTIONS_TAB3");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step1Option4Label,"PLRE_OPTIONS_TAB4");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step2Label,"PLRE_STEP2");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step2OptionLabel,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security != 0 ? "PLRE_SUMMARY_SEC" : "PLRE_SUMMARY_NOSEC");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step3Label,"PLRE_STEP3");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.step3OptionLabel,"PLRE_AI_NAME" + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.totalLabel,"PLRE_SUMMARY_TOTAL");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.fundsLabel,"PLRE_SUMMARY_FUNDS");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.purchaseButton.btnTxt,"PLRE_SUMMARY_CTA");
      this.view.step1Option0Unselected._visible = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory != 1;
      this.view.step1Option0Selected._visible = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory == 1;
      this.view.step1Option1Unselected._visible = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade != 1;
      this.view.step1Option1Selected._visible = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade == 1;
      this.view.step1Option2Unselected._visible = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium != 1;
      this.view.step1Option2Selected._visible = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium == 1;
      this.view.step1Option3Unselected._visible = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop != 1;
      this.view.step1Option3Selected._visible = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop == 1;
      this.view.step1Option4Selected._visible = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio == 1;
      var _loc2_ = this.website.activeMansion;
      if(_loc2_.isOwned && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint == _loc2_.purchasedTint && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern == _loc2_.purchasedPattern && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor == _loc2_.purchasedDecor && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory == _loc2_.purchasedArmory && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade == _loc2_.purchasedArcade && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium == _loc2_.purchasedPodium && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop == _loc2_.purchasedWorkshop && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio == _loc2_.purchasedArtStudio && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security == _loc2_.purchasedSecurity && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai == _loc2_.purchasedAI)
      {
         this.view.purchaseButton.disabled = true;
      }
      this.setCosts();
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.progressPanel = new com.rockstargames.gtav.web.prixluxuryrealestate.ProgressPanel(this.view.progressPanel,this.website,4);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(this.view.background._height);
      this.progressPanel.updateTotalCost(this.website.activeMansion);
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "purchaseButton":
            this.website.dispatchPlayerMansionSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_PURCHASE_PENDING_PAGE.name);
            break;
         case "step0Button":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_STYLE_PAGE.name);
            break;
         case "step1Button":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_OPTIONS_PAGE.name);
            break;
         case "step2Button":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_SECURITY_PAGE.name);
            break;
         case "step3Button":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_ASSISTANT_PAGE.name);
            break;
         case "step4Button":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_SUMMARY_PAGE.name);
         default:
            return;
      }
   }
   function handleLB()
   {
      this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_ASSISTANT_PAGE.name);
   }
   function setCosts()
   {
      var _loc2_ = this.website.activeMansion;
      var _loc46_ = 0;
      var _loc45_ = 0;
      var _loc47_ = false;
      var _loc33_ = 0;
      var _loc38_ = 0;
      var _loc36_ = false;
      var _loc17_ = 0;
      var _loc21_ = 0;
      var _loc24_ = false;
      var _loc18_ = 0;
      var _loc31_ = 0;
      var _loc9_ = false;
      var _loc16_ = 0;
      var _loc10_ = 0;
      var _loc5_ = false;
      var _loc3_ = 0;
      var _loc22_ = 0;
      var _loc6_ = false;
      var _loc11_ = 0;
      var _loc25_ = 0;
      var _loc14_ = false;
      var _loc15_ = 0;
      var _loc26_ = 0;
      var _loc32_ = false;
      var _loc19_ = 0;
      var _loc29_ = 0;
      var _loc23_ = false;
      var _loc13_ = 0;
      var _loc7_ = 0;
      var _loc20_ = false;
      var _loc27_ = 0;
      var _loc28_ = 0;
      var _loc8_ = false;
      var _loc4_ = 0;
      var _loc30_ = 0;
      var _loc12_ = false;
      if(!_loc2_.isOwned)
      {
         _loc33_ = _loc2_.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.BASE_COST_INDEX,0);
         _loc36_ = _loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.BASE_COST_INDEX,0);
         _loc38_ = _loc2_.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.BASE_COST_INDEX,0);
      }
      if(!_loc2_.isOwned || _loc2_.purchasedTint != com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint)
      {
         _loc17_ = _loc2_.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint);
         _loc24_ = _loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint);
         _loc21_ = _loc2_.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint);
      }
      if(!_loc2_.isOwned || _loc2_.purchasedPattern != com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern)
      {
         _loc18_ = _loc2_.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern);
         _loc9_ = _loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern);
         _loc31_ = _loc2_.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern);
      }
      if(!_loc2_.isOwned || _loc2_.purchasedDecor != com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor)
      {
         _loc16_ = _loc2_.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor);
         _loc5_ = _loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor);
         _loc10_ = _loc2_.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor);
      }
      if(!_loc2_.isOwned || _loc2_.purchasedAI != com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai)
      {
         _loc3_ = _loc2_.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai);
         _loc6_ = _loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai);
         _loc22_ = _loc2_.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory == 1 && !(_loc2_.isOwned && _loc2_.purchasedArmory == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory))
      {
         _loc11_ = _loc2_.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARMORY_INDEX,0);
         _loc14_ = _loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARMORY_INDEX,0);
         _loc25_ = _loc2_.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARMORY_INDEX,0);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade == 1 && !(_loc2_.isOwned && _loc2_.purchasedArcade == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade))
      {
         _loc15_ = _loc2_.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARCADE_INDEX,0);
         _loc32_ = _loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARCADE_INDEX,0);
         _loc26_ = _loc2_.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARCADE_INDEX,0);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium == 1 && !(_loc2_.isOwned && _loc2_.purchasedPodium == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium))
      {
         _loc19_ = _loc2_.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PODIUM_INDEX,0);
         _loc23_ = _loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PODIUM_INDEX,0);
         _loc29_ = _loc2_.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PODIUM_INDEX,0);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop == 1 && !(_loc2_.isOwned && _loc2_.purchasedWorkshop == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop))
      {
         _loc13_ = _loc2_.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.WORKSHOP_INDEX,0);
         _loc20_ = _loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.WORKSHOP_INDEX,0);
         _loc7_ = _loc2_.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.WORKSHOP_INDEX,0);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio == 1 && !(_loc2_.isOwned && _loc2_.purchasedArtStudio == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio))
      {
         _loc27_ = _loc2_.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ART_STUDIO_INDEX,0);
         _loc8_ = _loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ART_STUDIO_INDEX,0);
         _loc28_ = _loc2_.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ART_STUDIO_INDEX,0);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security == 1 && !(_loc2_.isOwned && _loc2_.purchasedSecurity == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security))
      {
         _loc4_ = _loc2_.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.SECURITY_INDEX,0);
         _loc12_ = _loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.SECURITY_INDEX,0);
         _loc30_ = _loc2_.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.SECURITY_INDEX,0);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security != 1)
      {
         this.view.step2Cost._visible = false;
      }
      else if(_loc12_)
      {
         this.view.step2Cost.gotoAndStop("sale");
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc4_,this.view.step2Cost.cost);
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc30_,this.view.step2Cost.originalCost);
         this.view.step2Cost.strikethrough._width = this.view.step2Cost.originalCost.textWidth;
      }
      else
      {
         this.view.step2Cost.gotoAndStop("noSale");
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc4_,this.view.step2Cost.cost);
      }
      if(_loc2_.isOwned && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai == _loc2_.purchasedAI)
      {
         this.view.step3Cost._visible = false;
      }
      else if(_loc6_)
      {
         this.view.step3Cost.gotoAndStop("sale");
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc3_,this.view.step3Cost.cost);
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc22_,this.view.step3Cost.originalCost);
         this.view.step3Cost.strikethrough._width = this.view.step3Cost.originalCost.textWidth;
      }
      else
      {
         this.view.step3Cost.gotoAndStop("noSale");
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc3_,this.view.step3Cost.cost);
      }
      var _loc39_ = _loc21_ + _loc31_ + _loc10_;
      var _loc37_ = _loc17_ + _loc18_ + _loc16_;
      var _loc41_ = _loc24_ || _loc9_ || _loc5_;
      if(_loc2_.isOwned && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint == _loc2_.purchasedTint && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern == _loc2_.purchasedPattern && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor == _loc2_.purchasedDecor)
      {
         this.view.step0Cost._visible = false;
      }
      else if(_loc41_)
      {
         this.view.step0Cost.gotoAndStop("sale");
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc37_,this.view.step0Cost.cost);
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc39_,this.view.step0Cost.originalCost);
         this.view.step0Cost.strikethrough._width = this.view.step0Cost.originalCost.textWidth;
      }
      else
      {
         this.view.step0Cost.gotoAndStop("noSale");
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc37_,this.view.step0Cost.cost);
      }
      var _loc40_ = _loc25_ + _loc26_ + _loc29_ + _loc7_ + _loc28_;
      var _loc35_ = _loc11_ + _loc15_ + _loc19_ + _loc13_ + _loc27_;
      var _loc44_ = _loc14_ || _loc32_ || _loc23_ || _loc20_ || _loc8_;
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory != 1 && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade != 1 && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium != 1 && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop != 1 && com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio != 1)
      {
         this.view.step1Cost._visible = false;
      }
      else if(_loc44_)
      {
         this.view.step1Cost.gotoAndStop("sale");
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc35_,this.view.step1Cost.cost);
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc40_,this.view.step1Cost.originalCost);
         this.view.step1Cost.strikethrough._width = this.view.step1Cost.originalCost.textWidth;
      }
      else
      {
         this.view.step1Cost.gotoAndStop("noSale");
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc35_,this.view.step1Cost.cost);
      }
      var _loc42_ = _loc33_ + _loc17_ + _loc18_ + _loc16_ + _loc3_ + _loc11_ + _loc15_ + _loc19_ + _loc13_ + _loc27_ + _loc4_;
      var _loc43_ = _loc38_ + _loc21_ + _loc31_ + _loc10_ + _loc22_ + _loc25_ + _loc26_ + _loc29_ + _loc7_ + _loc28_ + _loc30_;
      var _loc34_ = _loc36_ || _loc24_ || _loc9_ || _loc5_ || _loc6_ || _loc14_ || _loc32_ || _loc23_ || _loc20_ || _loc8_ || _loc12_;
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc42_,this.view.totalCost);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc43_,this.view.originalTotalCost);
      this.view.originalTotalCost._visible = _loc34_;
      this.view.totalStrikethrough._visible = _loc34_;
      this.view.totalStrikethrough._width = this.view.originalTotalCost.textWidth;
      this.view.totalStrikethrough._x = this.view.originalTotalCost._x + 0.5 * (this.view.originalTotalCost._width - this.view.totalStrikethrough._width);
   }
   function dispose()
   {
      this.progressPanel.dispose();
      this.progressPanel = null;
      super.dispose();
   }
}
