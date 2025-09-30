class com.rockstargames.gtav.levelDesign.DashboardDials.DIAL_GENTAXI extends com.rockstargames.gtav.levelDesign.DashboardDials.BaseVehicleDashboard
{
   var FUEL_IS_CLOCKWISE;
   var FUEL_MAX_ROT;
   var FUEL_MIN_ROT;
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
   var _mcName = "GENTAXI";
   function DIAL_GENTAXI(mc)
   {
      super(mc);
      mc._height = 256;
      mc._width = 512;
      this.RPM_MIN_ROT = -140;
      this.RPM_MAX_ROT = 104;
      this.SPEED_MIN_ROT = -130;
      this.SPEED_MAX_ROT = 110;
      this.FUEL_MIN_ROT = 40;
      this.FUEL_MAX_ROT = 120;
      this.TEMP_MIN_ROT = -122;
      this.TEMP_MAX_ROT = -40;
      this.RPM_IS_CLOCKWISE = true;
      this.SPEED_IS_CLOCKWISE = true;
      this.FUEL_IS_CLOCKWISE = false;
      this.TEMP_IS_CLOCKWISE = true;
      this.TOP_SPEED = 170;
   }
}
