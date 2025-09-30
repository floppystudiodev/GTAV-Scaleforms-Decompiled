class com.rockstargames.gtav.levelDesign.islandHeistBoard.data.HeistDataItem
{
   var description;
   var historyID;
   var id;
   var items;
   var parentID;
   var texture;
   var title;
   function HeistDataItem(id, parentID, title, description, texture)
   {
      this.id = id;
      this.parentID = parentID;
      this.title = title;
      this.description = description;
      this.texture = texture;
      this.items = [];
      this.historyID = -1;
   }
}
