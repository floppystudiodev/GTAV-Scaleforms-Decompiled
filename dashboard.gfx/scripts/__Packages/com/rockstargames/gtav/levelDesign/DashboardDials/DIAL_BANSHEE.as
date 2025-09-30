class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_BANSHEE extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var BOOST_IS_CLOCKWISE;
   var BOOST_MAX_ROT;
   var BOOST_MIN_ROT;
   var FUEL_IS_CLOCKWISE;
   var FUEL_MAX_ROT;
   var FUEL_MIN_ROT;
   var OIL_PRESSURE_IS_CLOCKWISE;
   var OIL_PRESSURE_MAX_ROT;
   var OIL_PRESSURE_MIN_ROT;
   var OIL_TEMP_IS_CLOCKWISE;
   var OIL_TEMP_MAX_ROT;
   var OIL_TEMP_MIN_ROT;
   var RPM_IS_CLOCKWISE;
   var RPM_MAX_ROT;
   var RPM_MIN_ROT;
   var SPEED_IS_CLOCKWISE;
   var SPEED_MAX_ROT;
   var SPEED_MIN_ROT;
   var TEMP_IS_CLOCKWISE;
   var TEMP_MAX_ROT;
   var TEMP_MIN_ROT;
   var TOP_SPEED;
   var _mcName = "BANSHEE";
   function DIAL_BANSHEE(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -154;
      this.RPM_MAX_ROT = 42;
      this.SPEED_MIN_ROT = -140;
      this.SPEED_MAX_ROT = 140;
      this.FUEL_MIN_ROT = -90;
      this.FUEL_MAX_ROT = -15;
      this.TEMP_MIN_ROT = -90;
      this.TEMP_MAX_ROT = -15;
      this.OIL_TEMP_MIN_ROT = -90;
      this.OIL_TEMP_MAX_ROT = -15;
      this.OIL_TEMP_IS_CLOCKWISE = true;
      this.BOOST_MIN_ROT = -90;
      this.BOOST_MAX_ROT = -10;
      this.BOOST_IS_CLOCKWISE = true;
      this.OIL_PRESSURE_MIN_ROT = -90;
      this.OIL_PRESSURE_MAX_ROT = -10;
      this.OIL_PRESSURE_IS_CLOCKWISE = true;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_IS_CLOCKWISE = true;
      this.TOP_SPEED = 200;
   }
}
