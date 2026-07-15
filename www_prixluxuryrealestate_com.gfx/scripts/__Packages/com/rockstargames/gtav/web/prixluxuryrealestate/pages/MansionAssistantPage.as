class com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionAssistantPage extends com.rockstargames.gtav.web.prixluxuryrealestate.Page
{
   var progressPanel;
   var view;
   var website;
   function MansionAssistantPage(website, viewContainer, pageName)
   {
      super(website,viewContainer,"mansionAssistantPage",pageName);
      this.init();
   }
   function init()
   {
      var _loc2_ = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.titlebarLocaliser,"PLRE_TITLEBAR");
      this.website.browser.SET_TITLEBAR_TEXT(_loc2_,14474460);
      this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","ai",this.view.image,true);
      this.view.label.verticalAlign = "center";
      this.view.assistant0Button.btnTxt.verticalAlign = "center";
      this.view.assistant1Button.btnTxt.verticalAlign = "center";
      this.view.assistant2Button.btnTxt.verticalAlign = "center";
      this.view.assistant0Button.onColour = 13409357;
      this.view.assistant0Button.offColour = 16777215;
      this.view.assistant1Button.onColour = 13409357;
      this.view.assistant1Button.offColour = 16777215;
      this.view.assistant2Button.onColour = 13409357;
      this.view.assistant2Button.offColour = 16777215;
      this.view.assistant0Button.aiIcon.gotoAndStop(1);
      this.view.assistant1Button.aiIcon.gotoAndStop(2);
      this.view.assistant2Button.aiIcon.gotoAndStop(3);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.logo,"PLRE_AI_LOGO");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.heading,"PLRE_AI_HEADING");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.subheading,"PLRE_AI_SUBHEADING");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.label,"PLRE_STEP3");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.description,"PLRE_AI_DESC");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.cta,"PLRE_AI_CTA");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.assistant0Button.btnTxt,"PLRE_AI_NAME0");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.assistant1Button.btnTxt,"PLRE_AI_NAME1");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.assistant2Button.btnTxt,"PLRE_AI_NAME2");
      this.view.fakeAssistant0Button.gotoAndStop("on");
      this.view.fakeAssistant1Button.gotoAndStop("on");
      this.view.fakeAssistant2Button.gotoAndStop("on");
      this.view.fakeAssistant0Button.aiIcon.gotoAndStop(1);
      this.view.fakeAssistant1Button.aiIcon.gotoAndStop(2);
      this.view.fakeAssistant2Button.aiIcon.gotoAndStop(3);
      this.view.fakeAssistant0Button.btnTxt.verticalAlign = "center";
      this.view.fakeAssistant1Button.btnTxt.verticalAlign = "center";
      this.view.fakeAssistant2Button.btnTxt.verticalAlign = "center";
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.fakeAssistant0Button.btnTxt,"PLRE_AI_NAME0");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.fakeAssistant1Button.btnTxt,"PLRE_AI_NAME1");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.fakeAssistant2Button.btnTxt,"PLRE_AI_NAME2");
      this.website.dataTextScope.push(this.view.assistant0Button.btnTxt);
      this.website.dataTextScope.push(this.view.assistant1Button.btnTxt);
      this.website.dataTextScope.push(this.view.assistant2Button.btnTxt);
      this.progressPanel = new com.rockstargames.gtav.web.prixluxuryrealestate.ProgressPanel(this.view.progressPanel,this.website,3);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(this.view.background._height);
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
      this.selectAssistant(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai);
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      this.updateCost();
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "assistant0Button":
            this.selectAssistant(0);
            break;
         case "assistant1Button":
            this.selectAssistant(1);
            break;
         case "assistant2Button":
            this.selectAssistant(2);
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
   function selectAssistant(index)
   {
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai = index;
      this.setButtonSelected(this.view.assistant0Button,index == 0,0);
      this.setButtonSelected(this.view.assistant1Button,index == 1,1);
      this.setButtonSelected(this.view.assistant2Button,index == 2,2);
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      this.updateCost();
   }
   function setButtonSelected(button, isSelected, buttonIndex)
   {
      if(isSelected)
      {
         button.gotoAndStop("on");
      }
      else
      {
         button.gotoAndStop("off");
      }
      if(buttonIndex == 0)
      {
         this.view.fakeAssistant0Button._visible = isSelected;
      }
      if(buttonIndex == 1)
      {
         this.view.fakeAssistant1Button._visible = isSelected;
      }
      if(buttonIndex == 2)
      {
         this.view.fakeAssistant2Button._visible = isSelected;
      }
      button._alpha = !isSelected ? 100 : 10;
   }
   function updateCost()
   {
      var _loc2_ = this.website.activeMansion;
      _loc2_.applyFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai,this.view.cost);
      if(_loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai))
      {
         _loc2_.applyOriginalFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai,this.view.originalCost);
         this.view.strikethrough._visible = true;
         this.view.strikethrough._width = this.view.originalCost.textWidth;
      }
      else
      {
         this.view.strikethrough._visible = false;
         this.view.originalCost.text = "";
      }
      this.view.originalCost._x = this.view.cost._x + this.view.cost.textWidth + 10;
      this.view.strikethrough._x = this.view.originalCost._x;
   }
   function handleLB()
   {
      this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_SECURITY_PAGE.name);
   }
   function handleRB()
   {
      this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_SUMMARY_PAGE.name);
   }
   function dispose()
   {
      this.progressPanel.dispose();
      this.progressPanel = null;
      super.dispose();
   }
}
