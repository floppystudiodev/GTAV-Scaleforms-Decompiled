class com.rockstargames.gtav.web.casino.pages.SplashPage extends com.rockstargames.gtav.web.casino.Page
{
   var view;
   var website;
   function SplashPage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"splashPage",pageName,isFirstPage);
      this.init();
   }
   function init()
   {
      this.initHeadings();
      this.initSubHeadings();
      this.initBodyText();
      this.initButtons();
      this.initBanner();
      this.initVerticalLayout();
   }
   function initHeadings()
   {
      this.view.heading1.autoSize = "left";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading1,"CASWEB_SPLASH_HEADING1",6,true,false);
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading2,"CASWEB_CASINO",6,true,false);
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading3,"CASWEB_SUITES",6,true,false);
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.heading1);
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.heading2);
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.heading3);
      }
   }
   function initSubHeadings()
   {
      this.initSubHeading(this.view.subHeading1,"CASWEB_SPLASH_SUBHEADING1",false);
      this.initSubHeading(this.view.subHeading2,"CASWEB_SPLASH_SUBHEADING2",true);
      this.initSubHeading(this.view.subHeading3,"CASWEB_SPLASH_SUBHEADING3",false);
   }
   function initBodyText()
   {
      this.view.body2.autoSize = "left";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view.body2,"CASWEB_SPLASH_BODY2");
      this.view.body3.autoSize = "left";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view.body3,"CASWEB_SPLASH_BODY3");
   }
   function initButtons()
   {
      this.initLabelButton(this.view.videoButton,"CASWEB_PLAY_VIDEO",5);
      this.view.setWaypointButton._y = this.view.body2._y + this.view.body2._height + 18;
      this.initLabelButton(this.view.setWaypointButton,"CASWEB_WAYPOINT",3);
      this.view.moreInfo1Button._y = this.view.body2._y + this.view.body2._height + 18;
      this.initLabelButton(this.view.moreInfo1Button,"CASWEB_MORE_INFO",3);
      this.view.moreInfo2Button._y = this.view.body3._y + this.view.body3._height + 18;
      this.initLabelButton(this.view.moreInfo2Button,"CASWEB_MORE_INFO",3);
      this.website.dataTextScope.push(this.view.logo.btnTxt);
      this.initTopNav(this.view.topNav.homeButton);
      this.initBottomNav(this.view.footer.homeButton);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initBanner()
   {
      this.view.bannerAnimation.banner.label.verticalAlign = "center";
      this.view.bannerAnimation.banner.label.autoSize = "left";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.bannerAnimation.banner.label,"CASWEB_BANNER",4,true,false);
      this.view.bannerAnimation.banner.right._x = this.view.bannerAnimation.banner.label._width + 30;
      this.view.bannerAnimation.banner.centre._xscale = this.view.bannerAnimation.banner.label._width;
      this.view.bannerAnimation.stop();
      this.view.bannerAnimation._visible = false;
      this.pollBannerState();
   }
   function pollBannerState()
   {
      if(this.website.showBanner === true)
      {
         this.view.bannerAnimation._visible = true;
         this.view.bannerAnimation.play();
      }
      else if(this.website.showBanner !== false)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.bannerAnimation,0.033,{onCompleteScope:this,onComplete:this.pollBannerState});
      }
   }
   function initVerticalLayout()
   {
      this.website.setPageHeight(this.view.background._height);
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "logo":
         case "homeButton":
            this.website.browser.GO_TO_WEBPAGE(this.website.browser.GET_CURRENT_WEBSITE());
            break;
         case "casinoButton":
         case "casinoInfoButton":
         case "moreInfo1Button":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.CASINO_PAGE.name);
            break;
         case "moreInfo2Button":
         case "suitesButton":
         case "suitesInfoButton":
            this.website.browser.GO_TO_WEBPAGE(!this.website.suiteIsOwned ? com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITES_PAGE.name : com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.RENOVATE_PAGE.name);
         default:
            return;
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.bannerAnimation);
      super.dispose();
   }
}
