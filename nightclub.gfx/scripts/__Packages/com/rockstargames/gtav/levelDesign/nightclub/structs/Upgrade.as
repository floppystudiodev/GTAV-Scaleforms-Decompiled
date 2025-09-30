class com.rockstargames.gtav.levelDesign.nightclub.structs.Upgrade
{
   var availability;
   var cost;
   var saleCost;
   static var LOCKED = 0;
   static var AVAILABLE = 1;
   static var PURCHASED = 2;
   function Upgrade()
   {
      this.cost = 0;
      this.saleCost = -1;
      this.availability = com.rockstargames.gtav.levelDesign.nightclub.structs.Upgrade.LOCKED;
   }
   function get isOnSale()
   {
      return this.saleCost >= 0 && this.cost > this.saleCost;
   }
}
