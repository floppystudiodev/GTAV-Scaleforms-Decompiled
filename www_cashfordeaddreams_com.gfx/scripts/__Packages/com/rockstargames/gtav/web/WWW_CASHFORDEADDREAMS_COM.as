class com.rockstargames.gtav.web.WWW_CASHFORDEADDREAMS_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var browser;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var mcScope;
   function WWW_CASHFORDEADDREAMS_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.browser = _level0.TIMELINE;
      this.defaultButtonOnColour = 4671303;
      this.defaultButtonOffColour = 0;
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = this.mcScope.rollOverText;
      _loc2_._visible = false;
      _loc2_.gotoAndStop(AnchorLink);
      if(this.browser.CURSOR._x + _loc2_._width > 1060)
      {
         _loc2_._x = this.mcScope[AnchorLink]._x + this.mcScope[AnchorLink]._width - _loc2_._width;
      }
      else
      {
         _loc2_._x = this.mcScope[AnchorLink]._x;
      }
      _loc2_._y = this.mcScope[AnchorLink]._y;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2_);
      _loc2_._alpha = 100;
      var _loc4_ = _loc2_.textTF.text.split(" ").length / 3.5;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,1,{_alpha:0,delay:_loc4_,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[_loc2_]});
      _loc2_._visible = true;
   }
   function POPULATE_TEXT(pageName)
   {
      this.mcScope = this.CONTENT.PAGE1;
      this.dataTextScope = new Array();
      this.dataTextScope[0] = this.mcScope.TV.btnTxt;
      this.dataTextScope[1] = this.mcScope.Car.btnTxt;
      this.dataTextScope[2] = this.mcScope.Jewelry.btnTxt;
      this.dataTextScope[3] = this.mcScope.Medals.btnTxt;
      this.dataTextScope[4] = this.mcScope.Clothes.btnTxt;
      this.dataTextScope[5] = this.mcScope.RV.btnTxt;
      this.dataTextScope[6] = this.mcScope.Silver.btnTxt;
      this.dataTextScope[7] = this.mcScope.Teeth.btnTxt;
      this.dataTextScope[8] = this.mcScope.Organs.btnTxt;
      this.dataTextScope[9] = this.mcScope.WWW_TOILETCLEANERONLINE_COM.btnTxt;
      this.dataTextScope[10] = this.mcScope.WWW_PROPOSITION208_COM.btnTxt;
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
}
