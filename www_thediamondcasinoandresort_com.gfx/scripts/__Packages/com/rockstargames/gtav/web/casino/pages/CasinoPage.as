class com.rockstargames.gtav.web.casino.pages.CasinoPage extends com.rockstargames.gtav.web.casino.Page
{
   var prevPageName;
   var view;
   var website;
   function CasinoPage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"casinoPage",pageName,isFirstPage);
      this.init();
   }
   function init()
   {
      this.initNav();
      this.initHeadings();
      this.initSubHeadings();
      this.initBodyText();
      this.initButtons();
      this.initPurchaseBox();
      this.initVerticalLayout();
   }
   function initNav()
   {
      this.prevPageName = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SPLASH_PAGE.name;
   }
   function initHeadings()
   {
      this.view.heading1.autoSize = "left";
      var _loc2_ = 1;
      while(_loc2_ <= 9)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view["heading" + _loc2_],"CASWEB_CASINO_HEADING" + _loc2_,6,true,false);
         if(this.website.displayConfig.isAsian)
         {
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view["heading" + _loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function initSubHeadings()
   {
      var _loc2_ = 1;
      while(_loc2_ <= 9)
      {
         var _loc3_ = !(_loc2_ & 1);
         this.initSubHeading(this.view["subHeading" + _loc2_],"CASWEB_CASINO_SUBHEADING" + _loc2_,_loc3_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function initBodyText()
   {
      var _loc2_ = 1;
      while(_loc2_ <= 9)
      {
         this.view["body" + _loc2_].autoSize = "left";
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view["body" + _loc2_],"CASWEB_CASINO_BODY" + _loc2_);
         _loc2_ = _loc2_ + 1;
      }
      this.view.body1._y = this.view.heading1._y + this.view.heading1._height + 4;
   }
   function initButtons()
   {
      this.initLabelButton(this.view.waypointButton,"CASWEB_WAYPOINT",3);
      this.view.waypointButton._y = this.view.body9._y + this.view.body9._height + 18;
      this.website.dataTextScope.push(this.view.logo.btnTxt);
      if(this.website.isAMember)
      {
         var _loc2_ = 2;
         while(_loc2_ <= 8)
         {
            this.view["membership" + _loc2_ + "Button"]._visible = false;
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         this.initLabelButton(this.view.purchaseBox.membershipButton,"CASWEB_BUY_MEMB",3);
         _loc2_ = 2;
         while(_loc2_ <= 8)
         {
            this.initLabelButton(this.view["membership" + _loc2_ + "Button"],"CASWEB_BUY_MEMB",3);
            this.view["membership" + _loc2_ + "Button"]._y = this.view["body" + _loc2_]._y + this.view["body" + _loc2_]._height + 18;
            _loc2_ = _loc2_ + 1;
         }
      }
      this.initTopNav(this.view.topNav.casinoButton);
      this.initBottomNav(this.view.footer.casinoButton);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initPurchaseBox()
   {
      if(this.website.isAMember)
      {
         this.view.purchaseBox._visible = false;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.purchaseBox.title,"CASWEB_MEMB",4,true,false);
         var _loc6_ = this.website.getMembershipCost(false);
         var _loc2_ = this.website.getMembershipCost(true);
         var _loc4_ = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc6_);
         if(_loc2_ == -1)
         {
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.purchaseBox.price,_loc4_,9,false,true);
            this.view.purchaseBox.strikethrough._visible = false;
         }
         else
         {
            var _loc5_ = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc2_);
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.purchaseBox.salePrice,_loc5_,8,false,true);
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.purchaseBox.originalPrice,_loc4_,8,false,true);
            var _loc7_ = this.view.purchaseBox.originalPrice._width;
            var _loc3_ = this.view.purchaseBox.originalPrice.textWidth;
            this.view.purchaseBox.strikethrough._x = 0.5 * (_loc7_ - _loc3_);
            this.view.purchaseBox.strikethrough._width = _loc3_;
         }
         if(this.website.displayConfig.isAsian)
         {
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.purchaseBox.price);
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.purchaseBox.salePrice);
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.purchaseBox.originalPrice);
         }
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
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.CASINO_PAGE.name);
            break;
         case "suitesButton":
         case "suitesInfoButton":
            this.website.browser.GO_TO_WEBPAGE(!this.website.suiteIsOwned ? com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITES_PAGE.name : com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.RENOVATE_PAGE.name);
            break;
         case "membershipButton":
         case "membership2Button":
         case "membership3Button":
         case "membership4Button":
         case "membership5Button":
         case "membership6Button":
         case "membership7Button":
         case "membership8Button":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.MEMBERSHIP_PAGE.name);
      }
   }
}
