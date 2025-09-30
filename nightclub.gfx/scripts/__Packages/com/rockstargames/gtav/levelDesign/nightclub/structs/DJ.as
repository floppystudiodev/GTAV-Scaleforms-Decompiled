class com.rockstargames.gtav.levelDesign.nightclub.structs.DJ
{
   var cost;
   var isMale;
   var isSolo;
   var name;
   var saleCost;
   var state;
   var texture;
   var textureDictionary;
   static var STATE_UNAVAILABLE = 0;
   static var STATE_BOOK = 1;
   static var STATE_COLLECT = 2;
   static var STATE_AVAILABLE = 3;
   static var STATE_RESIDENT = 4;
   function DJ()
   {
      this.state = com.rockstargames.gtav.levelDesign.nightclub.structs.DJ.STATE_UNAVAILABLE;
      this.name = "";
      this.cost = 0;
      this.saleCost = -1;
      this.textureDictionary = "";
      this.texture = "";
      this.isMale = true;
      this.isSolo = true;
   }
   function get isOnSale()
   {
      return this.saleCost >= 0 && this.cost > this.saleCost;
   }
   function get isAvailable()
   {
      return this.state != com.rockstargames.gtav.levelDesign.nightclub.structs.DJ.STATE_UNAVAILABLE;
   }
}
