class com.rockstargames.gtav.levelDesign.islandHeistBoard.data.MapIcon
{
   var finaleItemID;
   var iconID;
   var isWorldCoordinates;
   var mapID;
   var setupItemID;
   var x;
   var y;
   function MapIcon(setupItemID, finaleItemID, iconID, mapID, x, y, isWorldCoordinates)
   {
      this.setupItemID = setupItemID;
      this.finaleItemID = finaleItemID;
      this.iconID = iconID;
      this.mapID = mapID;
      this.x = x;
      this.y = y;
      this.isWorldCoordinates = isWorldCoordinates;
   }
}
