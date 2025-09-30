class com.rockstargames.gtav.FrontendGen9.components.StickerTypeData
{
   var colourData;
   var iconID;
   var type = 1;
   static var ICON_TYPE = 1;
   static var TEXT_TYPE = 2;
   static var ICON_AND_TEXT_TYPE = 3;
   static var NO_ICON = 0;
   static var PRIMARY_ICON = 1;
   static var SECONDARY_ICON = 2;
   static var TERTIARY_ICON = 3;
   static var BLUE_PLATFORM_ICON = 4;
   static var PURPLE_PLATFORM_ICON = 5;
   static var TICK_ICON = 6;
   static var LOCK_ICON = 7;
   static var NON_MEMBER = 30;
   static var WHITE_NON_MEMBER = 31;
   static var GOLD_MEMBER = 32;
   function StickerTypeData(colour, iconFrameID, iconTextType)
   {
      this.colourData = colour;
      this.iconID = iconFrameID;
      this.type = iconTextType;
   }
}
