class com.rockstargames.gtav.levelDesign.nightclub.structs.Stock
{
   var sellPrice;
   var currLevel;
   var maxLevel;
   function Stock()
   {
      this.sellPrice = 0;
      this.currLevel = 0;
      this.maxLevel = 0;
   }
   function get canSell()
   {
      return this.sellPrice > 0;
   }
}
