class com.rockstargames.gtav.web.WWW_PROPOSITION43_ORG extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var selectedItems;
   var selections;
   var maxSelectedItems;
   var resultButtonIndex;
   var results;
   var mcScope;
   var dataTextScope;
   var CONTENT;
   function WWW_PROPOSITION43_ORG()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = [];
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "PAGE2";
      this.PAGE_NAMES[3] = "CREATE";
      this.PAGE_NAMES[4] = "RESULT";
      this.CAN_STORE_PAGE = [];
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = false;
      this.browser = _level0.TIMELINE;
   }
   function READY()
   {
   }
   function setupCreator()
   {
      this.selectedItems = [];
      this.selections = [];
      this.maxSelectedItems = 3;
      this.resultButtonIndex = 0;
      this.results = {};
      this.results.ideal = "The ideal postmodern family. Remember to vote!";
      this.results.oneDadTwoMom = "One daddy and two mommies - that\'s hot";
      this.results.twoDadOneMom = "Two daddies and one mommy - I smell rotisserie!";
      this.results.noKids = "Creepy adult communes rule! The world is overpopulated enough - spend the college fund on swinging parties instead";
      this.results.nuclear = "Do you live in the dark ages? Do you hate difference? What is wrong with you?";
      this.results.imageMonkey = "Monkeys are our cousins, and excellent for preening you before school";
      this.results.imageHorse = "Girls love horses, for obvious reasons";
      this.results.imageSister = "A close family is a happy family. If it\'s good enough for royalty, it\'s good enough for you";
      this.results.imageHomeless = "Bringing a homeless person into your family is like adopting an adult. The neighbors will just think you\'ve taken in a hipster";
      this.results.imageImmigrant = "An illegal immigrant - one less income to declare on the joint tax return";
      this.results.imageStripper = "A stripper is self-sufficient, good for morale and earns well in a recession";
      this.results.imageOldLady = "Old ladies are great. Sometimes Daddy likes to drive a vintage";
      this.results.imageNudist = "A nudist means fun for all the family! Mostly confined to the house for legal reasons, so a great babysitter";
      this.results.imageTv = "Television really is the best parent money can buy";
      this.results.imageWeedbag = "The family that smokes together stays together";
   }
   function selectItem(mcName)
   {
      var _loc6_ = false;
      var _loc2_ = 0;
      while(_loc2_ < this.selectedItems.length)
      {
         if(mcName == this.selectedItems[_loc2_])
         {
            this.selectedItems.splice(_loc2_,1);
            _loc6_ = true;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc6_)
      {
         this.selectedItems.push(mcName);
      }
      while(this.selectedItems.length > this.maxSelectedItems)
      {
         this.selectedItems.shift();
      }
      _loc2_ = 0;
      while(_loc2_ < this.selections.length)
      {
         MovieClip(this.selections[_loc2_]).removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.selectedItems.length)
      {
         var _loc5_ = "sel_" + this.selectedItems[_loc2_];
         var _loc4_ = this.mcScope[this.selectedItems[_loc2_]];
         var _loc3_ = this.mcScope.attachMovie("selected",_loc5_,this.mcScope.getNextHighestDepth());
         _loc3_._x = _loc4_._x - 10;
         _loc3_._y = _loc4_._y - 10;
         this.selections.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.checkSelections();
   }
   function checkSelections()
   {
      if(this.selectedItems.length >= this.maxSelectedItems)
      {
         this.browser.DISABLE_BUTTON(this.resultButtonIndex,false);
         this.mcScope.createButton._alpha = 100;
      }
      else
      {
         this.browser.DISABLE_BUTTON(this.resultButtonIndex,true);
         this.mcScope.createButton._alpha = 50;
      }
      this.mcScope.RESULT._alpha = 1;
   }
   function showResult()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.selectedItems.length)
      {
         var _loc4_ = this.mcScope.attachMovie(this.selectedItems[_loc3_],"res_" + this.selectedItems[_loc3_],this.mcScope.getNextHighestDepth());
         _loc4_._x = 161 * _loc3_ + 415;
         _loc4_._y = 228;
         _loc3_ = _loc3_ + 1;
      }
      var _loc13_ = "test";
      var _loc14_ = "test";
      var _loc6_ = [];
      _loc6_.push(this.results.ideal);
      var _loc5_ = 0;
      var _loc8_ = false;
      var _loc9_ = false;
      var _loc7_ = false;
      var _loc11_ = 0;
      var _loc10_ = 0;
      var _loc12_ = 0;
      _loc3_ = 0;
      while(_loc3_ < this.selectedItems.length)
      {
         var _loc2_ = this.selectedItems[_loc3_];
         if(_loc2_ == "imageDad01" || _loc2_ == "imageDad02" || _loc2_ == "imageDad03")
         {
            _loc11_ = _loc11_ + 1;
            if(!_loc8_)
            {
               _loc5_ = _loc5_ + 1;
               _loc8_ = true;
            }
         }
         if(_loc2_ == "imageMom01" || _loc2_ == "imageMom02" || _loc2_ == "imageMom03")
         {
            _loc10_ = _loc10_ + 1;
            if(!_loc9_)
            {
               _loc5_ = _loc5_ + 1;
               _loc9_ = true;
            }
         }
         if(_loc2_ == "imageKid01" || _loc2_ == "imageKid02" || _loc2_ == "imageKid03" || _loc2_ == "imageTeen01" || _loc2_ == "imageTeen02" || _loc2_ == "imageSister")
         {
            _loc12_ = _loc12_ + 1;
            if(!_loc7_)
            {
               _loc5_ = _loc5_ + 1;
               _loc7_ = true;
            }
         }
         if(this.results[_loc2_])
         {
            _loc6_.push(this.results[_loc2_]);
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc12_ < 1 && _loc6_.length < 2)
      {
         _loc6_.push(this.results.noKids);
      }
      if(_loc10_ == 2 && _loc11_ == 1)
      {
         _loc6_.push(this.results.oneDadTwoMom);
      }
      if(_loc10_ == 1 && _loc11_ == 2)
      {
         _loc6_.push(this.results.twoDadOneMom);
      }
      if(_loc5_ >= 3)
      {
         _loc6_.push(this.results.nuclear);
      }
      this.mcScope.familyDescription.autoSize = true;
      this.mcScope.familyDescription.wordWrap = true;
      this.mcScope.familyDescription.text = _loc6_[_loc6_.length - 1];
      this.mcScope.familyDescription._y = this.mcScope.textBox._y + this.mcScope.textBox._height - (this.mcScope.textBox._height * 0.5 + this.mcScope.familyDescription._height * 0.5);
   }
   function setupButtons()
   {
      this.dataTextScope = new Array();
      var _loc3_ = 0;
      for(var _loc4_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc4_] == "movieclip")
         {
            if(this.mcScope[_loc4_].btnTxt != undefined)
            {
               this.mcScope[_loc4_].offColour = this.mcScope[_loc4_].btnTxt.textColor;
               var _loc2_ = this.mcScope[_loc4_].btnTxt;
               this.dataTextScope[_loc3_] = _loc2_;
               this.mcScope[_loc4_]._alpha = 1;
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      var _loc0_ = null;
      if((_loc0_ = _loc2_[0]) === "add")
      {
         this.selectItem(_loc2_[1]);
      }
   }
   function POPULATE_TEXT(pageName)
   {
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.setupButtons();
            break;
         case "PAGE2":
            this.mcScope = this.CONTENT.PAGE2;
            this.setupButtons();
            break;
         case "CREATE":
            this.mcScope = this.CONTENT.CREATE;
            this.setupButtons();
            this.setupCreator();
            this.checkSelections();
            break;
         case "RESULT":
            this.mcScope = this.CONTENT.RESULT;
            this.setupButtons();
            this.showResult();
      }
   }
}
