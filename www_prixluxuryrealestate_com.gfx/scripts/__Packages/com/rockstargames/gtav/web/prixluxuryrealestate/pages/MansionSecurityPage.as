class com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionSecurityPage extends com.rockstargames.gtav.web.prixluxuryrealestate.Page
{
   var progressPanel;
   var view;
   var website;
   function MansionSecurityPage(website, viewContainer, pageName)
   {
      super(website,viewContainer,"mansionSecurityPage",pageName);
      this.init();
   }
   function init()
   {
      var _loc2_ = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.titlebarLocaliser,"PLRE_TITLEBAR");
      this.website.browser.SET_TITLEBAR_TEXT(_loc2_,14474460);
      this.view.buyButton.onColour = 16777215;
      this.view.buyButton.offColour = 13409357;
      this.view.heading.verticalAlign = "center";
      this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","security",this.view.image,true);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.heading,"PLRE_STEP2");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.description,"PLRE_SECURITY_DESC");
      this.website.dataTextScope.push(this.view.buyButton.btnTxt);
      this.progressPanel = new com.rockstargames.gtav.web.prixluxuryrealestate.ProgressPanel(this.view.progressPanel,this.website,2);
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
      if(this.website.activeMansion.purchasedSecurity == 1)
      {
         this.view.buyButton.disabled = true;
         this.view.buyButton.gotoAndStop("on");
         this.initDynamicWidthButton(this.view.buyButton,"PLRE_SECURITY_ADDED");
         this.view.status.gotoAndStop("on");
      }
      else if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security == 1)
      {
         this.initDynamicWidthButton(this.view.buyButton,"PLRE_SECURITY_ADDED");
         this.view.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.buyButton,"PLRE_SECURITY_ADD");
         this.view.status.gotoAndStop("off");
      }
      this.view.status._x = this.view.buyButton._x + this.view.buyButton._width;
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      this.updateCost();
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "buyButton":
            this.toggleSecurity();
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
      this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_OPTIONS_PAGE.name);
   }
   function handleRB()
   {
      this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_ASSISTANT_PAGE.name);
   }
   function toggleSecurity()
   {
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security != 1 ? 1 : 0;
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security == 1)
      {
         this.initDynamicWidthButton(this.view.buyButton,"PLRE_SECURITY_ADDED");
         this.view.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.buyButton,"PLRE_SECURITY_ADD");
         this.view.status.gotoAndStop("off");
      }
      this.view.status._x = this.view.buyButton._x + this.view.buyButton._width;
      this.updateCost();
   }
   function updateCost()
   {
      var _loc2_;
      if(this.website.activeMansion.purchasedSecurity == 1)
      {
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.cost,"PLRE_PURCHASED");
         this.view.strikethrough._visible = false;
         this.view.originalCost.text = "";
      }
      else if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security == 1)
      {
         _loc2_ = this.website.activeMansion;
         _loc2_.applyFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.SECURITY_INDEX,0,this.view.cost);
         if(_loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.SECURITY_INDEX,0))
         {
            _loc2_.applyOriginalFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.SECURITY_INDEX,0,this.view.originalCost);
            this.view.strikethrough._visible = true;
            this.view.strikethrough._width = this.view.originalCost.textWidth;
         }
         else
         {
            this.view.strikethrough._visible = false;
            this.view.originalCost.text = "";
         }
      }
      else
      {
         this.view.strikethrough._visible = false;
         this.view.cost.text = "";
         this.view.originalCost.text = "";
      }
   }
   function dispose()
   {
      this.progressPanel.dispose();
      this.progressPanel = null;
      super.dispose();
   }
}
