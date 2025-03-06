class com.rockstargames.gtav.web.casino.Page
{
   var website;
   var pageName;
   var view;
   var prevPageName;
   var nextPageName;
   static var BUTTON_COLOUR = 15213100;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.web.casino.Page.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.web.casino.Page.STAGE_HEIGHT;
   static var BASE_PAGE_HEIGHT = 627;
   function Page(website, viewContainer, viewLinkage, pageName, isFirstPage)
   {
      this.website = website;
      this.pageName = pageName;
      this.view = viewContainer.attachMovie(viewLinkage,pageName,viewContainer.getNextHighestDepth());
   }
   function get name()
   {
      return this.pageName;
   }
   function handleClick(type, id)
   {
   }
   function handleLB()
   {
      if(this.prevPageName != undefined)
      {
         this.website.browser.GO_TO_WEBPAGE(this.prevPageName);
      }
   }
   function handleRB()
   {
      if(this.nextPageName != undefined)
      {
         this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
      }
   }
   function handleLT()
   {
   }
   function handleRT()
   {
   }
   function handleLTRelease()
   {
   }
   function handleRTRelease()
   {
   }
   function handleAnalogStickInput(isLeftStick, x, y)
   {
   }
   function handleMouseClick()
   {
   }
   function handleMouseRelease()
   {
   }
   function setDisabledButtons()
   {
   }
   function dispose()
   {
      this.website = null;
      this.view.removeMovieClip();
      this.view = null;
   }
   function initLabelButton(buttonView, label, letterSpacing)
   {
      buttonView.label.textAutoSize = "shrink";
      buttonView.label.verticalAlign = "center";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(buttonView.label,label,letterSpacing,true,false);
      this.website.dataTextScope.push(buttonView.btnTxt);
   }
   function initTopNav(activeButtonView)
   {
      var _loc2_ = this.view.topNav.suitesButton._x + this.view.topNav.suitesButton._width;
      this.initTopNavButton(this.view.topNav.suitesButton,"CASWEB_SUITES",activeButtonView);
      this.initTopNavButton(this.view.topNav.casinoButton,"CASWEB_CASINO",activeButtonView);
      this.initTopNavButton(this.view.topNav.homeButton,"CASWEB_HOME",activeButtonView);
      _loc2_ -= this.view.topNav.suitesButton._width;
      this.view.topNav.suitesButton._x = _loc2_;
      _loc2_ -= this.view.topNav.casinoButton._width;
      this.view.topNav.casinoButton._x = _loc2_;
      _loc2_ -= this.view.topNav.homeButton._width;
      this.view.topNav.homeButton._x = _loc2_;
   }
   function initTopNavButton(buttonView, label, activeButtonView)
   {
      buttonView.label.verticalAlign = "center";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(buttonView.label,label,2.2,true,false);
      buttonView.w = 40 + buttonView.label.textWidth;
      buttonView.bg._width = buttonView.w;
      buttonView.label._width = buttonView.w;
      this.website.dataTextScope.push(buttonView.btnTxt);
      if(buttonView == activeButtonView)
      {
         buttonView.disabled = true;
         buttonView.gotoAndStop("on");
      }
   }
   function initBottomNav(activeButtonView)
   {
      this.initBottomNavButton(this.view.footer.homeButton,"CASWEB_HOME",activeButtonView);
      this.initBottomNavButton(this.view.footer.casinoButton,"CASWEB_CASINO",activeButtonView);
      this.initBottomNavButton(this.view.footer.suitesButton,"CASWEB_SUITES",activeButtonView);
      this.view.footer.divider1._x = this.view.footer.homeButton._width + 20;
      this.view.footer.casinoButton._x = this.view.footer.divider1._x + this.view.footer.divider1._width + 20;
      this.view.footer.divider2._x = this.view.footer.casinoButton._x + this.view.footer.casinoButton._width + 20;
      this.view.footer.suitesButton._x = this.view.footer.divider2._x + this.view.footer.divider2._width + 20;
      this.view.footer._x = 0.5 * (com.rockstargames.gtav.web.casino.Page.STAGE_WIDTH - this.view.footer._width);
   }
   function initBottomNavButton(buttonView, label, activeButtonView)
   {
      buttonView.label.tf.autoSize = "left";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(buttonView.label.tf,label,2.2,true,false);
      this.website.dataTextScope.push(buttonView.btnTxt);
      if(buttonView == activeButtonView)
      {
         buttonView.disabled = true;
         buttonView.gotoAndStop("on");
      }
   }
   function initSubHeading(subHeadingView, label, alignRight)
   {
      var _loc2_ = subHeadingView._x + subHeadingView._width;
      subHeadingView.label.verticalAlign = "center";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(subHeadingView.label,label,4,true,false);
      subHeadingView.bg._width = subHeadingView.label.textWidth + 22;
      subHeadingView.label._width = subHeadingView.bg._width;
      if(alignRight)
      {
         subHeadingView._x = _loc2_ - subHeadingView._width;
      }
   }
}
