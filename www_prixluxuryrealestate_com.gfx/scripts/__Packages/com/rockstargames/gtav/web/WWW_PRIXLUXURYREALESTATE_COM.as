class com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var activeMansion;
   var browser;
   var currPage;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var displayConfig;
   var imageManager;
   var initialised;
   var isMP;
   var mansions;
   var pageContainer;
   var videoDisabled;
   static var PAGES = {MANSION_SPLASH_PAGE:{name:"PAGE1",index:1,canStore:true,pageClass:com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionSplashPage},MANSION_MAP_PAGE:{name:"MAP",index:2,canStore:false,pageClass:com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionMapPage},MANSION_STYLE_PAGE:{name:"STYLE",index:3,canStore:false,pageClass:com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionStylePage},MANSION_OPTIONS_PAGE:{name:"OPTIONS",index:4,canStore:false,pageClass:com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionOptionsPage},MANSION_SECURITY_PAGE:{name:"SECURITY",index:5,canStore:false,pageClass:com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionSecurityPage},MANSION_ASSISTANT_PAGE:{name:"ASSISTANT",index:6,canStore:false,pageClass:com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionAssistantPage},MANSION_SUMMARY_PAGE:{name:"OVERVIEW",index:7,canStore:false,pageClass:com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionSummaryPage},MANSION_PURCHASE_PENDING_PAGE:{name:"PURCHASE_D_PENDING",index:8,canStore:false,pageClass:com
   .rockstargames.gtav.web.prixluxuryrealestate.pages.MansionPurchasePendingPage},MANSION_PURCHASE_SUCCESS_PAGE:{name:"PURCHASE_D_SUCCESS",index:9,canStore:false,pageClass:com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionPurchasePage},MANSION_PURCHASE_FAILED_PAGE:{name:"PURCHASE_D_FAILED",index:10,canStore:false,pageClass:com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionPurchasePage},MANSION_PURCHASE_ERROR_PAGE:{name:"PURCHASE_D_ERROR",index:11,canStore:false,pageClass:com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionPurchasePage},UNDER_CONSTRUCTION_PAGE:{name:"UNDER_D_CONSTRUCTION",index:12,canStore:true,pageClass:com.rockstargames.gtav.web.prixluxuryrealestate.pages.UnderConstructionPage}};
   static var MANSION_0_DATA_SLOT = 10;
   static var MANSION_1_DATA_SLOT = 11;
   static var MANSION_2_DATA_SLOT = 12;
   function WWW_PRIXLUXURYREALESTATE_COM()
   {
      super();
      _global.gfxExtensions = true;
      this.initialised = false;
      this.mansions = [];
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.PAGE_NAMES = [];
      this.IS_SITE_DYNAMIC = 0;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
      this.isMP = this.browser.player == 1;
      this.videoDisabled = false;
      this.defaultButtonOnColour = 0;
      this.defaultButtonOffColour = 13409357;
      this.displayConfig = this.browser.getConfig();
      this.imageManager = new com.rockstargames.gtav.web.prixluxuryrealestate.ImageManager("WEB_BROWSER");
      this.pageContainer = this.CONTENT.createEmptyMovieClip("pageContainer",this.CONTENT.getNextHighestDepth());
      this.initPages();
   }
   function initPages()
   {
      var _loc2_;
      for(var _loc3_ in com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES)
      {
         _loc2_ = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES[_loc3_].index;
         this.PAGE_NAMES[_loc2_] = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES[_loc3_].name;
         this.CAN_STORE_PAGE[_loc2_] = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES[_loc3_].canStore;
      }
   }
   function setPage(pageName, PageClass)
   {
      if(this.currPage)
      {
         this.currPage.dispose();
      }
      this.dataTextScope.length = 0;
      this.CONTENT._y = 0;
      this.currPage = new PageClass(this,this.pageContainer,pageName);
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.browser.SUPRESS_HISTORY(false);
      if(this.activeMansion == null && this.dataProviderUI[com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.MANSION_0_DATA_SLOT].length > 0)
      {
         this.mansions[0] = new com.rockstargames.gtav.web.prixluxuryrealestate.Mansion(this.dataProviderUI[com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.MANSION_0_DATA_SLOT]);
         this.mansions[1] = new com.rockstargames.gtav.web.prixluxuryrealestate.Mansion(this.dataProviderUI[com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.MANSION_1_DATA_SLOT]);
         this.mansions[2] = new com.rockstargames.gtav.web.prixluxuryrealestate.Mansion(this.dataProviderUI[com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.MANSION_2_DATA_SLOT]);
         com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.resetBasket();
      }
   }
   function displayPage(pageName)
   {
      if(this.currPage.name == pageName)
      {
         return undefined;
      }
      if(!this.isMP)
      {
         this.setPage(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.UNDER_CONSTRUCTION_PAGE.name,com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.UNDER_CONSTRUCTION_PAGE.pageClass);
         return undefined;
      }
      if(pageName != com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_SPLASH_PAGE.name && this.mansions.length == 0)
      {
         return undefined;
      }
      for(var _loc3_ in com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES)
      {
         if(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES[_loc3_].name == pageName)
         {
            this.setPage(pageName,com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES[_loc3_].pageClass);
            break;
         }
      }
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      this.imageManager.textureLoaded(txd);
   }
   function DISABLE_VIDEO(isDisabled)
   {
      this.videoDisabled = isDisabled !== false;
   }
   function CLEANUP()
   {
      this.imageManager.dispose();
      this.imageManager = null;
      if(this.currPage)
      {
         this.currPage.dispose();
      }
      this.currPage = null;
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.resetBasket();
      this.mansions = null;
      this.activeMansion = null;
      super.CLEANUP();
   }
   function goToAnchor(link)
   {
      var _loc2_ = link.lastIndexOf("_");
      var _loc5_ = _loc2_ != -1 ? link.substring(0,_loc2_) : link;
      var _loc4_ = link.substring(_loc2_ + 1);
      this.currPage.handleClick(_loc5_,_loc4_);
   }
   function handleLB()
   {
      this.currPage.handleLB();
   }
   function handleRB()
   {
      this.currPage.handleRB();
   }
   function handleLT()
   {
      this.currPage.handleLT();
   }
   function handleRT()
   {
      this.currPage.handleRT();
   }
   function handleLTRelease()
   {
      this.currPage.handleLTRelease();
   }
   function handleRTRelease()
   {
      this.currPage.handleRTRelease();
   }
   function handleAnalogStickInput(isLeftStick, x, y, isScrollWheel)
   {
      this.currPage.handleAnalogStickInput(isLeftStick,x,y,isScrollWheel);
   }
   function handleMouseClick(inputIsMouseClick)
   {
      this.currPage.handleMouseClick(inputIsMouseClick);
   }
   function handleMouseRelease()
   {
      this.currPage.handleMouseRelease();
   }
   function setPageHeight(height)
   {
      this.CONTENT.BOUNDING_BOX._height = height;
      this.CONTENT.background._height = height;
      this.browser.RESIZE_WEBSITE();
   }
   function dispatchPlayerMansionSelections()
   {
      var _loc11_ = 2;
      var _loc10_ = 2;
      var _loc12_ = 3;
      var _loc5_ = 2;
      var _loc14_ = 2;
      var _loc7_ = 1;
      var _loc4_ = 1;
      var _loc6_ = 1;
      var _loc8_ = 1;
      var _loc9_ = 1;
      var _loc13_ = 1;
      var _loc2_ = 0;
      var _loc3_ = 0;
      _loc3_ |= this.activeMansion.id;
      _loc2_ += _loc11_;
      _loc3_ |= com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint << _loc2_;
      _loc2_ += _loc10_;
      _loc3_ |= com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern << _loc2_;
      _loc2_ += _loc12_;
      _loc3_ |= com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor << _loc2_;
      _loc2_ += _loc5_;
      _loc3_ |= com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai << _loc2_;
      _loc2_ += _loc14_;
      _loc3_ |= com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory << _loc2_;
      _loc2_ += _loc7_;
      _loc3_ |= com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade << _loc2_;
      _loc2_ += _loc4_;
      _loc3_ |= com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium << _loc2_;
      _loc2_ += _loc6_;
      _loc3_ |= com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop << _loc2_;
      _loc2_ += _loc8_;
      _loc3_ |= com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security << _loc2_;
      _loc2_ += _loc9_;
      _loc3_ |= com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio << _loc2_;
      _loc2_ += _loc13_;
      com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CLUBHOUSE,_loc3_);
      trace("*****************************************************************");
      trace("PRIXLUXURYREALESTATE MANSION DATA OUT");
      trace("ID: " + this.activeMansion.id);
      trace("TINT: " + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint);
      trace("PATTERN: " + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern);
      trace("DECOR: " + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor);
      trace("AI: " + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai);
      trace("ARMORY: " + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory);
      trace("ARCADE: " + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade);
      trace("PODIUM: " + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium);
      trace("WORKSHOP: " + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop);
      trace("ART STUDIO: " + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio);
      trace("SECURITY: " + com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security);
      trace("*****************************************************************");
      trace("BITFIELD: " + _loc3_);
      trace("*****************************************************************");
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function setSpacedTextField(tf, label, letterSpacing, forceUpperCase, isLiteralLabel)
   {
      if(isLiteralLabel)
      {
         tf.text = label;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(tf,label);
      }
      if(forceUpperCase)
      {
         tf.text = tf.text.toUpperCase();
      }
      var _loc2_ = tf.getTextFormat();
      _loc2_.letterSpacing = letterSpacing;
      tf.setTextFormat(_loc2_);
   }
   static function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
   static function resizeAsianText(tf)
   {
      if(!tf.multiline)
      {
         tf.verticalAlign = "center";
      }
      var _loc1_ = tf.getTextFormat();
      _loc1_.size *= 0.8;
      _loc1_.leading = 0;
      tf.setTextFormat(_loc1_);
   }
   static function formatDollarValue(value, tf)
   {
      var _loc3_;
      var _loc4_;
      var _loc2_;
      var _loc1_;
      var _loc5_;
      if(value == 0)
      {
         com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(tf,"FCFREE");
      }
      else
      {
         _loc3_ = Math.abs(int(value)).toString();
         _loc4_ = _loc3_.length;
         _loc2_ = 0;
         _loc1_ = _loc4_ % 3 || 3;
         _loc5_ = (value >= 0 ? "$" : "-$") + _loc3_.slice(_loc2_,_loc1_);
         while(_loc1_ < _loc4_)
         {
            _loc2_ = _loc1_;
            _loc1_ += 3;
            _loc5_ += "," + _loc3_.slice(_loc2_,_loc1_);
         }
         tf.text = _loc5_;
      }
   }
}
