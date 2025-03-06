class com.rockstargames.gtav.levelDesign.YACHT_NAME extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   function YACHT_NAME()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SET_YACHT_NAME(str, isWhiteText, country)
   {
      var _loc2_ = this.CONTENT.yacht_name;
      var _loc3_ = this.CONTENT.yacht_country;
      _loc2_.textAutoSize = "shrink";
      _loc3_.textAutoSize = "shrink";
      if(country == undefined)
      {
         country = "";
      }
      if(isWhiteText)
      {
         str = "<font color=\'#FFFFFF\'>" + str + "</font>";
         country = "<font color=\'#FFFFFF\'>" + country + "</font>";
      }
      _loc2_.htmlText = str;
      _loc3_.htmlText = country;
      _loc2_._y = 480 - _loc2_.textHeight;
      _loc3_._y = _loc2_._y + 20 + _loc2_.textHeight;
   }
   function debug()
   {
      this.SET_YACHT_NAME("wwwwwwwwwwwww",false,"Scotland");
   }
}
