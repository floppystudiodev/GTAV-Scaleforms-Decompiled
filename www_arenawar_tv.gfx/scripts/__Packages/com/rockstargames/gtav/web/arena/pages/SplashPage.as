class com.rockstargames.gtav.web.arena.pages.SplashPage extends com.rockstargames.gtav.web.arena.Page
{
   var progressPanel;
   var view;
   var website;
   static var BUTTON_FADE_IN_DURATION = 0.2;
   function SplashPage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"splashPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      this.progressPanel.hide();
      this.view.message.textAutoSize = "shrink";
      this.view.message.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.message,"MBA_SPLASH").toUpperCase();
      this.website.dataTextScope.push(this.view.propertyButton.btnTxt);
      this.view.propertyButton.label._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.propertyButton.label,0.5,{delay:0.04,_alpha:100});
      this.setButtonText(this.view.upgradeableButton,"MBA_BUY_UPGRADEABLE");
      this.website.dataTextScope.push(this.view.upgradeableButton.btnTxt);
      this.view.upgradeableButton.label._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.upgradeableButton.label,0.5,{delay:0.04,_alpha:100});
      this.setButtonText(this.view.arenaReadyButton,"MBA_BUY_ARENA_READY");
      this.website.dataTextScope.push(this.view.arenaReadyButton.btnTxt);
      this.view.arenaReadyButton.label._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.arenaReadyButton.label,0.5,{delay:0.04,_alpha:100});
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.view.footer._y = 612;
      this.view.background._height = this.view.footer._y + 14;
      this.website.setPageHeight(this.view.background._height);
   }
   function update()
   {
      this.setButtonText(this.view.propertyButton,!this.website.propertyIsOwned ? "MBA_BUY_GARAGE" : "MBA_RENOVATE_GARAGE");
   }
   function setButtonText(buttonView, label)
   {
      buttonView.label.btnTxt.textAutoSize = "shrink";
      buttonView.label.btnTxtShadow.textAutoSize = "shrink";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(buttonView.label.btnTxt,label);
      buttonView.label.btnTxtShadow.text = buttonView.label.btnTxt.text;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "propertyButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.WORKSHOP_STYLE_PAGE.name);
            break;
         case "upgradeableButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.UPGRADEABLE_VEHICLES_PAGE.name);
            break;
         case "arenaReadyButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.ARENA_READY_VEHICLES_PAGE.name);
         default:
            return;
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.propertyButton.label);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.upgradeableButton.label);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.arenaReadyButton.label);
      super.dispose();
   }
}
