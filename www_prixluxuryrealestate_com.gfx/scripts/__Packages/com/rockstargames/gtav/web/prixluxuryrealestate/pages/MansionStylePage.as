class com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionStylePage extends com.rockstargames.gtav.web.prixluxuryrealestate.Page
{
   var progressPanel;
   var view;
   var website;
   function MansionStylePage(website, viewContainer, pageName)
   {
      super(website,viewContainer,"mansionStylePage",pageName);
      this.init();
   }
   function init()
   {
      var _loc2_ = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.titlebarLocaliser,"PLRE_TITLEBAR");
      this.website.browser.SET_TITLEBAR_TEXT(_loc2_,14474460);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.tab0Content.description,"PLRE_STYLE_DESC0");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.tab1Content.description,"PLRE_STYLE_DESC1");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.tab2Content.description,"PLRE_STYLE_DESC2");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.tab0Content.cta,"PLRE_STYLE_CTA0");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.tab1Content.cta,"PLRE_STYLE_CTA1");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.tab2Content.cta,"PLRE_STYLE_CTA2");
      this.view.tab0Content.tint0Button.swatch.gotoAndStop(1);
      this.view.tab0Content.tint1Button.swatch.gotoAndStop(2);
      this.view.tab0Content.tint2Button.swatch.gotoAndStop(3);
      this.view.tab0Content.tint3Button.swatch.gotoAndStop(4);
      this.view.tab1Content.pattern0Button.swatch.gotoAndStop(1);
      this.view.tab1Content.pattern1Button.swatch.gotoAndStop(2);
      this.view.tab1Content.pattern2Button.swatch.gotoAndStop(3);
      this.view.tab1Content.pattern3Button.swatch.gotoAndStop(4);
      this.view.tab1Content.pattern4Button.swatch.gotoAndStop(5);
      this.view.tab1Content.pattern5Button.swatch.gotoAndStop(6);
      this.view.tab0Button.onColour = 16777215;
      this.view.tab0Button.offColour = 13409357;
      this.view.tab1Button.onColour = 16777215;
      this.view.tab1Button.offColour = 13409357;
      this.view.tab2Button.onColour = 16777215;
      this.view.tab2Button.offColour = 13409357;
      this.initDynamicWidthButton(this.view.tab0Button,"PLRE_STYLE_TAB0");
      this.initDynamicWidthButton(this.view.tab1Button,"PLRE_STYLE_TAB1");
      this.initDynamicWidthButton(this.view.tab2Button,"PLRE_STYLE_TAB2");
      this.view.tab1Button._x = this.view.tab0Button._x + this.view.tab0Button._width;
      this.view.tab2Button._x = this.view.tab1Button._x + this.view.tab1Button._width;
      this.view.tab0Shim._x = this.view.tab0Button._x + 1;
      this.view.tab0Shim._width = this.view.tab0Button._width - 1;
      this.view.tab0Shim._visible = false;
      this.view.tab1Shim._x = this.view.tab1Button._x + 1;
      this.view.tab1Shim._width = this.view.tab1Button._width - 1;
      this.view.tab1Shim._visible = false;
      this.view.tab2Shim._x = this.view.tab2Button._x + 1;
      this.view.tab2Shim._width = this.view.tab2Button._width - 1;
      this.view.tab2Shim._visible = false;
      this.initDynamicWidthButton(this.view.fakeTab0Button,"PLRE_STYLE_TAB0");
      this.initDynamicWidthButton(this.view.fakeTab1Button,"PLRE_STYLE_TAB1");
      this.initDynamicWidthButton(this.view.fakeTab2Button,"PLRE_STYLE_TAB2");
      this.view.fakeTab0Button.gotoAndStop("on");
      this.view.fakeTab1Button.gotoAndStop("on");
      this.view.fakeTab2Button.gotoAndStop("on");
      this.view.fakeTab0Button._x = this.view.tab0Button._x;
      this.view.fakeTab1Button._x = this.view.tab1Button._x;
      this.view.fakeTab2Button._x = this.view.tab2Button._x;
      this.initDynamicWidthButton(this.view.tab2Content.decor0Button,"PLRE_STYLE0");
      this.initDynamicWidthButton(this.view.tab2Content.decor1Button,"PLRE_STYLE1");
      this.initDynamicWidthButton(this.view.tab2Content.decor2Button,"PLRE_STYLE2");
      this.view.tab2Content.decor1Button._x = this.view.tab2Content.decor0Button._x + this.view.tab2Content.decor0Button._width + 2;
      this.view.tab2Content.decor2Button._x = this.view.tab2Content.decor1Button._x + this.view.tab2Content.decor1Button._width + 2;
      this.view.tab2Content.decor0Button.onColour = 0;
      this.view.tab2Content.decor0Button.offColour = 16777215;
      this.view.tab2Content.decor1Button.onColour = 0;
      this.view.tab2Content.decor1Button.offColour = 16777215;
      this.view.tab2Content.decor2Button.onColour = 0;
      this.view.tab2Content.decor2Button.offColour = 16777215;
      this.initDynamicWidthButton(this.view.tab2Content.fakeDecor0Button,"PLRE_STYLE0");
      this.initDynamicWidthButton(this.view.tab2Content.fakeDecor1Button,"PLRE_STYLE1");
      this.initDynamicWidthButton(this.view.tab2Content.fakeDecor2Button,"PLRE_STYLE2");
      this.view.tab2Content.fakeDecor0Button.gotoAndStop("on");
      this.view.tab2Content.fakeDecor1Button.gotoAndStop("on");
      this.view.tab2Content.fakeDecor2Button.gotoAndStop("on");
      this.view.tab2Content.fakeDecor0Button._x = this.view.tab2Content.decor0Button._x;
      this.view.tab2Content.fakeDecor1Button._x = this.view.tab2Content.decor1Button._x;
      this.view.tab2Content.fakeDecor2Button._x = this.view.tab2Content.decor2Button._x;
      this.view.tab2Content.fakeDecor0Button.btnTxt.textColor = 0;
      this.view.tab2Content.fakeDecor1Button.btnTxt.textColor = 0;
      this.view.tab2Content.fakeDecor2Button.btnTxt.textColor = 0;
      this.view.tab2Content.buttonGroupBackground._width = this.view.tab2Content.decor2Button._x + this.view.tab2Content.decor2Button._width - this.view.tab2Content.decor0Button._x + 6;
      this.website.dataTextScope.push(this.view.tab0Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab1Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab2Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab0Content.tint0Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab0Content.tint1Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab0Content.tint2Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab0Content.tint3Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab1Content.pattern0Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab1Content.pattern1Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab1Content.pattern2Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab1Content.pattern3Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab1Content.pattern4Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab1Content.pattern5Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab2Content.decor0Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab2Content.decor1Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab2Content.decor2Button.btnTxt);
      this.progressPanel = new com.rockstargames.gtav.web.prixluxuryrealestate.ProgressPanel(this.view.progressPanel,this.website,0);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(this.view.background._height);
      var _loc3_ = this.website.activeMansion;
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
      this.selectPattern(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern,false);
      this.selectDecor(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor,false);
      this.showTabContent(0);
      this.selectTint(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint,true);
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "tab0Button":
            this.showTabContent(0);
            break;
         case "tab1Button":
            this.showTabContent(1);
            break;
         case "tab2Button":
            this.showTabContent(2);
            break;
         case "tint0Button":
            this.selectTint(0,true);
            break;
         case "tint1Button":
            this.selectTint(1,true);
            break;
         case "tint2Button":
            this.selectTint(2,true);
            break;
         case "tint3Button":
            this.selectTint(3,true);
            break;
         case "pattern0Button":
            this.selectPattern(0,true);
            break;
         case "pattern1Button":
            this.selectPattern(1,true);
            break;
         case "pattern2Button":
            this.selectPattern(2,true);
            break;
         case "pattern3Button":
            this.selectPattern(3,true);
            break;
         case "pattern4Button":
            this.selectPattern(4,true);
            break;
         case "pattern5Button":
            this.selectPattern(5,true);
            break;
         case "decor0Button":
            this.selectDecor(0,true);
            break;
         case "decor1Button":
            this.selectDecor(1,true);
            break;
         case "decor2Button":
            this.selectDecor(2,true);
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
      this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_MAP_PAGE.name);
   }
   function handleRB()
   {
      this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_OPTIONS_PAGE.name);
   }
   function showTabContent(index)
   {
      this.view.tab0Content._visible = index == 0;
      this.view.tab1Content._visible = index == 1;
      this.view.tab2Content._visible = index == 2;
      this.view.tab0Shim._visible = index == 0;
      this.view.tab1Shim._visible = index == 1;
      this.view.tab2Shim._visible = index == 2;
      this.setButtonSelected(this.view.tab0Button,index == 0);
      this.setButtonSelected(this.view.tab1Button,index == 1);
      this.setButtonSelected(this.view.tab2Button,index == 2);
      this.view.tab0Button._visible = index != 0;
      this.view.tab1Button._visible = index != 1;
      this.view.tab2Button._visible = index != 2;
      this.view.fakeTab0Button._visible = index == 0;
      this.view.fakeTab1Button._visible = index == 1;
      this.view.fakeTab2Button._visible = index == 2;
      this.view.tab0Content.tint0Button.disabled = index != 0;
      this.view.tab0Content.tint1Button.disabled = index != 0;
      this.view.tab0Content.tint2Button.disabled = index != 0;
      this.view.tab0Content.tint3Button.disabled = index != 0;
      this.view.tab1Content.pattern0Button.disabled = index != 1;
      this.view.tab1Content.pattern1Button.disabled = index != 1;
      this.view.tab1Content.pattern2Button.disabled = index != 1;
      this.view.tab1Content.pattern3Button.disabled = index != 1;
      this.view.tab1Content.pattern4Button.disabled = index != 1;
      this.view.tab1Content.pattern5Button.disabled = index != 1;
      this.view.tab2Content.decor0Button.disabled = index != 2;
      this.view.tab2Content.decor1Button.disabled = index != 2;
      this.view.tab2Content.decor2Button.disabled = index != 2;
      if(index == 0)
      {
         this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","tint" + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint,this.view.image,true);
      }
      else if(index == 1)
      {
         this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","pattern" + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern,this.view.image,true);
      }
      else if(index == 2)
      {
         this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","decor" + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor,this.view.image,true);
      }
   }
   function selectTint(index, showImage)
   {
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint = index;
      this.setButtonSelected(this.view.tab0Content.tint0Button,index == 0);
      this.setButtonSelected(this.view.tab0Content.tint1Button,index == 1);
      this.setButtonSelected(this.view.tab0Content.tint2Button,index == 2);
      this.setButtonSelected(this.view.tab0Content.tint3Button,index == 3);
      var _loc3_ = this.website.activeMansion;
      _loc3_.applyFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint,this.view.tab0Content.cost);
      if(_loc3_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint))
      {
         _loc3_.applyOriginalFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint,this.view.tab0Content.originalCost);
         this.view.tab0Content.strikethrough._visible = true;
         this.view.tab0Content.strikethrough._width = this.view.tab0Content.originalCost.textWidth;
      }
      else
      {
         this.view.tab0Content.strikethrough._visible = false;
         this.view.tab0Content.originalCost.text = "";
      }
      this.view.tab0Content.originalCost._x = this.view.tab0Content.cost._x + this.view.tab0Content.cost.textWidth + 10;
      this.view.tab0Content.strikethrough._x = this.view.tab0Content.originalCost._x;
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      if(showImage)
      {
         this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","tint" + index,this.view.image,true);
      }
   }
   function selectPattern(index, showImage)
   {
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern = index;
      this.setButtonSelected(this.view.tab1Content.pattern0Button,index == 0);
      this.setButtonSelected(this.view.tab1Content.pattern1Button,index == 1);
      this.setButtonSelected(this.view.tab1Content.pattern2Button,index == 2);
      this.setButtonSelected(this.view.tab1Content.pattern3Button,index == 3);
      this.setButtonSelected(this.view.tab1Content.pattern4Button,index == 4);
      this.setButtonSelected(this.view.tab1Content.pattern5Button,index == 5);
      var _loc3_ = this.website.activeMansion;
      _loc3_.applyFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern,this.view.tab1Content.cost);
      if(_loc3_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern))
      {
         _loc3_.applyOriginalFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern,this.view.tab1Content.originalCost);
         this.view.tab1Content.strikethrough._visible = true;
         this.view.tab1Content.strikethrough._width = this.view.tab1Content.originalCost.textWidth;
      }
      else
      {
         this.view.tab1Content.strikethrough._visible = false;
         this.view.tab1Content.originalCost.text = "";
      }
      this.view.tab1Content.originalCost._x = this.view.tab1Content.cost._x + this.view.tab1Content.cost.textWidth + 10;
      this.view.tab1Content.strikethrough._x = this.view.tab1Content.originalCost._x;
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      if(showImage)
      {
         this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","pattern" + index,this.view.image,true);
      }
   }
   function selectDecor(index, showImage)
   {
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor = index;
      this.setButtonSelected(this.view.tab2Content.decor0Button,index == 0);
      this.setButtonSelected(this.view.tab2Content.decor1Button,index == 1);
      this.setButtonSelected(this.view.tab2Content.decor2Button,index == 2);
      this.view.tab2Content.fakeDecor0Button._visible = index == 0;
      this.view.tab2Content.fakeDecor1Button._visible = index == 1;
      this.view.tab2Content.fakeDecor2Button._visible = index == 2;
      var _loc3_ = this.website.activeMansion;
      _loc3_.applyFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor,this.view.tab2Content.cost);
      if(_loc3_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor))
      {
         _loc3_.applyOriginalFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor,this.view.tab2Content.originalCost);
         this.view.tab2Content.strikethrough._visible = true;
         this.view.tab2Content.strikethrough._width = this.view.tab2Content.originalCost.textWidth;
      }
      else
      {
         this.view.tab2Content.strikethrough._visible = false;
         this.view.tab2Content.originalCost.text = "";
      }
      this.view.tab2Content.originalCost._x = this.view.tab2Content.cost._x + this.view.tab2Content.cost.textWidth + 10;
      this.view.tab2Content.strikethrough._x = this.view.tab2Content.originalCost._x;
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      if(showImage)
      {
         this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","decor" + index,this.view.image,true);
      }
   }
   function setButtonSelected(button, isSelected)
   {
      if(isSelected)
      {
         button.gotoAndStop("on");
         button.disabled = true;
      }
      else
      {
         button.disabled = false;
         button.gotoAndStop("off");
      }
   }
   function dispose()
   {
      this.progressPanel.dispose();
      this.progressPanel = null;
      super.dispose();
   }
}
