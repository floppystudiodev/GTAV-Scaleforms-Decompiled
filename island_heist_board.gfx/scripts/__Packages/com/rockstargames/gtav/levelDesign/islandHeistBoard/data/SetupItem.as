class com.rockstargames.gtav.levelDesign.islandHeistBoard.data.SetupItem extends com.rockstargames.gtav.levelDesign.islandHeistBoard.data.HeistDataItem
{
   var denominator;
   var isComplete;
   var isMandatory;
   var locked;
   var numComplete;
   var numTotal;
   var numerator;
   var showDollar;
   function SetupItem(id, parentID, title, numComplete, numTotal, locked, isMandatory, description, texture, showDollar, numerator, denominator)
   {
      super(id,parentID,title,description,texture);
      this.numComplete = numComplete;
      this.numTotal = numTotal;
      this.locked = locked | 0;
      this.isMandatory = isMandatory;
      this.showDollar = showDollar;
      this.numerator = numerator;
      this.denominator = denominator;
      this.isComplete = numComplete == numTotal && numTotal > 0;
   }
}
