class com.rockstargames.gtav.web.WWW_TOESHOESUSA_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var browser;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var mcScope;
   var HOME_PAGE = "PAGE1";
   var ANATOMY_PAGE = "ANATOMY";
   var NUM_SLIDESHOW_IMAGES = 5;
   var NUM_ADVERT_IMAGES = 3;
   var SLIDER_TIME = 10;
   var BUTTON_ARG_TYPE = 1;
   var BUTTON_ARG_INDEX = 2;
   var sliderNum = 1;
   function WWW_TOESHOESUSA_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = ["",this.HOME_PAGE,this.ANATOMY_PAGE];
      this.CAN_STORE_PAGE = ["",true,true];
      this.browser = _level0.TIMELINE;
      this.defaultButtonOnColour = 4671303;
      this.defaultButtonOffColour = 0;
   }
   function READY()
   {
   }
   function POPULATE_TEXT(pageName)
   {
      this.mcScope = this.CONTENT[pageName];
      this.dataTextScope = [];
      this.sliderNum = 1;
      var _loc2_ = 1;
      while(_loc2_ <= this.NUM_SLIDESHOW_IMAGES)
      {
         this.dataTextScope.push(this.mcScope.sliderMC["button_slider_" + _loc2_].btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 1;
      while(_loc2_ <= this.NUM_ADVERT_IMAGES)
      {
         this.dataTextScope.push(this.mcScope.advertsMC["button_adverts_" + _loc2_].btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      switch(pageName)
      {
         case this.HOME_PAGE:
            this.dataTextScope.push(this.mcScope.PAGE1.btnTxt);
            this.dataTextScope.push(this.mcScope.ANATOMY.btnTxt);
            break;
         case this.ANATOMY_PAGE:
            this.dataTextScope.push(this.mcScope.PAGE1.btnTxt);
            _loc2_ = 1;
            while(_loc2_ <= 3)
            {
               this.dataTextScope.push(this.mcScope.descriptionMC["button_anatomy_" + _loc2_].btnTxt);
               _loc2_ = _loc2_ + 1;
            }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.SLIDER_TIME,{onComplete:this.slideToNextImage,onCompleteScope:this});
   }
   function slideToNextImage()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this.mcScope.sliderMC["button_slider_" + this.sliderNum].gotoAndStop("OFF");
      this.sliderNum = this.sliderNum % this.NUM_SLIDESHOW_IMAGES + 1;
      this.mcScope.sliderMC.gotoAndStop(this.sliderNum);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.SLIDER_TIME,{onComplete:this.slideToNextImage,onCompleteScope:this});
   }
   function goToAnchor(AnchorLink)
   {
      var _loc3_ = AnchorLink.split("_");
      var _loc4_ = _loc3_[this.BUTTON_ARG_TYPE];
      var _loc2_ = _loc3_[this.BUTTON_ARG_INDEX];
      switch(_loc4_)
      {
         case "slider":
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.SLIDER_TIME,{onComplete:this.slideToNextImage,onCompleteScope:this});
            this.mcScope.sliderMC.gotoAndStop(_loc2_);
            break;
         case "adverts":
            this.mcScope.advertsMC.gotoAndStop(_loc2_);
            break;
         case "anatomy":
            this.mcScope.descriptionMC.gotoAndStop(_loc2_);
         default:
            return;
      }
   }
}
