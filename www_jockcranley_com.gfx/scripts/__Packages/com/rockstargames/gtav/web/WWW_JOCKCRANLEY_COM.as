class com.rockstargames.gtav.web.WWW_JOCKCRANLEY_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var _name;
   var browser;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var mcScope;
   var testAnswers;
   function WWW_JOCKCRANLEY_COM()
   {
      super();
      this._name = "WWW_JOCKCRANLEY_COM";
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "PLEDGES";
      this.PAGE_NAMES[3] = "PATRIOTTEST";
      this.PAGE_NAMES[4] = "RESULTS";
      this.PAGE_NAMES[5] = "RESULTS_D_A";
      this.PAGE_NAMES[6] = "RESULTS_D_B";
      this.PAGE_NAMES[7] = "RESULTS_D_C";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = false;
      this.CAN_STORE_PAGE[5] = false;
      this.CAN_STORE_PAGE[6] = false;
      this.CAN_STORE_PAGE[7] = false;
      this.browser = _level0.TIMELINE;
      this.testAnswers = new Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      this.defaultButtonOnColour = 4671303;
      this.defaultButtonOffColour = 0;
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      var _loc8_ = new Array();
      _loc8_ = AnchorLink.split("tick");
      var _loc7_ = parseInt(_loc8_[1]);
      var _loc5_ = Math.ceil(_loc7_ / 3);
      var _loc10_ = 3 - Math.round((_loc5_ - _loc7_ / 3) * 3);
      var _loc2_ = 1;
      var _loc3_;
      var _loc4_;
      while(_loc2_ <= 3)
      {
         _loc3_ = _loc5_ * 3 - _loc2_ + 1;
         _loc4_ = "tick" + _loc3_;
         this.mcScope[_loc4_].tickbox.gotoAndStop("off");
         this.testAnswers[_loc3_ - 1] = 0;
         _loc2_ = _loc2_ + 1;
      }
      this.mcScope[AnchorLink].tickbox.gotoAndStop("on");
      this.testAnswers[_loc7_ - 1] = 1;
      var _loc6_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.testAnswers.length)
      {
         _loc6_ += this.testAnswers[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      if(_loc6_ == 8)
      {
         this.browser.DISABLE_BUTTON(2,false);
      }
   }
   function POPULATE_TEXT(pageName)
   {
      var _loc2_;
      var _loc4_;
      var _loc3_;
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PLEDGES.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PATRIOTTEST.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PATRIOTTEST_S_.btnTxt;
            this.ADD_TEXT(3);
            this.CONTENT.BOUNDING_BOX._height = 1020;
            break;
         case "PLEDGES":
            this.mcScope = this.CONTENT.PLEDGES;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PAGE1.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PATRIOTTEST.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PATRIOTTEST_S_.btnTxt;
            this.ADD_TEXT(3);
            this.CONTENT.BOUNDING_BOX._height = 1020;
            break;
         case "PATRIOTTEST":
            this.mcScope = this.CONTENT.PATRIOTTEST;
            this.CONTENT._y = 0;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PAGE1.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PLEDGES.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_JOCKCRANLEY_COM_S_RESULTS.btnTxt;
            _loc2_ = 1;
            while(_loc2_ <= 24)
            {
               _loc4_ = "tick" + _loc2_;
               this.mcScope[_loc4_].gotoAndStop("off");
               this.dataTextScope[_loc2_ + 2] = this.mcScope[_loc4_].btnTxt;
               _loc2_ = _loc2_ + 1;
            }
            this.ADD_TEXT(27);
            this.browser.DISABLE_BUTTON(2,true);
            this.CONTENT.BOUNDING_BOX._height = 2158;
            break;
         case "RESULTS":
            this.mcScope = this.CONTENT.RESULTS;
            _loc3_ = new Array();
            _loc3_.push({QUESTION:"A",RESULT:0,PAGE:"RESULTS_D_A"});
            _loc3_.push({QUESTION:"B",RESULT:0,PAGE:"RESULTS_D_B"});
            _loc3_.push({QUESTION:"C",RESULT:0,PAGE:"RESULTS_D_C"});
            _loc2_ = 0;
            while(_loc2_ < 24)
            {
               _loc3_[0].RESULT += Number(this.testAnswers[_loc2_]);
               _loc3_[1].RESULT += Number(this.testAnswers[_loc2_ + 1]);
               _loc3_[2].RESULT += Number(this.testAnswers[_loc2_ + 2]);
               _loc2_ += 3;
            }
            _loc3_.sortOn("RESULT",Array.NUMERIC);
            this.browser.GO_TO_WEBPAGE("WWW_JOCKCRANLEY_COM_S_" + _loc3_[2].PAGE);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "RESULTS_D_A":
            this.mcScope = this.CONTENT.RESULTS_D_A;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PAGE1.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PLEDGES.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PATRIOTTEST.btnTxt;
            this.ADD_TEXT(3);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "RESULTS_D_B":
            this.mcScope = this.CONTENT.RESULTS_D_B;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PAGE1.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PLEDGES.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PATRIOTTEST.btnTxt;
            this.ADD_TEXT(3);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "RESULTS_D_C":
            this.mcScope = this.CONTENT.RESULTS_D_C;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PAGE1.btnTxt;
            this.dataTextScope[1] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PLEDGES.btnTxt;
            this.dataTextScope[2] = this.mcScope.WWW_JOCKCRANLEY_COM_S_PATRIOTTEST.btnTxt;
            this.ADD_TEXT(3);
            this.CONTENT.BOUNDING_BOX._height = 627;
         default:
            return;
      }
   }
   function ADD_TEXT(numberOfSlots)
   {
      var _loc2_ = 0;
      while(_loc2_ < numberOfSlots)
      {
         if(this.dataTextScope[_loc2_] != undefined)
         {
            this.dataTextScope[_loc2_].text = " ";
         }
         _loc2_ = _loc2_ + 1;
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
}
