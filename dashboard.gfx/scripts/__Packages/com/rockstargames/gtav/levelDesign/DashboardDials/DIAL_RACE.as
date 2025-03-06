class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_RACE extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
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
   var OIL_TEMP_MIN_ROT;
   var OIL_TEMP_MAX_ROT;
   var OIL_TEMP_IS_CLOCKWISE;
   var BOOST_MIN_ROT;
   var BOOST_MAX_ROT;
   var BOOST_IS_CLOCKWISE;
   var VACUUM_MIN_ROT;
   var VACUUM_MAX_ROT;
   var VACUUM_IS_CLOCKWISE;
   var IS_DIAL;
   var TOP_SPEED;
   var _mcName = "RACE";
   function DIAL_RACE(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -124;
      this.RPM_MAX_ROT = 50;
      this.SPEED_MIN_ROT = -128;
      this.SPEED_MAX_ROT = 128;
      this.FUEL_MIN_ROT = -128;
      this.FUEL_MAX_ROT = 128;
      this.TEMP_MIN_ROT = -128;
      this.TEMP_MAX_ROT = 128;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = true;
      this.TEMP_IS_CLOCKWISE = true;
      this.OIL_TEMP_MIN_ROT = -128;
      this.OIL_TEMP_MAX_ROT = 128;
      this.OIL_TEMP_IS_CLOCKWISE = true;
      this.BOOST_MIN_ROT = -128;
      this.BOOST_MAX_ROT = 128;
      this.BOOST_IS_CLOCKWISE = true;
      this.VACUUM_MIN_ROT = -120;
      this.VACUUM_MAX_ROT = 110;
      this.VACUUM_IS_CLOCKWISE = true;
      this.IS_DIAL = true;
      this.TOP_SPEED = 180;
   }
}
