class com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button extends com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Target
{
   var view;
   static var STATE_AVAILABLE = 0;
   static var STATE_PAID = 1;
   static var STATE_SALVAGED = 2;
   static var STATE_OWNED = 3;
   static var STATE_IN_PROGRESS = 4;
   static var STATE_ACQUIRED = 5;
   static var STATE_SALVAGING = 6;
   static var STATE_UNAVAILABLE = 7;
   static var COLOR_RESET = new flash.geom.ColorTransform();
   static var COLOR_UNAVAILABLE = new flash.geom.ColorTransform(0,0,0,1,204,204,204,0);
   function Button(id, view)
   {
      super();
      var _loc5_ = view.getBounds(_root);
      this.init(id,_loc5_.xMin,_loc5_.xMax,_loc5_.yMin,_loc5_.yMax);
      this.view = view;
      view.vehicleName.verticalAlign = "center";
      view.paymentLabel.verticalAlign = "center";
      view.payment.verticalAlign = "center";
      view.salvageLabel.verticalAlign = "center";
      view.salvage.verticalAlign = "center";
      view.paidLabel.verticalAlign = "center";
      view.paid.verticalAlign = "center";
      view.ownedLabel.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(view.paymentLabel,"SVT_PAYMENT");
      com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(view.salvageLabel,"SVT_SALVAGE");
      com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(view.ownedLabel,"SVT_AVAILABLE");
      if(com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.IS_ASIAN)
      {
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.resizeAsianText(view.vehicleName);
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.resizeAsianText(view.paymentLabel);
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.resizeAsianText(view.payment);
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.resizeAsianText(view.salvageLabel);
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.resizeAsianText(view.salvage);
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.resizeAsianText(view.paidLabel);
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.resizeAsianText(view.paid);
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.resizeAsianText(view.ownedLabel);
      }
   }
   function setState(isOn)
   {
      this.view.gotoAndStop(!isOn ? "off" : "on");
   }
   function dispose()
   {
      this.view = null;
   }
   function show(name, value, txn, txd, salvageValue, state, ownable, imageManager)
   {
      this.view.vehicleName.text = name;
      this.view.payment.text = "$" + com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.formatNumber(value);
      this.view.salvage.text = "$" + com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.formatNumber(salvageValue);
      this.view.ownable._visible = ownable;
      if(state == com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button.STATE_UNAVAILABLE)
      {
         this.view.paymentLabel.textColor = 13421772;
         this.view.payment.textColor = 13421772;
         this.view.salvageLabel.textColor = 13421772;
         this.view.salvage.textColor = 13421772;
         this.view.frame.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button.COLOR_UNAVAILABLE;
         this.view.vehicleImageCover._visible = true;
      }
      else
      {
         this.view.paymentLabel.textColor = 0;
         this.view.payment.textColor = 1217302;
         this.view.salvageLabel.textColor = 0;
         this.view.salvage.textColor = 1217302;
         this.view.frame.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button.COLOR_RESET;
         this.view.vehicleImageCover._visible = false;
      }
      if(state == com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button.STATE_PAID)
      {
         this.view.paid.text = this.view.payment.text;
         this.view.paid._visible = true;
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(this.view.paidLabel,"SVT_PAID");
         this.view.paidLabel._visible = true;
         this.view.ownedLabel._visible = false;
         this.view.totalBackground.gotoAndStop(3);
      }
      else if(state == com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button.STATE_SALVAGED)
      {
         this.view.paid.text = this.view.salvage.text;
         this.view.paid._visible = true;
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(this.view.paidLabel,"SVT_SALVAGED");
         this.view.paidLabel._visible = true;
         this.view.ownedLabel._visible = false;
         this.view.totalBackground.gotoAndStop(3);
      }
      else if(state == com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button.STATE_UNAVAILABLE)
      {
         this.view.totalBackground.gotoAndStop(6);
      }
      else
      {
         this.view.paid._visible = false;
         this.view.paidLabel._visible = false;
         this.view.ownedLabel._visible = true;
         if(state == com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button.STATE_OWNED)
         {
            com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(this.view.ownedLabel,"SVT_OWNED");
            this.view.totalBackground.gotoAndStop(3);
         }
         else if(state == com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button.STATE_AVAILABLE)
         {
            com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(this.view.ownedLabel,"SVT_AVAILABLE");
            this.view.totalBackground.gotoAndStop(1);
         }
         else if(state == com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button.STATE_IN_PROGRESS)
         {
            com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(this.view.ownedLabel,"SVT_IN_PROGRESS");
            this.view.totalBackground.gotoAndStop(2);
         }
         else if(state == com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button.STATE_ACQUIRED)
         {
            com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(this.view.ownedLabel,"SVT_ACQUIRED");
            this.view.totalBackground.gotoAndStop(4);
         }
         else if(state == com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button.STATE_SALVAGING)
         {
            com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(this.view.ownedLabel,"SVT_SALVAGING");
            this.view.totalBackground.gotoAndStop(5);
         }
      }
      if(com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.IS_ASIAN)
      {
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.resizeAsianText(this.view.paidLabel);
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.resizeAsianText(this.view.paid);
         com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.resizeAsianText(this.view.ownedLabel);
      }
      imageManager.addImage(txd,txn,this.view.vehicleImage);
      this.view._visible = true;
      this.enabled = true;
   }
   function hide()
   {
      this.view._visible = false;
      this.enabled = false;
   }
   function get isShowing()
   {
      return this.view._visible;
   }
}
