class com.rockstargames.gtav.levelDesign.islandHeistBoard.data.HeistDataItem
{
   var id;
   var parentID;
   var title;
   var description;
   var texture;
   var items;
   var historyID;
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
