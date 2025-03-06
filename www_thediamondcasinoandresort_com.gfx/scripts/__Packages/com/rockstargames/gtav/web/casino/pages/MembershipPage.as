class com.rockstargames.gtav.web.casino.pages.MembershipPage extends com.rockstargames.gtav.web.casino.Page
{
   var view;
   var prevPageName;
   var website;
   function MembershipPage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"membershipPage",pageName,isFirstPage);
      this.init();
   }
   function init()
   {
      this.initNav();
      this.initText();
      this.initMembershipCard(this.view.membershipCard);
      this.initMembershipCard(this.view.membershipCardReflection);
      this.initButtons();
      this.initVerticalLayout();
   }
   function initNav()
   {
      this.prevPageName = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.CASINO_PAGE.name;
   }
   function initText()
   {
      this.view.heading.autoSize = "left";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading,"CASWEB_MEMB_HEADING",6,true,false);
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.heading);
      }
      this.initSubHeading(this.view.subHeading,"CASWEB_MEMBCARD",false);
      this.view.subHeading.bg.gotoAndStop("purple");
      this.view.body.autoSize = "left";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view.body,"CASWEB_MEMB_BODY");
      this.view.body._y = this.view.heading._y + this.view.heading._height + 4;
   }
   function initMembershipCard(cardView)
   {
      this.website.imageManager.addImage(this.website.headshot,this.website.headshot,cardView.headshot,false);
      cardView.gamertag.text = this.website.gamertag;
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(cardView.fee,"CASWEB_FEE");
      cardView.cost._x = cardView.fee._x + cardView.fee.textWidth + 10;
      var _loc5_ = this.website.getMembershipCost(false);
      var _loc4_ = this.website.getMembershipCost(true);
      if(_loc4_ == -1)
      {
         cardView.cost.text = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc5_);
         cardView.strikethrough._visible = false;
      }
      else
      {
         var _loc3_ = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc5_);
         cardView.cost.text = _loc3_ + "  $" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc4_);
         var _loc7_ = cardView.cost.text.indexOf(_loc3_);
         var _loc8_ = _loc7_ + _loc3_.length;
         var _loc6_ = cardView.cost.getExactCharBoundaries(_loc7_).left;
         var _loc9_ = cardView.cost.getExactCharBoundaries(_loc8_).right;
         cardView.strikethrough._x = cardView.cost._x + _loc6_ - 4;
         cardView.strikethrough._width = _loc9_ - _loc6_;
      }
   }
   function initButtons()
   {
      this.website.dataTextScope.push(this.view.logo.btnTxt);
      this.initLabelButton(this.view.purchaseButton,"CASWEB_BUYNOW",3);
      this.initTopNav(this.view.topNav.casinoButton);
      this.initBottomNav(this.view.footer.casinoButton);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
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
            this.website.browser.GO_TO_WEBPAGE(!this.website.suiteIsOwned ? com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITES_PAGE.name : com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.RENOVATE_PAGE.name);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.MEMBERSHIP_PENDING_PAGE.name);
      }
   }
}
