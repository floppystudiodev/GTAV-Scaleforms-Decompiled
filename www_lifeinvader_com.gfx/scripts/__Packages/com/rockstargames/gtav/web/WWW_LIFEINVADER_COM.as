class com.rockstargames.gtav.web.WWW_LIFEINVADER_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var _name;
   var adContainer;
   var browser;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var listItem;
   var mcScope;
   var pageHeight;
   var postContainer;
   var sideBarItem;
   var lineSpacing = 8;
   var sideBarX = 226;
   var sideBarY = 290;
   var listX = 430;
   var listY = 290;
   function WWW_LIFEINVADER_COM()
   {
      super();
      this._name = "WWW_LIFEINVADER_COM";
      this.IS_SITE_DYNAMIC = 1;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "ERROR";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = false;
      this.resetScroll == true;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = AnchorLink.indexOf("WWW_");
      if(_loc2_ != -1)
      {
         this.browser.GO_TO_WEBPAGE(AnchorLink);
      }
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.defaultButtonOnColour = 16711680;
      this.defaultButtonOffColour = 10682370;
      this.CONTENT._y = 0;
      this.dataTextScope = new Array();
      var _loc2_;
      if(newPage == true)
      {
         _loc2_ = "LFI_STRAPLINE" + this.randRange(1,10);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.CONTENT.header.headerTF,_loc2_,0,true);
      }
      this.pageHeight = 627;
      this.sideBarY = 290;
      this.sideBarItem = 0;
      this.listY = 290;
      this.listItem = 0;
      if(this.postContainer != undefined)
      {
         this.postContainer.removeMovieClip();
      }
      if(this.browser.player == 1)
      {
         pageName = "ERROR";
         this.CONTENT.gotoAndStop(pageName);
      }
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.setupProfileBox();
            this.makeLists();
            break;
         case "ERROR":
            this.mcScope = this.CONTENT.ERROR;
            this.mcScope.messageTF.autoSize = "center";
            if(this.browser.player == 1)
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.messageTF,"LFI_OUTOFSERVICE",0,true);
               break;
            }
            if(this.dataProviderUI[1] != undefined && this.dataProviderUI[1] != "")
            {
               this.mcScope.messageTF.htmlText = this.dataProviderUI[1];
            }
      }
      this.updateSponsoredAds();
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      if(this.pageHeight > 627)
      {
         this.mcScope.backgroundMC._height = this.pageHeight;
         this.CONTENT.BOUNDING_BOX._height = this.pageHeight;
      }
   }
   function setupProfileBox()
   {
      var _loc13_ = this.mcScope.profile;
      var _loc7_ = this.dataProviderUI[0][0];
      var _loc6_ = this.dataProviderUI[0][1];
      var _loc4_ = this.dataProviderUI[0][2];
      var _loc3_ = this.dataProviderUI[0][3];
      var _loc5_ = this.dataProviderUI[0][4];
      var _loc2_ = this.dataProviderUI[0][5];
      var _loc8_ = this.dataProviderUI[0][6];
      var _loc10_ = this.dataProviderUI[0][7];
      var _loc9_ = this.dataProviderUI[0][8];
      var _loc11_ = this.dataProviderUI[0][9];
      var _loc12_ = this.dataProviderUI[0][10];
      if(_loc7_ != undefined)
      {
         this.mcScope.profileMC.usernameTF.htmlText = _loc7_;
      }
      if(_loc6_ != undefined && _loc6_ != "")
      {
         this.mcScope.profileMC.picMC.gotoAndStop(_loc6_);
      }
      else
      {
         this.mcScope.profileMC.picMC.gotoAndStop(1);
      }
      this.mcScope.profileMC.picMC._alpha = 100;
      if(_loc4_ != undefined && _loc4_ != "")
      {
         this.mcScope.profileMC.occupationTitleTF.autoSize = "left";
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.profileMC.occupationTitleTF,"LFI_OCCUPATION",0,true);
         this.mcScope.profileMC.occupationTF.autoSize = "left";
         this.mcScope.profileMC.occupationTF._x = this.mcScope.profileMC.occupationTitleTF._x + this.mcScope.profileMC.occupationTitleTF._width + 4;
         this.mcScope.profileMC.occupationTF.htmlText = _loc4_;
      }
      else
      {
         this.mcScope.profileMC.occupationTitleTF.htmlText = "";
         this.mcScope.profileMC.occupationTF.htmlText = "";
      }
      if(_loc3_ != undefined && _loc3_ != "")
      {
         this.mcScope.profileMC.relationshipTitleTF.autoSize = "left";
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.profileMC.relationshipTitleTF,"LFI_RELATIONSHIP",0,true);
         this.mcScope.profileMC.relationshipTF.autoSize = "left";
         this.mcScope.profileMC.relationshipTF._x = this.mcScope.profileMC.relationshipTitleTF._x + this.mcScope.profileMC.relationshipTitleTF._width + 4;
         this.mcScope.profileMC.relationshipTF.htmlText = _loc3_;
      }
      else
      {
         this.mcScope.profileMC.relationshipTitleTF.htmlText = "";
         this.mcScope.profileMC.relationshipTF.htmlText = "";
      }
      this.dataTextScope[0] = undefined;
      this.dataTextScope[1] = undefined;
      this.dataTextScope[2] = undefined;
      this.dataTextScope[3] = undefined;
      if(_loc10_ == true)
      {
         this.dataTextScope[0] = this.mcScope.profileMC.backtoprofile.btnTxt;
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.profileMC.backtoprofile.btnTxt,"LFI_BACKTOMYPROFILE",0,true);
         this.mcScope.profileMC.backtoprofile._visible = true;
      }
      else
      {
         this.mcScope.profileMC.backtoprofile._visible = false;
      }
      if(_loc9_ == true)
      {
         this.dataTextScope[1] = this.mcScope.profileMC.PHOTOS.btnTxt;
      }
      if(_loc11_ == true)
      {
         this.dataTextScope[2] = this.mcScope.profileMC.FRIENDS.btnTxt;
      }
      if(_loc12_ == true)
      {
         this.dataTextScope[3] = this.mcScope.profileMC.STALKING.btnTxt;
      }
      if(_loc5_ != undefined && _loc5_ != "")
      {
         this.mcScope.profileMC.PHOTOS.picMC.gotoAndStop(_loc5_);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.profileMC.PHOTOS.btnTxt,"LFI_PHOTOS",0,true);
         this.mcScope.profileMC.PHOTOS.picMC._alpha = 100;
      }
      else
      {
         this.mcScope.profileMC.PHOTOS.picMC.gotoAndStop(1);
         this.mcScope.profileMC.PHOTOS.btnTxt.text = "";
      }
      if(_loc2_ != undefined && _loc2_ != "")
      {
         this.mcScope.profileMC.FRIENDS.picMC.gotoAndStop(_loc2_);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.profileMC.FRIENDS.btnTxt,"LFI_FRIENDS",0,true);
         this.mcScope.profileMC.FRIENDS.picMC._alpha = 100;
      }
      else
      {
         this.mcScope.profileMC.FRIENDS.picMC.gotoAndStop(1);
         this.mcScope.profileMC.FRIENDS.btnTxt.text = "";
      }
      if(_loc2_ != undefined && _loc8_ != "")
      {
         this.mcScope.profileMC.STALKING.picMC.gotoAndStop(_loc8_);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.profileMC.STALKING.btnTxt,"LFI_STALKING",0,true);
         this.mcScope.profileMC.STALKING.picMC._alpha = 100;
      }
      else
      {
         this.mcScope.profileMC.STALKING.picMC.gotoAndStop(1);
         this.mcScope.profileMC.STALKING.btnTxt.text = "";
      }
   }
   function updateSponsoredAds()
   {
      var _loc5_;
      var _loc6_;
      var _loc2_;
      var _loc3_;
      var _loc4_;
      if(this.mcScope.sponsoredAds != undefined)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.sponsoredAds.header_sponsoredTF,"LFI_SPONSOREDADVERTS",0,true);
         _loc5_ = new Array();
         _loc5_ = ["WWW_BLEETER_BIZ","WWW_CULTSTOPPERS_COM","WWW_ELECTROTOKESYSTEM_COM","WWW_EPSILONPROGRAM_COM","WWW_LENNYAVERY_D_REALTY_COM","WWW_PRINCESSROBOTBUBBLEGUM_COM","WWW_SIXFIGURETEMPS_COM","WWW_VISITTHEALAMOSEA_COM"];
         if(this.adContainer != undefined)
         {
            this.adContainer.removeMovieClip();
         }
         this.adContainer = this.mcScope.sponsoredAds.createEmptyMovieClip("adContainer",this.mcScope.sponsoredAds.getNextHighestDepth());
         _loc2_ = 0;
         while(_loc2_ < 4)
         {
            _loc3_ = _loc5_.splice(this.randRange(0,_loc5_.length - 1),1);
            _loc6_ = 48 + _loc2_ * 77;
            _loc4_ = this.adContainer.attachMovie(_loc3_[0],_loc3_[0],this.adContainer.getNextHighestDepth(),{_x:2,_y:_loc6_});
            this.dataTextScope.push(_loc4_.btnTxt);
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function makeLists()
   {
      this.postContainer = this.mcScope.createEmptyMovieClip("postContainer",this.mcScope.getNextHighestDepth());
      var _loc9_ = 4;
      var _loc2_;
      var _loc3_;
      var _loc12_;
      var _loc6_;
      var _loc7_;
      var _loc11_;
      var _loc8_;
      var _loc14_;
      var _loc4_;
      var _loc5_;
      var _loc13_;
      var _loc10_;
      while(_loc9_ < this.dataProviderUI.length)
      {
         _loc2_ = _loc9_;
         if(this.dataProviderUI[_loc2_][0] == 0)
         {
            _loc3_ = this.postContainer.attachMovie("MC_sidebar_box","MC_sidebar_box" + this.sideBarItem,this.postContainer.getNextHighestDepth(),{_x:this.sideBarX,_y:this.sideBarY});
            if(this.dataProviderUI[_loc2_][1] != undefined && this.dataProviderUI[_loc2_][1] != "")
            {
               _loc3_.titleTF.htmlText = this.dataProviderUI[_loc2_][1];
            }
            _loc3_.titleTF.autoSize = true;
            _loc3_.numberTF._x = _loc3_.titleTF._x + _loc3_.titleTF._width;
            _loc3_.bodyTF._y = _loc3_.titleTF._height;
            _loc3_.imageMC._y = _loc3_.titleTF._height;
            if(this.dataProviderUI[_loc2_][2] != undefined && this.dataProviderUI[_loc2_][2] != "")
            {
               _loc3_.bodyTF.htmlText = this.dataProviderUI[_loc2_][2];
            }
            _loc3_.bodyTF.autoSize = true;
            if(this.dataProviderUI[_loc2_][3] != undefined && this.dataProviderUI[_loc2_][3] != "")
            {
               _loc3_.picMC.gotoAndStop(this.dataProviderUI[_loc2_][3]);
            }
            else
            {
               _loc3_.picMC.gotoAndStop(1);
            }
            _loc3_.picMC._alpha = 100;
            if(this.dataProviderUI[_loc2_][4] != undefined && this.dataProviderUI[_loc2_][4] != "")
            {
               _loc3_.numberTF.htmlText = this.dataProviderUI[_loc2_][4];
               _loc3_.numberTF.autoSize = true;
            }
            _loc3_.divider._y = _loc3_.bodyTF._y + _loc3_.bodyTF._height;
            this.sideBarY += _loc3_._height + this.lineSpacing;
            this.sideBarItem = this.sideBarItem + 1;
            if(this.sideBarY + 40 > this.pageHeight)
            {
               this.pageHeight = this.sideBarY + 40;
            }
         }
         if(this.dataProviderUI[_loc2_][0] == 1)
         {
            _loc12_ = "MC_message_box" + this.listItem;
            _loc6_ = this.dataProviderUI[_loc2_][3];
            _loc7_ = _loc6_.indexOf("www.");
            if(_loc7_ != -1)
            {
               _loc11_ = _loc6_.substr(_loc7_ + 1).indexOf(" ");
               if(_loc11_ == -1)
               {
                  _loc11_ = _loc6_.length;
               }
               _loc8_ = _loc6_.substr(_loc7_,_loc11_ + 1);
               _loc12_ = this.browser.PARSE_TEXT_TO_FILENAME(_loc8_);
               _loc14_ = _loc6_.split(_loc8_);
               _loc6_ = _loc14_[0] + "<font color=\'#2f5c73\'>" + _loc8_ + "</font>" + _loc14_[1];
               this.dataProviderUI[_loc2_][5] = true;
            }
            _loc4_ = this.postContainer.attachMovie("MC_message_box",_loc12_,this.postContainer.getNextHighestDepth(),{_x:this.listX,_y:this.listY});
            if(this.dataProviderUI[_loc2_][1] != undefined && this.dataProviderUI[_loc2_][1] != "")
            {
               _loc4_.btnTxt.htmlText = this.dataProviderUI[_loc2_][1];
            }
            _loc4_.btnTxt.autoSize = true;
            _loc4_.statusTF._y = _loc4_.btnTxt._y + _loc4_.btnTxt._height;
            if(this.dataProviderUI[_loc2_][2] != undefined && this.dataProviderUI[_loc2_][2] != "")
            {
               _loc4_.statusTF.htmlText = this.dataProviderUI[_loc2_][2];
            }
            _loc4_.messageTF._y = _loc4_.statusTF._y + _loc4_.statusTF._height;
            if(_loc6_ != undefined && _loc6_ != "")
            {
               _loc4_.messageTF.htmlText = _loc6_;
            }
            _loc4_.messageTF.autoSize = true;
            if(this.dataProviderUI[_loc2_][4] != undefined)
            {
               _loc4_.picMC.gotoAndStop(this.dataProviderUI[_loc2_][4]);
            }
            else
            {
               _loc4_.picMC.gotoAndStop(1);
            }
            _loc4_.picMC._alpha = 100;
            _loc4_.bg._height = _loc4_.messageTF._y + _loc4_.messageTF._height + 4;
            if(this.dataProviderUI[_loc2_][5] == true)
            {
               this.dataTextScope[_loc2_] = _loc4_.btnTxt;
            }
            this.listY += _loc4_._height + this.lineSpacing;
            this.listItem = this.listItem + 1;
            if(this.listY + 40 > this.pageHeight)
            {
               this.pageHeight = this.listY + 40;
            }
         }
         if(this.dataProviderUI[_loc2_][0] == 2)
         {
            _loc5_ = this.postContainer.attachMovie("MC_friends_box","MC_friends_box" + this.listItem,this.postContainer.getNextHighestDepth(),{_x:this.listX,_y:this.listY});
            if(this.dataProviderUI[_loc2_][1] != undefined && this.dataProviderUI[_loc2_][1] != "")
            {
               _loc5_.btnTxt.htmlText = this.dataProviderUI[_loc2_][1];
            }
            _loc5_.btnTxt.autoSize = true;
            _loc5_.messageTF._y = _loc5_.btnTxt._y + _loc5_.btnTxt._height;
            if(this.dataProviderUI[_loc2_][2] != undefined && this.dataProviderUI[_loc2_][2] != "")
            {
               _loc5_.messageTF.htmlText = this.dataProviderUI[_loc2_][2];
            }
            _loc5_.messageTF.autoSize = true;
            if(this.dataProviderUI[_loc2_][3] != undefined)
            {
               _loc5_.picMC.gotoAndStop(this.dataProviderUI[_loc2_][3]);
            }
            else
            {
               _loc5_.picMC.gotoAndStop(1);
            }
            _loc5_.picMC._alpha = 100;
            _loc13_ = _loc5_.messageTF._y + _loc5_.messageTF._height + 4;
            if(_loc13_ > 48)
            {
               _loc5_.bg._height = _loc13_;
            }
            if(this.dataProviderUI[_loc2_][4] == true)
            {
               this.dataTextScope[_loc2_] = _loc5_.btnTxt;
            }
            this.listY += _loc5_._height + this.lineSpacing;
            this.listItem = this.listItem + 1;
            if(this.listY + 40 > this.pageHeight)
            {
               this.pageHeight = this.listY + 40;
            }
         }
         if(this.dataProviderUI[_loc2_][0] == 3)
         {
            _loc10_ = this.postContainer.attachMovie("MC_text_box","MC_text_box" + this.listItem,this.postContainer.getNextHighestDepth(),{_x:this.listX,_y:this.listY});
            if(this.dataProviderUI[_loc2_][1] != undefined && this.dataProviderUI[_loc2_][1] != "")
            {
               _loc10_.messageTF.htmlText = this.dataProviderUI[_loc2_][1];
            }
            _loc10_.messageTF.autoSize = true;
            this.listY += _loc10_._height + this.lineSpacing;
            this.listItem = this.listItem + 1;
            if(this.listY + 40 > this.pageHeight)
            {
               this.pageHeight = this.listY + 40;
            }
         }
         _loc9_ = _loc9_ + 1;
      }
   }
   function randRange(min, max)
   {
      var _loc1_ = Math.floor(Math.random() * (max - min + 1)) + min;
      return _loc1_;
   }
   function CLEANUP()
   {
   }
}
