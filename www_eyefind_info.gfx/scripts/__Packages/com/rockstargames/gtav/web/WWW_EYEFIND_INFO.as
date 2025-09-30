class com.rockstargames.gtav.web.WWW_EYEFIND_INFO extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var TXDarray;
   var _name;
   var browser;
   var composeBodyStr;
   var composeSubjectStr;
   var dataProviderUI;
   var dataTextScope;
   var dontUpdateSearch;
   var excludeMPwebsites;
   var intervalID;
   var mcScope;
   var mpRandomWebsites;
   var newsOrgArray;
   var offerMPWebsites;
   var pageName;
   var prevPage;
   var prevSearchArgs;
   var randomWebsites;
   var resultsContainer;
   var searchResults;
   var sponsoredAdNum;
   var weatherDataArray;
   var weatherUpdated;
   var womURL;
   var maxNumberOfResults = 6;
   var wantedLevel = 0;
   var isMP = false;
   var inboxStr = "";
   var composeStr = "";
   var replyStr = "";
   var deleteStr = "";
   var cancelStr = "";
   var sendStr = "";
   var olderStr = "";
   var newerStr = "";
   var numEmails = 0;
   var numContacts = 0;
   var lastEmailClicked = 0;
   function WWW_EYEFIND_INFO()
   {
      super();
      this._name = "WWW_EYEFIND_INFO";
      this.IS_SITE_DYNAMIC = 1;
      this.browser = _level0.TIMELINE;
      this.isMP = this.browser.player == 1;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "";
      this.PAGE_NAMES[3] = "ERROR";
      this.PAGE_NAMES[4] = "SEARCH";
      this.PAGE_NAMES[5] = "NEWS";
      this.PAGE_NAMES[6] = "WARNING";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = true;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = true;
      this.browser.DebugTextContent = true;
      this.weatherUpdated = false;
      this.dontUpdateSearch = true;
      this.prevPage = undefined;
      this.prevSearchArgs = undefined;
      this.TXDarray = new Array();
      this.searchResults = new Array();
      this.weatherDataArray = new Array();
      this.newsOrgArray = new Array("news_dailyglobe","news_dailyrag","news_libertytree","news_lossantosmeteor","news_lossantosshepherd","news_ls24","news_ludendorffweekly","news_PLO","news_prattle","news_senorabeacon","news_starstalk","news_talkinballs","news_weazelnews","news_wnka");
      this.excludeMPwebsites = new Array("EYEFIND_INFO","ELITASTRAVEL_COM","LEGENDARYMOTORSPORT_NET","WARSTOCK_D_CACHE_D_AND_D_CARRY_COM","DOCKTEASE_COM","SOUTHERNSANANDREASSUPERAUTOS_COM","DYNASTY8REALESTATE_COM","FORECLOSURES_MAZE_D_BANK_COM","BENNYSORIGINALMOTORWORKS_COM","DYNASTY8EXECUTIVEREALTY_COM");
      this.offerMPWebsites = ["WWW_DOCKTEASE_COM","WWW_DYNASTY8REALESTATE_COM","WWW_ELITASTRAVEL_COM","WWW_LEGENDARYMOTORSPORT_NET","WWW_BENNYSORIGINALMOTORWORKS_COM","WWW_PANDMCYCLES_COM","WWW_SOUTHERNSANANDREASSUPERAUTOS_COM","WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM","WWW_DYNASTY8EXECUTIVEREALTY_COM","FORECLOSURES_MAZE_D_BANK_COM","WWW_ELITASTRAVEL_COM","WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM","WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM","WWW_ARENAWAR_TV","WWW_THEDIAMONDCASINOANDRESORT_COM"];
      this.randomWebsites = new Array();
      com.rockstargames.gtav.web.allWebsites.makeWebsitesList(this.browser.isJapanese);
      this.generateRandomWebsites();
      this.mpRandomWebsites = [];
      var _loc3_ = 0;
      var _loc4_ = com.rockstargames.gtav.web.allWebsites.websitesArray.length;
      while(_loc3_ < _loc4_)
      {
         if(com.rockstargames.gtav.web.allWebsites.websitesArray[_loc3_][0] != "EYEFIND_INFO")
         {
            this.mpRandomWebsites.push(_loc3_);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.shuffleArray(this.mpRandomWebsites);
   }
   function READY()
   {
   }
   function updateWeatherWidget()
   {
      var _loc3_ = new Array("EXTRASUNNY","SUNNY","SUNNY_WINDY","CLOUDY","DRIZZLE","FOGGY","LIGHTNING","SNOW");
      var _loc2_ = 0;
      if(this.weatherDataArray[0] != undefined)
      {
         this.mcScope.weatherMC.weatherIconMC.gotoAndStop(_loc3_[this.weatherDataArray[0]]);
         _loc2_ = 100;
      }
      if(this.weatherDataArray[2] != undefined)
      {
         this.mcScope.weatherMC.areaTF.text = this.weatherDataArray[2];
      }
      if(this.weatherDataArray[3] != undefined)
      {
         this.mcScope.weatherMC.dayTF.text = this.weatherDataArray[3];
      }
      this.mcScope.weatherMC._alpha = _loc2_;
   }
   function generateRandomWebsites()
   {
      var _loc7_ = [];
      var _loc6_;
      var _loc5_;
      var _loc3_;
      var _loc8_;
      var _loc2_;
      var _loc4_;
      _loc3_ = 0;
      _loc8_ = com.rockstargames.gtav.web.allWebsites.websitesArray.length;
      while(_loc3_ < _loc8_)
      {
         _loc6_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc3_][0];
         if(_loc6_ != "EYEFIND_INFO")
         {
            _loc5_ = false;
            _loc2_ = 0;
            _loc4_ = this.excludeMPwebsites.length;
            while(_loc2_ < _loc4_)
            {
               if(_loc6_ == this.excludeMPwebsites[_loc2_])
               {
                  _loc5_ = true;
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
            if(!_loc5_)
            {
               _loc7_.push(_loc3_);
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < 6)
      {
         _loc2_ = Math.floor(Math.random() * _loc7_.length);
         this.randomWebsites[_loc3_] = _loc7_.splice(_loc2_,1)[0];
         _loc3_ = _loc3_ + 1;
      }
      this.womURL = com.rockstargames.gtav.web.allWebsites.websitesArray[this.randomWebsites[0]][0];
      if(!this.urlHasSubdomain(this.womURL))
      {
         this.womURL = "WWW_" + this.womURL;
      }
      if(this.isMP)
      {
         this.randomWebsites[1] = 16;
      }
      if(this.browser.player == 1)
      {
         this.sponsoredAdNum = 0;
      }
      else
      {
         this.sponsoredAdNum = this.randRange(1,7);
      }
   }
   function urlHasSubdomain(url)
   {
      url = url.split("_S_").join("/");
      url = url.split("_D_").join("-");
      return url.indexOf("_") != url.lastIndexOf("_");
   }
   function goToAnchor(AnchorLinkString)
   {
      var _loc13_ = new Array();
      _loc13_ = AnchorLinkString.split("_");
      var _loc16_;
      var _loc12_;
      var _loc11_;
      var _loc14_;
      var _loc8_;
      var _loc4_;
      var _loc10_;
      var _loc2_;
      var _loc5_;
      var _loc9_;
      var _loc6_;
      var _loc7_;
      var _loc3_;
      if(_loc13_[0] == "contact")
      {
         _loc11_ = parseInt(_loc13_[1]);
         _loc14_ = _loc11_ + 10;
         _loc8_ = 0;
         while(_loc8_ < this.dataProviderUI.length - 10)
         {
            _loc4_ = this.mcScope.contactsContainer["contact_" + _loc8_];
            if(_loc8_ != _loc11_)
            {
               _loc4_.highlight._visible = false;
               _loc4_.background._visible = false;
               _loc4_.playernameTF.textColor = 5214662;
            }
            else
            {
               _loc4_.highlight._visible = false;
               _loc4_.background._visible = true;
               _loc4_.playernameTF.textColor = 16777215;
            }
            _loc8_ = _loc8_ + 1;
         }
      }
      else if(_loc13_[0] == "email")
      {
         _loc10_ = parseInt(_loc13_[1]);
         _loc14_ = _loc10_ + 10;
         _loc2_ = this.mcScope.emailContainer["email_" + _loc10_];
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.playerNameTF,"EF_SENDER",0,true);
         this.mcScope.playerNameTF.htmlText += " " + this.dataProviderUI[_loc14_][0];
         this.mcScope.playerNameTF.textAutoSize = "shrink";
         this.mcScope.dateTF.htmlText = this.dataProviderUI[_loc14_][1];
         this.mcScope.dateTF.textAutoSize = "shrink";
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.mcScope.subjectTF,"EF_SUBJECT",0,true);
         this.mcScope.subjectTF.htmlText += " " + this.dataProviderUI[_loc14_][2];
         this.mcScope.subjectTF.autoSize = "left";
         this.mcScope.dividerHorizontal._y = this.mcScope.subjectTF._y + this.mcScope.subjectTF._height + 6;
         this.mcScope.bodyTF._y = this.mcScope.dividerHorizontal._y + 6;
         this.mcScope.bodyTF.htmlText = this.dataProviderUI[_loc14_][3];
         this.mcScope.bodyTF.autoSize = "left";
         _loc8_ = 0;
         while(_loc8_ < this.dataProviderUI.length - 10)
         {
            _loc2_ = this.mcScope.emailContainer["email_" + _loc8_];
            if(_loc8_ != _loc10_)
            {
               _loc2_.highlight._visible = false;
               _loc2_.background._visible = false;
               _loc2_.playernameTF.textColor = 5214662;
               _loc2_.dateTF.textColor = 6710886;
               _loc2_.subjectTF.textColor = 3355443;
            }
            else
            {
               _loc2_.highlight._visible = false;
               _loc2_.background._visible = true;
               _loc2_.playernameTF.textColor = 16777215;
               _loc2_.dateTF.textColor = 16777215;
               _loc2_.subjectTF.textColor = 16777215;
               this.lastEmailClicked = _loc8_;
            }
            _loc8_ = _loc8_ + 1;
         }
      }
      else if(AnchorLinkString == "BLEETER")
      {
         this.browser.GO_TO_WEBPAGE("WWW_BLEETER_BIZ");
      }
      else if(AnchorLinkString == "WOMtextLink")
      {
         this.browser.GO_TO_WEBPAGE(this.womURL);
      }
      else if(AnchorLinkString == "sponsoredAdMC")
      {
         switch(this.sponsoredAdNum)
         {
            case 0:
               this.browser.GO_TO_WEBPAGE("WWW_DYNASTY8REALESTATE_COM");
               break;
            case 1:
               this.browser.GO_TO_WEBPAGE("WWW_LEGENDARYMOTORSPORT_NET");
               break;
            case 2:
               this.browser.GO_TO_WEBPAGE("WWW_ELITASTRAVEL_COM");
               break;
            case 3:
               this.browser.GO_TO_WEBPAGE("WWW_DOCKTEASE_COM");
               break;
            case 4:
               this.browser.GO_TO_WEBPAGE("WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM");
               break;
            case 5:
               this.browser.GO_TO_WEBPAGE("WWW_PANDMCYCLES_COM");
               break;
            case 6:
               this.browser.GO_TO_WEBPAGE("WWW_SOUTHERNSANANDREASSUPERAUTOS_COM");
               break;
            case 7:
               this.browser.GO_TO_WEBPAGE("WWW_LENNYAVERY_D_REALTY_COM");
         }
      }
      else
      {
         this.searchResults = new Array();
         switch(AnchorLinkString)
         {
            case "search_random":
               _loc12_ = "EF_RANDOM";
               _loc5_ = new Array();
               _loc5_[0] = this.getRandomWebsite();
               _loc8_ = 1;
               _loc9_ = 0;
               while(_loc8_ < this.maxNumberOfResults)
               {
                  _loc6_ = this.getRandomWebsite();
                  _loc7_ = false;
                  _loc3_ = 0;
                  while(_loc3_ < _loc8_)
                  {
                     if(_loc5_[_loc3_] == _loc6_)
                     {
                        _loc7_ = true;
                        _loc9_ = _loc9_ + 1;
                     }
                     _loc3_ = _loc3_ + 1;
                  }
                  if(_loc7_ == false)
                  {
                     _loc5_[_loc8_] = _loc6_;
                     _loc8_ = _loc8_ + 1;
                  }
                  if(_loc9_ > 10)
                  {
                     break;
                  }
               }
               _loc8_ = 0;
               while(_loc8_ < _loc5_.length)
               {
                  this.searchResults.push(com.rockstargames.gtav.web.allWebsites.websitesArray[_loc5_[_loc8_]][0]);
                  _loc8_ = _loc8_ + 1;
               }
               break;
            case "search_media":
               _loc12_ = "EF_MEDIAANDENT";
               this.searchResults = ["LIFEINVADER_COM","CLASSICVINEWOOD_COM","FAMEORSHAME_NET","KUNGFURAINBOWLAZERFORCE_COM","PRINCESSROBOTBUBBLEGUM_COM","REPUBLICANSPACERANGERS_COM","RIGHTEOUSSLAUGHTER7_COM"];
               break;
            case "search_food":
               _loc12_ = "EF_FOODANDDRINK";
               this.searchResults = ["LOSSANTOSFREEGANS_COM","EGOCHASERENERGYBAR_COM","TACO_D_BOMB_COM","GRAINOFTRUTH_NET"];
               break;
            case "search_money":
               _loc12_ = "EF_MONEYANDSERV";
               if(this.isMP == true)
               {
                  this.searchResults = ["THEDIAMONDCASINOANDRESORT_COM","FORECLOSURES_MAZE_D_BANK_COM","DYNASTY8EXECUTIVEREALTY_COM","BAWSAQ_COM","DYNASTY8REALESTATE_COM","MAZE_D_BANK_COM"];
                  break;
               }
               this.searchResults = ["LCN_D_EXCHANGE_COM","BAWSAQ_COM","DYNASTY8REALESTATE_COM","MAZE_D_BANK_COM","FLEECA_COM","THEBANKOFLIBERTY_COM"];
               break;
            case "search_travel":
               _loc12_ = "EF_TRAVELANDTRANS";
               this.searchResults = ["ELITASTRAVEL_COM","LEGENDARYMOTORSPORT_NET","WARSTOCK_D_CACHE_D_AND_D_CARRY_COM","DOCKTEASE_COM","PANDMCYCLES_COM","SOUTHERNSANANDREASSUPERAUTOS_COM"];
               if(this.isMP)
               {
                  this.searchResults.unshift("BENNYSORIGINALMOTORWORKS_COM");
                  this.searchResults.unshift("ARENAWAR_TV");
               }
               break;
            case "search_fashion":
               _loc12_ = "EF_FASHIONANDHEALTH";
               this.searchResults = ["SWALLOWCO_COM","UNIVERSALUNIFORM_NET","TOESHOESUSA_COM","PRESERVEXSKINCREAM_COM","ABSTINENTAMERICA_COM","FABIENLAROUCHEYOGA_COM"];
         }
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc12_,this.CONTENT.localisationTF,false);
         this.browser.userTextEntry = this.CONTENT.localisationTF.text.split("<BR>").join(" ");
         this.browser.GO_TO_WEBPAGE("SEARCH");
      }
   }
   function POPULATE_TEXT(_pageName, searchArgs, newPage)
   {
      this.pageName = _pageName;
      if(newPage)
      {
         this.CLEANUP();
      }
      if(this.pageName != "COMPOSE")
      {
         this.composeSubjectStr = undefined;
         this.composeBodyStr = undefined;
      }
      var _loc5_;
      var _loc18_;
      var _loc14_;
      var _loc12_;
      var _loc8_;
      var _loc4_;
      var _loc16_;
      var _loc27_;
      var _loc23_;
      var _loc26_;
      var _loc11_;
      var _loc13_;
      var _loc7_;
      var _loc10_;
      var _loc33_;
      var _loc21_;
      var _loc28_;
      var _loc35_;
      var _loc9_;
      var _loc34_;
      var _loc30_;
      var _loc36_;
      var _loc15_;
      var _loc22_;
      var _loc20_;
      var _loc3_;
      var _loc6_;
      var _loc19_;
      var _loc17_;
      var _loc32_;
      switch(this.pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.dataTextScope = [];
            com.rockstargames.ui.utils.Debug.log("WWW_EYEFIND_INFO::POPULATE_TEXT ***************************************************************************** START");
            com.rockstargames.ui.utils.Debug.log("WWW_EYEFIND_INFO::POPULATE_TEXT args [" + arguments + "]");
            com.rockstargames.ui.utils.Debug.log("WWW_EYEFIND_INFO::POPULATE_TEXT mcScope [" + this.mcScope + "]");
            com.rockstargames.ui.utils.Debug.log("WWW_EYEFIND_INFO::POPULATE_TEXT CONTENT._currentframe [" + this.CONTENT._currentframe + "]");
            com.rockstargames.ui.utils.Debug.log("WWW_EYEFIND_INFO::POPULATE_TEXT isMP [" + this.isMP + "]");
            _loc5_ = 0;
            while(_loc5_ < this.dataProviderUI.length)
            {
               com.rockstargames.ui.utils.Debug.log("WWW_EYEFIND_INFO::POPULATE_TEXT dataProviderUI[" + _loc5_ + "] [" + this.dataProviderUI[_loc5_] + "]");
               _loc5_ = _loc5_ + 1;
            }
            if(this.isMP)
            {
               this.CONTENT.PAGE1.gotoAndStop("MP");
               com.rockstargames.ui.utils.Debug.log("WWW_EYEFIND_INFO::POPULATE_TEXT CONTENT.PAGE1._currentframe [" + this.CONTENT.PAGE1._currentframe + "]");
               _loc5_ = 0;
               while(_loc5_ < 3)
               {
                  _loc18_ = this.mcScope["offer_" + _loc5_].btn;
                  if(this.dataProviderUI[9] == undefined || this.dataProviderUI[9].length == 0 || isNaN(this.dataProviderUI[9][_loc5_ * 2]))
                  {
                     _loc18_._visible = false;
                  }
                  else
                  {
                     _loc14_ = this.offerMPWebsites[this.dataProviderUI[9][_loc5_ << 1]];
                     if(_loc18_ == undefined)
                     {
                        _loc18_ = this.mcScope["offer_" + _loc5_][_loc14_];
                     }
                     _loc18_._name = _loc14_;
                     _loc18_.onColour = 16777215;
                     _loc18_.offColour = 16777215;
                     _loc18_.btnTxt.textAutoSize = "shrink";
                     _loc18_.image.gotoAndStop(this.dataProviderUI[9][_loc5_ << 1] + 1);
                     _loc18_.btnTxt.text = this.dataProviderUI[9][(_loc5_ << 1) + 1];
                     this.dataTextScope[_loc5_ + 16] = _loc18_.btnTxt;
                     _loc18_._visible = true;
                  }
                  _loc5_ = _loc5_ + 1;
               }
               _loc5_ = this.mpRandomWebsites.length - 1;
               while(_loc5_ >= 0)
               {
                  _loc12_ = false;
                  _loc8_ = com.rockstargames.gtav.web.allWebsites.websitesArray[this.mpRandomWebsites[_loc5_]][0];
                  if(!this.urlHasSubdomain(_loc8_))
                  {
                     _loc8_ = "WWW_" + _loc8_;
                  }
                  _loc4_ = 0;
                  while(_loc4_ <= 4)
                  {
                     if(_loc8_ == this.offerMPWebsites[this.dataProviderUI[9][_loc4_]])
                     {
                        this.mpRandomWebsites.splice(_loc5_,1);
                        _loc12_ = true;
                        break;
                     }
                     _loc4_ += 2;
                  }
                  if(!_loc12_)
                  {
                     _loc4_ = 6;
                     while(_loc4_ < this.dataProviderUI[9].length)
                     {
                        if(this.mpRandomWebsites[_loc5_] == this.dataProviderUI[9][_loc4_])
                        {
                           this.mpRandomWebsites.splice(_loc5_,1);
                           break;
                        }
                        _loc4_ = _loc4_ + 1;
                     }
                  }
                  _loc5_ = _loc5_ - 1;
               }
               _loc16_ = [228,393.5,559,724.5,890];
               _loc27_ = 86;
               _loc23_ = 388;
               _loc26_ = this.dataProviderUI[9].length;
               _loc5_ = 6;
               while(_loc5_ < _loc26_)
               {
                  _loc11_ = this.dataProviderUI[9][_loc5_];
                  if(_loc11_ == -1)
                  {
                     _loc11_ = this.mpRandomWebsites[_loc5_ % this.mpRandomWebsites.length];
                  }
                  _loc13_ = (_loc5_ - 6) % _loc16_.length;
                  _loc7_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc11_][0];
                  if(!this.urlHasSubdomain(_loc7_))
                  {
                     _loc7_ = "WWW_" + _loc7_;
                  }
                  if(this.mcScope["featured_button_" + _loc5_] == undefined)
                  {
                     _loc10_ = this.mcScope.createEmptyMovieClip("featured_button_" + _loc5_,this.mcScope.getNextHighestDepth());
                     _loc10_._x = _loc16_[_loc13_];
                     _loc10_._y = _loc23_;
                     _loc18_ = _loc10_.attachMovie("thumbnailMC",_loc7_,0);
                     this.loadButtonThumbnail(_loc7_,_loc18_,_loc5_);
                  }
                  if(_loc13_ == _loc16_.length - 1)
                  {
                     _loc23_ += _loc27_;
                  }
                  this.dataTextScope[_loc5_ + 16] = this.mcScope["featured_button_" + _loc5_][_loc7_].btnTxt;
                  _loc5_ = _loc5_ + 1;
               }
               _loc33_ = Math.ceil((_loc26_ - 6) / 5) * _loc27_ + 388 + 50;
               pageHeight = Math.max(627,_loc33_);
               this.mcScope.BACKGROUND._height = pageHeight;
               this.CONTENT.BOUNDING_BOX._height = pageHeight;
            }
            this.mcScope.search_random.onColour = 16777215;
            this.mcScope.search_random.offColour = 16777215;
            this.set_localised_text(1,this.mcScope.TEXT_search_box.btnTxt,"EF_ENTERSEARCH",true);
            this.set_localised_text(3,this.mcScope.search_random.btnTxt,"EF_RANDOM",true);
            this.mcScope.search_random.btnTxt.onColour = 16777215;
            this.mcScope.search_random.btnTxt.offColour = 16777215;
            this.set_localised_text(4,this.mcScope.search_media.btnTxt,"EF_MEDIAANDENT",true);
            this.set_localised_text(5,this.mcScope.search_food.btnTxt,"EF_FOODANDDRINK",true);
            this.set_localised_text(6,this.mcScope.search_money.btnTxt,"EF_MONEYANDSERV",true);
            this.set_localised_text(7,this.mcScope.search_travel.btnTxt,"EF_TRAVELANDTRANS",true);
            this.set_localised_text(8,this.mcScope.search_fashion.btnTxt,"EF_FASHIONANDHEALTH",true);
            this.formatSearchButtons(this.mcScope);
            if(!this.isMP)
            {
               if(!newPage)
               {
                  this.set_localised_text(-1,this.mcScope.EF_WEBSITEOFTHEMINUTE,"EF_WEBSITEOFTHEMINUTE");
                  _loc21_ = this.randomWebsites[0];
                  _loc28_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc21_][0];
                  _loc35_ = "DESC_" + _loc28_;
                  if(!this.urlHasSubdomain(_loc28_))
                  {
                     _loc28_ = "WWW_" + _loc28_;
                  }
                  this.loadButtonThumbnail(_loc28_,this.mcScope.WOTD,10);
                  this.womURL = _loc28_;
                  this.mcScope.websiteMinuteDescTF.autoSize = "true";
                  this.set_localised_text(-1,this.mcScope.websiteMinuteDescTF,_loc35_);
                  this.mcScope.WOMtextLink.btnTxt.autoSize = "true";
                  this.mcScope.WOMtextLink.btnTxt.text = this.browser.PARSE_FILENAME_TO_TEXT(_loc28_);
                  this.dataTextScope[0] = this.mcScope.WOMtextLink.btnTxt;
                  this.mcScope.websiteOfTheMinuteBG.gotoAndStop(2);
                  if(this.mcScope.websiteMinuteDescTF._height + 66 > this.mcScope.websiteOfTheMinuteBG._height)
                  {
                     this.mcScope.websiteOfTheMinuteBG._height = this.mcScope.websiteMinuteDescTF._height + 66;
                  }
                  this.setUpSponsoredAd(16);
               }
               this.set_localised_text(-1,this.mcScope.FeaturedWebsitesBG.EF_FEATUREDWEBSITES,"EF_FEATUREDWEBSITES");
               _loc5_ = 0;
               while(_loc5_ < 5)
               {
                  _loc21_ = this.randomWebsites[_loc5_ + 1];
                  _loc9_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc21_][0];
                  if(!this.urlHasSubdomain(_loc9_))
                  {
                     _loc9_ = "WWW_" + _loc9_;
                  }
                  this.loadButtonThumbnail(_loc9_,this.mcScope["WOTW_" + _loc5_],_loc5_ + 11);
                  _loc5_ = _loc5_ + 1;
               }
               this.mcScope.EF_NEWSOFTHEDAY.textAutoSize = "shrink";
               this.set_localised_text(-1,this.mcScope.EF_NEWSOFTHEDAY,"EF_NEWSOFTHEDAY");
               this.set_localised_text(2,this.mcScope.BLEETER.btnTxt,"EF_RECENTBLEETS",true);
            }
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EF_EYETUBES",this.CONTENT.localisationTF);
            this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text);
            if(this.dataProviderUI[0] != undefined)
            {
               this.weatherDataArray[0] = this.dataProviderUI[0];
            }
            if(this.dataProviderUI[1] != undefined)
            {
               this.weatherDataArray[1] = this.dataProviderUI[1];
            }
            if(this.dataProviderUI[2] != undefined)
            {
               this.weatherDataArray[2] = this.dataProviderUI[2];
            }
            if(this.dataProviderUI[3] != undefined)
            {
               this.weatherDataArray[3] = this.dataProviderUI[3];
            }
            this.updateWeatherWidget();
            if(newPage == false)
            {
               if(this.isMP == false)
               {
                  this.mcScope.FeaturedWebsitesBG.BG._height = 126;
                  if(this.dataProviderUI[4] != undefined && this.dataProviderUI[4] != "")
                  {
                     if(this.dataProviderUI[5] != undefined)
                     {
                        if(this.dataProviderUI[5] >= 0 && this.dataProviderUI[5] <= 13)
                        {
                           this.loadNewsTexture(this.newsOrgArray[this.dataProviderUI[5]],this.mcScope.newsImage);
                        }
                     }
                     this.mcScope.newsTitleTF.autoSize = true;
                     this.mcScope.newsTitleTF.htmlText = this.dataProviderUI[4];
                     if(this.mcScope.newsTitleTF._height < 24)
                     {
                        this.mcScope.newsTitleTF._y = 277;
                     }
                     else if(this.mcScope.newsTitleTF._height > 24 && this.mcScope.newsTitleTF._height < 44)
                     {
                        this.mcScope.newsTitleTF._y = 267;
                     }
                     else if(this.mcScope.newsTitleTF._height > 44)
                     {
                        this.mcScope.newsTitleTF._y = 257;
                     }
                     if(this.dataProviderUI[6] != undefined)
                     {
                        this.mcScope.newsArticleTF.htmlText = this.dataProviderUI[6];
                     }
                     else
                     {
                        this.mcScope.newsArticleTF.htmlText = "";
                     }
                     this.mcScope.NEWS.btnTxt.autoSize = true;
                     this.set_localised_text(9,this.mcScope.NEWS.btnTxt,"EF_READMORENEWS",true);
                     this.mcScope.noNewsTF.text = "";
                  }
                  else
                  {
                     this.set_localised_text(9,this.mcScope.noNewsTF,"EF_NONEWS",true);
                     this.mcScope.newsTitleTF.htmlText = "";
                     this.mcScope.newsArticleTF.htmlText = "";
                  }
               }
            }
            this.CONTENT.BOUNDING_BOX._height = 820;
            this.updateBleets();
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.lastEmailClicked = 0;
            com.rockstargames.ui.utils.Debug.log("WWW_EYEFIND_INFO::POPULATE_TEXT ***************************************************************************** END");
            break;
         case "ERROR":
            this.mcScope = this.CONTENT.ERROR;
            if(newPage == true)
            {
               _loc34_ = this.randRange(2,20);
               this.mcScope.errorPicMC.gotoAndStop(_loc34_);
               this.mcScope.gotoAndPlay(2);
               this.dataTextScope = new Array();
               this.dataTextScope[0] = this.mcScope.WWW_EYEFIND_INFO.btnTxt;
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
               this.CONTENT.BOUNDING_BOX._height = 627;
            }
            this.lastEmailClicked = 0;
            break;
         case "SEARCH":
            this.mcScope = this.CONTENT.SEARCH;
            if(this.dataProviderUI[0] != undefined)
            {
               this.weatherDataArray[0] = this.dataProviderUI[0];
            }
            if(this.dataProviderUI[1] != undefined)
            {
               this.weatherDataArray[1] = this.dataProviderUI[1];
            }
            if(this.dataProviderUI[2] != undefined)
            {
               this.weatherDataArray[2] = this.dataProviderUI[2];
            }
            if(this.dataProviderUI[3] != undefined)
            {
               this.weatherDataArray[3] = this.dataProviderUI[3];
            }
            this.updateWeatherWidget();
            _loc30_ = false;
            if(newPage == true)
            {
               if(searchArgs != "" && searchArgs != undefined)
               {
                  this.searchResults = searchArgs.split("&");
                  _loc36_ = this.searchResults.shift();
                  this.browser.userTextEntry = _loc36_.toString();
                  _loc30_ = true;
               }
               if(this.mcScope.resultsContainer != undefined)
               {
                  this.mcScope.resultsContainer.removeMovieClip();
               }
               this.resultsContainer = this.mcScope.createEmptyMovieClip("resultsContainer",this.mcScope.getNextHighestDepth());
               this.mcScope.search_random.onColour = 16777215;
               this.mcScope.search_random.offColour = 16777215;
               this.mcScope.searchKeywordsTF.multiline = true;
               this.mcScope.searchKeywordsTF.autoSize = true;
               this.mcScope.searchKeywordsTF.htmlText = "";
               this.CONTENT._y = 0;
               this.mcScope.BACKGROUND._height = 627;
               this.CONTENT.BOUNDING_BOX._height = 627;
               this.dataTextScope = new Array();
               this.dataTextScope[0] = this.mcScope.WWW_EYEFIND_INFO.btnTxt;
               this.set_localised_text(1,this.mcScope.TEXT_search_box.btnTxt,"EF_ENTERSEARCH",true);
               this.set_localised_text(3,this.mcScope.search_random.btnTxt,"EF_RANDOM",true);
               this.mcScope.search_random.btnTxt.onColour = 16777215;
               this.mcScope.search_random.btnTxt.offColour = 16777215;
               this.set_localised_text(4,this.mcScope.search_media.btnTxt,"EF_MEDIAANDENT",true);
               this.set_localised_text(5,this.mcScope.search_food.btnTxt,"EF_FOODANDDRINK",true);
               this.set_localised_text(6,this.mcScope.search_money.btnTxt,"EF_MONEYANDSERV",true);
               this.set_localised_text(7,this.mcScope.search_travel.btnTxt,"EF_TRAVELANDTRANS",true);
               this.set_localised_text(8,this.mcScope.search_fashion.btnTxt,"EF_FASHIONANDHEALTH",true);
               this.formatSearchButtons(this.mcScope);
               if(this.searchResults.length == 0)
               {
                  this.searchResults = this.doSearch(this.browser.userTextEntry);
               }
               _loc15_ = 284;
               _loc22_ = 10;
               com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EF_CLOSESTMATCH",this.CONTENT.localisationTF);
               this.mcScope.searchKeywordsTF.text = this.CONTENT.localisationTF.text + " " + this.browser.userTextEntry.toUpperCase();
               this.mcScope.searchResultsBG._height = 72;
               if(this.searchResults.length == 0)
               {
                  this.set_localised_text(-1,this.mcScope.searchKeywordsTF,"EF_CANTFIND");
                  com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EF_EYETUBES",this.CONTENT.localisationTF);
                  this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text);
               }
               else
               {
                  _loc5_ = 0;
                  while(_loc5_ < this.searchResults.length)
                  {
                     _loc20_ = "thumbnail_" + this.searchResults[_loc5_];
                     if(this.urlHasSubdomain(this.searchResults[_loc5_]))
                     {
                        _loc3_ = this.searchResults[_loc5_];
                     }
                     else
                     {
                        _loc3_ = "WWW_" + this.searchResults[_loc5_];
                     }
                     _loc6_ = this.resultsContainer.attachMovie("button_searchResultMC",_loc3_,this.resultsContainer.getNextHighestDepth(),{_x:228,_y:_loc15_});
                     _loc6_.btnTxt.text = this.browser.PARSE_FILENAME_TO_TEXT(_loc3_);
                     _loc19_ = this.mcScope.attachMovie("thumbnailMC","result_" + _loc3_,this.mcScope.getNextHighestDepth(),{_x:_loc6_._x,_y:_loc6_._y});
                     _loc19_.DISPLAY_THUMBNAIL(_loc20_,"result_" + _loc3_);
                     this.dataTextScope[_loc5_ + 9] = _loc6_.btnTxt;
                     _loc17_ = "DESC_" + this.searchResults[_loc5_];
                     this.mcScope.resultsContainer[_loc3_].descriptionTF.autoSize = "left";
                     this.set_localised_text(-1,this.mcScope.resultsContainer[_loc3_].descriptionTF,_loc17_);
                     if(this.mcScope.resultsContainer[_loc3_].descriptionTF._height > 54)
                     {
                        this.mcScope.resultsContainer[_loc3_].BG._height = this.mcScope.resultsContainer[_loc3_].descriptionTF._height + 34;
                     }
                     this.mcScope.searchResultsBG._height = _loc15_ + _loc6_._height + _loc22_ - this.mcScope.searchResultsBG._y;
                     _loc15_ += _loc6_._height + _loc22_;
                     _loc5_ = _loc5_ + 1;
                  }
                  com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EF_EYEFOUND",this.CONTENT.localisationTF);
                  this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text);
               }
               if(_loc30_ == false)
               {
                  _loc32_ = this.searchResults;
                  _loc32_.unshift(this.browser.userTextEntry.toUpperCase());
                  this.browser.ADD_URL_ARGS_TO_HISTORY(_loc32_);
               }
               if(this.isMP == true)
               {
                  this.dataTextScope[this.dataTextScope.length] = null;
                  this.dataTextScope[this.dataTextScope.length] = null;
               }
               this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
               var pageHeight = this.mcScope.searchResultsBG._y + this.mcScope.searchResultsBG._height + 40;
               if(pageHeight > 627)
               {
                  this.mcScope.BACKGROUND._height = pageHeight;
                  this.CONTENT.BOUNDING_BOX._height = pageHeight;
               }
               clearInterval(this.intervalID);
               this.intervalID = setInterval(this,"clearSearchResults",500);
            }
            this.lastEmailClicked = 0;
            break;
         case "NEWS":
            this.mcScope = this.CONTENT.NEWS;
            this.dontUpdateSearch = true;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_EYEFIND_INFO.btnTxt;
            this.set_localised_text(1,this.mcScope.TEXT_search_box.btnTxt,"EF_ENTERSEARCH",true);
            this.set_localised_text(3,this.mcScope.search_random.btnTxt,"EF_RANDOM",true);
            this.mcScope.search_random.onColour = 16777215;
            this.mcScope.search_random.offColour = 16777215;
            this.set_localised_text(10,this.mcScope.search_media.btnTxt,"EF_MEDIAANDENT",true);
            this.set_localised_text(11,this.mcScope.search_food.btnTxt,"EF_FOODANDDRINK",true);
            this.set_localised_text(12,this.mcScope.search_money.btnTxt,"EF_MONEYANDSERV",true);
            this.set_localised_text(13,this.mcScope.search_travel.btnTxt,"EF_TRAVELANDTRANS",true);
            this.set_localised_text(14,this.mcScope.search_fashion.btnTxt,"EF_FASHIONANDHEALTH",true);
            this.formatSearchButtons(this.mcScope);
            if(this.dataProviderUI[0] != undefined)
            {
               this.weatherDataArray[0] = this.dataProviderUI[0];
            }
            if(this.dataProviderUI[1] != undefined)
            {
               this.weatherDataArray[1] = this.dataProviderUI[1];
            }
            if(this.dataProviderUI[2] != undefined)
            {
               this.weatherDataArray[2] = this.dataProviderUI[2];
            }
            if(this.dataProviderUI[3] != undefined)
            {
               this.weatherDataArray[3] = this.dataProviderUI[3];
            }
            this.updateWeatherWidget();
            if(this.dataProviderUI[4] != undefined && this.dataProviderUI[4] != "")
            {
               if(this.dataProviderUI[5] != undefined)
               {
                  if(this.dataProviderUI[5] >= 0 && this.dataProviderUI[5] <= 13)
                  {
                     this.loadNewsTexture(this.newsOrgArray[this.dataProviderUI[5]],this.mcScope.newsImage);
                  }
               }
               this.mcScope.newsTitleTF.htmlText = this.dataProviderUI[4];
               this.mcScope.newsArticleTF.autoSize = "left";
               this.mcScope.newsArticleTF.multiline = true;
               if(this.dataProviderUI[6] != undefined)
               {
                  this.mcScope.newsArticleTF.htmlText = this.dataProviderUI[6];
               }
            }
            this.mcScope.newsArticleBG._height = this.mcScope.newsArticleTF._y + this.mcScope.newsArticleTF._height + 9 - this.mcScope.newsArticleBG._y;
            this.set_localised_text(2,this.mcScope.BLEETER.btnTxt,"EF_RECENTBLEETS",true);
            this.updateBleets();
            this.setUpSponsoredAd(9);
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 667;
            if(this.mcScope.newsArticleBG._y + this.mcScope.newsArticleBG._height > 667)
            {
               this.CONTENT.BOUNDING_BOX._height = this.mcScope.newsArticleBG._y + this.mcScope.newsArticleBG._height;
            }
            this.CONTENT.BOUNDING_BOX._height += 40;
            this.lastEmailClicked = 0;
            break;
         case "PAGE2":
      }
      this.prevPage = this.pageName;
      this.prevSearchArgs = searchArgs;
   }
   function formatSearchButtons(container)
   {
      container.search_media.btnTxt.autoSize = "center";
      container.search_food.btnTxt.autoSize = "center";
      container.search_money.btnTxt.autoSize = "center";
      container.search_travel.btnTxt.autoSize = "center";
      container.search_fashion.btnTxt.autoSize = "center";
   }
   function setDelayedText(TF, textStr, duration)
   {
      if(TF != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(TF);
         if(textStr != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(TF,0,{delay:duration,onComplete:this.showDelayedText,onCompleteScope:this,onCompleteArgs:[TF,textStr]});
         }
      }
   }
   function showDelayedText(TF, textStr)
   {
      if(TF instanceof TextField)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(TF,textStr,0,true);
      }
   }
   function clearSearchResults()
   {
      clearInterval(this.intervalID);
      this.searchResults = new Array();
   }
   function setUpSponsoredAd(buttonID)
   {
      this.mcScope.sponsoredAdMC.sponsoredAd.gotoAndStop(this.sponsoredAdNum + 2);
      this.dataTextScope[buttonID] = this.mcScope.sponsoredAdMC.btnTxt;
      this.set_localised_text(-1,this.mcScope.sponsoredAdMC.EF_SPONSOREDADVERT,"EF_SPONSOREDADVERT");
   }
   function doSearch(userSearchKeywords)
   {
      var _loc16_ = userSearchKeywords.split("www.").join("").split(".com").join("").split(".org").join("").split(".info").join("").split(".net").join("").split(".biz").join("").split(".us").join("");
      userSearchKeywords = _loc16_;
      var _loc11_ = new Array();
      var _loc3_;
      var _loc7_;
      var _loc4_;
      var _loc10_;
      var _loc9_;
      var _loc8_;
      var _loc2_;
      var _loc5_;
      var _loc6_;
      var _loc14_;
      if(userSearchKeywords.length != 0)
      {
         _loc3_ = userSearchKeywords.toLowerCase().split(" ");
         _loc7_ = 0;
         while(_loc7_ < com.rockstargames.gtav.web.allWebsites.websitesArray.length)
         {
            _loc4_ = 0;
            _loc10_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc7_][0];
            _loc9_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc7_][1].toLowerCase();
            _loc9_.split(", ").join(" ");
            _loc8_ = this.browser.PARSE_FILENAME_TO_TEXT(_loc10_.substr(0,_loc10_.lastIndexOf("_")));
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               _loc5_ = _loc9_.split(_loc3_[_loc2_]);
               if(_loc5_.length > 1)
               {
                  _loc4_ = _loc4_ + 1;
                  if(_loc5_.indexOf(_loc3_[_loc2_] + " ") > -1)
                  {
                     _loc4_ += _loc3_[_loc2_].length;
                     _loc4_ += _loc3_.length - _loc2_;
                  }
               }
               _loc6_ = _loc8_.indexOf(_loc3_[_loc2_]);
               if(_loc6_ > -1)
               {
                  _loc4_ += _loc8_.length - _loc6_;
               }
               _loc2_ = _loc2_ + 1;
            }
            _loc11_.push({RELEVANCE:_loc4_,WEBSITE:_loc10_});
            _loc7_ = _loc7_ + 1;
         }
         _loc11_.sortOn("RELEVANCE",Array.DESCENDING | Array.NUMERIC);
         _loc14_ = new Array();
         _loc7_ = 0;
         while(_loc7_ < this.maxNumberOfResults)
         {
            if(_loc11_[_loc7_].RELEVANCE > 0)
            {
               _loc14_.push(_loc11_[_loc7_].WEBSITE);
            }
            _loc7_ = _loc7_ + 1;
         }
         return _loc14_;
      }
      this.browser.GO_TO_WEBPAGE("PAGE1");
   }
   function loadButtonThumbnail(urlName, placeholder, textScopeSlot)
   {
      var _loc3_;
      var _loc4_;
      if(this.mcScope[urlName] == undefined)
      {
         _loc3_ = this.mcScope.attachMovie("thumbnailMC",urlName,this.mcScope.getNextHighestDepth(),{_x:placeholder._x,_y:placeholder._y});
         _loc4_ = urlName.indexOf("WWW_") != 0 ? urlName : urlName.slice(4);
         _loc3_.DISPLAY_THUMBNAIL("thumbnail_" + _loc4_,urlName);
      }
      this.dataTextScope[textScopeSlot] = this.mcScope[urlName].btnTxt;
   }
   function loadNewsTexture(txd, placeholder)
   {
      var _loc2_ = this.mcScope.attachMovie("newsImageMC","newsImageMC",this.mcScope.getNextHighestDepth(),{_x:placeholder._x,_y:placeholder._y});
      _loc2_._width = placeholder._width + 4;
      _loc2_._height = placeholder._height + 4;
      _loc2_.DISPLAY_THUMBNAIL(txd,"newsImageMC");
   }
   function set_localised_text(slotID, TF, TextLabel, setDataSlot)
   {
      if(TF != undefined)
      {
         if(setDataSlot)
         {
            this.dataTextScope[slotID] = TF;
         }
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,TextLabel,TF,true);
      }
   }
   function getRandomWebsite()
   {
      var _loc3_ = this.randRange(0,com.rockstargames.gtav.web.allWebsites.websitesArray.length - 1);
      while(com.rockstargames.gtav.web.allWebsites.websitesArray[_loc3_][0] == "EYEFIND_INFO")
      {
         _loc3_ = this.randRange(0,com.rockstargames.gtav.web.allWebsites.websitesArray.length - 1);
      }
      var _loc2_;
      if(this.mcScope == this.CONTENT.PAGE1 && this.isMP == true)
      {
         _loc2_ = 0;
         while(_loc2_ < this.excludeMPwebsites.length)
         {
            if(com.rockstargames.gtav.web.allWebsites.websitesArray[_loc3_][0] == this.excludeMPwebsites[_loc2_])
            {
               _loc3_ = _loc3_ + 1;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      return _loc3_;
   }
   function randRange(min, max)
   {
      var _loc1_ = Math.floor(Math.random() * (max - min + 1)) + min;
      return _loc1_;
   }
   function shuffleArray(source)
   {
      var _loc4_ = source.length;
      var _loc1_ = 0;
      var _loc3_;
      var _loc2_;
      while(_loc1_ < _loc4_ - 1)
      {
         _loc3_ = Math.random() * (_loc4_ - _loc1_ - 1) + _loc1_ + 1;
         _loc2_ = source.splice(_loc3_,1)[0];
         source.splice(_loc1_,0,_loc2_);
         _loc1_ = _loc1_ + 1;
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      var _loc5_;
      var _loc2_;
      var _loc3_;
      if(success == true)
      {
         if(this.mcScope[uniqueID].txd == undefined)
         {
            _loc5_ = this.dataProviderUI[9].length;
            _loc2_ = 6;
            while(_loc2_ < _loc5_)
            {
               _loc3_ = this.mcScope["featured_button_" + _loc2_][uniqueID];
               if(_loc3_ != undefined)
               {
                  _loc3_.TXD_HAS_LOADED(textureDict,success,uniqueID);
                  return undefined;
               }
               _loc2_ = _loc2_ + 1;
            }
            this.TXDarray.push(new Array(textureDict,uniqueID));
            this.mcScope[uniqueID].TXD_HAS_LOADED(textureDict,success,uniqueID);
         }
      }
   }
   function updateBleets()
   {
      var _loc3_;
      var _loc2_;
      var _loc4_;
      var _loc9_;
      var _loc6_;
      var _loc5_;
      var _loc7_;
      var _loc8_;
      if(this.isMP == false)
      {
         _loc3_ = 7;
         while(_loc3_ < 9)
         {
            if(this.dataProviderUI[_loc3_] != undefined)
            {
               _loc2_ = "";
               _loc4_ = "";
               _loc9_ = "bleet" + (_loc3_ - 6) + "NameTF";
               _loc6_ = "bleet" + (_loc3_ - 6) + "TF";
               this.CONTENT.localisationTF.text = this.dataProviderUI[_loc3_];
               _loc2_ = this.CONTENT.localisationTF.text;
               _loc5_ = _loc2_.indexOf("*");
               if(_loc5_ != -1)
               {
                  _loc7_ = _loc2_.substr(_loc5_ + 1).indexOf(" ");
                  _loc8_ = _loc2_.substr(_loc7_ + 2,_loc2_.length);
                  _loc2_ = _loc8_;
               }
               _loc5_ = _loc2_.indexOf("@");
               if(_loc5_ != -1)
               {
                  _loc7_ = _loc2_.substr(_loc5_ + 1).indexOf(" ");
                  _loc4_ = _loc2_.slice(_loc5_,_loc7_ + 1);
                  _loc8_ = _loc2_.substr(_loc7_ + 2,_loc2_.length);
                  _loc2_ = _loc8_;
               }
               if(_loc4_ != undefined)
               {
                  this.mcScope.BLEETER[_loc9_].text = _loc4_;
               }
               this.mcScope.BLEETER[_loc6_].autoSize = true;
               if(_loc2_ != undefined)
               {
                  this.mcScope.BLEETER[_loc6_].text = _loc2_;
               }
            }
            _loc3_ = _loc3_ + 1;
         }
         this.mcScope.BLEETER.bleetDivider._y = this.mcScope.BLEETER.bleet1TF._y + this.mcScope.BLEETER.bleet1TF._height + 2;
         this.mcScope.BLEETER.bleet2NameTF._y = this.mcScope.BLEETER.bleetDivider._y + 2;
         this.mcScope.BLEETER.bleet2TF._y = this.mcScope.BLEETER.bleet2NameTF._y + 15;
         this.mcScope.BLEETER.bleeterBG._height = this.mcScope.BLEETER.bleet2TF._y + this.mcScope.BLEETER.bleet2TF._height + 4;
      }
      this.moveFeaturedWebsites();
   }
   function moveFeaturedWebsites()
   {
      var _loc9_;
      var _loc8_;
      var _loc4_;
      var _loc6_;
      var _loc3_;
      var _loc5_;
      var _loc2_;
      var _loc7_;
      switch(this.mcScope)
      {
         case this.CONTENT.PAGE1:
            if(!this.isMP)
            {
               _loc9_ = this.mcScope.BLEETER._y + this.mcScope.BLEETER._height + 9;
               _loc8_ = this.mcScope.websiteOfTheMinuteBG._y + this.mcScope.websiteOfTheMinuteBG._height + 9;
               _loc4_ = Math.max(_loc9_,_loc8_);
               this.mcScope.FeaturedWebsitesBG._y = _loc4_;
               _loc6_ = 37;
               if(this.isMP == true)
               {
                  _loc6_ = 110;
                  this.mcScope.WWW_DYNASTY8EXECUTIVEREALTY_COM._y = _loc4_ + 37;
                  this.mcScope.WWW_LEGENDARYMOTORSPORT_NET._y = _loc4_ + 37;
                  this.mcScope.WWW_BENNYSORIGINALMOTORWORKS_COM._y = _loc4_ + 37;
                  this.mcScope.WWW_DOCKTEASE_COM._y = _loc4_ + 37;
                  this.mcScope.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM._y = _loc4_ + 37;
               }
               _loc3_ = 0;
               while(_loc3_ < 5)
               {
                  _loc5_ = this.randomWebsites[_loc3_ + 1];
                  _loc2_ = com.rockstargames.gtav.web.allWebsites.websitesArray[_loc5_][0];
                  if(!this.urlHasSubdomain(_loc2_))
                  {
                     _loc2_ = "WWW_" + _loc2_;
                  }
                  this.mcScope["WOTW_" + _loc3_]._y = _loc4_ + _loc6_;
                  if(this.mcScope[_loc2_] != undefined)
                  {
                     this.mcScope[_loc2_]._y = _loc4_ + _loc6_;
                  }
                  _loc3_ = _loc3_ + 1;
               }
               _loc7_ = _loc4_ + this.mcScope.FeaturedWebsitesBG._height + 40;
               if(isNaN(_loc7_))
               {
                  _loc7_ = 646;
               }
               if(_loc7_ > 627)
               {
                  this.CONTENT.BOUNDING_BOX._height = _loc7_;
               }
               else
               {
                  this.CONTENT.BOUNDING_BOX._height = 627;
               }
            }
            break;
         case this.CONTENT.NEWS:
            _loc9_ = this.mcScope.BLEETER._y + this.mcScope.BLEETER._height;
            _loc8_ = this.mcScope.newsArticleBG._y + this.mcScope.newsArticleBG._height;
            _loc7_ = Math.max(_loc9_,_loc8_) + 40;
            if(_loc7_ > 627)
            {
               this.CONTENT.BOUNDING_BOX._height = _loc7_;
            }
            else
            {
               this.CONTENT.BOUNDING_BOX._height = 627;
            }
         default:
            return;
      }
   }
   function UPDATE_TICKERTAPE(speed)
   {
      var _loc6_ = new String();
      var _loc3_ = " ";
      var _loc12_ = "<font color=\'#636363\'>";
      var _loc10_ = "<font color=\'#008100\'>";
      var _loc11_ = "<font color=\'#BB0000\'>";
      var _loc7_ = "<\font>";
      var _loc13_ = "   ";
      var _loc2_ = 0;
      var _loc8_;
      var _loc9_;
      var _loc4_;
      var _loc5_;
      while(_loc2_ < this.dataProviderUI.length)
      {
         if(this.dataProviderUI[_loc2_][0] != undefined)
         {
            _loc8_ = this.dataProviderUI[_loc2_][3];
            _loc9_ = this.dataProviderUI[_loc2_][0];
            _loc4_ = this.dataProviderUI[_loc2_][1];
            _loc5_ = this.dataProviderUI[_loc2_][2];
            _loc6_ += _loc13_ + _loc3_ + _loc12_ + _loc8_ + _loc3_ + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(_loc9_,2) + _loc7_ + _loc3_;
            if(_loc4_ < 0)
            {
               _loc6_ += _loc11_ + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc4_),2) + "<img src=\'down_arrow\' height=\'14\' width=\'14\'>" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc5_),2) + "%" + _loc7_ + _loc3_;
            }
            else
            {
               _loc6_ += _loc10_ + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc4_),2) + "<img src=\'up_arrow\' height=\'14\' width=\'14\'>" + com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(_loc5_),2) + "%" + _loc7_ + _loc3_;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.TICKER_STOCK.SET_TICKER_TEXT(speed,_loc6_);
   }
   function CLEANUP()
   {
      var _loc2_;
      var _loc3_;
      if(this.TXDarray.length > 0)
      {
         _loc2_ = 0;
         while(_loc2_ < this.TXDarray.length)
         {
            if(this.TXDarray[_loc2_] != undefined)
            {
               _loc3_ = this.mcScope[this.TXDarray[_loc2_][1]];
               if(_loc3_ != undefined)
               {
                  _loc3_.REMOVE_THUMBNAIL();
                  _loc3_.removeMovieClip();
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      this.TXDarray = new Array();
      return true;
   }
}
