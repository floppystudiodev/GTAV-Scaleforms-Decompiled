class com.rockstargames.gtav.web.warstock.ChopperInteriorPage extends com.rockstargames.gtav.web.warstock.ChopperPage
{
   var buttons;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   static var SWATCH_COLOURS = [5131854,12474138,10367156,3569937,957616,11930989,11842740,2828584,15050775];
   function ChopperInteriorPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.prevPageName = "PAGE1";
      if(this.website.purchasedChopperTurret != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TURRET_PAGE;
      }
      else if(this.website.purchasedChopperVehicle != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_VEHICLE_PAGE;
      }
      else if(this.website.purchasedChopperWeapon != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_WEAPON_PAGE;
      }
      else if(this.website.purchasedChopperTerminal != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TERMINAL_PAGE;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_SUMMARY_PAGE;
      }
      if(this.website.chopperInterior == -1)
      {
         this.website.chopperInterior = 0;
      }
      this.setLocalisedText(this.view.description,"CANDC_CHOPPER_INT_DESC_" + this.website.chopperInterior);
      this.website.imageManager.addImage("CANDC_CHOPPER","interior_" + this.website.chopperInterior,this.view.image.tf);
      this.progressPanel.updateCosts();
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(0);
      this.progressPanel.enable();
      this.initButtons();
   }
   function initButtons()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 9)
      {
         _loc3_ = this.view.interiorButtons["interiorButton_" + _loc2_];
         _loc3_.highlight._visible = _loc2_ == this.website.chopperInterior;
         this.tintButtonSwatch(_loc3_,com.rockstargames.gtav.web.warstock.ChopperInteriorPage.SWATCH_COLOURS[_loc2_]);
         this.buttons.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
   }
   function tintButtonSwatch(button, colour)
   {
      var _loc3_ = colour >> 16 & 0xFF;
      var _loc4_ = colour >> 8 & 0xFF;
      var _loc2_ = colour & 0xFF;
      button.swatch.transform.colorTransform = new flash.geom.ColorTransform(1,1,1,1,_loc3_,_loc4_,_loc2_,0);
      button.outline._visible = colour == 0;
   }
   function handleClick(id, attribute)
   {
      var _loc4_;
      var _loc2_;
      var _loc3_;
      if(id == "interiorButton")
      {
         _loc4_ = parseInt(attribute);
         this.website.chopperInterior = _loc4_;
         this.progressPanel.updateCosts();
         _loc2_ = 0;
         while(_loc2_ < 9)
         {
            _loc3_ = this.view.interiorButtons["interiorButton_" + _loc2_];
            _loc3_.highlight._visible = _loc2_ == this.website.chopperInterior;
            _loc2_ = _loc2_ + 1;
         }
      }
      this.setLocalisedText(this.view.description,"CANDC_CHOPPER_INT_DESC_" + this.website.chopperInterior);
      this.website.imageManager.addImage("CANDC_CHOPPER","interior_" + this.website.chopperInterior,this.view.image.tf);
   }
   function dispose()
   {
      super.dispose();
   }
}
