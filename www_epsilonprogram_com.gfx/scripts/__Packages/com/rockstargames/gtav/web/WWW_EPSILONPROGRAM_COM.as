class com.rockstargames.gtav.web.WWW_EPSILONPROGRAM_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var EvalQuestionArray;
   var PAGE_NAMES;
   var browser;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var intervalId;
   var mcScope;
   var scriptAccessibleMovieClips;
   var scriptAccessibleMovieClipsXpos;
   var currentEvalQuestion = 1;
   function WWW_EPSILONPROGRAM_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 1;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "DONATE";
      this.PAGE_NAMES[3] = "BUY_ROBES";
      this.PAGE_NAMES[4] = "MEETCRIS";
      this.PAGE_NAMES[5] = "CELEBRITIES";
      this.PAGE_NAMES[6] = "HOUSES";
      this.PAGE_NAMES[7] = "MEMBERS";
      this.PAGE_NAMES[8] = "BELIEFS";
      this.PAGE_NAMES[9] = "TENETS";
      this.PAGE_NAMES[10] = "UNSAVEABLES";
      this.PAGE_NAMES[11] = "EVALUATION";
      this.PAGE_NAMES[12] = "RESULTS";
      this.PAGE_NAMES[13] = "WELCOME";
      this.PAGE_NAMES[14] = "PRESENTATION";
      this.PAGE_NAMES[15] = "DONATIONS";
      this.PAGE_NAMES[16] = "ERROR";
      this.PAGE_NAMES[17] = "OUTOFSTOCK";
      this.PAGE_NAMES[18] = "PURCHASETRANSACTION";
      this.PAGE_NAMES[19] = "DONATIONTRANSACTION";
      this.PAGE_NAMES[20] = "MAKEDONATION";
      this.PAGE_NAMES[21] = "STORE";
      this.PAGE_NAMES[22] = "TRANSACTION_D_FAILED";
      this.PAGE_NAMES[23] = "MAINTENANCE";
      this.PAGE_NAMES[24] = "TRACT";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = true;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = true;
      this.CAN_STORE_PAGE[7] = true;
      this.CAN_STORE_PAGE[8] = true;
      this.CAN_STORE_PAGE[9] = true;
      this.CAN_STORE_PAGE[10] = true;
      this.CAN_STORE_PAGE[11] = true;
      this.CAN_STORE_PAGE[12] = true;
      this.CAN_STORE_PAGE[13] = true;
      this.CAN_STORE_PAGE[14] = true;
      this.CAN_STORE_PAGE[15] = true;
      this.CAN_STORE_PAGE[16] = false;
      this.CAN_STORE_PAGE[17] = false;
      this.CAN_STORE_PAGE[18] = false;
      this.CAN_STORE_PAGE[19] = false;
      this.CAN_STORE_PAGE[20] = true;
      this.CAN_STORE_PAGE[21] = true;
      this.CAN_STORE_PAGE[22] = false;
      this.CAN_STORE_PAGE[23] = false;
      this.CAN_STORE_PAGE[24] = false;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
      this.scriptAccessibleMovieClips = ["WWW_EPSILONPROGRAM_COM_S_DONATIONTRANSACTION","WWW_EPSILONPROGRAM_COM_S_DONATIONTRANSACTION_S_"];
      this.scriptAccessibleMovieClipsXpos = [300,300];
      this.EvalQuestionArray = new Array();
   }
   function READY()
   {
   }
   function PROXY_FUNCTION(_function, _page)
   {
      var _loc2_ = _page.toString();
      if(this.mcScope.slideshow != undefined)
      {
         this.mcScope.slideshow.gotoAndStop(_loc2_);
         switch(_loc2_)
         {
            case "0":
            case "1":
               if(this.mcScope.slideshow.message1TF)
               {
                  this.set_localised_text(1,this.mcScope.slideshow.message1TF,"EPS_UNKNOW");
               }
               if(this.mcScope.slideshow.message2TF)
               {
                  this.set_localised_text(1,this.mcScope.slideshow.message2TF,"EPS_CONFRONT");
               }
               if(this.mcScope.slideshow.message3TF)
               {
                  this.set_localised_text(1,this.mcScope.slideshow.message3TF,"EPS_LEARNTRUTH");
               }
               break;
            case "6":
               if(this.mcScope.slideshow.messageTF)
               {
                  this.set_localised_text(1,this.mcScope.slideshow.messageTF,"EPS_PRESENTATION");
               }
            default:
               return;
         }
      }
   }
   function goToAnchor(AnchorLink)
   {
      var _loc3_ = new Array();
      _loc3_ = AnchorLink.split("_");
      var _loc2_ = parseInt(_loc3_[1]);
      var _loc5_;
      var _loc4_;
      if(this.mcScope == this.CONTENT.BELIEFS)
      {
         _loc5_ = "EPS_BELIEFS_Q" + _loc2_;
         _loc4_ = "EPS_BELIEFS_A" + _loc2_;
         this.mcScope.questionTF.autoSize = true;
         this.mcScope.answerTF.autoSize = true;
         this.set_localised_text(2,this.mcScope.questionTF,_loc5_);
         this.set_localised_text(3,this.mcScope.answerTF,_loc4_);
         this.mcScope.buttonHighlight._x = this.mcScope["Q_" + _loc2_]._x;
      }
      else if(this.mcScope == this.CONTENT.EVALUATION)
      {
         if(_loc3_[0] == "Q")
         {
            this.currentEvalQuestion = _loc2_;
            _loc5_ = "EPS_Q" + _loc2_;
            this.mcScope.questionTF.autoSize = true;
            this.set_localised_text(2,this.mcScope.questionTF,_loc5_);
            this.mcScope.buttonHighlight._x = this.mcScope["Q_" + _loc2_]._x;
         }
         else if(_loc3_[0] == "A")
         {
            this.EvalQuestionArray[this.currentEvalQuestion - 1] = _loc2_;
            if(this.currentEvalQuestion < 10)
            {
               this.browser.DISABLE_BUTTON(14 + this.currentEvalQuestion,false);
               this.goToAnchor("Q_" + (this.currentEvalQuestion + 1));
            }
            if(this.EvalQuestionArray.length > 9)
            {
               this.browser.DISABLE_BUTTON(10,false);
            }
         }
      }
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.defaultButtonOnColour = 16777215;
      this.defaultButtonOffColour = 14079703;
      this.dataTextScope = new Array();
      clearInterval(this.intervalId);
      this.CONTENT._y = 0;
      if(this.browser.player != 0)
      {
         pageName = "ERROR";
         this.CONTENT.gotoAndStop(pageName);
      }
      var _loc2_;
      var _loc4_;
      var _loc9_;
      var _loc11_;
      var _loc3_;
      var _loc10_;
      var _loc8_;
      var _loc6_;
      var _loc5_;
      var _loc7_;
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.set_localised_text(-1,this.mcScope.EPS_WELCOME,"EPS_WELCOME",false);
            this.set_localised_text(-1,this.mcScope.EPS_HOME1,"EPS_HOME1",false);
            this.set_localised_text(10,this.mcScope.EVALUATION.btnTxt,"EPS_EVAL",true);
            this.set_localised_text(1,this.mcScope.STORE.btnTxt,"EPS_CLICK_ROBES",true);
            this.set_localised_text(2,this.mcScope.MAKEDONATION.btnTxt,"EPS_MAKEDONATION",true);
            this.set_localised_text(4,this.mcScope.WELCOME.btnTxt,"EPS_WELCOME",true);
            this.set_robes_ad_text();
            this.browser.DISABLE_BUTTON(4,true);
            this.CONTENT.BOUNDING_BOX._height = 1190;
            break;
         case "MEETCRIS":
            this.mcScope = this.CONTENT.MEETCRIS;
            this.set_localised_text(1,this.mcScope.EVALUATION.btnTxt,"EPS_EVAL",true);
            this.CONTENT.BOUNDING_BOX._height = 1240;
            break;
         case "CELEBRITIES":
            this.mcScope = this.CONTENT.CELEBRITIES;
            this.CONTENT.BOUNDING_BOX._height = 1180;
            break;
         case "HOUSES":
            this.mcScope = this.CONTENT.HOUSES;
            this.set_localised_text(1,this.mcScope.EVALUATION.btnTxt,"EPS_EVAL",true);
            this.set_localised_text(2,this.mcScope.STORE.btnTxt,"EPS_CLICK_ROBES",true);
            this.set_robes_ad_text();
            this.CONTENT.BOUNDING_BOX._height = 1170;
            break;
         case "MEMBERS":
            this.mcScope = this.CONTENT.MEMBERS;
            this.set_localised_text(1,this.mcScope.EVALUATION.btnTxt,"EPS_EVAL",true);
            this.set_robes_ad_text();
            this.set_localised_text(2,this.mcScope.STORE.btnTxt,"EPS_CLICK_ROBES",true);
            this.CONTENT.BOUNDING_BOX._height = 1100;
            break;
         case "BELIEFS":
            this.mcScope = this.CONTENT.BELIEFS;
            this.set_localised_text(1,this.mcScope.TENETS.btnTxt,"EPS_CLICK",true);
            _loc2_ = 1;
            while(_loc2_ < 11)
            {
               _loc4_ = "Q_" + _loc2_;
               this.dataTextScope[9 + _loc2_] = this.mcScope[_loc4_].btnTxt;
               this.mcScope[_loc4_].btnTxt.text = "Q" + _loc2_;
               this.mcScope[_loc4_].offColour = 6721717;
               _loc2_ = _loc2_ + 1;
            }
            this.mcScope.buttonHighlight._x = this.mcScope.Q_1._x;
            this.set_localised_text(2,this.mcScope.questionTF,"EPS_BELIEFS_Q1");
            this.set_localised_text(3,this.mcScope.answerTF,"EPS_BELIEFS_A1");
            this.CONTENT.BOUNDING_BOX._height = 1110;
            break;
         case "TENETS":
            this.mcScope = this.CONTENT.TENETS;
            _loc9_ = 350;
            _loc11_ = 22;
            _loc2_ = 1;
            while(_loc2_ < 13)
            {
               _loc3_ = "TENETS" + _loc2_;
               _loc10_ = "EPS_TENETS" + _loc2_;
               _loc8_ = "number" + _loc2_;
               this.mcScope[_loc3_].autoSize = true;
               this.set_localised_text(_loc2_ + 9,this.mcScope[_loc3_],_loc10_);
               this.mcScope[_loc8_].text = _loc2_;
               this.mcScope[_loc8_]._y = _loc9_ - 15;
               this.mcScope[_loc3_]._y = _loc9_;
               _loc9_ += this.mcScope[_loc3_]._height + _loc11_;
               _loc2_ = _loc2_ + 1;
            }
            this.CONTENT.BOUNDING_BOX._height = _loc9_ + this.mcScope[_loc3_]._height + _loc11_ + 40;
            break;
         case "UNSAVEABLES":
            this.mcScope = this.CONTENT.UNSAVEABLES;
            this.set_localised_text(10,this.mcScope.EVALUATION.btnTxt,"EPS_EVAL",true);
            this.set_localised_text(11,this.mcScope.STORE.btnTxt,"EPS_CLICK_ROBES",true);
            this.set_robes_ad_text();
            this.CONTENT.BOUNDING_BOX._height = 1140;
            break;
         case "EVALUATION":
            this.mcScope = this.CONTENT.EVALUATION;
            this.set_localised_text(10,this.mcScope.RESULTS.btnTxt,"EPS_GETRESULTS",true);
            this.set_localised_text(11,this.mcScope.A_1.btnTxt,"EPS_YES",true);
            this.set_localised_text(12,this.mcScope.A_2.btnTxt,"EPS_NO",true);
            this.set_localised_text(13,this.mcScope.A_3.btnTxt,"EPS_MAYBE",true);
            this.mcScope.A_1.offColour = 6721717;
            this.mcScope.A_2.offColour = 6721717;
            this.mcScope.A_3.offColour = 6721717;
            this.mcScope.questionTF.autoSize = true;
            this.set_localised_text(1,this.mcScope.questionTF,"EPS_Q1");
            _loc2_ = 1;
            while(_loc2_ < 11)
            {
               _loc4_ = "Q_" + _loc2_;
               this.dataTextScope[13 + _loc2_] = this.mcScope[_loc4_].btnTxt;
               this.mcScope[_loc4_].btnTxt.text = "Q" + _loc2_;
               this.mcScope[_loc4_].offColour = 6721717;
               _loc2_ = _loc2_ + 1;
            }
            this.currentEvalQuestion = 1;
            this.CONTENT.BOUNDING_BOX._height = 920;
            if(this.EvalQuestionArray.length > 9)
            {
               this.browser.DISABLE_BUTTON(10,false);
               break;
            }
            this.browser.DISABLE_BUTTON(10,true);
            _loc2_ = 2;
            while(_loc2_ < 11)
            {
               if(this.EvalQuestionArray[_loc2_ - 1] == undefined)
               {
                  this.browser.DISABLE_BUTTON(13 + _loc2_,true);
               }
               else
               {
                  this.browser.DISABLE_BUTTON(13 + _loc2_,false);
               }
               _loc2_ = _loc2_ + 1;
            }
            break;
         case "RESULTS":
            this.mcScope = this.CONTENT.RESULTS;
            this.set_localised_text(1,this.mcScope.processingResultsMC.messageTF,"EPS_PROCESSING");
            this.CONTENT.BOUNDING_BOX._height = 860;
            break;
         case "WELCOME":
            this.mcScope = this.CONTENT.WELCOME;
            this.set_localised_text(1,this.mcScope.PRESENTATION.btnTxt,"EPS_CLICKSTART",true);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PRESENTATION":
            this.mcScope = this.CONTENT.PRESENTATION;
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "ERROR":
            this.mcScope = this.CONTENT.ERROR;
            this.mcScope.messageTF.multiline = true;
            this.mcScope.messageTF.wordWrap = true;
            if(this.browser.player != 0)
            {
               this.set_localised_text(-1,this.mcScope.messageTF,"EPSI_NO_MP_VISIT");
            }
            else
            {
               this.set_localised_text(-1,this.mcScope.messageTF,"EPS_DONATEFAIL");
            }
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "OUTOFSTOCK":
            this.mcScope = this.CONTENT.ERROR;
            this.set_localised_text(1,this.mcScope.messageTF,"EPS_OUTOFSTOCK");
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PURCHASETRANSACTION":
            this.mcScope = this.CONTENT.PURCHASETRANSACTION;
            this.set_localised_text(1,this.mcScope.messageTF,"EPS_ROBESBOUGHT");
            this.set_localised_text(10,this.mcScope.processingTransactionMC.messageTF,"WEB_PROCESSINGTRANSACTION");
            this.intervalId = setInterval(this,"displayPurchasedText",2000);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "DONATIONTRANSACTION":
            this.mcScope = this.CONTENT.DONATIONTRANSACTION;
            this.set_localised_text(1,this.mcScope.messageTF,"EPS_DONATESUCCESS");
            this.set_localised_text(10,this.mcScope.processingTransactionMC.messageTF,"WEB_PROCESSINGTRANSACTION");
            this.intervalId = setInterval(this,"displayPurchasedText",2000);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "MAKEDONATION":
            this.mcScope = this.CONTENT.MAKEDONATION;
            this.set_localised_text(2,this.mcScope.DONATIONTRANSACTION.btnTxt,"EPS_DONATE500");
            this.set_localised_text(3,this.mcScope.DONATIONTRANSACTION_S_.btnTxt,"EPS_DONATE5000");
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "STORE":
            this.mcScope = this.CONTENT.STORE;
            this.set_localised_text(1,this.mcScope.PURCHASETRANSACTION.btnTxt,"EPS_BUYROBES",true);
            this.CONTENT.BOUNDING_BOX._height = 900;
            break;
         case "TRANSACTION_D_FAILED":
            this.mcScope = this.CONTENT.ERROR;
            this.mcScope.messageTF.multiline = true;
            this.mcScope.messageTF.wordWrap = true;
            this.dataTextScope[1] = this.mcScope.messageTF;
            if(this.dataProviderUI[0] != undefined && this.dataProviderUI[0] != "")
            {
               this.dataTextScope[1].text = this.dataProviderUI[0];
            }
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "MAINTENANCE":
            this.mcScope = this.CONTENT.MAINTENANCE;
            this.set_localised_text(1,this.mcScope.messageTF,"WEB_MAINTENANCE");
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "TRACT":
            this.mcScope = this.CONTENT.TRACT;
            _loc6_ = ["TRACT1_1","TRACT1_2","TRACT1_3","TRACT2_1","TRACT2_2","TRACT2_3","TRACT2_4","TRACT3_1","TRACT3_2","TRACT3_3","TRACT3_4","TRACT3_5","TRACT3_6","TRACT3_7","TRACT4_1","TRACT4_2","TRACT4_3","TRACT4_4","TRACT4_5","TRACT4_6","TRACT5_1","TRACT5_2","TRACT5_3","TRACT5_4","TRACT5_5","TRACT5_6"];
            this.mcScope.TRACT1_1.autoSize = true;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EPS_TRACT1_1",this.mcScope.TRACT1_1,true);
            _loc2_ = 1;
            while(_loc2_ < _loc6_.length)
            {
               _loc5_ = this.mcScope[_loc6_[_loc2_]];
               _loc7_ = this.mcScope[_loc6_[_loc2_ - 1]];
               _loc5_._y = _loc7_._y + _loc7_._height + 8;
               _loc5_.autoSize = true;
               com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EPS_" + _loc6_[_loc2_],_loc5_,true);
               _loc2_ = _loc2_ + 1;
            }
            this.mcScope.TRACT5_6._y = this.mcScope.TRACT5_5._y + this.mcScope.TRACT5_5._height + 8;
            this.CONTENT.BOUNDING_BOX._height = this.mcScope.TRACT5_6._y + this.mcScope.TRACT5_6._height + 60;
      }
      if(this.mcScope != this.CONTENT.PAGE1)
      {
         this.scan_and_set_localised_text(this.mcScope);
      }
      this.mcScope.WWW_EPSILONPROGRAM_COM_S_PAGE1.onColour = 3355443;
      this.mcScope.WWW_EPSILONPROGRAM_COM_S_PAGE1.offColour = 0;
      this.set_localised_text(0,this.mcScope.WWW_EPSILONPROGRAM_COM_S_PAGE1.btnTxt,"WEB_HOME",true);
      this.set_localised_text(25,this.mcScope.MEETCRIS.btnTxt,"EPS_MEETCRIS",true);
      this.set_localised_text(5,this.mcScope.CELEBRITIES.btnTxt,"EPS_CELEB",true);
      this.set_localised_text(6,this.mcScope.HOUSES.btnTxt,"EPS_HOUSES",true);
      this.set_localised_text(7,this.mcScope.MEMBERS.btnTxt,"EPS_MEMBERS",true);
      this.set_localised_text(8,this.mcScope.BELIEFS.btnTxt,"EPS_BELIEFS",true);
      this.set_localised_text(9,this.mcScope.UNSAVEABLES.btnTxt,"EPS_UNSAVEABLES",true);
      if(newPage == false)
      {
         this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      }
   }
   function displayPurchasedText()
   {
      clearInterval(this.intervalId);
      if(this.mcScope.processingTransactionMC != undefined)
      {
         this.mcScope.processingTransactionMC._alpha = 0;
      }
   }
   function scan_and_set_localised_text(scope)
   {
      var _loc2_;
      var _loc1_;
      for(var _loc4_ in scope)
      {
         _loc2_ = scope[_loc4_]._name;
         if(_loc2_.substr(0,4) == "EPS_")
         {
            _loc1_ = scope[_loc4_];
            _loc1_.html = true;
            _loc1_.multiline = true;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc2_,_loc1_,true);
         }
      }
   }
   function set_localised_text(slotID, TF, TextLabel, setDataSlot, isHtml)
   {
      this.dataTextScope[slotID] = TF;
      if(isHtml == undefined)
      {
         isHtml = true;
      }
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,TextLabel,TF,isHtml);
      TF.multiline = true;
      var _loc3_;
      if(setDataSlot == true)
      {
         _loc3_ = this.CONTENT.TF.htmlText;
         this.browser.SET_DATA_SLOT(slotID,_loc3_);
      }
   }
   function set_robes_ad_text()
   {
      this.set_localised_text(0,this.mcScope.STORE.robesTop,"EPS_PALE_BLUE");
      this.set_localised_text(0,this.mcScope.STORE.robesBottom,"EPS_LOOK_GREAT");
   }
   function SET_MOVIECLIP_VISIBILITY(isVisible, instanceEnum)
   {
      var _loc3_ = this.scriptAccessibleMovieClipsXpos[instanceEnum];
      var _loc2_ = this.mcScope[this.scriptAccessibleMovieClips[instanceEnum]];
      if(_loc2_)
      {
         if(isVisible == false)
         {
            this.hideMovieClip(_loc2_);
         }
         else
         {
            this.showMovieClip(_loc2_,_loc3_);
         }
      }
   }
}
