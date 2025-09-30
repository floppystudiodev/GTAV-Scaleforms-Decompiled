class com.rockstargames.gtav.levelDesign.DashboardDials.AIRCRAFT_DIALS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var currentDials;
   function AIRCRAFT_DIALS()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.currentDials = new com.rockstargames.gtav.levelDesign.DashboardDials.BaseAircraftDial(this.CONTENT);
   }
   function SET_DASHBOARD_DIALS(fuel, temp, oilPressure, battery, fuelPSI, airSpeed, verticleAirSpeed, compass, roll, pitch, alt_small, alt_large)
   {
      this.CONTENT.DIALS.fuel_dialMC._rotation = this.getDialAngle(this.currentDials.FUEL_MIN_ROT,this.currentDials.FUEL_MAX_ROT,fuel,this.currentDials.FUEL_IS_CLOCKWISE);
      this.CONTENT.DIALS.templ_dialMC._rotation = this.getDialAngle(this.currentDials.TEMP_MIN_ROT,this.currentDials.TEMP_MAX_ROT,temp / 120,this.currentDials.TEMP_IS_CLOCKWISE);
      this.CONTENT.DIALS.oilpressure_dialMC._rotation = this.getDialAngle(this.currentDials.OIL_PRES_MIN_ROT,this.currentDials.OIL_PRES_MAX_ROT,oilPressure / 100,this.currentDials.OIL_IS_CLOCKWISE);
      this.CONTENT.DIALS.battery_dialMC._rotation = this.getDialAngle(this.currentDials.BATTERY_MIN_ROT,this.currentDials.BATTERY_MAX_ROT,battery,this.currentDials.BATTERY_IS_CLOCKWISE);
      this.CONTENT.DIALS.fuelpsi_dialMC._rotation = this.getDialAngle(this.currentDials.FUEL_PSI_MIN_ROT,this.currentDials.FUEL_PSI_MAX_ROT,fuelPSI / 100,this.currentDials.FUEL_PSI_IS_CLOCKWISE);
      this.CONTENT.DIALS.speedo_dialMC._rotation = this.getDialAngle(this.currentDials.AIR_SPEED_MIN_ROT,this.currentDials.AIR_SPEED_MAX_ROT,airSpeed,this.currentDials.AIR_SPEED_IS_CLOCKWISE);
      this.CONTENT.DIALS.verticalspeed_dialMC._rotation = this.getDialAngle(this.currentDials.VERT_AIR_SPEED_MIN_ROT,this.currentDials.VERT_AIR_SPEED_MAX_ROT,verticleAirSpeed / 4,this.currentDials.VERT_AIR_SPEED_IS_CLOCKWISE);
      this.CONTENT.DIALS.altitude_small_dialMC._rotation = this.getDialAngle(this.currentDials.ALTI_SM_MIN_ROT,this.currentDials.ALTI_SM_MAX_ROT,alt_small,this.currentDials.ALTI_SM_IS_CLOCKWISE);
      this.CONTENT.DIALS.altitude_big_dialMC._rotation = this.getDialAngle(this.currentDials.ALTI_BIG_MIN_ROT,this.currentDials.ALTI_BIG_MAX_ROT,alt_large,this.currentDials.ALTI_BIG_IS_CLOCKWISE);
      this.CONTENT.DIALS.compass_dialMC._rotation = this.getDialAngle(0,360,compass,false);
      this.CONTENT.DIALS.pitch_dialMC.INDICATOR._y = 20 * Math.sin(6.283185307179586 * pitch);
      this.CONTENT.DIALS.roll_dialMC._rotation = this.getDialAngle(360,0,roll + 0.5,false);
   }
   function SET_DASHBOARD_LIGHTS(gearUp, gearDown, breach)
   {
      this.CONTENT.DIALS.gear_upMC.gotoAndStop(Number(gearUp) + 1);
      this.CONTENT.DIALS.gear_downMC.gotoAndStop(Number(gearDown) + 1);
      this.CONTENT.DIALS.breach.gotoAndStop(Number(breach) + 1);
   }
   function SET_AIRCRAFT_HUD(airTXT, fuelTXT, oilTXT, vacuumTXT)
   {
      this.CONTENT.DIALS.dialTxt.airTXT.text = airTXT;
      this.CONTENT.DIALS.dialTxt.fuelTXT.text = fuelTXT;
      this.CONTENT.DIALS.dialTxt.oilTXT.text = oilTXT;
      this.CONTENT.DIALS.dialTxt.vacuumTXT.text = vacuumTXT;
   }
   function getDialAngle(minRot, maxRot, scale, isClockwise)
   {
      scale *= 100;
      if(isClockwise == undefined)
      {
         isClockwise = true;
      }
      var _loc4_ = -1;
      var _loc3_ = -1;
      var _loc1_ = minRot;
      var _loc2_ = maxRot;
      if(!isClockwise)
      {
         _loc1_ = maxRot;
         _loc2_ = minRot;
      }
      if(_loc1_ < 0 && _loc2_ < 0)
      {
         _loc3_ = Math.abs(_loc1_) - Math.abs(_loc2_);
         _loc4_ = minRot + _loc3_ / 100 * scale;
      }
      if(_loc1_ < 0 && _loc2_ >= 0)
      {
         _loc3_ = Math.abs(_loc1_) + _loc2_;
         _loc4_ = minRot + _loc3_ / 100 * scale;
      }
      if(_loc1_ >= 0 && _loc2_ >= 0)
      {
         _loc3_ = _loc2_ - _loc1_;
         _loc4_ = _loc1_ + _loc3_ / 100 * scale;
      }
      return _loc4_;
   }
   function percFromRad(input)
   {
      var _loc1_ = (input + 3.141592653589793) / 6.283185307179586;
      return _loc1_;
   }
   function debug()
   {
      this.SET_DASHBOARD_DIALS(1,1,0,1,1,0,0.5,0.1,1,1,0.5,0.75);
      this.SET_DASHBOARD_LIGHTS(false,true,false);
      this.SET_AIRCRAFT_HUD(123,456,789,1011);
   }
}
