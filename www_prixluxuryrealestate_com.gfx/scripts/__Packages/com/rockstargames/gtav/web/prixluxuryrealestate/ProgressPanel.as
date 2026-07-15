class com.rockstargames.gtav.web.prixluxuryrealestate.ProgressPanel
{
   var view;
   function ProgressPanel(view, website, step)
   {
      this.view = view;
      this.init(website,step);
   }
   function init(website, step)
   {
      var _loc3_ = website.activeMansion;
      website.imageManager.addImage(_loc3_.txd,_loc3_.txn,this.view.image);
      this.view.name.text = _loc3_.name;
      this.view.location.text = _loc3_.location;
      this.view.strikethrough._visible = false;
      this.view.steps.step0Button.offColour = 16777215;
      this.view.steps.step1Button.offColour = 16777215;
      this.view.steps.step2Button.offColour = 16777215;
      this.view.steps.step3Button.offColour = 16777215;
      this.view.steps.step4Button.offColour = 16777215;
      this.view.steps.step0Button.onColour = 13409357;
      this.view.steps.step1Button.onColour = 13409357;
      this.view.steps.step2Button.onColour = 13409357;
      this.view.steps.step3Button.onColour = 13409357;
      this.view.steps.step4Button.onColour = 13409357;
      this.view.priceLabel.autoSize = "left";
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.priceLabel,"PLRE_TOTAL");
      this.view.price._x = this.view.priceLabel._x + this.view.priceLabel.textWidth + 10;
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.steps.step0Button.btnTxt,"PLRE_STEP0");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.steps.step1Button.btnTxt,"PLRE_STEP1");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.steps.step2Button.btnTxt,"PLRE_STEP2");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.steps.step3Button.btnTxt,"PLRE_STEP3");
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.steps.step4Button.btnTxt,"PLRE_STEP4");
      if(step != 0)
      {
         website.dataTextScope.push(this.view.steps.step0Button.btnTxt);
      }
      if(step != 1)
      {
         website.dataTextScope.push(this.view.steps.step1Button.btnTxt);
      }
      if(step != 2)
      {
         website.dataTextScope.push(this.view.steps.step2Button.btnTxt);
      }
      if(step != 3)
      {
         website.dataTextScope.push(this.view.steps.step3Button.btnTxt);
      }
      if(step != 4)
      {
         website.dataTextScope.push(this.view.steps.step4Button.btnTxt);
      }
      this.view.steps.pips.gotoAndStop(step + 1);
   }
   function updateTotalCost(m)
   {
      var _loc5_ = 0;
      var _loc4_ = 0;
      var _loc3_ = false;
      if(!m.isOwned)
      {
         _loc5_ += m.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.BASE_COST_INDEX,0);
         _loc3_ = m.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.BASE_COST_INDEX,0) || _loc3_;
         _loc4_ += m.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.BASE_COST_INDEX,0);
      }
      if(!m.isOwned || m.purchasedTint != com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint)
      {
         _loc5_ += m.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint);
         _loc3_ = m.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint) || _loc3_;
         _loc4_ += m.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint);
      }
      if(!m.isOwned || m.purchasedPattern != com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern)
      {
         _loc5_ += m.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern);
         _loc3_ = m.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern) || _loc3_;
         _loc4_ += m.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern);
      }
      if(!m.isOwned || m.purchasedDecor != com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor)
      {
         _loc5_ += m.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor);
         _loc3_ = m.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor) || _loc3_;
         _loc4_ += m.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor);
      }
      if(!m.isOwned || m.purchasedAI != com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai)
      {
         _loc5_ += m.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai);
         _loc3_ = m.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai) || _loc3_;
         _loc4_ += m.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX,com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory == 1 && !(m.isOwned && m.purchasedArmory == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory))
      {
         _loc5_ += m.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARMORY_INDEX,0);
         _loc3_ = m.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARMORY_INDEX,0) || _loc3_;
         _loc4_ += m.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARMORY_INDEX,0);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade == 1 && !(m.isOwned && m.purchasedArcade == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade))
      {
         _loc5_ += m.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARCADE_INDEX,0);
         _loc3_ = m.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARCADE_INDEX,0) || _loc3_;
         _loc4_ += m.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARCADE_INDEX,0);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium == 1 && !(m.isOwned && m.purchasedPodium == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium))
      {
         _loc5_ += m.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PODIUM_INDEX,0);
         _loc3_ = m.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PODIUM_INDEX,0) || _loc3_;
         _loc4_ += m.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PODIUM_INDEX,0);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop == 1 && !(m.isOwned && m.purchasedWorkshop == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop))
      {
         _loc5_ += m.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.WORKSHOP_INDEX,0);
         _loc3_ = m.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.WORKSHOP_INDEX,0) || _loc3_;
         _loc4_ += m.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.WORKSHOP_INDEX,0);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio == 1 && !(m.isOwned && m.purchasedArtStudio == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio))
      {
         _loc5_ += m.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ART_STUDIO_INDEX,0);
         _loc3_ = m.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ART_STUDIO_INDEX,0) || _loc3_;
         _loc4_ += m.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ART_STUDIO_INDEX,0);
      }
      if(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security == 1 && !(m.isOwned && m.purchasedSecurity == com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security))
      {
         _loc5_ += m.getPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.SECURITY_INDEX,0);
         _loc3_ = m.getPriceIsOnSale(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.SECURITY_INDEX,0) || _loc3_;
         _loc4_ += m.getOriginalPrice(com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.SECURITY_INDEX,0);
      }
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc5_,this.view.price);
      if(_loc3_)
      {
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(_loc4_,this.view.originalPrice);
         this.view.strikethrough._visible = true;
         this.view.strikethrough._width = this.view.originalPrice.textWidth;
      }
      else
      {
         this.view.originalPrice.text = "";
         this.view.strikethrough._visible = false;
      }
      this.view.originalPrice._x = this.view.price._x + this.view.price.textWidth + 10;
      this.view.strikethrough._x = this.view.originalPrice._x;
   }
   function dispose()
   {
      this.view.removeMovieClip();
      this.view = null;
   }
}
