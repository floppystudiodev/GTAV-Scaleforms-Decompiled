class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_FELTZER extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var RPM_MIN_ROT;
   var RPM_MAX_ROT;
   var SPEED_MIN_ROT;
   var SPEED_MAX_ROT;
   var FUEL_MIN_ROT;
   var FUEL_MAX_ROT;
   var TEMP_MIN_ROT;
   var TEMP_MAX_ROT;
   var RPM_IS_CLOCKWISE;
   var SPEED_IS_CLOCKWISE;
   var FUEL_IS_CLOCKWISE;
   var TEMP_IS_CLOCKWISE;
   var TOP_SPEED;
   var _mcName = "FELTZER";
   function DIAL_FELTZER(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -130;
      this.RPM_MAX_ROT = 91;
      this.SPEED_MIN_ROT = -130;
      this.SPEED_MAX_ROT = 130;
      this.FUEL_MIN_ROT = 43;
      this.FUEL_MAX_ROT = 136;
      this.TEMP_MIN_ROT = -133;
      this.TEMP_MAX_ROT = -45;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = false;
      this.TEMP_IS_CLOCKWISE = true;
      this.TOP_SPEED = 200;
   }
}
