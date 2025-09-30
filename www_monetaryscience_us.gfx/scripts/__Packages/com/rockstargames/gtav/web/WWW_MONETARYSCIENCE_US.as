class com.rockstargames.gtav.web.WWW_MONETARYSCIENCE_US extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var browser;
   var calcOptionsHowLong;
   var calcOptionsHowMuch;
   var calcResults;
   var calcSelectedWhat;
   var dataTextScope;
   var mcScope;
   var selected;
   function WWW_MONETARYSCIENCE_US()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "CALCULATOR";
      this.PAGE_NAMES[3] = "RESULT";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = false;
      this.browser = _level0.TIMELINE;
   }
   function READY()
   {
   }
   function setupCalculator()
   {
      this.calcResults = [];
      this.calcResults.push("See? Isn\'t that fantastic? Graphs always make things look amazing. Invest in your future today. When global crisis hits, the guy with the Arctic sleeping bag and water purification kit will be laughing on the other side of his face when he sees your bag of shiny stones.");
      this.calcResults.push("Not available. We\'re still not 100% sure what this is. It\'s on the periodic table, which is a bunch of mumbo jumbo anyway! But if we get some, you can buy it.");
      this.calcResults.push("A wise choice. You are truly the pig that built his house on sand, if you get my drift. Radioactive metals are very valuable in the apocalypse, especially when other clans are looking to forge a makeshift nuclear bomb. We also bake the finest yellowcake uranium for your hoarding&nbsp;pleasure.");
      this.calcSelectedWhat = [];
      this.calcSelectedWhat.push({item:"GOLD INGOTS",resultId:0});
      this.calcSelectedWhat.push({item:"SILVER DOUBLOONS",resultId:0});
      this.calcSelectedWhat.push({item:"PLATINUM RECORDS",resultId:0});
      this.calcSelectedWhat.push({item:"PALLADIUM BRICKS",resultId:1});
      this.calcSelectedWhat.push({item:"RADIUM CAKES",resultId:2});
      this.calcOptionsHowMuch = ["$10","$100","$500","$1,000","$5,000","$10,000","$50,000","$100,000"];
      this.calcOptionsHowLong = ["1 YEAR","5 YEARS","10 YEARS","20 YEARS","100 YEARS"];
      this.selected = {howlong:1,howmuch:1,what:1};
      this.doSelection("what","prev");
      this.doSelection("howmuch","prev");
      this.doSelection("howlong","prev");
   }
   function doSelection(selection, direction)
   {
      var _loc3_;
      var _loc5_ = this.mcScope["select_" + selection];
      var _loc2_;
      switch(selection)
      {
         case "what":
            _loc3_ = [];
            _loc2_ = 0;
            while(_loc2_ < this.calcSelectedWhat.length)
            {
               _loc3_.push(this.calcSelectedWhat[_loc2_].item);
               _loc2_ = _loc2_ + 1;
            }
            break;
         case "howmuch":
            _loc3_ = this.calcOptionsHowMuch;
            break;
         case "howlong":
            _loc3_ = this.calcOptionsHowLong;
      }
      if(direction == "prev")
      {
         this.selected[selection]--;
         if(this.selected[selection] < 0)
         {
            this.selected[selection] = _loc3_.length - 1;
         }
      }
      else
      {
         this.selected[selection] = this.selected[selection] + 1;
         if(this.selected[selection] >= _loc3_.length)
         {
            this.selected[selection] = 0;
         }
      }
      _loc5_.option.htmlText = _loc3_[this.selected[selection]];
   }
   function showResult()
   {
      var _loc2_ = this.calcSelectedWhat[this.selected.what];
      this.mcScope.resultText.autoSize = "center";
      this.mcScope.resultText.htmlText = this.calcResults[_loc2_.resultId];
      if(_loc2_.resultId != 0)
      {
         this.mcScope.graph._visible = false;
         this.mcScope.resultText._y = 188;
      }
      this.mcScope.CALCULATOR._y = this.mcScope.resultText._y + this.mcScope.resultText._height + 20;
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      this.doSelection(_loc2_[1],_loc2_[2]);
   }
   function POPULATE_TEXT(pageName)
   {
      this.mcScope = this.CONTENT[pageName];
      switch(pageName)
      {
         case "CALCULATOR":
            this.setupCalculator();
            break;
         case "RESULT":
            this.showResult();
            break;
         case "PAGE1":
      }
      this.dataTextScope = new Array();
      var _loc3_ = 0;
      var _loc2_;
      for(var _loc4_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc4_] == "movieclip")
         {
            if(this.mcScope[_loc4_].btnTxt != undefined)
            {
               this.mcScope[_loc4_].offColour = this.mcScope[_loc4_].btnTxt.textColor;
               _loc2_ = this.mcScope[_loc4_].btnTxt;
               this.dataTextScope[_loc3_] = _loc2_;
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
}
