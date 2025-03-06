class com.rockstargames.gtav.web.WWW_CREDITCARDCONSOLIDATIONKINGS_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var browser;
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var TIMELINE;
   var answerState;
   var mcScope;
   var totalDebt;
   var CONTENT;
   var dataTextScope;
   var resultsButtonIndex;
   var OnColour;
   var defaultButtonOnColour;
   var questionCount = 8;
   function WWW_CREDITCARDCONSOLIDATIONKINGS_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "FORM";
      this.PAGE_NAMES[3] = "RESULTS";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = false;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.TIMELINE.ref = this;
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      var _loc0_ = null;
      if((_loc0_ = AnchorLink) !== "RESULTS")
      {
         var _loc2_ = Number(AnchorLink.charAt(1));
         this.answerState[_loc2_ - 1] = AnchorLink.charAt(2) != "y" ? false : true;
         this.mcScope["q" + _loc2_ + "y"].selectedMC._visible = this.answerState[_loc2_ - 1];
         this.mcScope["q" + _loc2_ + "n"].selectedMC._visible = !this.answerState[_loc2_ - 1];
      }
      else if(this._isTestComplete())
      {
         this.totalDebt = Number(this.mcScope.debtMC.btnTxt.text);
         trace("TOTAL DEBT: " + this.totalDebt + "\t\t" + this.mcScope.debtMC.btnTxt.text);
         this.browser.GO_TO_WEBPAGE("WWW_CREDITCARDCONSOLIDATIONKINGS_COM_S_RESULTS");
      }
   }
   function _isTestComplete()
   {
      if(this.mcScope.debtMC.btnTxt.text == "")
      {
         return false;
      }
      if(this.mcScope.ssnMC.btnTxt.text == "")
      {
         return false;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.questionCount)
      {
         if(this.answerState[_loc2_] == undefined)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      return true;
   }
   function POPULATE_TEXT(pageName)
   {
      this.CONTENT._y = 0;
      this.mcScope = this.CONTENT[pageName];
      this.dataTextScope = new Array();
      var index = 0;
      for(var x in this.mcScope)
      {
         if(typeof this.mcScope[x] == "movieclip")
         {
            if(this.mcScope[x].btnTxt != undefined)
            {
               this.mcScope[x].offColour = this.mcScope[x].btnTxt.textColor;
               var buttonMC = this.mcScope[x];
               if(buttonMC.selectedMC)
               {
                  buttonMC.selectedMC._visible = false;
               }
               if(buttonMC._name == "RESULTS")
               {
                  this.resultsButtonIndex = index;
               }
               this.dataTextScope[index] = buttonMC.btnTxt;
               index++;
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.TIMELINE.onEnterFrame = undefined;
      switch(this.browser.pageName)
      {
         case "RESULTS":
            this.mcScope.monthlyTF.text = "Monthly Payment = $" + this.addCommas(Math.ceil(this.totalDebt * 2 * 0.0057));
            this.mcScope.payOffTF.text = "Your debt will be fully paid off by the year " + (3051 + Math.round(Math.random() * 969));
            break;
         case "FORM":
            this.answerState = [];
            this.totalDebt = 0;
            this.mcScope.debtMC.numberBox = true;
            this.mcScope.debtMC.charLimit = 12;
            this.mcScope.ssnMC.numberBox = true;
            this.mcScope.ssnMC.charLimit = 8;
            this.mcScope.tickMC.tickMC._visible = false;
            this.browser.DISABLE_BUTTON(this.resultsButtonIndex,false);
            this.mcScope.RESULTS._visible = false;
            this.TIMELINE.onEnterFrame = function()
            {
               with(this.ref)
               {
                  if(_isTestComplete())
                  {
                     mcScope.RESULTS._visible = true;
                     browser.DISABLE_BUTTON(resultsButtonIndex,false);
                  }
                  else
                  {
                     mcScope.RESULTS._visible = false;
                     mcScope.RESULTS.gotoAndStop("OFF");
                     browser.DISABLE_BUTTON(resultsButtonIndex,true);
                  }
               }
            };
      }
      if(this.CONTENT.globalColourMouseOver != undefined)
      {
         this.OnColour = this.CONTENT.globalColourMouseOver.textColor;
      }
      if(this.mcScope.colourMouseOver != undefined)
      {
         this.OnColour = this.mcScope.colourMouseOver.textColor;
      }
      this.defaultButtonOnColour = this.OnColour;
   }
   function addCommas(val)
   {
      var _loc3_ = val.toString();
      var _loc1_ = _loc3_.length;
      var _loc2_ = [];
      var _loc5_ = undefined;
      while(_loc1_ > 0)
      {
         _loc2_.push(_loc3_.substring(_loc1_ - 3,_loc1_));
         _loc1_ -= 3;
      }
      _loc2_.reverse();
      return _loc2_.join(",");
   }
}
