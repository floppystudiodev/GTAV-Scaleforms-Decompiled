class com.rockstargames.gtav.levelDesign.islandHeistBoard.data.FinaleItem extends com.rockstargames.gtav.levelDesign.islandHeistBoard.data.HeistDataItem
{
   var isSelected;
   var locked;
   var showDollar;
   function FinaleItem(id, parentID, title, isSelected, description, texture, locked, showDollar)
   {
      super(id,parentID,title,description,texture);
      this.isSelected = isSelected;
      this.locked = locked | 0;
      this.showDollar = showDollar === true;
   }
}
