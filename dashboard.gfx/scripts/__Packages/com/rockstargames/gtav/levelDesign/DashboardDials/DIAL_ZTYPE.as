class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_ZTYPE extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var RPM_MIN_ROT;
   var RPM_MAX_ROT;
   var SPEED_MIN_ROT;
   var SPEED_MAX_ROT;
   var FUEL_MIN_ROT;
   var FUEL_MAX_ROT;
   var TEMP_MIN_ROT;
   var TEMP_MAX_ROT;
   var OIL_PRESSURE_MIN_ROT;
   var OIL_PRESSURE_MAX_ROT;
   var RPM_IS_CLOCKWISE;
   var SPEED_IS_CLOCKWISE;
   var FUEL_IS_CLOCKWISE;
   var TEMP_IS_CLOCKWISE;
   var OIL_PRESSURE_IS_CLOCKWISE;
   var TOP_SPEED;
   var _mcName = "ZTYPE";
   function DIAL_ZTYPE(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -130;
      this.RPM_MAX_ROT = 74;
      this.SPEED_MIN_ROT = -132;
      this.SPEED_MAX_ROT = 98;
      this.FUEL_MIN_ROT = -90;
      this.FUEL_MAX_ROT = -23;
      this.TEMP_MIN_ROT = -90;
      this.TEMP_MAX_ROT = -23;
      this.OIL_PRESSURE_MIN_ROT = -90;
      this.OIL_PRESSURE_MAX_ROT = -23;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_IS_CLOCKWISE = true;
      this.OIL_PRESSURE_IS_CLOCKWISE = true;
      this.TOP_SPEED = 200;
   }
}
