class com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionOptionsPage extends com.rockstargames.gtav.web.prixluxuryrealestate.Page
{
   var progressPanel;
   var view;
   var website;
   function MansionOptionsPage(website, viewContainer, pageName)
   {
      super(website,viewContainer,"mansionOptionsPage",pageName);
      this.init();
   }
   function init()
   {
      var _loc3_ = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.titlebarLocaliser,"PLRE_TITLEBAR");
      this.website.browser.SET_TITLEBAR_TEXT(_loc3_,14474460);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.tab0Content.description,"PLRE_OPTIONS_DESC0");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.tab1Content.description,"PLRE_OPTIONS_DESC1");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.tab2Content.description,"PLRE_OPTIONS_DESC2");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.tab3Content.description,"PLRE_OPTIONS_DESC3");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.tab4Content.description,"PLRE_OPTIONS_DESC4");
      this.view.tab0Button.onColour = 16777215;
      this.view.tab0Button.offColour = 13409357;
      this.view.tab1Button.onColour = 16777215;
      this.view.tab1Button.offColour = 13409357;
      this.view.tab2Button.onColour = 16777215;
      this.view.tab2Button.offColour = 13409357;
      this.view.tab3Button.onColour = 16777215;
      this.view.tab3Button.offColour = 13409357;
      this.view.tab4Button.onColour = 16777215;
      this.view.tab4Button.offColour = 13409357;
      this.view.tab0Content.buy0Button.onColour = 16777215;
      this.view.tab0Content.buy0Button.offColour = 13409357;
      this.view.tab1Content.buy1Button.onColour = 16777215;
      this.view.tab1Content.buy1Button.offColour = 13409357;
      this.view.tab2Content.buy2Button.onColour = 16777215;
      this.view.tab2Content.buy2Button.offColour = 13409357;
      this.view.tab3Content.buy3Button.onColour = 16777215;
      this.view.tab3Content.buy3Button.offColour = 13409357;
      this.view.tab4Content.buy4Button.onColour = 16777215;
      this.view.tab4Content.buy4Button.offColour = 13409357;
      this.initDynamicWidthButton(this.view.tab0Button,"PLRE_OPTIONS_TAB0");
      this.initDynamicWidthButton(this.view.tab1Button,"PLRE_OPTIONS_TAB1");
      this.initDynamicWidthButton(this.view.tab2Button,"PLRE_OPTIONS_TAB2");
      this.initDynamicWidthButton(this.view.tab3Button,"PLRE_OPTIONS_TAB3");
      this.initDynamicWidthButton(this.view.tab4Button,"PLRE_OPTIONS_TAB4");
      this.view.tab0Button._x = this.view.tab4Button._x + this.view.tab4Button._width;
      this.view.tab1Button._x = this.view.tab0Button._x + this.view.tab0Button._width;
      this.view.tab3Button._x = this.view.tab2Button._x + this.view.tab2Button._width;
      this.view.tab0Shim._x = this.view.tab0Button._x + 1;
      this.view.tab0Shim._width = this.view.tab0Button._width - 1;
      this.view.tab0Shim._visible = false;
      this.view.tab1Shim._x = this.view.tab1Button._x + 1;
      this.view.tab1Shim._width = this.view.tab1Button._width - 1;
      this.view.tab1Shim._visible = false;
      this.view.tab2Shim._x = this.view.tab2Button._x + 1;
      this.view.tab2Shim._width = this.view.tab2Button._width - 1;
      this.view.tab2Shim._visible = false;
      this.view.tab3Shim._x = this.view.tab3Button._x + 1;
      this.view.tab3Shim._width = this.view.tab3Button._width - 1;
      this.view.tab3Shim._visible = false;
      this.view.tab4Shim._x = this.view.tab4Button._x + 1;
      this.view.tab4Shim._width = this.view.tab4Button._width - 1;
      this.view.tab4Shim._visible = false;
      this.initDynamicWidthButton(this.view.fakeTab0Button,"PLRE_OPTIONS_TAB0");
      this.initDynamicWidthButton(this.view.fakeTab1Button,"PLRE_OPTIONS_TAB1");
      this.initDynamicWidthButton(this.view.fakeTab2Button,"PLRE_OPTIONS_TAB2");
      this.initDynamicWidthButton(this.view.fakeTab3Button,"PLRE_OPTIONS_TAB3");
      this.initDynamicWidthButton(this.view.fakeTab4Button,"PLRE_OPTIONS_TAB4");
      this.view.fakeTab0Button.gotoAndStop("on");
      this.view.fakeTab1Button.gotoAndStop("on");
      this.view.fakeTab2Button.gotoAndStop("on");
      this.view.fakeTab3Button.gotoAndStop("on");
      this.view.fakeTab4Button.gotoAndStop("on");
      this.view.fakeTab0Button._x = this.view.tab0Button._x;
      this.view.fakeTab1Button._x = this.view.tab1Button._x;
      this.view.fakeTab2Button._x = this.view.tab2Button._x;
      this.view.fakeTab3Button._x = this.view.tab3Button._x;
      this.view.fakeTab4Button._x = this.view.tab4Button._x;
      this.website.dataTextScope.push(this.view.tab0Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab1Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab2Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab3Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab4Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab0Content.buy0Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab1Content.buy1Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab2Content.buy2Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab3Content.buy3Button.btnTxt);
      this.website.dataTextScope.push(this.view.tab4Content.buy4Button.btnTxt);
      this.progressPanel = new com.rockstargames.gtav.web.prixluxuryrealestate.ProgressPanel(this.view.progressPanel,this.website,1);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(this.view.background._height);
      var _loc2_ = this.website.activeMansion;
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
      if(!_loc2_.ownsAgencyProperty)
      {
         this.initDynamicWidthButton(this.view.tab0Content.buy0Button,"PLRE_OPTIONS_LOCKED0");
         this.view.tab0Content.status.gotoAndStop("locked");
         this.view.tab0Content.buy0Button.btnTxt.textColor = 13409357;
      }
      else if(_loc2_.isOwned && _loc2_.purchasedArmory == 1)
      {
         this.initDynamicWidthButton(this.view.tab0Content.buy0Button,"PLRE_OPTIONS_ADDED0");
         this.view.tab0Content.buy0Button.disabled = true;
         this.view.tab0Content.status.gotoAndStop("on");
      }
      else if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory == 1)
      {
         this.initDynamicWidthButton(this.view.tab0Content.buy0Button,"PLRE_OPTIONS_ADDED0");
         this.view.tab0Content.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.tab0Content.buy0Button,"PLRE_OPTIONS_ADD0");
         this.view.tab0Content.status.gotoAndStop("off");
      }
      if(!_loc2_.ownsArcadeProperty)
      {
         this.initDynamicWidthButton(this.view.tab1Content.buy1Button,"PLRE_OPTIONS_LOCKED1");
         this.view.tab1Content.status.gotoAndStop("locked");
         this.view.tab1Content.buy1Button.btnTxt.textColor = 13409357;
      }
      else if(_loc2_.isOwned && _loc2_.purchasedArcade == 1)
      {
         this.initDynamicWidthButton(this.view.tab1Content.buy1Button,"PLRE_OPTIONS_ADDED1");
         this.view.tab1Content.buy1Button.disabled = true;
         this.view.tab1Content.status.gotoAndStop("on");
      }
      else if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade == 1)
      {
         this.initDynamicWidthButton(this.view.tab1Content.buy1Button,"PLRE_OPTIONS_ADDED1");
         this.view.tab1Content.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.tab1Content.buy1Button,"PLRE_OPTIONS_ADD1");
         this.view.tab1Content.status.gotoAndStop("off");
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium == 1)
      {
         this.initDynamicWidthButton(this.view.tab2Content.buy2Button,"PLRE_OPTIONS_ADDED2");
         this.view.tab2Content.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.tab2Content.buy2Button,"PLRE_OPTIONS_ADD2");
         this.view.tab2Content.status.gotoAndStop("off");
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop == 1)
      {
         this.initDynamicWidthButton(this.view.tab3Content.buy3Button,"PLRE_OPTIONS_ADDED3");
         this.view.tab3Content.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.tab3Content.buy3Button,"PLRE_OPTIONS_ADD3");
         this.view.tab3Content.status.gotoAndStop("off");
      }
      if(_loc2_.purchasedArtStudio == 1)
      {
         this.initDynamicWidthButton(this.view.tab4Content.buy4Button,"PLRE_OPTIONS_ADDED4");
         this.view.tab4Content.buy4Button.disabled = true;
         this.view.tab4Content.status.gotoAndStop("on");
      }
      else if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio == 1)
      {
         this.initDynamicWidthButton(this.view.tab4Content.buy4Button,"PLRE_OPTIONS_ADDED4");
         this.view.tab4Content.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.tab4Content.buy4Button,"PLRE_OPTIONS_ADD4");
         this.view.tab4Content.status.gotoAndStop("off");
      }
      this.view.tab0Content.status._x = this.view.tab0Content.buy0Button._x + this.view.tab0Content.buy0Button._width;
      this.view.tab1Content.status._x = this.view.tab1Content.buy1Button._x + this.view.tab1Content.buy1Button._width;
      this.view.tab2Content.status._x = this.view.tab2Content.buy2Button._x + this.view.tab2Content.buy2Button._width;
      this.view.tab3Content.status._x = this.view.tab3Content.buy3Button._x + this.view.tab3Content.buy3Button._width;
      this.view.tab4Content.status._x = this.view.tab4Content.buy4Button._x + this.view.tab4Content.buy4Button._width;
      this.showTabContent(4);
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      this.updateTabCost(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARMORY_INDEX,this.view.tab0Content,_loc2_.purchasedArmory == 1,!_loc2_.ownsAgencyProperty);
      this.updateTabCost(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARCADE_INDEX,this.view.tab1Content,_loc2_.purchasedArcade == 1,!_loc2_.ownsArcadeProperty);
      this.updateTabCost(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PODIUM_INDEX,this.view.tab2Content,_loc2_.purchasedPodium == 1,false);
      this.updateTabCost(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.WORKSHOP_INDEX,this.view.tab3Content,_loc2_.purchasedWorkshop == 1,false);
      this.updateTabCost(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ART_STUDIO_INDEX,this.view.tab4Content,_loc2_.purchasedArtStudio == 1,false);
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
         case "tab3Button":
            this.showTabContent(3);
            break;
         case "tab4Button":
            this.showTabContent(4);
            break;
         case "buy0Button":
            this.toggleArmory();
            break;
         case "buy1Button":
            this.toggleArcade();
            break;
         case "buy2Button":
            this.togglePodium();
            break;
         case "buy3Button":
            this.toggleWorkshop();
            break;
         case "buy4Button":
            this.toggleArtStudio();
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
      this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_STYLE_PAGE.name);
   }
   function handleRB()
   {
      this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_SECURITY_PAGE.name);
   }
   function showTabContent(index)
   {
      var _loc3_ = this.website.activeMansion;
      this.view.tab0Content._visible = index == 0;
      this.view.tab1Content._visible = index == 1;
      this.view.tab2Content._visible = index == 2;
      this.view.tab3Content._visible = index == 3;
      this.view.tab4Content._visible = index == 4;
      this.view.tab0Shim._visible = index == 0;
      this.view.tab1Shim._visible = index == 1;
      this.view.tab2Shim._visible = index == 2;
      this.view.tab3Shim._visible = index == 3;
      this.view.tab4Shim._visible = index == 4;
      this.setButtonSelected(this.view.tab0Button,index == 0);
      this.setButtonSelected(this.view.tab1Button,index == 1);
      this.setButtonSelected(this.view.tab2Button,index == 2);
      this.setButtonSelected(this.view.tab3Button,index == 3);
      this.setButtonSelected(this.view.tab4Button,index == 4);
      this.view.tab0Button._visible = index != 0;
      this.view.tab1Button._visible = index != 1;
      this.view.tab2Button._visible = index != 2;
      this.view.tab3Button._visible = index != 3;
      this.view.tab4Button._visible = index != 4;
      this.view.fakeTab0Button._visible = index == 0;
      this.view.fakeTab1Button._visible = index == 1;
      this.view.fakeTab2Button._visible = index == 2;
      this.view.fakeTab3Button._visible = index == 3;
      this.view.fakeTab4Button._visible = index == 4;
      this.view.tab0Content.buy0Button.disabled = index != 0 || _loc3_.isOwned && _loc3_.purchasedArmory == 1;
      this.view.tab1Content.buy1Button.disabled = index != 1 || _loc3_.isOwned && _loc3_.purchasedArcade == 1;
      this.view.tab2Content.buy2Button.disabled = index != 2 || _loc3_.isOwned && _loc3_.purchasedPodium == 1;
      this.view.tab3Content.buy3Button.disabled = index != 3 || _loc3_.isOwned && _loc3_.purchasedWorkshop == 1;
      this.view.tab4Content.buy4Button.disabled = index != 4 || _loc3_.purchasedArtStudio == 1;
      if(index == 0)
      {
         this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","armory",this.view.image,true);
      }
      else if(index == 1)
      {
         this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","arcade",this.view.image,true);
      }
      else if(index == 2)
      {
         this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","podium",this.view.image,true);
      }
      else if(index == 3)
      {
         this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","workshop",this.view.image,true);
      }
      else if(index == 4)
      {
         this.website.imageManager.addImage("PRIX_LUXURY_MANSION_INTERNAL","artstudio",this.view.image,true);
      }
   }
   function toggleArmory()
   {
      if(!this.website.activeMansion.ownsAgencyProperty)
      {
         return undefined;
      }
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory != 1 ? 1 : 0;
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory == 1)
      {
         this.initDynamicWidthButton(this.view.tab0Content.buy0Button,"PLRE_OPTIONS_ADDED0");
         this.view.tab0Content.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.tab0Content.buy0Button,"PLRE_OPTIONS_ADD0");
         this.view.tab0Content.status.gotoAndStop("off");
      }
      this.view.tab0Content.status._x = this.view.tab0Content.buy0Button._x + this.view.tab0Content.buy0Button._width;
      this.updateTabCost(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARMORY_INDEX,this.view.tab0Content,false,false);
   }
   function toggleArcade()
   {
      if(!this.website.activeMansion.ownsArcadeProperty)
      {
         return undefined;
      }
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade != 1 ? 1 : 0;
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade == 1)
      {
         this.initDynamicWidthButton(this.view.tab1Content.buy1Button,"PLRE_OPTIONS_ADDED1");
         this.view.tab1Content.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.tab1Content.buy1Button,"PLRE_OPTIONS_ADD1");
         this.view.tab1Content.status.gotoAndStop("off");
      }
      this.view.tab1Content.status._x = this.view.tab1Content.buy1Button._x + this.view.tab1Content.buy1Button._width;
      this.updateTabCost(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARCADE_INDEX,this.view.tab1Content,false,false);
   }
   function togglePodium()
   {
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium != 1 ? 1 : 0;
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium == 1)
      {
         this.initDynamicWidthButton(this.view.tab2Content.buy2Button,"PLRE_OPTIONS_ADDED2");
         this.view.tab2Content.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.tab2Content.buy2Button,"PLRE_OPTIONS_ADD2");
         this.view.tab2Content.status.gotoAndStop("off");
      }
      this.view.tab2Content.status._x = this.view.tab2Content.buy2Button._x + this.view.tab2Content.buy2Button._width;
      this.updateTabCost(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PODIUM_INDEX,this.view.tab2Content,false,false);
   }
   function toggleWorkshop()
   {
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop != 1 ? 1 : 0;
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop == 1)
      {
         this.initDynamicWidthButton(this.view.tab3Content.buy3Button,"PLRE_OPTIONS_ADDED3");
         this.view.tab3Content.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.tab3Content.buy3Button,"PLRE_OPTIONS_ADD3");
         this.view.tab3Content.status.gotoAndStop("off");
      }
      this.view.tab3Content.status._x = this.view.tab3Content.buy3Button._x + this.view.tab3Content.buy3Button._width;
      this.updateTabCost(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.WORKSHOP_INDEX,this.view.tab3Content,false,false);
   }
   function toggleArtStudio()
   {
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio = com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio != 1 ? 1 : 0;
      this.progressPanel.updateTotalCost(this.website.activeMansion);
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio == 1)
      {
         this.initDynamicWidthButton(this.view.tab4Content.buy4Button,"PLRE_OPTIONS_ADDED4");
         this.view.tab4Content.status.gotoAndStop("on");
      }
      else
      {
         this.initDynamicWidthButton(this.view.tab4Content.buy4Button,"PLRE_OPTIONS_ADD4");
         this.view.tab4Content.status.gotoAndStop("off");
      }
      this.view.tab4Content.status._x = this.view.tab4Content.buy4Button._x + this.view.tab4Content.buy4Button._width;
      this.updateTabCost(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ART_STUDIO_INDEX,this.view.tab4Content,false,false);
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
   function updateTabCost(itemState, costIndex, tab, itemAlreadyPurchased, itemIsLocked)
   {
      var _loc3_;
      if(itemAlreadyPurchased)
      {
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(tab.cost,"PLRE_PURCHASED");
         tab.strikethrough._visible = false;
         tab.originalCost.text = "";
      }
      else if(itemIsLocked)
      {
         tab.strikethrough._visible = false;
         tab.originalCost.text = "";
         tab.cost.text = "";
      }
      else
      {
         _loc3_ = this.website.activeMansion;
         _loc3_.applyFormattedPrice(costIndex,0,tab.cost);
         if(_loc3_.getPriceIsOnSale(costIndex,0))
         {
            _loc3_.applyOriginalFormattedPrice(costIndex,0,tab.originalCost);
            tab.strikethrough._visible = true;
            tab.strikethrough._width = tab.originalCost.textWidth;
         }
         else
         {
            tab.strikethrough._visible = false;
            tab.originalCost.text = "";
         }
      }
   }
   function dispose()
   {
      this.progressPanel.dispose();
      this.progressPanel = null;
      super.dispose();
   }
}
