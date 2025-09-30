class com.rockstargames.gtav.web.warstock.HackerDecalPage extends com.rockstargames.gtav.web.warstock.HackerPage
{
   var buttons;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   function HackerDecalPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_TINT_PAGE;
      if(this.website.purchasedHackerMissile != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_MISSILE_PAGE;
      }
      else if(this.website.purchasedHackerDrone != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DRONE_PAGE;
      }
      else if(this.website.purchasedHackerWeapon != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WEAPON_PAGE;
      }
      else if(this.website.purchasedHackerWorkshop != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WORKSHOP_PAGE;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_SUMMARY_PAGE;
      }
      if(this.website.hackerTint == -1)
      {
         this.website.hackerTint = 0;
      }
      if(this.website.hackerDecal == -1)
      {
         this.website.hackerDecal = 0;
      }
      this.setLocalisedText(this.view.description,"CANDC_HACKER_DEC_DESC_" + this.website.hackerDecal);
      this.website.imageManager.addImage("CANDC_HACKER","DECAL" + this.website.hackerDecal,this.view.image.tf);
      this.progressPanel.updateCosts();
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(1);
      this.progressPanel.enable();
      this.initButtons();
      this.view.decalButtons._y = this.view.description._y + this.view.description.textHeight + 40;
   }
   function initButtons()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 25)
      {
         _loc3_ = this.view.decalButtons["decalButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 1);
         _loc3_.highlight._visible = _loc2_ == this.website.hackerDecal;
         this.buttons.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
   }
   function handleClick(id, attribute)
   {
      var _loc4_;
      var _loc2_;
      var _loc3_;
      if(id == "decalButton")
      {
         _loc4_ = parseInt(attribute);
         this.website.hackerDecal = _loc4_;
         this.progressPanel.updateCosts();
         _loc2_ = 0;
         while(_loc2_ < 25)
         {
            _loc3_ = this.view.decalButtons["decalButton_" + _loc2_];
            _loc3_.highlight._visible = _loc2_ == this.website.hackerDecal;
            _loc2_ = _loc2_ + 1;
         }
      }
      this.setLocalisedText(this.view.description,"CANDC_HACKER_DEC_DESC_" + this.website.hackerDecal);
      this.website.imageManager.addImage("CANDC_HACKER","DECAL" + this.website.hackerDecal,this.view.image.tf);
   }
   function dispose()
   {
      super.dispose();
   }
}
