class com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Job
{
   static var VALUE_TYPE_HIDDEN = 0;
   static var VALUE_TYPE_CASH = 1;
   static var VALUE_TYPE_SECONDS = 2;
   var title = "";
   var value = 0;
   var tooltip = "";
   var salePrice = -1;
   var isAvailable = false;
   var valueType = com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Job.VALUE_TYPE_HIDDEN;
   function Job()
   {
   }
   function reset()
   {
      this.title = "";
      this.value = 0;
      this.tooltip = "";
      this.salePrice = -1;
      this.isAvailable = false;
      this.valueType = com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Job.VALUE_TYPE_HIDDEN;
   }
}
