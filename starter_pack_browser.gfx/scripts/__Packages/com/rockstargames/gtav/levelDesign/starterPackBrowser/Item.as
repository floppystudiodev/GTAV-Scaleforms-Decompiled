class com.rockstargames.gtav.levelDesign.starterPackBrowser.Item
{
   static var CAT_PROPERTY = 0;
   static var CAT_VEHICLES = 1;
   static var CAT_WEAPONS = 2;
   static var CAT_OUTFITS = 3;
   static var CAT_TATTOOS = 4;
   static var SUBCAT_NONE = -1;
   var id = -1;
   var category = -1;
   var subCategory = -1;
   var title = "";
   var description = "";
   var textureDictionary = "";
   var texture = "";
   var thumbTextureDictionary = "";
   var thumbTexture = "";
   var link = "";
   var equipped = false;
   function Item()
   {
   }
   function setData(id, category, subCategory, title, description, textureDictionary, texture, thumbTextureDictionary, thumbTexture, link, equipped)
   {
      this.id = id;
      this.category = category;
      this.subCategory = subCategory;
      this.title = title;
      this.description = description;
      this.textureDictionary = textureDictionary;
      this.texture = texture;
      this.thumbTextureDictionary = thumbTextureDictionary;
      this.thumbTexture = thumbTexture;
      this.link = link;
      this.equipped = equipped;
   }
}
