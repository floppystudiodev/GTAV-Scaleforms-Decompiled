class com.rockstargames.gtav.web.warstock.TruckSummaryPage extends com.rockstargames.gtav.web.warstock.TruckPage
{
   var buttons;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   function TruckSummaryPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_COLOUR_PAGE;
      var _loc4_ = com.rockstargames.gtav.web.warstock.TruckPage.MODULE_DATA;
      var _loc5_ = [];
      var _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         if(_loc4_[_loc3_].type == this.website.truckModule1)
         {
            _loc5_[0] = _loc4_[_loc3_].label;
         }
         if(_loc4_[_loc3_].type == this.website.truckModule2)
         {
            _loc5_[1] = _loc4_[_loc3_].label;
         }
         if(_loc4_[_loc3_].type == this.website.truckModule3)
         {
            _loc5_[2] = _loc4_[_loc3_].label;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc5_[1] == undefined)
      {
         _loc5_[1] = _loc5_[0];
      }
      if(_loc5_[2] == undefined)
      {
         _loc5_[2] = _loc5_[1];
      }
      this.setLocalisedText(this.view.title,"CANDC_TRUCK_SUMMARY",true);
      this.setLocalisedText(this.view.cabLabel,"CANDC_TRUCK_CAB",true);
      this.setLocalisedText(this.view.cab,"CANDC_TRUCK_CAB_" + (this.website.truckCab + 1),true);
      this.setLocalisedText(this.view.location1Label,"CANDC_MODULE_1",true);
      if(_loc5_[0])
      {
         this.setLocalisedText(this.view.location1,_loc5_[0],true);
      }
      this.setLocalisedText(this.view.location2Label,"CANDC_MODULE_2",true);
      if(_loc5_[1])
      {
         this.setLocalisedText(this.view.location2,_loc5_[1],true);
      }
      this.setLocalisedText(this.view.location3Label,"CANDC_MODULE_3",true);
      if(_loc5_[2])
      {
         this.setLocalisedText(this.view.location3,_loc5_[2],true);
      }
      this.setLocalisedText(this.view.colourLabel,"CANDC_COLOR",true);
      var _loc6_ = com.rockstargames.gtav.web.warstock.TruckColourPage.TINT_OFFSETS.length - 1;
      while(_loc6_ > 0)
      {
         if(this.website.truckColour >= com.rockstargames.gtav.web.warstock.TruckColourPage.TINT_OFFSETS[_loc6_])
         {
            break;
         }
         _loc6_ = _loc6_ - 1;
      }
      this.setLocalisedText(this.view.colour,"CANDC_TRUCK_COLOUR_" + (_loc6_ + 1),true);
      var _loc7_ = com.rockstargames.gtav.web.warstock.TruckColourPage.TINTS[this.website.truckColour];
      var _loc9_ = _loc7_ >> 16 & 0xFF;
      var _loc10_ = _loc7_ >> 8 & 0xFF;
      var _loc8_ = _loc7_ & 0xFF;
      this.view.tint.swatch.transform.colorTransform = new flash.geom.ColorTransform(1,1,1,1,_loc9_,_loc10_,_loc8_,0);
      this.view.tint.outline._visible = _loc7_ == 0;
      this.view.buyButton.label.text = this.setLocalisedText(this.view.buyButton.label,"CANDC_BUY_TRUCK",true) + ": $" + this.website.formatNumber(this.progressPanel.total);
      this.buttons.push(this.view.buyButton.btnTxt);
      this.progressPanel.updateCosts();
      this.progressPanel.hideBuyButton();
      this.progressPanel.setActiveStep(5);
      if(this.website.truckCab == this.website.purchasedTruckCab && this.website.truckModule1 == this.website.purchasedTruckModule1 && this.website.truckModule2 == this.website.purchasedTruckModule2 && this.website.truckModule3 == this.website.purchasedTruckModule3 && this.website.truckColour == this.website.purchasedTruckColour)
      {
         this.view.buyButton.disabled = true;
         this.view.buyButton._alpha = 50;
      }
   }
   function handleClick(id, attribute)
   {
      if(id == "buyButton")
      {
         this.website.dispatchPlayerTruckSelections();
      }
   }
}
