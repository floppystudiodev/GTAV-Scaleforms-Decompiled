class com.rockstargames.gtav.web.WWW_THECHILDRENOFTHEMOUNTAIN_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var anagramResult;
   var anagramsMc;
   var autoPassword1;
   var autoPassword2;
   var autoPassword3;
   var autoPassword4;
   var browser;
   var currentAnagramMc;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var intervalId;
   var mcScope;
   var password1;
   var password2;
   var timerIntervalId;
   var completedStatus = 0;
   var slides = [];
   var slideIndex = 0;
   var anagrams = [];
   var anagramIndex = 0;
   var anagramAnswerSlots = [];
   var anagramResultSlots = [];
   var anagramLettertileSlots = [];
   var userAnagram = [];
   var timeRemaining = 59;
   function WWW_THECHILDRENOFTHEMOUNTAIN_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "FAQ";
      this.PAGE_NAMES[3] = "GUARANTEE";
      this.PAGE_NAMES[4] = "STAGE2_D_JOIN";
      this.PAGE_NAMES[5] = "STAGE2";
      this.PAGE_NAMES[6] = "STAGE2_D_COMPLETE";
      this.PAGE_NAMES[7] = "STAGE3";
      this.PAGE_NAMES[8] = "STAGE4";
      this.PAGE_NAMES[9] = "STAGE4_D_1";
      this.PAGE_NAMES[10] = "STAGE4_D_2";
      this.PAGE_NAMES[11] = "STAGE4_D_3";
      this.PAGE_NAMES[12] = "STAGE4_D_4";
      this.PAGE_NAMES[13] = "STAGE4_D_5";
      this.PAGE_NAMES[14] = "CERTIFICATE";
      this.PAGE_NAMES[15] = "PAYMENTERROR";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = false;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = false;
      this.CAN_STORE_PAGE[7] = true;
      this.CAN_STORE_PAGE[8] = false;
      this.CAN_STORE_PAGE[9] = true;
      this.CAN_STORE_PAGE[10] = true;
      this.CAN_STORE_PAGE[11] = true;
      this.CAN_STORE_PAGE[12] = true;
      this.CAN_STORE_PAGE[13] = true;
      this.CAN_STORE_PAGE[14] = true;
      this.CAN_STORE_PAGE[15] = false;
      this.browser = _level0.TIMELINE;
      this.password1 = "futility";
      this.password2 = "actuality";
      this.autoPassword1 = "stage2_auto";
      this.autoPassword2 = "stage3_auto";
      this.autoPassword3 = "stage4_auto";
      this.autoPassword4 = "stage5_auto";
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      var _loc4_;
      clearInterval(this.intervalId);
      if(AnchorLink == "LOGINSUBMIT")
      {
         _loc4_ = this.mcScope.loginPassword.btnTxt.text;
         if(this.browser.player == 2)
         {
            switch(_loc4_)
            {
               case this.password1:
                  if(this.completedStatus == 1)
                  {
                     this.browser.GO_TO_WEBPAGE("STAGE2_D_JOIN");
                     break;
                  }
                  com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_INCORRECT",this.mcScope.loginPassword.btnTxt);
                  break;
               case this.password2:
                  if(this.completedStatus == 4)
                  {
                     this.browser.GO_TO_WEBPAGE("STAGE4");
                     break;
                  }
                  com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_INCORRECT",this.mcScope.loginPassword.btnTxt);
                  break;
               case this.autoPassword1:
                  this.gotoStage2();
                  break;
               case this.autoPassword2:
                  this.gotoStage3();
                  break;
               case this.autoPassword3:
                  this.gotoStage4();
                  break;
               case this.autoPassword4:
                  this.gotoCertificate();
                  break;
               default:
                  com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_INCORRECT",this.mcScope.loginPassword.btnTxt);
            }
         }
         else
         {
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_INCORRECT",this.mcScope.loginPassword.btnTxt);
         }
      }
      if(AnchorLink == "STAGE2PAYMENT")
      {
         this.browser.DISABLE_BUTTON(0,true);
         this.intervalId = setInterval(this,"gotoStage2",1500);
      }
      if(AnchorLink == "STAGE3PAYMENT")
      {
         this.browser.DISABLE_BUTTON(0,true);
         this.intervalId = setInterval(this,"gotoStage3",1500);
      }
      if(AnchorLink == "SLIDENEXT")
      {
         this.showSlide(this.mcScope,this.incrementSlideIndex());
      }
      if(AnchorLink == "SLIDEPREV")
      {
         this.showSlide(this.mcScope,this.decrementSlideIndex());
      }
      if(AnchorLink == "STAGE3WEBINARDONE")
      {
         this.browser.DISABLE_BUTTON(0,true);
         this.intervalId = setInterval(this,"gotoPage1",1500);
      }
      if(AnchorLink == "STAGE4PAYMENT")
      {
         this.browser.DISABLE_BUTTON(0,true);
         this.intervalId = setInterval(this,"gotoStage4",1500);
      }
      if(_loc2_[0] == "CBTRUE")
      {
         this.answerQuestion(this.mcScope,_loc2_[1],true);
      }
      if(_loc2_[0] == "CBFALSE")
      {
         this.answerQuestion(this.mcScope,_loc2_[1],false);
      }
      if(_loc2_[0] == "LETTER")
      {
         this.updateLetter(_loc2_[2]);
      }
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.mcScope = this.CONTENT[pageName];
      clearInterval(this.intervalId);
      clearInterval(this.timerIntervalId);
      this.completedStatus = this.dataProviderUI[0];
      if(this.completedStatus == undefined)
      {
         this.completedStatus = 0;
      }
      this.dataTextScope = [];
      this.setupHeader(this.mcScope);
      if(newPage == true)
      {
         this.scan_and_set_localised_text(this.mcScope);
      }
      switch(pageName)
      {
         case "PAGE1":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_ENTER",this.mcScope.LOGINSUBMIT.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.LOGINSUBMIT.btnTxt;
            this.dataTextScope[1] = this.mcScope.loginPassword.btnTxt;
            break;
         case "STAGE2_D_JOIN":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_SUBMIT",this.mcScope.STAGE2PAYMENT.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.STAGE2PAYMENT.btnTxt;
            break;
         case "STAGE2":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_COMMIT",this.mcScope.STAGE2_D_COMPLETE.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.STAGE2_D_COMPLETE.btnTxt;
            break;
         case "STAGE2_D_COMPLETE":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_SUBMIT",this.mcScope.STAGE3PAYMENT.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.STAGE3PAYMENT.btnTxt;
            break;
         case "STAGE3":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_COMMIT",this.mcScope.STAGE3WEBINARDONE.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.STAGE3WEBINARDONE.btnTxt;
            this.mcScope.SLIDEPREV.btnTxt.text = " ";
            this.dataTextScope[1] = this.mcScope.SLIDEPREV.btnTxt;
            this.mcScope.SLIDENEXT.btnTxt.text = " ";
            this.dataTextScope[2] = this.mcScope.SLIDENEXT.btnTxt;
            this.initSlideshow(this.mcScope);
            break;
         case "STAGE4":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_SUBMIT",this.mcScope.STAGE4PAYMENT.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.STAGE4PAYMENT.btnTxt;
            break;
         case "STAGE4_D_1":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_NEXT",this.mcScope.STAGE4_D_2.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.STAGE4_D_2.btnTxt;
            this.initQuestion(this.mcScope,1);
            break;
         case "STAGE4_D_2":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_NEXT",this.mcScope.STAGE4_D_3.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.STAGE4_D_3.btnTxt;
            this.initQuestion(this.mcScope,2);
            break;
         case "STAGE4_D_3":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_NEXT",this.mcScope.STAGE4_D_4.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.STAGE4_D_4.btnTxt;
            this.initQuestion(this.mcScope,3);
            break;
         case "STAGE4_D_4":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_NEXT",this.mcScope.STAGE4_D_5.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.STAGE4_D_5.btnTxt;
            this.initQuestion(this.mcScope,4);
            break;
         case "STAGE4_D_5":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_NEXT",this.mcScope.CERTIFICATE.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.CERTIFICATE.btnTxt;
            this.initQuestion(this.mcScope,5);
            break;
         case "PAYMENTERROR":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PAYERROR_BUTTON",this.mcScope.PAGE1.btnTxt,true);
            this.dataTextScope[0] = this.mcScope.PAGE1.btnTxt;
            this.CONTENT._y = 0;
      }
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 2533856;
      var _loc5_ = 10;
      var _loc3_;
      var _loc4_;
      var _loc2_;
      for(var _loc6_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc6_] == "movieclip")
         {
            if(this.mcScope[_loc6_].btnTxt != undefined)
            {
               this.mcScope[_loc6_].offColour = this.mcScope[_loc6_].btnTxt.textColor;
               _loc3_ = this.mcScope[_loc6_].btnTxt;
               _loc4_ = false;
               _loc2_ = 0;
               while(_loc2_ < this.dataTextScope.length)
               {
                  if(this.dataTextScope[_loc2_] == _loc3_)
                  {
                     _loc4_ = true;
                  }
                  _loc2_ = _loc2_ + 1;
               }
               if(_loc4_ == false)
               {
                  this.dataTextScope[_loc5_] = _loc3_;
               }
               _loc5_ = _loc5_ + 1;
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      if(pageName == "PAGE1")
      {
         this.setPage1Content(this.mcScope,this.completedStatus);
      }
      if(pageName == "STAGE2")
      {
         this.initAnagrams(this.mcScope);
      }
   }
   function gotoPage1()
   {
      clearInterval(this.intervalId);
      this.browser.GO_TO_WEBPAGE("PAGE1");
   }
   function gotoStage2()
   {
      clearInterval(this.intervalId);
      this.browser.GO_TO_WEBPAGE("STAGE2");
   }
   function gotoStage3()
   {
      clearInterval(this.intervalId);
      this.browser.GO_TO_WEBPAGE("STAGE3");
   }
   function gotoStage4()
   {
      clearInterval(this.intervalId);
      this.browser.GO_TO_WEBPAGE("STAGE4_D_1");
   }
   function gotoCertificate()
   {
      clearInterval(this.intervalId);
      this.browser.GO_TO_WEBPAGE("CERTIFICATE");
   }
   function setupHeader(scope)
   {
      this.dataTextScope[7] = scope.headerMC.PAGE1.btnTxt;
      this.dataTextScope[8] = scope.headerMC.FAQ.btnTxt;
      this.dataTextScope[9] = scope.headerMC.GUARANTEE.btnTxt;
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_HOME",scope.headerMC.PAGE1.btnTxt,true);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_FAQ",scope.headerMC.FAQ.btnTxt,true);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_GUARANTEE",scope.headerMC.GUARANTEE.btnTxt,true);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_CONGRATS",scope.headerMC.COM_CONGRATS,true);
   }
   function scan_and_set_localised_text(scope, noShrinkList)
   {
      var _loc2_;
      var _loc3_;
      var _loc5_;
      var _loc1_;
      for(var _loc7_ in scope)
      {
         _loc2_ = scope[_loc7_]._name;
         if(_loc2_.indexOf("COM_") == 0)
         {
            _loc3_ = scope[_loc7_];
            _loc3_.html = true;
            _loc5_ = !_loc3_.multiline;
            _loc1_ = 0;
            while(_loc1_ < noShrinkList.length)
            {
               if(_loc2_ == noShrinkList[_loc1_])
               {
                  _loc5_ = false;
                  noShrinkList.splice(_loc1_,1);
                  break;
               }
               _loc1_ = _loc1_ + 1;
            }
            if(_loc5_)
            {
               _loc3_.textAutoSize = "shrink";
            }
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc2_,_loc3_,true);
         }
      }
   }
   function CLEANUP()
   {
      clearInterval(this.timerIntervalId);
   }
   function setPage1Content(scope, status)
   {
      switch(String(status.valueOf()))
      {
         case "2":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY",scope.PG1_ENTRY,true);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY_COPY_STAGE2",scope.PG1_ENTRY_COPY,true);
            scope.loginPassword.btnTxt.text = this.autoPassword1;
            scope.loginPassword._visible = false;
            this.browser.DISABLE_BUTTON(1,true);
            return;
         case "3":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY_STAGE3",scope.PG1_ENTRY,true);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY_COPY_STAGE3",scope.PG1_ENTRY_COPY,true);
            scope.loginPassword.btnTxt.text = this.autoPassword2;
            scope.loginPassword._visible = false;
            this.browser.DISABLE_BUTTON(1,true);
            return;
         case "4":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY_STAGE4",scope.PG1_ENTRY,true);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY_STAGE4_PASSWORD_COPY",scope.PG1_ENTRY_COPY,true);
            scope.loginPassword.btnTxt.text = "";
            scope.loginPassword._visible = true;
            this.browser.DISABLE_BUTTON(1,false);
            return;
         case "5":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY_STAGE4",scope.PG1_ENTRY,true);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY_COPY_STAGE4",scope.PG1_ENTRY_COPY,true);
            scope.loginPassword.btnTxt.text = this.autoPassword3;
            scope.loginPassword._visible = false;
            this.browser.DISABLE_BUTTON(1,true);
            return;
         case "6":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY_STAGE5",scope.PG1_ENTRY,true);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY_COPY_STAGE5",scope.PG1_ENTRY_COPY,true);
            scope.loginPassword.btnTxt.text = this.autoPassword4;
            scope.loginPassword._visible = false;
            this.browser.DISABLE_BUTTON(1,true);
            return;
         default:
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY",scope.PG1_ENTRY,true);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_PG1_ENTRY_COPY",scope.PG1_ENTRY_COPY,true);
            scope.loginPassword.btnTxt.text = "";
            scope.loginPassword._visible = true;
            this.browser.DISABLE_BUTTON(1,false);
            return;
      }
   }
   function initAnagrams(scope)
   {
      this.anagrams.push({answer:"divine",specialletters:"i"});
      this.anagrams.push({answer:"completeness",specialletters:"t"});
      this.anagrams.push({answer:"orthodoxy",specialletters:"y"});
      this.anagrams.push({answer:"process",specialletters:"o"});
      this.anagrams.push({answer:"realization",specialletters:"i"});
      this.anagrams.push({answer:"awareness",specialletters:"a"});
      this.anagrams.push({answer:"actuality",specialletters:"u"});
      this.anagrams.push({answer:"denial",specialletters:"de"});
      this.anagrams.push({answer:"perception",specialletters:"r"});
      this.anagrams.push({answer:"interpretation",specialletters:"a"});
      this.anagrams.push({answer:"potential",specialletters:"n"});
      this.anagramResult = "you are an idiot";
      this.cleanUpAnagram();
      if(this.anagramsMc)
      {
         this.anagramsMc.removeMovieClip();
      }
      this.anagramsMc = scope.createEmptyMovieClip("anagrams",scope.getNextHighestDepth());
      this.anagramIndex = 0;
      this.userAnagram = [];
      scope.resultScreen._visible = false;
      this.timeRemaining = 59;
      this.updateAnagramTimer();
      this.timerIntervalId = setInterval(this,"updateAnagramTimer",1000);
      if(this.currentAnagramMc)
      {
         this.currentAnagramMc.removeMovieClip();
      }
      this.currentAnagramMc = this.anagramsMc.createEmptyMovieClip("anagram",this.anagramsMc.getNextHighestDepth(),{_x:scope.STG2_TIMER_TF._x,_y:300});
      this.anagramResultSlots = [];
      this.setupAnagramResult(scope);
      this.setupAnagram(scope,this.anagramIndex);
      this.browser.DISABLE_BUTTON(0,true);
      this.mcScope.STAGE2_D_COMPLETE._visible = false;
   }
   function setupAnagramResult(scope)
   {
      var _loc5_ = this.anagramResult.split("");
      var _loc4_ = scope.STG2_TIMER_TF._x + scope.STG2_TIMER_TF._width / 2 - _loc5_.length * 50 / 2 + 40;
      var _loc6_ = this.anagramsMc.createEmptyMovieClip("results",this.anagramsMc.getNextHighestDepth());
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc5_.length)
      {
         _loc3_ = _loc6_.attachMovie("resultslot","resultslot_" + _loc2_,_loc6_.getNextHighestDepth(),{_x:_loc4_,_y:540});
         this.anagramResultSlots.push(_loc3_);
         if(_loc5_[_loc2_] == " ")
         {
            _loc3_._visible = false;
            _loc4_ += 30;
         }
         else
         {
            _loc4_ += 50;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateAnagramTimer()
   {
      var _loc2_;
      if(this.timeRemaining >= 0)
      {
         _loc2_ = String(this.timeRemaining);
         if(_loc2_.length < 2)
         {
            _loc2_ = "0" + _loc2_;
         }
         this.mcScope.STG2_TIMER_TF.text = "00:" + _loc2_;
         this.timeRemaining = this.timeRemaining - 1;
      }
      else
      {
         this.currentAnagramMc.removeMovieClip();
         this.showLoseScreen();
      }
   }
   function updateLetter(index)
   {
      var _loc10_ = this.anagramLettertileSlots[index];
      var _loc8_ = _loc10_.mc;
      _loc8_.swapDepths(50);
      var _loc16_ = _loc10_.isSelected;
      var _loc13_;
      var _loc11_;
      var _loc9_;
      var _loc5_;
      var _loc12_;
      var _loc14_;
      if(!_loc16_)
      {
         _loc11_ = false;
         _loc5_ = 0;
         while(_loc5_ < this.userAnagram.length)
         {
            if(this.userAnagram[_loc5_] == "-")
            {
               this.userAnagram[_loc5_] = _loc8_.btnTxt.text;
               _loc9_ = _loc5_;
               _loc11_ = true;
               break;
            }
            _loc5_ = _loc5_ + 1;
         }
         if(!_loc11_)
         {
            this.userAnagram.push(_loc8_.btnTxt.text);
            _loc9_ = this.userAnagram.length - 1;
         }
         _loc12_ = this.anagramAnswerSlots[_loc9_];
         _loc13_ = {_x:_loc12_._x,_y:_loc12_._y,_rotation:0};
         _loc10_.isSelected = true;
         _loc10_.targetSlotIndex = _loc9_;
      }
      else
      {
         this.userAnagram[_loc10_.targetSlotIndex] = "-";
         _loc14_ = _loc10_.setup;
         _loc13_ = _loc14_;
         _loc10_.isSelected = false;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc8_,0.5,_loc13_);
      var _loc17_ = this.userAnagram.join("");
      var _loc15_;
      var _loc7_;
      var _loc6_;
      var _loc3_;
      var _loc2_;
      var _loc4_;
      if(_loc17_.toLowerCase() == String(this.anagrams[this.anagramIndex].answer).toLowerCase())
      {
         _loc15_ = this.anagrams[this.anagramIndex];
         _loc7_ = this.anagramResult.split("");
         _loc6_ = String(_loc15_.specialletters).split("");
         _loc5_ = 0;
         while(_loc5_ < _loc6_.length)
         {
            _loc3_ = _loc6_[_loc5_];
            _loc2_ = 0;
            while(_loc2_ < this.anagramResultSlots.length)
            {
               _loc4_ = this.anagramResultSlots[_loc2_];
               if(String(_loc7_[_loc2_]).toLowerCase() == _loc3_.toLowerCase())
               {
                  _loc4_.txt.text = _loc3_.toUpperCase();
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
            _loc5_ = _loc5_ + 1;
         }
         if(this.anagramIndex < this.anagrams.length - 1)
         {
            this.anagramIndex = this.anagramIndex + 1;
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.mcScope,0.7,{onComplete:this.anagramDone,onCompleteScope:this});
         }
         else
         {
            this.cleanUpAnagram();
         }
      }
   }
   function anagramDone()
   {
      this.setupAnagram(this.mcScope,this.anagramIndex);
   }
   function showLoseScreen()
   {
      this.mcScope.resultScreen._visible = true;
      clearInterval(this.timerIntervalId);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_STG2_RESULT_TITLE",this.mcScope.resultScreen.COM_STG2_RESULT_TITLE,true);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_STG2_RESULT_COPY",this.mcScope.resultScreen.COM_STG2_RESULT_COPY,true);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_STG2_PANEL_TITLE",this.mcScope.resultScreen.COM_STG2_PANEL_TITLE,true);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_STG2_PANEL_COPY",this.mcScope.resultScreen.COM_STG2_PANEL_COPY,true);
      this.mcScope.STAGE2_D_COMPLETE._visible = true;
      this.browser.DISABLE_BUTTON(0,false);
      this.cleanUpAnagram();
      this.cleanUpResult();
   }
   function cleanUpResult()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.anagramResultSlots.length)
      {
         MovieClip(this.anagramResultSlots[_loc2_]).removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      MovieClip(this.anagramsMc.results).removeMovieClip();
   }
   function cleanUpAnagram()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.anagramAnswerSlots.length)
      {
         MovieClip(this.anagramAnswerSlots[_loc3_]).removeMovieClip();
         _loc3_ = _loc3_ + 1;
      }
      var _loc2_ = 0;
      var _loc4_;
      var _loc5_;
      while(_loc2_ < this.anagramLettertileSlots.length)
      {
         _loc4_ = this.anagramLettertileSlots[_loc2_];
         _loc5_ = _loc4_.mc;
         _loc5_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.anagramLettertileSlots = [];
      this.anagramAnswerSlots = [];
      this.userAnagram = [];
   }
   function setupAnagram(scope, index)
   {
      this.cleanUpAnagram();
      this.anagramIndex = index;
      var _loc22_ = this.anagrams[index];
      var _loc6_ = String(_loc22_.answer).split("");
      var _loc12_ = this.shuffleArray(_loc6_.slice(0));
      var _loc21_ = String(_loc22_.specialletters).split("");
      var _loc10_ = this.currentAnagramMc.createEmptyMovieClip("slots",this.currentAnagramMc.getNextHighestDepth());
      var _loc13_ = this.currentAnagramMc.createEmptyMovieClip("tiles",this.currentAnagramMc.getNextHighestDepth());
      var _loc7_ = scope.STG2_TIMER_TF._x + scope.STG2_TIMER_TF._width / 2 - _loc6_.length * 50 / 2;
      var _loc11_ = [];
      var _loc2_ = 0;
      var _loc8_;
      var _loc4_;
      var _loc3_;
      var _loc5_;
      var _loc9_;
      while(_loc2_ < _loc12_.length)
      {
         _loc8_ = Math.floor(Math.random() * 16) - 8;
         _loc4_ = {_x:_loc7_,_rotation:_loc8_,_y:460};
         _loc3_ = _loc13_.attachMovie("button_lettertile","LETTER_" + this.anagramIndex + "_" + _loc2_,_loc13_.getNextHighestDepth(),{_x:(scope.STG2_TIMER_TF._x + scope.STG2_TIMER_TF._width) / 2,_y:900});
         _loc3_.btnTxt.text = String(_loc12_[_loc2_]).toUpperCase();
         this.anagramLettertileSlots.push({mc:_loc3_,setup:_loc4_,selected:false});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,0.3,_loc4_);
         this.dataTextScope.push(_loc3_.btnTxt);
         _loc3_.offColour = _loc3_.btnTxt.textColor;
         _loc5_ = "letterslot";
         if(this.stringInArray(_loc21_,_loc6_[_loc2_]) && !this.stringInArray(_loc11_,_loc6_[_loc2_]))
         {
            _loc5_ = "resultslot";
            _loc11_.push(_loc6_[_loc2_]);
         }
         _loc9_ = _loc10_.attachMovie(_loc5_,"letterslot_" + this.anagramIndex + "_" + _loc2_,_loc10_.getNextHighestDepth(),{_x:_loc7_,_y:400});
         this.anagramAnswerSlots.push(_loc9_);
         _loc7_ += 50;
         _loc2_ = _loc2_ + 1;
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function shuffleArray(input)
   {
      var _loc1_ = input.length - 1;
      var _loc3_;
      var _loc4_;
      while(_loc1_ >= 0)
      {
         _loc3_ = Math.floor(Math.random() * (_loc1_ + 1));
         _loc4_ = input[_loc3_];
         input[_loc3_] = input[_loc1_];
         input[_loc1_] = _loc4_;
         _loc1_ = _loc1_ - 1;
      }
      return input;
   }
   function stringInArray(input, what)
   {
      var _loc1_ = 0;
      while(_loc1_ < input.length)
      {
         if(input[_loc1_] == what)
         {
            return true;
         }
         _loc1_ = _loc1_ + 1;
      }
      return false;
   }
   function initSlideshow(scope)
   {
      this.slides.push({frame:"SLIDE1A",body:"COM_SLIDE1A",caption:"COM_CAPTION1A"});
      this.slides.push({frame:"SLIDE1B",body:"COM_SLIDE1B"});
      this.slides.push({frame:"SLIDE1C",body:"COM_SLIDE1C"});
      this.slides.push({frame:"SLIDE1D",body:"COM_SLIDE1D"});
      this.slides.push({frame:"SLIDE2",body:"COM_SLIDE2"});
      this.slides.push({frame:"SLIDE3A",body:"COM_SLIDE3A"});
      this.slides.push({frame:"SLIDE3B",body:"COM_SLIDE3B"});
      this.slides.push({frame:"SLIDE4",body:"COM_SLIDE4",caption:"COM_CAPTION4"});
      this.slides.push({frame:"SLIDE6",body:"COM_SLIDE6"});
      this.slides.push({frame:"SLIDE7A",body:"COM_SLIDE7A"});
      this.slides.push({frame:"SLIDE7B",body:"COM_SLIDE7B"});
      this.slideIndex = 0;
      scope.STAGE3WEBINARDONE._visible = false;
      this.browser.DISABLE_BUTTON(0,true);
      this.showSlide(scope,this.slideIndex);
   }
   function decrementSlideIndex()
   {
      this.slideIndex = this.slideIndex - 1;
      if(this.slideIndex < 0)
      {
         this.slideIndex = 0;
      }
      return this.slideIndex;
   }
   function incrementSlideIndex()
   {
      this.slideIndex = this.slideIndex + 1;
      if(this.slideIndex >= this.slides.length - 1)
      {
         this.slideIndex = this.slides.length - 1;
      }
      return this.slideIndex;
   }
   function showSlide(scope, index)
   {
      var _loc6_ = scope.SLIDEPREV;
      var _loc5_ = scope.SLIDENEXT;
      _loc6_._alpha = 100;
      _loc5_._alpha = 100;
      this.browser.DISABLE_BUTTON(1,false);
      this.browser.DISABLE_BUTTON(2,false);
      if(this.slideIndex == 0)
      {
         this.browser.DISABLE_BUTTON(1,true);
         _loc6_._alpha = 10;
      }
      if(this.slideIndex >= this.slides.length - 1)
      {
         this.browser.DISABLE_BUTTON(2,true);
         _loc5_._alpha = 10;
      }
      if(this.slideIndex >= this.slides.length - 2)
      {
         scope.STAGE3WEBINARDONE._visible = true;
         this.browser.DISABLE_BUTTON(0,false);
      }
      var _loc3_ = scope.slideshow;
      var _loc4_ = this.slides[index];
      var _loc9_ = _loc4_.frame;
      var _loc2_ = _loc4_.caption;
      var _loc8_ = _loc4_.body;
      _loc3_.gotoAndStop(_loc9_);
      if(_loc2_ && _loc2_ != "")
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc2_,_loc3_[_loc2_],true);
      }
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc8_,_loc3_[_loc8_],true);
   }
   function initQuestion(scope, questionNumber)
   {
      this.browser.DISABLE_BUTTON(0,true);
      scope["COM_STG4_Q_A" + questionNumber]._visible = false;
      scope["STAGE4_D_" + questionNumber]._visible = false;
      scope["CBTRUE_" + questionNumber].gotoAndStop("UNTICKED");
      scope["CBFALSE_" + questionNumber].gotoAndStop("UNTICKED");
   }
   function answerQuestion(scope, questionNumber, responseWasTrue)
   {
      scope["COM_STG4_Q_A" + questionNumber]._visible = true;
      if(responseWasTrue)
      {
         this.browser.DISABLE_BUTTON(0,false);
         scope["STAGE4_D_" + questionNumber]._visible = true;
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_STG4_Q_A" + questionNumber,scope["COM_STG4_Q_A" + questionNumber],true);
         scope["CBTRUE_" + questionNumber].gotoAndStop("TICKED");
         scope["CBFALSE_" + questionNumber].gotoAndStop("UNTICKED");
      }
      else
      {
         this.browser.DISABLE_BUTTON(0,true);
         scope["STAGE4_D_" + questionNumber]._visible = false;
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"COM_STG4_Q_W" + questionNumber,scope["COM_STG4_Q_A" + questionNumber],true);
         scope["CBTRUE_" + questionNumber].gotoAndStop("UNTICKED");
         scope["CBFALSE_" + questionNumber].gotoAndStop("TICKED");
      }
   }
}
