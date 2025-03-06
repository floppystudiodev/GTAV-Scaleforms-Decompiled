class com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   static var DEFAULT_COLOUR = "000000";
   static var DEFAULT_FONT = "$Font2";
   static var COLOURS = ["000000","9B9B9B","F0F0F0","EA991C","E03232","359A47","F0C850","2D6EB9"];
   static var FONTS = ["$Machine","$Stencil","$Lubalin","$Bookman","$Stenberg","$Mistral","$HelveticaBLK","$HelveticaBLKI","$Times","$TradeGothic","$AnnaSC","$EngraversOldEnglish","$Bauhaus"];
   function CLUBHOUSE_NAME()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SET_CLUBHOUSE_NAME(str, colourIndex, fontIndex)
   {
      trace("SET_CLUBHOUSE_NAME");
      var _loc2_ = this.CONTENT.clubhouse_name;
      _loc2_.textAutoSize = "fit";
      _loc2_.verticalAlign = "center";
      var _loc5_ = typeof colourIndex == "number" ? com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.COLOURS[colourIndex] : com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.DEFAULT_COLOUR;
      var _loc4_ = !(typeof fontIndex != "number" || fontIndex < 0) ? com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.FONTS[fontIndex] : com.rockstargames.gtav.levelDesign.CLUBHOUSE_NAME.DEFAULT_FONT;
      _loc2_.htmlText = "<font face=\'" + _loc4_ + "\' color=\'#" + _loc5_ + "\'>" + str + "</font>";
   }
}
