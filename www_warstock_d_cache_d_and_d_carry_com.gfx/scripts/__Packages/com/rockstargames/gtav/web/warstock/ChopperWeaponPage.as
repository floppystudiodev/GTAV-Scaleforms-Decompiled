class com.rockstargames.gtav.web.warstock.ChopperWeaponPage extends com.rockstargames.gtav.web.warstock.ChopperPage
{
   var buttons;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var setLocalisedText;
   var view;
   var website;
   function ChopperWeaponPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      if(this.website.purchasedChopperVehicle != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_VEHICLE_PAGE;
      }
      else if(this.website.purchasedChopperTurret != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TURRET_PAGE;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_INTERIOR_PAGE;
      }
      if(this.website.purchasedChopperTerminal != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TERMINAL_PAGE;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_SUMMARY_PAGE;
      }
      this.website.imageManager.addImage("CANDC_CHOPPER","weapon",this.view.image.tf);
      this.progressPanel.updateCosts();
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(3);
      this.progressPanel.enable();
      this.setLocalisedText(this.view.description,"CANDC_CHOPPER_W_MOD_DESC");
      var _loc3_ = this.view.selection;
      this.setLocalisedText(_loc3_.btnTxt,"CANDC_CHOPPER_W_MOD");
      _loc3_.gotoAndStop(this.website.chopperWeapon != 1 ? "unselected" : "selected");
      if(this.website.purchasedChopperWeapon != 1)
      {
         this.buttons.push(_loc3_.btnTxt);
      }
   }
   function handleClick(id, attribute)
   {
      var _loc2_;
      if(id == "selection")
      {
         _loc2_ = this.view.selection;
         if(this.website.chopperWeapon == 1)
         {
            this.website.chopperWeapon = 0;
            _loc2_.gotoAndStop("unselected");
         }
         else
         {
            this.website.chopperWeapon = 1;
            _loc2_.gotoAndStop("selected");
         }
         this.progressPanel.updateCosts();
      }
   }
   function dispose()
   {
      super.dispose();
   }
}
