class com.rockstargames.gtav.loadingScreens.ONLINE_POLICIES extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var PAGES;
   var PAGES_CACHE;
   var TEXT_CHECK;
   var pageHistory;
   var regTextFormat;
   var DispConf;
   static var SCROLL_TYPE_UP = 0;
   static var SCROLL_TYPE_DOWN = 1;
   static var SCROLL_TYPE_END = 2;
   static var SCROLL_TYPE_TOP = 3;
   static var SCROLL_TYPE_STATIC = 4;
   static var SCROLL_ARROW_DISABLE_ALPHA = 30;
   var maxscroll = 1;
   var _position = 1;
   var HUD_COLOUR_DISABLE_HIGHLIGHT_HARDCODED = [150,150,150];
   var HUD_COLOUR_DISABLE_TEXT_HARDCODED = [100,100,100];
   var INDEX_POLICY_UPDATE = 0;
   var INDEX_ONLINE_POLICY = 1;
   var INDEX_POLICY = 2;
   function ONLINE_POLICIES(mc)
   {
      super();
      this.TIMELINE = mc;
      this.PAGES = [];
      this.PAGES[this.INDEX_POLICY_UPDATE] = {pageName:"PAGES_POLICY_UPDATE",linkageId:"PAGES_POLICY_UPDATE",store:false};
      this.PAGES[this.INDEX_ONLINE_POLICY] = {pageName:"PAGES_ONLINE_POLICY",linkageId:"PAGES_ONLINE_POLICY",store:false};
      this.PAGES[this.INDEX_POLICY] = {pageName:"PAGES_POLICY",linkageId:"PAGES_POLICY",store:false};
      this.PAGES_CACHE = [];
      this.TEXT_CHECK = [];
      var _loc3_ = 0;
      while(_loc3_ < this.PAGES.length)
      {
         this.TEXT_CHECK.push(false);
         _loc3_ = _loc3_ + 1;
      }
      this.pageHistory = [];
      this.regTextFormat = new TextFormat();
      this.regTextFormat.font = "$Font2";
      this.DispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.DispConf = this.getDisplayConfig(true);
      if(!this.DispConf.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         this.DispConf.screenWidth = 960;
      }
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
      if(btnMc.submitField._width > 145)
      {
         btnMc.submitField._x = 5;
         MovieClip(btnMc.glow)._width = btnMc.submitField._width + 10;
         MovieClip(btnMc.submitHighlight)._width = MovieClip(btnMc.glow)._width;
      }
      btnMc.submitField.setTextFormat(this.regTextFormat);
   }
   function SET_SUBMIT_BUTTON_ENABLED(btnMc, enable, isSelected)
   {
      var _loc3_ = this.TIMELINE.PAGES_ONLINE_POLICY;
      if(enable)
      {
         com.rockstargames.ui.mouse.MouseBtn(_loc3_.SubmitBtn).init();
         this.SET_HIGHLIGHT_COLOR(isSelected,btnMc.submitHighlight,btnMc.glow);
         this.SET_TEXT_ENABLED_COLOR(btnMc.submitField);
      }
      else
      {
         com.rockstargames.ui.mouse.MouseBtn(_loc3_.SubmitBtn).dispose();
         this.SET_HIGHLIGHT_DISABLED_COLOR(btnMc.submitHighlight,btnMc.glow);
         this.SET_TEXT_DISABLED_COLOR(btnMc.submitField);
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
   function SET_HIGHLIGHT_COLOR(isSelected, clip, glowClip)
   {
      if(clip)
      {
         if(isSelected)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(clip,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YELLOW);
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
   function SET_POLICY_TITLE(title, isRawText)
   {
      if(isRawText)
      {
         this.TIMELINE.PAGES_POLICY.TOSTitle.text = title;
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_POLICY.TOSTitle,title);
      }
      this.TIMELINE.PAGES_POLICY.TOSTitle.autoSize = "shrink";
      this.TIMELINE.PAGES_POLICY.TOSTitle.setTextFormat(this.regTextFormat);
   }
   function SET_POLICY_INTRO(text, isRawText)
   {
      if(isRawText)
      {
         this.TIMELINE.PAGES_POLICY.TOSIntro.htmlText = text;
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_POLICY.TOSIntro,text,undefined,true);
      }
      this.TIMELINE.PAGES_POLICY.TOSIntro.setTextFormat(this.regTextFormat);
   }
   function get position()
   {
      return this._position;
   }
   function set position(value)
   {
      this._position = value;
      this.TIMELINE.PAGES_POLICY.TOSText.scroll = this._position;
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
      var _loc5_ = TextField(this.TIMELINE.PAGES_POLICY.TOSText);
      _loc5_.htmlText = tos;
      this.maxscroll = _loc5_.maxscroll;
      _loc5_.setTextFormat(this.regTextFormat);
      var _loc6_ = _loc5_.textHeight > _loc5_._height;
      MovieClip(this.TIMELINE.PAGES_POLICY.scrollArrowUp)._alpha = com.rockstargames.gtav.loadingScreens.ONLINE_POLICIES.SCROLL_ARROW_DISABLE_ALPHA;
      MovieClip(this.TIMELINE.PAGES_POLICY.scrollArrowDown)._alpha = !_loc6_ ? com.rockstargames.gtav.loadingScreens.ONLINE_POLICIES.SCROLL_ARROW_DISABLE_ALPHA : 100;
   }
   function SCROLL_POLICY_TEXT(scrollType)
   {
      switch(scrollType)
      {
         case com.rockstargames.gtav.loadingScreens.ONLINE_POLICIES.SCROLL_TYPE_UP:
            if(this.position == 1)
            {
               MovieClip(this.TIMELINE.PAGES_POLICY.scrollArrowUp)._alpha = 30;
               return false;
            }
            MovieClip(this.TIMELINE.PAGES_POLICY.scrollArrowDown)._alpha = 100;
            this.position = Math.max(1,this.position - 1);
            return true;
            break;
         case com.rockstargames.gtav.loadingScreens.ONLINE_POLICIES.SCROLL_TYPE_DOWN:
            if(this.position == this.maxscroll)
            {
               MovieClip(this.TIMELINE.PAGES_POLICY.scrollArrowDown)._alpha = 30;
               return false;
            }
            MovieClip(this.TIMELINE.PAGES_POLICY.scrollArrowUp)._alpha = 100;
            this.position = Math.min(this.maxscroll,this.position + 1);
            return true;
            break;
         case com.rockstargames.gtav.loadingScreens.ONLINE_POLICIES.SCROLL_TYPE_END:
            this.position = this.maxscroll;
            MovieClip(this.TIMELINE.PAGES_POLICY.scrollArrowDown)._alpha = 30;
            return true;
         case com.rockstargames.gtav.loadingScreens.ONLINE_POLICIES.SCROLL_TYPE_TOP:
            this.position = 1;
            MovieClip(this.TIMELINE.PAGES_POLICY.scrollArrowUp)._alpha = 30;
            return true;
         case com.rockstargames.gtav.loadingScreens.ONLINE_POLICIES.SCROLL_TYPE_STATIC:
            this.position = 1;
            MovieClip(this.TIMELINE.PAGES_POLICY.scrollArrowUp)._alpha = 0;
            MovieClip(this.TIMELINE.PAGES_POLICY.scrollArrowDown)._alpha = 0;
            return true;
         default:
      }
   }
   function INIT_DOWNLOADED_POLICY()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_POLICY);
   }
   function SET_POLICY_ACCEPTED_TEXT(text, isRawText)
   {
      if(!isRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_POLICY.AcceptText,text);
      }
      else
      {
         this.TIMELINE.PAGES_POLICY.AcceptText.htmlText = text;
      }
      this.TIMELINE.PAGES_POLICY.AcceptText.setTextFormat(this.regTextFormat);
      if(text.length > 0)
      {
         MovieClip(this.TIMELINE.PAGES_POLICY.AcceptConfirm)._visible = true;
      }
      else
      {
         MovieClip(this.TIMELINE.PAGES_POLICY.AcceptConfirm)._visible = false;
      }
   }
   function DISPLAY_DOWNLOADED_POLICY()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_POLICY);
      this.SET_POLICY_ACCEPTED_TEXT("");
   }
   function DISPLAY_TOS()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_POLICY);
      if(!this.TEXT_CHECK[this.INDEX_POLICY])
      {
         this.SET_POLICY_TITLE("ONLINE_POLICY_TOS_TITLE");
         this.SET_POLICY_ACCEPTED_TEXT("");
      }
   }
   function DISPLAY_EULA()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_POLICY);
      if(!this.TEXT_CHECK[this.INDEX_POLICY])
      {
         this.SET_POLICY_TITLE("");
         this.SET_POLICY_ACCEPTED_TEXT("");
      }
   }
   function DISPLAY_PP()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_POLICY);
      if(!this.TEXT_CHECK[this.INDEX_POLICY])
      {
         this.SET_POLICY_TITLE("ONLINE_POLICY_PP_TITLE");
         this.SET_POLICY_ACCEPTED_TEXT("");
      }
   }
   function SET_ONLINE_POLICY_TEXT(policy)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPText.htmlText = policy;
      var _loc2_ = this.regTextFormat;
      if(this.DispConf.isAsian)
      {
         _loc2_.align = "left";
      }
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPText.setTextFormat(_loc2_);
   }
   function SET_ONLINE_POLICY_TITLE(title)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitle.htmlText = title;
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitle.setTextFormat(this.regTextFormat);
   }
   function SET_ONLINE_POLICY_READ_TITLE(title)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitleReadPolicy.htmlText = title;
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitleReadPolicy.setTextFormat(this.regTextFormat);
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
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy2.setTextFormat(this.regTextFormat);
      this.updatePolicyLinkLayout();
   }
   function SET_ONLINE_POLICY_LINK_2_HIGHLIGHT(isSelected)
   {
      this.SET_HIGHLIGHT_COLOR(isSelected,this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy2);
   }
   function SET_ONLINE_POLICY_LINK_3(linkText)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy3.policyText.htmlText = linkText;
      this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy3.setTextFormat(this.regTextFormat);
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
      if(state)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.TIMELINE.PAGES_ONLINE_POLICY.AcceptConfirm,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YELLOW);
      }
   }
   function SET_ONLINE_POLICY_ACCEPTED_TEXT(text)
   {
      this.TIMELINE.PAGES_ONLINE_POLICY.AcceptText.htmlText = text;
      this.TIMELINE.PAGES_ONLINE_POLICY.AcceptText.setTextFormat(this.regTextFormat);
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
         var _loc2_ = this.regTextFormat;
         if(this.DispConf.isAsian)
         {
            _loc2_.align = "left";
         }
         this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitle.setTextFormat(this.regTextFormat);
         this.TIMELINE.PAGES_ONLINE_POLICY.SCOPText.setTextFormat(_loc2_);
         this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitleReadPolicy.setTextFormat(this.regTextFormat);
         this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy2.policyText.setTextFormat(this.regTextFormat);
         this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy3.policyText.setTextFormat(this.regTextFormat);
         this.TIMELINE.PAGES_ONLINE_POLICY.AcceptText.setTextFormat(this.regTextFormat);
         this.SET_SUBMIT_BUTTON(this.TIMELINE.PAGES_ONLINE_POLICY.submitButton,"SC_SUBMIT_BUTTON");
         this.SET_SUBMIT_BUTTON_ENABLED(this.TIMELINE.PAGES_ONLINE_POLICY.submitButton,false,false);
         this.SET_ONLINE_POLICY_ACCEPT_HIGHLIGHT(true);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_ONLINE_POLICY.SCOPTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_ONLINE_POLICY.SCOPText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.TEXT_CHECK[this.INDEX_ONLINE_POLICY] = true;
      }
   }
   function INIT_DOWNLOADED_POLICY_UPDATE()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_POLICY_UPDATE);
   }
   function SET_POLICY_UPDATE_TEXT(policy, isRawText)
   {
      if(!isRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_POLICY_UPDATE.SCOPText,policy,undefined,true);
      }
      else
      {
         this.TIMELINE.PAGES_POLICY_UPDATE.SCOPText.htmlText = policy;
      }
      var _loc2_ = this.regTextFormat;
      if(this.DispConf.isAsian)
      {
         _loc2_.align = "left";
      }
      this.TIMELINE.PAGES_POLICY_UPDATE.SCOPText.setTextFormat(_loc2_);
   }
   function SET_POLICY_UPDATE_TITLE(title, isRawText)
   {
      if(!isRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.TIMELINE.PAGES_POLICY_UPDATE.SCOPTitle,title,undefined,true);
      }
      else
      {
         this.TIMELINE.PAGES_POLICY_UPDATE.SCOPTitle.htmlText = title;
      }
      this.TIMELINE.PAGES_POLICY_UPDATE.TOSTitle.autoSize = "shrink";
      this.TIMELINE.PAGES_POLICY_UPDATE.SCOPTitle.setTextFormat(this.regTextFormat);
   }
   function DISPLAY_POLICY_UPDATE()
   {
      this.SHOW_PAGE_BY_ID(this.INDEX_POLICY_UPDATE);
      if(!this.TEXT_CHECK[this.INDEX_POLICY_UPDATE])
      {
         this.SET_POLICY_UPDATE_TITLE("ONLINE_POLICY_UPDATE_TITLE");
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_POLICY_UPDATE.SCOPTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.SET_TEXT_HUDCOLOUR(this.TIMELINE.PAGES_POLICY_UPDATE.SCOPText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.TEXT_CHECK[this.INDEX_POLICY_UPDATE] = true;
      }
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
      var _loc4_ = this.PAGES[pageID];
      if(this.PAGES_CACHE[pageID])
      {
         MovieClip(this.PAGES_CACHE[pageID])._visible = true;
      }
      else
      {
         var _loc5_ = this.TIMELINE.attachMovie(_loc4_.linkageId,_loc4_.pageName,this.TIMELINE.getNextHighestDepth());
         this.PAGES_CACHE[pageID] = _loc5_;
         this.TEXT_CHECK[pageID] = false;
      }
      switch(pageID)
      {
         case this.INDEX_ONLINE_POLICY:
            this.TIMELINE.PAGES_ONLINE_POLICY.SCOPPolicy2Btn.onLoad = mx.utils.Delegate.create(this,this.INIT_BUTTONS);
            break;
         case this.INDEX_POLICY:
            this.INIT_TOS_BUTTONS();
      }
   }
   function INIT_BUTTONS()
   {
      var _loc2_ = this.TIMELINE.PAGES_ONLINE_POLICY;
      com.rockstargames.ui.mouse.MouseBtn(_loc2_.SCOPPolicy2Btn).setupMouseInterface(com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_ONLINE_POLICY,undefined,[0]);
      com.rockstargames.ui.mouse.MouseBtn(_loc2_.SCOPPolicy3Btn).setupMouseInterface(com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_ONLINE_POLICY,undefined,[1]);
      com.rockstargames.ui.mouse.MouseBtn(_loc2_.AcceptConfirmBtn).setupMouseInterface(com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_ONLINE_POLICY,undefined,[2]);
      com.rockstargames.ui.mouse.MouseBtn(_loc2_.SubmitBtn).setupMouseInterface(com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_ONLINE_POLICY,undefined,[3]);
      com.rockstargames.ui.mouse.MouseBtn(_loc2_.SubmitBtn).dispose();
   }
   function DISPOSE_BUTTONS()
   {
      var _loc2_ = this.TIMELINE.PAGES_ONLINE_POLICY;
      com.rockstargames.ui.mouse.MouseBtn(_loc2_.SCOPPolicy2Btn).dispose();
      com.rockstargames.ui.mouse.MouseBtn(_loc2_.SCOPPolicy3Btn).dispose();
      com.rockstargames.ui.mouse.MouseBtn(_loc2_.AcceptConfirmBtn).dispose();
      com.rockstargames.ui.mouse.MouseBtn(_loc2_.SubmitBtn).dispose();
   }
   function INIT_TOS_BUTTONS()
   {
      var _loc2_ = this.TIMELINE.PAGES_POLICY;
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
      if(arrowMC._alpha != com.rockstargames.gtav.loadingScreens.ONLINE_POLICIES.SCROLL_ARROW_DISABLE_ALPHA)
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
      this.SCROLL_POLICY_TEXT(com.rockstargames.gtav.loadingScreens.ONLINE_POLICIES.SCROLL_TYPE_UP);
   }
   function onClickArrowDown()
   {
      this.SCROLL_POLICY_TEXT(com.rockstargames.gtav.loadingScreens.ONLINE_POLICIES.SCROLL_TYPE_DOWN);
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
   function GET_ROOT_DISPLAY_OBJECT()
   {
      return this.TIMELINE;
   }
}
