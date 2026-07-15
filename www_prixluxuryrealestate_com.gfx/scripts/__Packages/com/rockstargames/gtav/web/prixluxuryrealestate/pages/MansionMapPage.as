class com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionMapPage extends com.rockstargames.gtav.web.prixluxuryrealestate.Page
{
   var bodyTextBuyY;
   var bodyTextRenovateY;
   var view;
   var website;
   function MansionMapPage(website, viewContainer, pageName)
   {
      super(website,viewContainer,"mansionMapPage",pageName);
      this.init();
   }
   function init()
   {
      var _loc3_ = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.titlebarLocaliser,"PLRE_TITLEBAR");
      this.website.browser.SET_TITLEBAR_TEXT(_loc3_,14474460);
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.customiseButton.btnTxt,"PLRE_CUSTOMIZE");
      this.bodyTextBuyY = this.view.description._y;
      this.bodyTextRenovateY = this.view.buyFrom._y;
      this.view.property0Button.btnTxt.autoSize = "left";
      this.view.property0Button.btnTxt.verticalAlign = "center";
      this.view.property0Button.onColour = 16777215;
      this.view.property1Button.btnTxt.autoSize = "left";
      this.view.property1Button.btnTxt.verticalAlign = "center";
      this.view.property1Button.onColour = 16777215;
      this.view.property2Button.btnTxt.autoSize = "right";
      this.view.property2Button.btnTxt.verticalAlign = "center";
      this.view.property2Button.onColour = 16777215;
      this.view.customiseButton.btnTxt.textAutoSize = "shrink";
      this.view.customiseButton.btnTxt.verticalAlign = "center";
      this.view.property0Button.btnTxt.text = this.website.mansions[0].name;
      this.view.property1Button.btnTxt.text = this.website.mansions[1].name;
      this.view.property2Button.btnTxt.text = this.website.mansions[2].name;
      this.view.baseCostStrikethrough._visible = false;
      this.view.image._visible = false;
      this.view.customiseButton._visible = false;
      this.view.sidePanelBG._visible = false;
      this.view.imageFrame._visible = false;
      this.website.dataTextScope.push(this.view.customiseButton.btnTxt);
      this.website.dataTextScope.push(this.view.property0Button.btnTxt);
      this.website.dataTextScope.push(this.view.property1Button.btnTxt);
      this.website.dataTextScope.push(this.view.property2Button.btnTxt);
      this.view.customiseButton.disabled = this.website.activeMansion == null;
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(this.view.background._height);
      var _loc2_;
      if(this.website.activeMansion != null)
      {
         _loc2_ = 0;
         while(_loc2_ < this.website.mansions.length)
         {
            if(this.website.mansions[_loc2_] == this.website.activeMansion)
            {
               this.setSelectedMansion(_loc2_);
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "customiseButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_STYLE_PAGE.name);
            break;
         case "property0Button":
            this.setSelectedMansion(0);
            break;
         case "property1Button":
            this.setSelectedMansion(1);
            break;
         case "property2Button":
            this.setSelectedMansion(2);
         default:
            return;
      }
   }
   function handleLB()
   {
      this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_SPLASH_PAGE.name);
   }
   function handleRB()
   {
      if(this.website.activeMansion != null)
      {
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_STYLE_PAGE.name);
      }
   }
   function setSelectedMansion(index)
   {
      var _loc2_ = this.website.mansions[index];
      var _loc4_ = this.website.activeMansion != _loc2_;
      this.website.activeMansion = _loc2_;
      this.website.imageManager.addImage(_loc2_.txd,_loc2_.txn,this.view.image);
      this.view.title.text = _loc2_.name;
      this.view.location.text = _loc2_.location;
      this.view.description.text = _loc2_.description;
      if(_loc2_.isOwned)
      {
         this.view.buyFrom.text = "";
         this.view.baseCost.text = "";
         this.view.originalBaseCost.text = "";
         this.view.baseCostStrikethrough._visible = false;
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.customiseButton.btnTxt,"PLRE_RENOFROM");
         this.view.description._y = this.bodyTextRenovateY;
      }
      else
      {
         this.view.buyFrom.autoSize = "left";
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.buyFrom,"PLRE_BUYFROM");
         this.view.baseCost._x = this.view.buyFrom._x + this.view.buyFrom.textWidth + 10;
         this.view.originalBaseCost._x = this.view.baseCost._x;
         this.view.baseCostStrikethrough._x = this.view.originalBaseCost._x;
         _loc2_.applyFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.BASE_COST_INDEX,0,this.view.baseCost);
         if(_loc2_.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.BASE_COST_INDEX,0))
         {
            _loc2_.applyOriginalFormattedPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.BASE_COST_INDEX,0,this.view.originalBaseCost);
            this.view.baseCostStrikethrough._visible = true;
            this.view.baseCostStrikethrough._width = this.view.originalBaseCost.textWidth;
         }
         else
         {
            this.view.baseCostStrikethrough._visible = false;
            this.view.originalBaseCost.text = "";
         }
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.customiseButton.btnTxt,"PLRE_CUSTOMIZE");
         this.view.description._y = this.bodyTextBuyY;
      }
      this.view.customiseButton.disabled = false;
      this.view.customiseButton.btnTxt.textColor = 13409357;
      this.website.imageManager.addImage(_loc2_.txd,_loc2_.txn,this.view.image,false);
      this.view.image._visible = true;
      this.view.customiseButton._visible = true;
      this.view.sidePanelBG._visible = true;
      this.view.imageFrame._visible = true;
      this.view.pip0.gotoAndStop(index != 0 ? "off" : "on");
      this.view.pip1.gotoAndStop(index != 1 ? "off" : "on");
      this.view.pip2.gotoAndStop(index != 2 ? "off" : "on");
      if(_loc4_)
      {
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.resetBasket(_loc2_);
      }
   }
   function dispose()
   {
      super.dispose();
   }
}
