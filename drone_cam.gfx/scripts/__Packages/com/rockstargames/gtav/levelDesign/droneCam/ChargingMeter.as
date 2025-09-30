class com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter
{
   var isCharging;
   var value;
   var view;
   static var CHARGING_COLOR_TRANSFORM = new flash.geom.ColorTransform(0,0,0,1,153,0,0,0);
   static var READY_COLOR_TRANSFORM = new flash.geom.ColorTransform(0,0,0,1,0,153,51,0);
   static var TITLE_LETTER_SPACING = 3;
   static var STATE_LETTER_SPACING = 2;
   var readyLabel = "DRONE_READY";
   var chargingLabel = "DRONE_CHARGING";
   var drainingLabel = "DRONE_DRAINING";
   var altReady = "";
   function ChargingMeter(view, visible, title, chargingLabel, drainingLabel, readyLabel)
   {
      this.view = view;
      this.visible = visible;
      if(chargingLabel != undefined)
      {
         this.chargingLabel = chargingLabel;
      }
      if(drainingLabel != undefined)
      {
         this.drainingLabel = drainingLabel;
      }
      if(readyLabel != undefined)
      {
         this.readyLabel = readyLabel;
      }
      this.init(title);
   }
   function init(title)
   {
      this.view.title.verticalAlign = "center";
      this.view.state.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.title,title,com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter.TITLE_LETTER_SPACING);
      this.chargePercent = 0;
   }
   function set visible(isVisible)
   {
      this.view._visible = isVisible;
   }
   function set chargePercent(percent)
   {
      var _loc2_ = percent >= 0 ? (percent <= 100 ? Math.round(percent) : 100) : 0;
      var _loc3_;
      if(_loc2_ != this.value)
      {
         if(_loc2_ == 0)
         {
            this.view.state.text = "";
            this.isCharging = false;
         }
         else if(_loc2_ == 100)
         {
            if(this.altReady.length > 0)
            {
               this.view.state.text = this.altReady;
               _loc3_ = this.view.state.getNewTextFormat();
               _loc3_.letterSpacing = com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter.STATE_LETTER_SPACING;
               this.view.state.setTextFormat(_loc3_);
            }
            else
            {
               com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.state,this.readyLabel,com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter.STATE_LETTER_SPACING);
            }
            this.view.bar.transform.colorTransform = com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter.READY_COLOR_TRANSFORM;
            this.isCharging = true;
         }
         else if(_loc2_ > this.value && !this.isCharging)
         {
            com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.state,this.chargingLabel,com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter.STATE_LETTER_SPACING);
            this.view.bar.transform.colorTransform = com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter.CHARGING_COLOR_TRANSFORM;
            this.isCharging = true;
         }
         else if(_loc2_ < this.value && this.isCharging)
         {
            com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.state,this.drainingLabel,com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter.STATE_LETTER_SPACING);
            this.view.bar.transform.colorTransform = com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter.CHARGING_COLOR_TRANSFORM;
            this.isCharging = false;
         }
      }
      this.view.bar._xscale = this.value = _loc2_;
   }
   function overrideReadyLabel(altReady)
   {
      this.altReady = altReady;
      var _loc2_;
      if(this.view.bar._xscale == 100)
      {
         if(altReady.length > 0)
         {
            this.view.state.text = altReady;
            _loc2_ = this.view.state.getNewTextFormat();
            _loc2_.letterSpacing = com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter.STATE_LETTER_SPACING;
            this.view.state.setTextFormat(_loc2_);
         }
         else
         {
            com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.state,this.readyLabel,com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter.STATE_LETTER_SPACING);
         }
      }
   }
}
