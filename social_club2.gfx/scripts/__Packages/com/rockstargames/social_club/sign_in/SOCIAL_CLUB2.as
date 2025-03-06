class com.rockstargames.social_club.sign_in.SOCIAL_CLUB2 extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var PAGES;
   var PAGES_CACHE;
   var TEXT_CHECK;
   var WELCOME_TABS;
   var pageHistory;
   var regTextFormat;
   var boldTextFormat;
   var DispConf;
   var imgLdr;
   var imgLdrQRTxd;
   var imgLdrQR;
   static var SCROLL_TYPE_UP = 0;
   static var SCROLL_TYPE_DOWN = 1;
   static var SCROLL_TYPE_END = 2;
   static var SCROLL_TYPE_TOP = 3;
   static var SCROLL_ARROW_DISABLE_ALPHA = 30;
   var HUD_COLOUR_DISABLE_HIGHLIGHT_HARDCODED = [150,150,150];
   var HUD_COLOUR_DISABLE_TEXT_HARDCODED = [100,100,100];
   var TOUR_IMAGE_WIDTH = 576;
   var TOUR_IMAGE_HEIGHT = 392;
   var maxscroll = 1;
   var _position = 1;
   var INDEX_WELCOME = 0;
   var INDEX_ONLINE_POLICY = 1;
   var INDEX_TOS = 2;
   var INDEX_SIGN_UP = 3;
   var INDEX_SIGN_IN = 4;
   var INDEX_SYNC = 5;
   var INDEX_DOB = 6;
   var INDEX_CONFIRM = 7;
   var INDEX_SIGN_UP_DONE = 8;
   var INDEX_SIGN_IN_DONE = 9;
   var INDEX_FORGOT_PASSWORD = 10;
   var INDEX_FORGOT_PASSWORD_DONE = 11;
   var INDEX_ERROR = 12;
   var INDEX_QR_CODE = 13;
   function SOCIAL_CLUB2(mc)
   {
      super();
      this.TIMELINE = mc;
      this.PAGES = [];
      this.PAGES[this.INDEX_WELCOME] = {pageName:"PAGES_WELCOME",linkageId:"PAGES_WELCOME",store:true};
      this.PAGES[this.INDEX_ONLINE_POLICY] = {pageName:"PAGES_ONLINE_POLICY",linkageId:"PAGES_ONLINE_POLICY",store:false};
      this.PAGES[this.INDEX_TOS] = {pageName:"PAGES_TERMS_OF_SERVICE",linkageId:"PAGES_TERMS_OF_SERVICE",store:false};
      this.PAGES[this.INDEX_SIGN_UP] = {pageName:"PAGES_SIGN_UP",linkageId:"PAGES_SIGN_UP",store:true};
      this.PAGES[this.INDEX_SIGN_IN] = {pageName:"PAGES_SIGN_IN",linkageId:"PAGES_SIGN_IN",store:true};
      this.PAGES[this.INDEX_SYNC] = {pageName:"PAGES_SYNC",linkageId:"PAGES_SYNC",store:false};
      this.PAGES[this.INDEX_DOB] = {pageName:"PAGES_DOB",linkageId:"PAGES_SIGN_UP_DOB",store:true};
      this.PAGES[this.INDEX_CONFIRM] = {pageName:"PAGES_CONFIRM",linkageId:"PAGES_CONFIRM",store:false};
      this.PAGES[this.INDEX_SIGN_UP_DONE] = {pageName:"PAGES_SIGN_UP_DONE",linkageId:"PAGES_CONFIRM",store:false};
      this.PAGES[this.INDEX_SIGN_IN_DONE] = {pageName:"PAGES_SIGN_IN_DONE",linkageId:"PAGES_CONFIRM",store:false};
      this.PAGES[this.INDEX_FORGOT_PASSWORD] = {pageName:"PAGES_FORGOT_PASSWORD",linkageId:"PAGES_FORGOT_PASSWORD",store:true};
      this.PAGES[this.INDEX_FORGOT_PASSWORD_DONE] = {pageName:"PAGES_FORGOT_PASSWORD_DONE",linkageId:"PAGES_FORGOT_PASSWORD_DONE",store:false};
      this.PAGES[this.INDEX_ERROR] = {pageName:"PAGES_ERROR",linkageId:"PAGES_ERROR",store:false};
      this.PAGES[this.INDEX_QR_CODE] = {pageName:"PAGES_QR_CODE",linkageId:"PAGES_QR_CODE",store:false};
      this.PAGES_CACHE = [];
      this.TEXT_CHECK = [];
      var _loc3_ = 0;
      while(_loc3_ < this.PAGES.length)
      {
         this.TEXT_CHECK.push(false);
         _loc3_ = _loc3_ + 1;
      }
      this.WELCOME_TABS = [];
      this.pageHistory = [];
      this.regTextFormat = new TextFormat();
      this.regTextFormat.font = "$SOCIAL_CLUB_COND_REG";
      this.boldTextFormat = new TextFormat();
      this.boldTextFormat.font = "$SOCIAL_CLUB_COND_BOLD";
      this.DispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.DispConf = this.getDisplayConfig(true);
      if(!this.DispConf.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         this.DispConf.screenWidth = 960;
      }
   }
   function RESET_MENU()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.TEXT_CHECK.length)
      {
         this.TEXT_CHECK[_loc2_] = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function CREATE_BLIP_LAYER(page, xPos, yPos)
   {
      if(page.blipLayer != undefined)
      {
         MovieClip(page.blipLayer).removeMovieClip();
      }
      var _loc1_ = page.createEmptyMovieClip("blipLayer",page.getNextHighestDepth());
      _loc1_._x = xPos;
      _loc1_._y = yPos;
      return _loc1_;
   }
   function SET_HIGHLIGHT_COLOR(isSelected, clip, glowClip)
   {
      if(clip)
      {
         if(isSelected)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(clip,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(clip,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         }
      }
      if(glowClip)
      {
         glowClip._visible = isSelected;
      }
   }
   function SET_HIGHLIGHT_DISABLED_COLOR(clip, glowClip)
   {
      if(clip)
      {
         com.rockstargames.ui.utils.Colour.Colourise(clip,this.HUD_COLOUR_DISABLE_HIGHLIGHT_HARDCODED[0],this.HUD_COLOUR_DISABLE_HIGHLIGHT_HARDCODED[1],this.HUD_COLOUR_DISABLE_HIGHLIGHT_HARDCODED[2],100);
      }
      if(glowClip)
      {
         glowClip._visible = false;
      }
   }
   function SET_TEXT_ENABLED_COLOR(tf)
   {
      var _loc1_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc1_);
      tf.textColor = _loc1_.r * 65536 + _loc1_.g * 256 + _loc1_.b;
   }
   function SET_TEXT_DISABLED_COLOR(tf)
   {
      var _loc2_ = this.HUD_COLOUR_DISABLE_TEXT_HARDCODED[0] * 65536 + this.HUD_COLOUR_DISABLE_TEXT_HARDCODED[1] * 256 + this.HUD_COLOUR_DISABLE_TEXT_HARDCODED[2];
      tf.textColor = _loc2_;
   }
   function SET_TEXT_HUDCOLOUR(tf, hudColourId)
   {
      var _loc1_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(hudColourId,_loc1_);
      tf.textColor = _loc1_.r * 65536 + _loc1_.g * 256 + _loc1_.b;
   }
   function SET_MC_HUDCOLOUR(mc, hudColourId)
   {
      com.rockstargames.ui.utils.Colour.ApplyHudColour(mc,hudColourId);
   }
   function SET_SUBMIT_BUTTON(btnMc, btnText, rawText)
   {
      TextField(btnMc.submitField).autoSize = "center";
      if(!rawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(btnMc.submitField,btnText);
      }
      else
      {
         btnMc.submitField.text = btnText;
      }
      if(btnMc.submitField._width > 190)
      {
         btnMc.submitField._x = 5;
         MovieClip(btnMc.glow)._width = btnMc.submitField._width + 10;
         MovieClip(btnMc.submitHighlight)._width = MovieClip(btnMc.glow)._width;
      }
      btnMc.submitField.setTextFormat(this.boldTextFormat);
   }
   function SET_SUBMIT_BUTTON_ENABLED(btnMc, enable, isSelected)
   {
      var _loc3_ = this.TIMELINE.PAGES_ONLINE_POLICY;
      if(enable)
      {
         com.rockstargames.ui.mouse.MouseBtn(_loc3_.submitButton).init();
         this.SET_HIGHLIGHT_COLOR(isSelected,btnMc.submitHighlight,btnMc.glow);
         this.SET_TEXT_ENABLED_COLOR(btnMc.submitField);
      }
      else
      {
         com.rockstargames.ui.mouse.MouseBtn(_loc3_.submitButton).dispose();
         this.SET_HIGHLIGHT_DISABLED_COLOR(btnMc.submitHighlight,btnMc.glow);
         this.SET_TEXT_DISABLED_COLOR(btnMc.submitField);
      }
   }
   function SET_GAMERNAME(gamerName)
   {
      this.TIMELINE.GamerName.htmlText = gamerName;
      this.SET_TEXT_HUDCOLOUR(this.TIMELINE.GamerName,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.TIMELINE.GamerName.setTextFormat(this.boldTextFormat);
   }
   function SET_SOCIAL_CLUB_PRESENCE(scPresence)
   {
      this.TIMELINE.presenceText.htmlText = scPresence;
      this.TIMELINE.presenceText.setTextFormat(this.boldTextFormat);
   }
   function SET_SOCIAL_CLUB_PRESENCE_ACTIVE(scPresence)
   {
      var _loc3_ = undefined;
      if(scPresence)
      {
         var _loc2_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB,_loc2_);
         _loc3_ = _loc2_.r * 65536 + _loc2_.g * 256 + _loc2_.b;
         MovieClip(this.TIMELINE.icon_sc).gotoAndStop("SC YES");
         this.SET_SOCIAL_CLUB_PRESENCE(scPresence);
      }
      else
      {
         _loc3_ = this.HUD_COLOUR_DISABLE_HIGHLIGHT_HARDCODED[0] * 65536 + this.HUD_COLOUR_DISABLE_HIGHLIGHT_HARDCODED[1] * 256 + this.HUD_COLOUR_DISABLE_HIGHLIGHT_HARDCODED[2];
         MovieClip(this.TIMELINE.icon_sc).gotoAndStop("SC NO");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.presenceText,"SC_SIGNED_OUT");
      }
      TextField(this.TIMELINE.presenceText).textColor = _loc3_;
      this.TIMELINE.presenceText.setTextFormat(this.boldTextFormat);
   }
   function SET_NEWS_TEXT(heading, title, newsItem)
   {
      this.TIMELINE.PAGES_WELCOME.newsLabel.newsTitle.text = heading;
      this.TIMELINE.PAGES_WELCOME.newsLabel.text = title;
      this.TIMELINE.PAGES_WELCOME.newsText.htmlText = newsItem;
   }
   function SET_SOCIAL_CLUB_NAME()
   {
   }
   function SET_WELCOME_TITLE_TEXT(title)
   {
      this.TIMELINE.PAGES_WELCOME.welcomeTextTitle.htmlText = title.toUpperCase();
      this.TIMELINE.PAGES_WELCOME.welcomeTextTitle.setTextFormat(this.boldTextFormat);
   }
   function SET_WELCOME_INTRO_TEXT(intro)
   {
      this.TIMELINE.PAGES_WELCOME.welcomeTextIntro.htmlText = intro;
      this.TIMELINE.PAGES_WELCOME.welcomeTextIntro.setTextFormat(this.regTextFormat);
   }
   function SET_WELCOME_CALLOUT_TEXT(callout)
   {
      this.TIMELINE.PAGES_WELCOME.welcomeTextCallout.htmlText = callout;
      this.TIMELINE.PAGES_WELCOME.welcomeTextCallout.setTextFormat(this.boldTextFormat);
   }
   function SET_WELCOME_IMAGE(txd, image)
   {
      if(this.imgLdr == undefined)
      {
         this.imgLdr = com.rockstargames.ui.media.ImageLoaderMC(this.TIMELINE.PAGES_WELCOME.welcomeImage.attachMovie("mcLoaderTest","mcLoaderTest",100));
      }
      if(this.imgLdr.textureDict == txd)
      {
         if(this.imgLdr.isLoaded)
         {
            this.imgLdr.init("SOCIAL_CLUB2",txd,image,this.TOUR_IMAGE_WIDTH,this.TOUR_IMAGE_HEIGHT);
            this.imgLdr.displayTxdResponse(txd);
         }
      }
      else
      {
         if(this.imgLdr.isLoaded)
         {
            this.imgLdr.removeTxdRef();
         }
         this.imgLdr.init("SOCIAL_CLUB2",txd,image,this.TOUR_IMAGE_WIDTH,this.TOUR_IMAGE_HEIGHT);
         this.imgLdr.addTxdRef("SOCIAL_CLUB2");
      }
      this.TIMELINE.PAGES_WELCOME.imageSpinner._visible = false;
   }
   function SET_WELCOME_FALLBACK_IMAGE_VISIBILITY(visible)
   {
      if(visible)
      {
         MovieClip(this.TIMELINE.PAGES_WELCOME.fallbackImage)._visible = true;
      }
      else
      {
         MovieClip(this.TIMELINE.PAGES_WELCOME.fallbackImage)._visible = false;
      }
   }
   function ADD_TXD_REF_RESPONSE(txd)
   {
      if(txd == this.imgLdrQRTxd)
      {
         this.imgLdrQR.displayTxdResponse();
      }
      else
      {
         this.imgLdr.displayTxdResponse();
      }
   }
   function SET_WELCOME_JOIN_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_WELCOME.joinHighlight);
   }
   function SET_WELCOME_SIGN_IN_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_WELCOME.signInHighlight);
   }
   function SETUP_WELCOME_TABS(count)
   {
      var _loc7_ = 8;
      if(this.WELCOME_TABS.length < 1)
      {
         _loc7_ = 8;
         var _loc3_ = 0;
         while(_loc3_ < count)
         {
            var _loc5_ = "tab_" + _loc3_;
            var _loc2_ = this.TIMELINE.PAGES_WELCOME.attachMovie("page_indicator",_loc5_,this.TIMELINE.PAGES_WELCOME.getNextHighestDepth());
            var _loc6_ = MovieClip(this.TIMELINE.PAGES_WELCOME.welcomeImage)._width / 2 - (_loc2_._width * count - _loc7_ * (count - 1) / 2);
            _loc2_._y = MovieClip(this.TIMELINE.PAGES_WELCOME.welcomeImage)._y + MovieClip(this.TIMELINE.PAGES_WELCOME.welcomeImage)._height + 16;
            _loc2_._x = MovieClip(this.TIMELINE.PAGES_WELCOME.welcomeImage)._x + _loc3_ * 16 + _loc6_;
            _loc2_._alpha = 30;
            this.WELCOME_TABS.push(_loc2_);
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function SET_WELCOME_TAB(whichTab)
   {
      if(this.WELCOME_TABS.length < 1)
      {
         return undefined;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.WELCOME_TABS.length)
      {
         MovieClip(this.WELCOME_TABS[_loc2_])._alpha = 30;
         _loc2_ = _loc2_ + 1;
      }
      MovieClip(this.WELCOME_TABS[whichTab])._alpha = 100;
   }
   function DISPLAY_WELCOME_PAGE()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_WELCOME);
      if(!this.TEXT_CHECK[this.INDEX_WELCOME])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_WELCOME.welcomeTextTitle,"SC_WELCOME_TOUR_1_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_WELCOME.welcomeTextIntro,"SC_WELCOME_TOUR_1_INTRO");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_WELCOME.welcomeTextCallout,"SC_WELCOME_TOUR_CALLOUT");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_WELCOME.buttonTextJoin,"SC_WELCOME_TOUR_JOIN_BUTTON");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_WELCOME.buttonTextSignin,"SC_WELCOME_TOUR_SIGN_IN_BUTTON");
         this.TIMELINE.PAGES_WELCOME.welcomeTextTitle.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_WELCOME.welcomeTextIntro.setTextFormat(this.regTextFormat);
         this.TIMELINE.PAGES_WELCOME.welcomeTextCallout.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_WELCOME.buttonTextJoin.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_WELCOME.buttonTextSignin.setTextFormat(this.boldTextFormat);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_WELCOME.welcomeTextTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_WELCOME.welcomeTextIntro,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_WELCOME.welcomeTextCallout,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_WELCOME_FALLBACK_IMAGE_VISIBILITY(false);
         this.TEXT_CHECK[this.INDEX_WELCOME] = true;
      }
   }
   function SET_ONLINE_POLICY_TEXT(policy)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPText.htmlText = policy;
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPText.setTextFormat(this.regTextFormat);
   }
   function SET_ONLINE_POLICY_TITLE(title)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitle.htmlText = title;
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitle.setTextFormat(this.boldTextFormat);
   }
   function SET_ONLINE_POLICY_READ_TITLE(title)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitleReadPolicy.htmlText = title;
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitleReadPolicy.setTextFormat(this.boldTextFormat);
   }
   function SET_ONLINE_POLICY_LINK_1(linkText)
   {
   }
   function SET_ONLINE_POLICY_LINK_1_HIGHLIGHT(isSelected)
   {
   }
   function SET_ONLINE_POLICY_LINK_2(linkText)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy2.policyText.htmlText = linkText;
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy2.setTextFormat(this.boldTextFormat);
      this.updatePolicyLinkLayout();
   }
   function SET_ONLINE_POLICY_LINK_2_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy2);
   }
   function SET_ONLINE_POLICY_LINK_3(linkText)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy3.policyText.htmlText = linkText;
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy3.setTextFormat(this.boldTextFormat);
      this.updatePolicyLinkLayout();
   }
   function SET_ONLINE_POLICY_LINK_3_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy3);
   }
   function SET_ONLINE_POLICY_ACCEPT_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_ONLINE_POLICY.AcceptConfirm);
   }
   function SET_ONLINE_POLICY_ACCEPT_RADIO_BUTTON_STATE(state)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.AcceptConfirm.gotoAndStop(state + 1);
   }
   function SET_ONLINE_POLICY_ACCEPTED_TEXT(text)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.AcceptText.htmlText = text;
      this.TIMELINE.PAGES_ONLINE_POLICY.AcceptText.setTextFormat(this.boldTextFormat);
   }
   function updatePolicyLinkLayout()
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy3._y = this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy2._y + this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy2._height + 10;
   }
   function SET_ONLINE_POLICY_SUBMIT_FIELD(text)
   {
      this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_ONLINE_POLICY.submitButton,text,true);
   }
   function SET_ONLINE_POLICY_SUBMIT_HIGHLIGHT(isEnabled, isSelected)
   {
      this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_ONLINE_POLICY.submitButton,isEnabled,isSelected);
   }
   function DISPLAY_ONLINE_POLICY()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_ONLINE_POLICY);
      if(!this.TEXT_CHECK[this.INDEX_ONLINE_POLICY])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitle,"ONLINE_POLICIES_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_ONLINE_POLICY.SCOPText,"ONLINE_POLICY_INTRO",undefined,true);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitleReadPolicy,"ONLINE_POLICY_READ_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy2.policyText,"ONLINE_POLICY_LINK_PP",undefined,true);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy3.policyText,"ONLINE_POLICY_LINK_TOS",undefined,true);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_ONLINE_POLICY.AcceptText,"ONLINE_POLICY_ACCEPT",undefined,true);
         this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitle.text = this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitle.text.toUpperCase();
         this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitle.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_ONLINE_POLICY.SCOPText.setTextFormat(this.regTextFormat);
         this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitleReadPolicy.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy2.policyText.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy3.policyText.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_ONLINE_POLICY.AcceptText.setTextFormat(this.boldTextFormat);
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_ONLINE_POLICY.submitButton,"SC_SUBMIT_BUTTON");
         this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_ONLINE_POLICY.submitButton,false,false);
         this.SET_ONLINE_POLICY_ACCEPT_HIGHLIGHT(true);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_ONLINE_POLICY.SCOPText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.TEXT_CHECK[this.INDEX_ONLINE_POLICY] = true;
      }
   }
   function SET_POLICY_TITLE(title)
   {
      this.TIMELINE.PAGES_TERMS_OF_SERVICE.TOSTitle.htmlText = title;
      this.TIMELINE.PAGES_TERMS_OF_SERVICE.TOSTitle.setTextFormat(this.boldTextFormat);
   }
   function get position()
   {
      return this._position;
   }
   function set position(value)
   {
      this._position = value;
      this.TIMELINE.PAGES_TERMS_OF_SERVICE.TOSText.scroll = this._position;
   }
   function SET_POLICY_TEXT(tos)
   {
      var _loc3_ = 1;
      while(_loc3_ < arguments.length)
      {
         if(arguments[_loc3_] && arguments[_loc3_] != "")
         {
            tos = tos + "<br><br>" + arguments[_loc3_];
         }
         _loc3_ = _loc3_ + 1;
      }
      var _loc5_ = TextField(this.TIMELINE.PAGES_TERMS_OF_SERVICE.TOSText);
      _loc5_.htmlText = tos;
      this.maxscroll = _loc5_.maxscroll;
      _loc5_.setTextFormat(this.regTextFormat);
      var _loc6_ = _loc5_.textHeight > _loc5_._height;
      MovieClip(this.TIMELINE.PAGES_TERMS_OF_SERVICE.scrollArrowUp)._alpha = com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_ARROW_DISABLE_ALPHA;
      MovieClip(this.TIMELINE.PAGES_TERMS_OF_SERVICE.scrollArrowDown)._alpha = !_loc6_ ? com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_ARROW_DISABLE_ALPHA : 100;
   }
   function SCROLL_POLICY_TEXT(scrollType)
   {
      this.maxscroll = this.TIMELINE.PAGES_TERMS_OF_SERVICE.TOSText.maxscroll;
      switch(scrollType)
      {
         case com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_TYPE_UP:
            if(this.position == 1)
            {
               MovieClip(this.TIMELINE.PAGES_TERMS_OF_SERVICE.scrollArrowUp)._alpha = com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_ARROW_DISABLE_ALPHA;
               return false;
            }
            MovieClip(this.TIMELINE.PAGES_TERMS_OF_SERVICE.scrollArrowDown)._alpha = 100;
            this.position = Math.max(1,this.position - 1);
            return true;
            break;
         case com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_TYPE_DOWN:
            if(this.position == this.maxscroll)
            {
               MovieClip(this.TIMELINE.PAGES_TERMS_OF_SERVICE.scrollArrowDown)._alpha = com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_ARROW_DISABLE_ALPHA;
               return false;
            }
            MovieClip(this.TIMELINE.PAGES_TERMS_OF_SERVICE.scrollArrowUp)._alpha = 100;
            this.position = Math.min(this.maxscroll,this.position + 1);
            return true;
            break;
         case com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_TYPE_END:
            this.position = this.maxscroll;
            MovieClip(this.TIMELINE.PAGES_TERMS_OF_SERVICE.scrollArrowDown)._alpha = com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_ARROW_DISABLE_ALPHA;
            return true;
         case com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_TYPE_TOP:
            this.position = 1;
            MovieClip(this.TIMELINE.PAGES_TERMS_OF_SERVICE.scrollArrowUp)._alpha = com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_ARROW_DISABLE_ALPHA;
            return true;
         default:
      }
   }
   function INIT_DOWNLOADED_POLICY()
   {
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_TERMS_OF_SERVICE.TOSTitle,"SC_TOS_HEADER");
      this.TIMELINE.PAGES_TERMS_OF_SERVICE.TOSTitle.setTextFormat(this.boldTextFormat);
   }
   function DISPLAY_DOWNLOADED_POLICY()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_TOS);
      this.INIT_DOWNLOADED_POLICY();
      if(!this.TEXT_CHECK[this.INDEX_TOS])
      {
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_TERMS_OF_SERVICE.submitButton,"SC_NEXT_BUTTON");
      }
   }
   function SET_EMAIL_ADDRESS(emailAddress)
   {
      if(emailAddress != "")
      {
         this.TIMELINE.PAGES_SIGN_UP.emailField.text = emailAddress;
         this.TIMELINE.PAGES_SIGN_IN.emailField.text = emailAddress;
         this.TIMELINE.PAGES_FORGOT_PASSWORD.emailField.text = emailAddress;
      }
      this.TIMELINE.PAGES_SIGN_UP.emailField.setTextFormat(this.boldTextFormat);
      this.TIMELINE.PAGES_SIGN_IN.emailField.setTextFormat(this.boldTextFormat);
      this.TIMELINE.PAGES_FORGOT_PASSWORD.emailField.setTextFormat(this.boldTextFormat);
   }
   function SET_NICKNAME(nickname)
   {
      if(nickname != "")
      {
         this.TIMELINE.PAGES_SIGN_UP.nicknameField.text = nickname;
         this.TIMELINE.PAGES_SIGN_IN.emailField.text = nickname;
      }
      this.TIMELINE.PAGES_SIGN_IN.emailField.setTextFormat(this.boldTextFormat);
      this.TIMELINE.PAGES_SIGN_UP.nicknameField.setTextFormat(this.boldTextFormat);
   }
   function SET_SIGN_UP_TITLE(title)
   {
      this.TIMELINE.PAGES_SIGN_UP.signUpTitle.htmlText = title;
      this.TIMELINE.PAGES_SIGN_UP.signUpTitle.setTextFormat(this.boldTextFormat);
   }
   function SET_SIGN_UP_TEXT(text)
   {
      this.TIMELINE.PAGES_SIGN_UP.signUpText.htmlText = text;
      this.TIMELINE.PAGES_SIGN_UP.signUpText.setTextFormat(this.regTextFormat);
   }
   function SET_SIGN_UP_NICKNAME_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_SIGN_UP.nicknameHighlight);
   }
   function SET_SIGN_UP_EMAIL_ADDRESS_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_SIGN_UP.emailHighlight);
   }
   function SET_SIGN_UP_PASSWORD_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_SIGN_UP.passwordHighlight);
   }
   function SET_SIGN_UP_PASSWORD(password)
   {
      this.TIMELINE.PAGES_SIGN_UP.passwordField.text = password;
      this.TIMELINE.PAGES_SIGN_UP.passwordField.setTextFormat(this.boldTextFormat);
   }
   function SET_SIGN_UP_RADIO_BUTTON_STATE(state)
   {
      this.TIMELINE.PAGES_SIGN_UP.mailingListRadioButton.gotoAndStop(state + 1);
   }
   function SET_HIGLIGHT_INPUT_MAILING_LIST(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_SIGN_UP.mailingListRadioButton);
   }
   function SET_INPUT_MAILING_LIST(text)
   {
      this.TIMELINE.PAGES_SIGN_UP.MailListText.htmlText = text;
      this.TIMELINE.PAGES_SIGN_UP.MailListText.setTextFormat(this.boldTextFormat);
      if(text != "")
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_UP.mailingListRadioButton)._visible = true;
      }
      else
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_UP.mailingListRadioButton)._visible = false;
      }
   }
   function SET_SIGN_UP_SUBMIT_TEXT(text)
   {
      this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_SIGN_UP.submitButton,text);
   }
   function SET_SIGN_UP_SUBMIT_HIGHLIGHT(isSelected)
   {
      this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_SIGN_UP.submitButton,true,isSelected);
   }
   function SET_SIGN_UP_SUBMIT_DISABLED()
   {
      this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_SIGN_UP.submitButton,false);
   }
   function SET_SIGN_UP_NICKNAME_STATE(message, icon)
   {
      this.TIMELINE.PAGES_SIGN_UP.nicknameErrorField.htmlText = message;
      this.TIMELINE.PAGES_SIGN_UP.nicknameErrorField.setTextFormat(this.boldTextFormat);
      this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_UP.nicknameErrorField,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
      MovieClip(this.TIMELINE.PAGES_SIGN_UP.alertIcon1)._visible = false;
      MovieClip(this.TIMELINE.PAGES_SIGN_UP.nicknameBusySpinner)._visible = false;
      MovieClip(this.TIMELINE.PAGES_SIGN_UP.nicknameConfirm)._visible = false;
      if(icon == 1)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_UP.nicknameBusySpinner)._visible = true;
      }
      else if(icon == 2)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_UP.alertIcon1)._visible = true;
      }
      else if(icon == 3)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_UP.nicknameConfirm)._visible = true;
      }
   }
   function SET_SIGN_UP_EMAIL_STATE(message, icon)
   {
      this.TIMELINE.PAGES_SIGN_UP.emailErrorField.htmlText = message;
      this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_UP.emailErrorField,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
      this.TIMELINE.PAGES_SIGN_UP.emailErrorField.setTextFormat(this.boldTextFormat);
      MovieClip(this.TIMELINE.PAGES_SIGN_UP.alertIcon2)._visible = false;
      MovieClip(this.TIMELINE.PAGES_SIGN_UP.emailBusySpinner)._visible = false;
      MovieClip(this.TIMELINE.PAGES_SIGN_UP.emailConfirm)._visible = false;
      if(icon == 1)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_UP.emailBusySpinner)._visible = true;
      }
      else if(icon == 2)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_UP.alertIcon2)._visible = true;
      }
      else if(icon == 3)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_UP.emailConfirm)._visible = true;
      }
   }
   function SET_SIGN_UP_PASSWORD_STATE(message, icon)
   {
      this.TIMELINE.PAGES_SIGN_UP.passwordErrorField.htmlText = message;
      this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_UP.passwordErrorField,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
      this.TIMELINE.PAGES_SIGN_UP.passwordErrorField.setTextFormat(this.boldTextFormat);
      MovieClip(this.TIMELINE.PAGES_SIGN_UP.alertIcon3)._visible = false;
      MovieClip(this.TIMELINE.PAGES_SIGN_UP.passwordBusySpinner)._visible = false;
      MovieClip(this.TIMELINE.PAGES_SIGN_UP.passwordConfirm)._visible = false;
      if(icon == 1)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_UP.passwordBusySpinner)._visible = true;
      }
      else if(icon == 2)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_UP.alertIcon3)._visible = true;
      }
      else if(icon == 3)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_UP.passwordConfirm)._visible = true;
      }
   }
   function DISPLAY_SIGN_UP()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_SIGN_UP);
      this.INIT_SIGN_UP();
   }
   function INIT_SIGN_UP()
   {
      if(!this.TEXT_CHECK[this.INDEX_SIGN_UP])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_UP.emailField,"SC_EMAIL_LABEL");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_UP.nicknameField,"SC_NICKNAME_LABEL");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_UP.passwordField,"SC_PASSWORD_LABEL");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_UP.MailListText,"SC_RECV_EMAIL");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_UP.signUpTitle,"SC_SIGNUP_HEADER");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_UP.signUpText,"SC_SIGNUP_TEXT",undefined,true);
         this.TIMELINE.PAGES_SIGN_UP.emailField.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_SIGN_UP.nicknameField.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_SIGN_UP.passwordField.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_SIGN_UP.MailListText.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_SIGN_UP.signUpTitle.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_SIGN_UP.signUpText.setTextFormat(this.regTextFormat);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_UP.signUpTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_UP.signUpText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_MC_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_UP.alertIcon1,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         this.SET_MC_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_UP.alertIcon2,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         this.SET_MC_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_UP.alertIcon3,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_SIGN_UP.submitButton,"SC_SUBMIT_BUTTON");
         this.SET_SIGN_UP_SUBMIT_DISABLED();
         this.SET_SIGN_UP_NICKNAME_STATE("",0);
         this.SET_SIGN_UP_EMAIL_STATE("",0);
         this.SET_SIGN_UP_PASSWORD_STATE("",0);
         this.SET_SIGN_UP_NICKNAME_HIGHLIGHT(true);
         this.TEXT_CHECK[this.INDEX_SIGN_UP] = true;
      }
   }
   function SET_SIGN_IN_TITLE(title)
   {
      this.TIMELINE.PAGES_SIGN_IN.signInTitle.text = title;
      this.TIMELINE.PAGES_SIGN_IN.signInTitle.setTextFormat(this.boldTextFormat);
   }
   function SET_SIGN_IN_TEXT(text)
   {
      this.TIMELINE.PAGES_SIGN_IN.signInText.htmlText = text;
      this.TIMELINE.PAGES_SIGN_IN.signInText.setTextFormat(this.regTextFormat);
   }
   function SET_SIGN_IN_EMAIL_ADDRESS_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_SIGN_IN.emailHighlight);
   }
   function SET_SIGN_IN_PASSWORD_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_SIGN_IN.passwordHighlight);
   }
   function SET_SIGN_IN_PASSWORD(password)
   {
      this.TIMELINE.PAGES_SIGN_IN.passwordField.text = password;
      this.TIMELINE.PAGES_SIGN_IN.passwordField.setTextFormat(this.boldTextFormat);
   }
   function SET_SIGN_IN_SUBMIT_DISABLED()
   {
      this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_SIGN_IN.submitButton,false);
   }
   function SET_SIGN_IN_SUBMIT_HIGHLIGHT(isSelected)
   {
      this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_SIGN_IN.submitButton,true,isSelected);
   }
   function SET_SIGN_IN_EMAIL_STATE(message, icon)
   {
      this.TIMELINE.PAGES_SIGN_IN.emailErrorField.htmlText = message;
      this.TIMELINE.PAGES_SIGN_IN.emailErrorField.setTextFormat(this.boldTextFormat);
      this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_IN.emailErrorField,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
      MovieClip(this.TIMELINE.PAGES_SIGN_IN.alertIcon1)._visible = false;
      MovieClip(this.TIMELINE.PAGES_SIGN_IN.emailBusySpinner)._visible = false;
      MovieClip(this.TIMELINE.PAGES_SIGN_IN.emailConfirm)._visible = false;
      if(icon == 1)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_IN.emailBusySpinner)._visible = true;
      }
      else if(icon == 2)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_IN.alertIcon1)._visible = true;
      }
      else if(icon == 3)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_IN.emailConfirm)._visible = true;
      }
   }
   function SET_SIGN_IN_PASSWORD_STATE(message, icon)
   {
      this.TIMELINE.PAGES_SIGN_IN.passwordErrorField.htmlText = message;
      this.TIMELINE.PAGES_SIGN_IN.passwordErrorField.setTextFormat(this.boldTextFormat);
      this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_IN.passwordErrorField,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
      MovieClip(this.TIMELINE.PAGES_SIGN_IN.alertIcon2)._visible = false;
      MovieClip(this.TIMELINE.PAGES_SIGN_IN.passwordBusySpinner)._visible = false;
      MovieClip(this.TIMELINE.PAGES_SIGN_IN.passwordConfirm)._visible = false;
      if(icon == 1)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_IN.passwordBusySpinner)._visible = true;
      }
      else if(icon == 2)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_IN.alertIcon2)._visible = true;
      }
      else if(icon == 3)
      {
         MovieClip(this.TIMELINE.PAGES_SIGN_IN.passwordConfirm)._visible = true;
      }
   }
   function SET_SIGN_IN_PASSWORD_RESET_TEXT(text)
   {
      this.TIMELINE.PAGES_SIGN_IN.passwordResetText.htmlText = text;
      this.TIMELINE.PAGES_SIGN_IN.passwordResetText.setTextFormat(this.regTextFormat);
   }
   function SET_SIGN_IN_PASSWORD_RESET_HIGHLIGHT(isSelected)
   {
      this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_SIGN_IN.resetPasswordButton,true,isSelected);
   }
   function INIT_SIGN_IN()
   {
      if(!this.TEXT_CHECK[this.INDEX_SIGN_IN])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_IN.signInTitle,"SC_SIGNIN_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_IN.signInText,"SC_SIGNIN_TEXT",undefined,true);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_IN.emailField,"SC_EMAIL_NICKNAME_LABEL");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_IN.passwordField,"SC_PASSWORD_LABEL");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_IN.passwordResetText,"SC_SIGNIN_PASSWORD_RESET");
         this.TIMELINE.PAGES_SIGN_IN.signInTitle.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_SIGN_IN.signInText.setTextFormat(this.regTextFormat);
         this.TIMELINE.PAGES_SIGN_IN.emailField.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_SIGN_IN.passwordField.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_SIGN_IN.passwordResetText.setTextFormat(this.regTextFormat);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_IN.signInTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_IN.signInText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_MC_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_IN.alertIcon1,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         this.SET_MC_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_IN.alertIcon2,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_SIGN_IN.submitButton,"SC_SUBMIT_BUTTON");
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_SIGN_IN.resetPasswordButton,"SC_SIGNIN_PASSWORD_RESET_BUTTON");
         this.SET_SIGN_IN_SUBMIT_DISABLED();
         this.SET_SIGN_IN_PASSWORD_RESET_HIGHLIGHT(false);
         this.SET_SIGN_IN_EMAIL_STATE("",0);
         this.SET_SIGN_IN_PASSWORD_STATE("",0);
         this.TEXT_CHECK[this.INDEX_SIGN_IN] = true;
      }
      if(this.pageHistory[this.pageHistory.length - 2] == this.INDEX_FORGOT_PASSWORD)
      {
         this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_SIGN_IN.resetPasswordButton,true,true);
         this.SET_SIGN_IN_EMAIL_ADDRESS_HIGHLIGHT(false);
      }
   }
   function DISPLAY_SIGN_IN()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_SIGN_IN);
      this.INIT_SIGN_IN();
   }
   function DISPLAY_SYNC(scTitle, scText, showSpinner)
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_SYNC);
      this.TIMELINE.PAGES_SYNC.SYNCTitle.text = scTitle;
      this.TIMELINE.PAGES_SYNC.SYNCText.htmlText = scText;
      this.TIMELINE.PAGES_SYNC.SYNCTitle.setTextFormat(this.boldTextFormat);
      this.TIMELINE.PAGES_SYNC.SYNCText.setTextFormat(this.regTextFormat);
      this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SYNC.SYNCTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
      this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SYNC.SYNCText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      if(!this.DispConf.isWideScreen)
      {
         this.TIMELINE.PAGES_SYNC.SYNC_SPINNER._x = 17;
         if(showSpinner)
         {
            this.TIMELINE.PAGES_SYNC.SYNCTitle._x = this.TIMELINE.PAGES_SYNC.SYNC_SPINNER._x + 17;
         }
      }
      if(!showSpinner)
      {
         this.TIMELINE.PAGES_SYNC.SYNC_SPINNER._visible = false;
      }
   }
   function SET_DOB_SIGNUP_TITLE(title)
   {
      this.TIMELINE.PAGES_DOB.DOBsignUpTitle.htmlText = title;
      this.TIMELINE.PAGES_DOB.DOBsignUpTitle.setTextFormat(this.boldTextFormat);
   }
   function SET_DOB_SIGNUP_TEXT(text)
   {
      this.TIMELINE.PAGES_DOB.DOBsignUpText.htmlText = text;
      this.TIMELINE.PAGES_DOB.DOBsignUpText.setTextFormat(this.regTextFormat);
   }
   function SET_DOB_HIGHLIGHT(isSelected, whichDOB)
   {
      whichDOB += 1;
      if(this.TIMELINE.PAGES_DOB.PANEL_DOB["dobHighlight" + whichDOB] != undefined)
      {
         this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_DOB.PANEL_DOB["dobHighlight" + whichDOB],this.TIMELINE.PAGES_DOB.PANEL_DOB["dobHighlight" + whichDOB + "Glow"]);
      }
   }
   function SET_DOB_TEXT(whichDOB, str)
   {
      whichDOB += 1;
      var _loc2_ = this.TIMELINE.PAGES_DOB.PANEL_DOB["dobField" + whichDOB];
      if(whichDOB == 1)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_,str);
      }
      else
      {
         _loc2_.text = str;
      }
      _loc2_.setTextFormat(this.boldTextFormat);
   }
   function RESET_DOB_TEXT(whichDOB)
   {
      whichDOB += 1;
      var _loc3_ = this.TIMELINE.PAGES_DOB.PANEL_DOB["dobField" + whichDOB];
      if(whichDOB == 1)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_DOB.PANEL_DOB.dobField1,"SC_DOB_MONTH");
      }
      if(whichDOB == 2)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_DOB.PANEL_DOB.dobField2,"SC_DOB_DAY");
      }
      if(whichDOB == 3)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_DOB.PANEL_DOB.dobField3,"SC_DOB_YEAR");
      }
      _loc3_.setTextFormat(this.boldTextFormat);
   }
   function SET_DOB_ERROR(errorMessage)
   {
      this.TIMELINE.PAGES_DOB.dobErrorField.htmlText = errorMessage;
      this.TIMELINE.PAGES_DOB.dobErrorField.setTextFormat(this.boldTextFormat);
      this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_DOB.dobErrorField,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
      if(errorMessage != "")
      {
         MovieClip(this.TIMELINE.PAGES_DOB.alertIcon1)._visible = true;
         this.SET_MC_HUDCOLOUR(this.TIMELINE.PAGES_DOB.alertIcon1,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
      }
      else
      {
         MovieClip(this.TIMELINE.PAGES_DOB.alertIcon1)._visible = false;
      }
   }
   function SET_DOB_SUBMIT_HIGHLIGHT(isSelected)
   {
      this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_DOB.submitButton,true,isSelected);
   }
   function SET_DOB_SUBMIT_DISABLED()
   {
      this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_DOB.submitButton,false);
   }
   function DISPLAY_DOB_PAGE()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_DOB);
      if(!this.TEXT_CHECK[this.INDEX_DOB])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_DOB.DOBsignUpTitle,"SC_DOB_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_DOB.DOBsignUpText,"SC_DOB_TEXT",undefined,true);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_DOB.PANEL_DOB.dobField1,"SC_DOB_MONTH");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_DOB.PANEL_DOB.dobField2,"SC_DOB_DAY");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_DOB.PANEL_DOB.dobField3,"SC_DOB_YEAR");
         this.TIMELINE.PAGES_DOB.DOBsignUpTitle.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_DOB.DOBsignUpText.setTextFormat(this.regTextFormat);
         this.TIMELINE.PAGES_DOB.PANEL_DOB.dobField1.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_DOB.PANEL_DOB.dobField2.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_DOB.PANEL_DOB.dobField3.setTextFormat(this.boldTextFormat);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_DOB.DOBsignUpTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_DOB.DOBsignUpText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_DOB.submitButton,"SC_SUBMIT_BUTTON");
         this.SET_DOB_SUBMIT_DISABLED();
         this.SET_DOB_ERROR("");
         this.SET_DOB_HIGHLIGHT(true,0);
         this.TEXT_CHECK[this.INDEX_DOB] = true;
      }
   }
   function SET_CONFIRM_TITLE(title)
   {
      this.TIMELINE.PAGES_CONFIRM.confirmTitle.htmlText = title;
      this.TIMELINE.PAGES_CONFIRM.confirmTitle.setTextFormat(this.boldTextFormat);
   }
   function SET_CONFIRM_TEXT(text)
   {
      this.TIMELINE.PAGES_CONFIRM.confirmText.htmlText = text;
      this.TIMELINE.PAGES_CONFIRM.confirmText.setTextFormat(this.regTextFormat);
   }
   function SET_CONFIRM_TEXT_BLIPS(label)
   {
      var _loc3_ = new com.rockstargames.ui.utils.Text();
      var _loc2_ = this.CREATE_BLIP_LAYER(this.TIMELINE.PAGES_CONFIRM,0,0);
      _loc3_.setTextWithIcons(label,_loc2_,this.TIMELINE.PAGES_CONFIRM.confirmText,0,16,4,false);
   }
   function SET_CONFIRM_EMAIL_LABEL_TEXT(text)
   {
      this.TIMELINE.PAGES_CONFIRM.confirmEmailLabel.htmlText = text;
      this.TIMELINE.PAGES_CONFIRM.confirmEmailLabel.setTextFormat(this.boldTextFormat);
   }
   function SET_CONFIRM_USER_EMAIL_TEXT(text)
   {
      this.TIMELINE.PAGES_CONFIRM.confirmUserEmail.htmlText = text;
      this.TIMELINE.PAGES_CONFIRM.confirmUserEmail.setTextFormat(this.regTextFormat);
      this.TIMELINE.PAGES_CONFIRM.confirmText.setTextFormat(this.regTextFormat);
   }
   function SET_CONFIRM_NICKNAME_LABEL_TEXT(text)
   {
      this.TIMELINE.PAGES_CONFIRM.confirmNicknameLabel.htmlText = text;
      this.TIMELINE.PAGES_CONFIRM.confirmNicknameLabel.setTextFormat(this.boldTextFormat);
   }
   function SET_CONFIRM_USER_NICKNAME_TEXT(text)
   {
      this.TIMELINE.PAGES_CONFIRM.confirmUserNickname.htmlText = text;
      this.TIMELINE.PAGES_CONFIRM.confirmUserNickname.setTextFormat(this.regTextFormat);
   }
   function SET_CONFIRM_NEWSLETTER_TEXT(text)
   {
      this.TIMELINE.PAGES_CONFIRM.confirmNewsletter.htmlText = text;
      this.TIMELINE.PAGES_CONFIRM.confirmNewsletter.setTextFormat(this.regTextFormat);
   }
   function DISPLAY_CONFIRM_PAGE()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_CONFIRM);
      if(!this.TEXT_CHECK[this.INDEX_CONFIRM])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_CONFIRM.confirmTitle,"SC_CONFIRM_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_CONFIRM.confirmText,"SC_CONFIRM_TEXT",undefined,true);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_CONFIRM.confirmEmailLabel,"SC_EMAIL_CONF_LABEL");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_CONFIRM.confirmNicknameLabel,"SC_NICK_CONF_LABEL");
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_CONFIRM.confirmTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_CONFIRM.confirmText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.TIMELINE.PAGES_CONFIRM.confirmTitle.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_CONFIRM.confirmText.setTextFormat(this.regTextFormat);
         this.TIMELINE.PAGES_CONFIRM.confirmEmailLabel.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_CONFIRM.confirmNicknameLabel.setTextFormat(this.boldTextFormat);
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_CONFIRM.submitButton,"SC_CONFIRM_BUTTON");
         this.TEXT_CHECK[this.INDEX_CONFIRM] = true;
      }
   }
   function SET_SIGN_IN_DONE_TITLE(title)
   {
      this.TIMELINE.PAGES_SIGN_IN_DONE.confirmTitle.htmlText = title;
      this.TIMELINE.PAGES_SIGN_IN_DONE.confirmTitle.setTextFormat(this.boldTextFormat);
   }
   function SET_SIGN_IN_DONE_TEXT(text)
   {
      this.TIMELINE.PAGES_SIGN_IN_DONE.confirmText.htmlText = text;
      this.TIMELINE.PAGES_SIGN_IN_DONE.confirmText.setTextFormat(this.regTextFormat);
   }
   function DISPLAY_SIGN_IN_DONE_PAGE()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_SIGN_IN_DONE);
      if(!this.TEXT_CHECK[this.INDEX_SIGN_IN_DONE])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_IN_DONE.confirmTitle,"SC_SIGN_IN_DONE_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_IN_DONE.confirmText,"SC_SIGN_IN_DONE_TEXT",undefined,true);
         this.TIMELINE.PAGES_SIGN_IN_DONE.confirmTitle.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_SIGN_IN_DONE.confirmText.setTextFormat(this.regTextFormat);
         TextField(this.TIMELINE.PAGES_SIGN_IN_DONE.confirmText).autoSize = true;
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_IN_DONE.confirmTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_IN_DONE.confirmText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_SIGN_IN_DONE.submitButton,"SC_RETURN_BUTTON");
         this.TEXT_CHECK[this.INDEX_SIGN_IN_DONE] = true;
      }
   }
   function SET_SIGN_UP_DONE_TITLE(title)
   {
      this.TIMELINE.PAGES_SIGN_UP_DONE.confirmTitle.htmlText = title;
      this.TIMELINE.PAGES_SIGN_UP_DONE.confirmTitle.setTextFormat(this.boldTextFormat);
   }
   function SET_SIGN_UP_DONE_TEXT(text)
   {
      this.TIMELINE.PAGES_SIGN_UP_DONE.confirmText.htmlText = text;
      this.TIMELINE.PAGES_SIGN_UP_DONE.confirmText.setTextFormat(this.regTextFormat);
   }
   function DISPLAY_SIGN_UP_DONE_PAGE()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_SIGN_UP_DONE);
      if(!this.TEXT_CHECK[this.INDEX_SIGN_UP_DONE])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_UP_DONE.confirmTitle,"SC_SIGN_UP_DONE_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_SIGN_UP_DONE.confirmText,"SC_SIGN_UP_DONE_TEXT",undefined,true);
         TextField(this.TIMELINE.PAGES_SIGN_UP_DONE.confirmText).autoSize = true;
         this.TIMELINE.PAGES_SIGN_UP_DONE.confirmText.setTextFormat(this.regTextFormat);
         this.TIMELINE.PAGES_SIGN_UP_DONE.confirmTitle.setTextFormat(this.boldTextFormat);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_UP_DONE.confirmTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_SIGN_UP_DONE.confirmText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_SIGN_UP_DONE.submitButton,"SC_RETURN_BUTTON");
         this.TEXT_CHECK[this.INDEX_SIGN_UP_DONE] = true;
      }
   }
   function SET_FORGOT_PASSWORD_TITLE(title)
   {
      this.TIMELINE.PAGES_FORGOT_PASSWORD.forgotPasswordTitle.htmlText = title;
      this.TIMELINE.PAGES_FORGOT_PASSWORD.forgotPasswordTitle.setTextFormat(this.boldTextFormat);
   }
   function SET_FORGOT_PASSWORD_TEXT(text)
   {
      this.TIMELINE.PAGES_FORGOT_PASSWORD.forgotPasswordText.htmlText = text;
      this.TIMELINE.PAGES_FORGOT_PASSWORD.forgotPasswordText.setTextFormat(this.regTextFormat);
   }
   function SET_FORGOT_PASSWORD_EMAIL_STATE(message, icon)
   {
      this.TIMELINE.PAGES_FORGOT_PASSWORD.emailErrorField.htmlText = message;
      this.TIMELINE.PAGES_FORGOT_PASSWORD.emailErrorField.setTextFormat(this.boldTextFormat);
      this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_FORGOT_PASSWORD.emailErrorField,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
      MovieClip(this.TIMELINE.PAGES_FORGOT_PASSWORD.alertIcon1)._visible = false;
      MovieClip(this.TIMELINE.PAGES_FORGOT_PASSWORD.emailBusySpinner)._visible = false;
      MovieClip(this.TIMELINE.PAGES_FORGOT_PASSWORD.emailConfirm)._visible = false;
      if(icon == 1)
      {
         MovieClip(this.TIMELINE.PAGES_FORGOT_PASSWORD.emailBusySpinner)._visible = true;
      }
      else if(icon == 2)
      {
         MovieClip(this.TIMELINE.PAGES_FORGOT_PASSWORD.alertIcon1)._visible = true;
      }
      else if(icon == 3)
      {
         MovieClip(this.TIMELINE.PAGES_FORGOT_PASSWORD.emailConfirm)._visible = true;
      }
   }
   function SET_FORGOT_PASSWORD_EMAIL_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_FORGOT_PASSWORD.emailHighlight);
   }
   function SET_FORGOT_PASSWORD_SUBMIT_HIGHLIGHT(isSelected)
   {
      this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_FORGOT_PASSWORD.submitButton,true,isSelected);
   }
   function DISABLE_FORGOT_PASSWORD_SUBMIT_HIGHLIGHT()
   {
      this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_FORGOT_PASSWORD.submitButton,false);
   }
   function INIT_FORGOT_PASSWORD_PAGE()
   {
      if(!this.TEXT_CHECK[this.INDEX_FORGOT_PASSWORD])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_FORGOT_PASSWORD.forgotPasswordTitle,"SC_FORGOT_PASSWORD_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_FORGOT_PASSWORD.forgotPasswordText,"SC_FORGOT_PASSWORD_TEXT",undefined,true);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_FORGOT_PASSWORD.emailField,"SC_EMAIL_LABEL");
         this.TIMELINE.PAGES_FORGOT_PASSWORD.forgotPasswordTitle.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_FORGOT_PASSWORD.forgotPasswordText.setTextFormat(this.regTextFormat);
         this.TIMELINE.PAGES_FORGOT_PASSWORD.emailField.setTextFormat(this.boldTextFormat);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_FORGOT_PASSWORD.forgotPasswordTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_FORGOT_PASSWORD.forgotPasswordText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_FORGOT_PASSWORD.emailErrorField,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         this.SET_MC_HUDCOLOUR(this.TIMELINE.PAGES_FORGOT_PASSWORD.alertIcon1,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_FORGOT_PASSWORD.submitButton,"SC_SUBMIT_BUTTON");
         this.SET_FORGOT_PASSWORD_EMAIL_STATE("",0);
         this.DISABLE_FORGOT_PASSWORD_SUBMIT_HIGHLIGHT();
         this.TEXT_CHECK[this.INDEX_FORGOT_PASSWORD] = true;
      }
   }
   function DISPLAY_FORGOT_PASSWORD_PAGE()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_FORGOT_PASSWORD);
      this.INIT_FORGOT_PASSWORD_PAGE();
   }
   function SET_FORGOT_PASSWORD_DONE_TITLE(title)
   {
      this.TIMELINE.PAGES_FORGOT_PASSWORD_DONE.forgotPasswordDoneTitle.htmlText = title;
      this.TIMELINE.PAGES_FORGOT_PASSWORD_DONE.forgotPasswordDoneTitle.setTextFormat(this.boldTextFormat);
   }
   function SET_FORGOT_PASSWORD_DONE_TEXT(text)
   {
      this.TIMELINE.PAGES_FORGOT_PASSWORD_DONE.forgotPasswordDoneText.htmlText = text;
      this.TIMELINE.PAGES_FORGOT_PASSWORD_DONE.forgotPasswordDoneText.setTextFormat(this.regTextFormat);
   }
   function DISPLAY_FORGOT_PASSWORD_DONE_PAGE()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_FORGOT_PASSWORD_DONE);
      if(!this.TEXT_CHECK[this.INDEX_FORGOT_PASSWORD_DONE])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_FORGOT_PASSWORD_DONE.forgotPasswordDoneTitle,"SC_FORGOT_PASSWORD_DONE_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_FORGOT_PASSWORD_DONE.forgotPasswordDoneText,"SC_FORGOT_PASSWORD_DONE_TEXT");
         this.TIMELINE.PAGES_FORGOT_PASSWORD_DONE.forgotPasswordDoneTitle.setTextFormat(this.boldTextFormat);
         this.TIMELINE.PAGES_FORGOT_PASSWORD_DONE.forgotPasswordDoneText.setTextFormat(this.regTextFormat);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_FORGOT_PASSWORD_DONE.forgotPasswordDoneTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_FORGOT_PASSWORD_DONE.forgotPasswordDoneText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_FORGOT_PASSWORD_DONE.submitButton,"SC_SIGNIN_TITLE");
         this.TEXT_CHECK[this.INDEX_FORGOT_PASSWORD_DONE] = true;
      }
   }
   function SET_ERROR_TITLE(title)
   {
      this.TIMELINE.PAGES_ERROR.errorTitle.htmlText = title;
      this.TIMELINE.PAGES_ERROR.errorTitle.setTextFormat(this.boldTextFormat);
   }
   function SET_ERROR_TEXT(text)
   {
      this.TIMELINE.PAGES_ERROR.errorText.htmlText = text;
      this.TIMELINE.PAGES_ERROR.errorText.setTextFormat(this.regTextFormat);
   }
   function SET_ERROR_BUTTON_TEXT(text)
   {
      this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_ERROR.submitButton,text,true);
   }
   function SHOW_ERROR_SUBMIT_BUTTON(show)
   {
      this.TIMELINE.PAGES_ERROR.submitButton._visible = show;
   }
   function DISPLAY_ERROR_PAGE()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_ERROR);
      if(!this.TEXT_CHECK[this.INDEX_ERROR])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_ERROR.errorTitle,"SC_ERROR_TITLE");
         this.TIMELINE.PAGES_ERROR.errorTitle.setTextFormat(this.boldTextFormat);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_ERROR.errorTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_ERROR.errorText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_MC_HUDCOLOUR(this.TIMELINE.PAGES_ERROR.icon,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_ERROR.submitButton,"SC_BACK_BUTTON");
         this.TEXT_CHECK[this.INDEX_ERROR] = true;
         if(!this.DispConf.isWideScreen)
         {
            this.TIMELINE.PAGES_ERROR.icon._x = -8;
            this.TIMELINE.PAGES_ERROR.errorTitle._x = this.TIMELINE.PAGES_ERROR.icon._x + 35;
         }
      }
   }
   function SET_QR_IMAGE(texture, dictionary)
   {
      if(this.imgLdrQR == undefined)
      {
         this.imgLdrQR = com.rockstargames.ui.media.ImageLoaderMC(this.TIMELINE.PAGES_QR_CODE.QRImage.attachMovie("mcLoaderTest","mcLoaderTest",100));
      }
      if(this.imgLdrQR.textureDict == dictionary)
      {
         if(this.imgLdrQR.isLoaded)
         {
            this.imgLdrQR.init("SOCIAL_CLUB2",dictionary,texture,304,304);
            this.imgLdrQR.displayTxdResponse(texture);
         }
      }
      else
      {
         if(this.imgLdrQR.isLoaded)
         {
            this.imgLdrQR.removeTxdRef();
         }
         this.imgLdrQR.init("SOCIAL_CLUB2",dictionary,texture,304,304);
         this.imgLdrQR.addTxdRef("SOCIAL_CLUB2");
         this.imgLdrQRTxd = dictionary;
      }
      this.TIMELINE.PAGES_QR_CODE.imageSpinner._visible = false;
   }
   function SET_QR_INFO(infoText)
   {
      this.TIMELINE.PAGES_QR_CODE.instructionText.htmlText = infoText;
   }
   function SET_QR_PIN(pin)
   {
      this.TIMELINE.PAGES_QR_CODE.pinText.text = pin;
      this.TIMELINE.PAGES_QR_CODE.pinText._visible = true;
      this.TIMELINE.PAGES_QR_CODE.pinLabel._visible = true;
   }
   function SET_QR_EXPIRED()
   {
      this.TIMELINE.PAGES_QR_CODE.pinText._visible = false;
      this.TIMELINE.PAGES_QR_CODE.pinLabel._visible = false;
      this.TIMELINE.PAGES_QR_CODE.QRImage._visible = false;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_QR_CODE.instructionText,"SC_QR_URL_EXPIRED");
   }
   function DISPLAY_QR_CODE_PAGE()
   {
      delete this.imgLdrQR;
      this.SHOW_PAGE_BY_ID(this.INDEX_QR_CODE);
      if(!this.TEXT_CHECK[this.INDEX_QR_CODE])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_QR_CODE.titleText,"SC_QR_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_QR_CODE.descriptionText,"SC_QR_TEXT");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_QR_CODE.pinLabel,"SC_QR_PIN");
         this.TEXT_CHECK[this.INDEX_QR_CODE] = true;
      }
      this.TIMELINE.PAGES_QR_CODE.imageSpinner._visible = true;
      this.TIMELINE.PAGES_QR_CODE.pinLabel._visible = false;
   }
   function DISPLAY_QR_CODE_EXPIRED_PAGE()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_QR_CODE);
      if(!this.TEXT_CHECK[this.INDEX_QR_CODE])
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_QR_CODE.titleText,"SC_QR_TITLE");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_QR_CODE.descriptionText,"SC_QR_TEXT");
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_QR_CODE.pinLabel,"SC_QR_PIN");
         this.TEXT_CHECK[this.INDEX_QR_CODE] = true;
      }
      this.TIMELINE.PAGES_QR_CODE.imageSpinner._visible = true;
      this.TIMELINE.PAGES_QR_CODE.pinLabel._visible = false;
   }
   function SHOW_PAGE_BY_ID(pageID)
   {
      if(this.pageHistory[this.pageHistory.length - 1] >= 0)
      {
         var _loc3_ = this.pageHistory[this.pageHistory.length - 1];
         var _loc6_ = this.PAGES[_loc3_];
         if(!_loc6_.store && this.PAGES_CACHE[_loc3_])
         {
            MovieClip(this.PAGES_CACHE[_loc3_]).removeMovieClip();
            this.PAGES_CACHE[_loc3_] = null;
         }
         else
         {
            MovieClip(this.PAGES_CACHE[_loc3_])._visible = false;
         }
         this.DISPOSE_BUTTONS();
      }
      this.pageHistory.push(pageID);
      var _loc5_ = this.PAGES[pageID];
      if(this.PAGES_CACHE[pageID])
      {
         MovieClip(this.PAGES_CACHE[pageID])._visible = true;
      }
      else
      {
         var _loc4_ = this.TIMELINE.attachMovie(_loc5_.linkageId,_loc5_.pageName,this.TIMELINE.getNextHighestDepth());
         _loc4_._x = this.TIMELINE.scLogo._x + 5;
         _loc4_._y = this.TIMELINE.scLogo._y + 100;
         this.PAGES_CACHE[pageID] = _loc4_;
         this.TEXT_CHECK[pageID] = false;
      }
      switch(pageID)
      {
         case this.INDEX_ONLINE_POLICY:
            break;
         case this.INDEX_TOS:
            this.TIMELINE.PAGES_TERMS_OF_SERVICE.submitButton.onLoad = mx.utils.Delegate.create(this,this.INIT_TOS_BUTTONS);
            break;
         case this.INDEX_SIGN_IN_DONE:
            this.TIMELINE.PAGES_SIGN_IN_DONE.submitButton.onLoad = mx.utils.Delegate.create(this,this.INIT_SID_BUTTONS);
      }
   }
   function INIT_ONLINE_POLICY_BUTTONS()
   {
   }
   function INIT_TOS_BUTTONS()
   {
      var _loc2_ = this.TIMELINE.PAGES_TERMS_OF_SERVICE;
      com.rockstargames.ui.mouse.MouseBtn(_loc2_.submitButton).setupGenericMouseInterface(0,-1,this.onSubmitBtnMouseEvent);
      this.initTOSScrollButton(_loc2_.scrollArrowUp,this.onClickArrowUp);
      this.initTOSScrollButton(_loc2_.scrollArrowDown,this.onClickArrowDown);
   }
   function initTOSScrollButton(arrowMC, onClickEvent)
   {
      arrowMC.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this,this.onRollOverArrow,arrowMC);
      arrowMC.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this,this.onRollOutArrow,arrowMC);
      arrowMC.onRelease = mx.utils.Delegate.create(this,onClickEvent);
   }
   function onRollOverArrow(arrowMC)
   {
      if(arrowMC._alpha != com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_ARROW_DISABLE_ALPHA)
      {
         arrowMC._xscale = arrowMC._yscale = 105;
      }
   }
   function onRollOutArrow(arrowMC)
   {
      arrowMC._xscale = arrowMC._yscale = 100;
   }
   function disposeTOSScrollButton(arrowMC)
   {
      delete arrowMC.onRollOver;
      delete arrowMC.onRollOut;
      delete arrowMC.onRelease;
   }
   function onClickArrowUp()
   {
      this.SCROLL_POLICY_TEXT(com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_TYPE_UP);
   }
   function onClickArrowDown()
   {
      this.SCROLL_POLICY_TEXT(com.rockstargames.social_club.sign_in.SOCIAL_CLUB2.SCROLL_TYPE_DOWN);
   }
   function INIT_SID_BUTTONS()
   {
      com.rockstargames.ui.mouse.MouseBtn(this.TIMELINE.PAGES_SIGN_IN_DONE.submitButton).setupGenericMouseInterface(0,-1,this.onSubmitBtnMouseEvent);
   }
   function onSubmitBtnMouseEvent(evtType, targetMC)
   {
      switch(evtType)
      {
         case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT:
            targetMC.glow._visible = true;
            break;
         case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER:
            targetMC.glow._visible = false;
      }
   }
   function DISPOSE_BUTTONS()
   {
      var _loc2_ = this.TIMELINE.PAGES_ONLINE_POLICY;
      if(_loc2_)
      {
         com.rockstargames.ui.mouse.MouseBtn(_loc2_.SCOPPolicy1Btn).dispose();
         com.rockstargames.ui.mouse.MouseBtn(_loc2_.SCOPPolicy2Btn).dispose();
         com.rockstargames.ui.mouse.MouseBtn(_loc2_.SCOPPolicy3Btn).dispose();
         com.rockstargames.ui.mouse.MouseBtn(_loc2_.AcceptConfirmBtn).dispose();
         com.rockstargames.ui.mouse.MouseBtn(_loc2_.submitButton).dispose();
      }
      var _loc3_ = this.TIMELINE.PAGES_TERMS_OF_SERVICE;
      if(_loc3_)
      {
         com.rockstargames.ui.mouse.MouseBtn(_loc3_.submitButton).dispose();
         this.disposeTOSScrollButton(_loc3_.scrollArrowUp);
         this.disposeTOSScrollButton(_loc3_.scrollArrowDown);
      }
      var _loc4_ = this.TIMELINE.PAGES_SIGN_IN_DONE;
      if(_loc4_)
      {
         com.rockstargames.ui.mouse.MouseBtn(_loc4_.submitButton).dispose();
      }
   }
   function GET_ROOT_DISPLAY_OBJECT()
   {
      return this.TIMELINE;
   }
}
