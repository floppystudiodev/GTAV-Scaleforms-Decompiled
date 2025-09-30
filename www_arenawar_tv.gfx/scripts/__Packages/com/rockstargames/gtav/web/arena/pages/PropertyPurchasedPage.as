class com.rockstargames.gtav.web.arena.pages.PropertyPurchasedPage extends com.rockstargames.gtav.web.arena.Page
{
   var progressPanel;
   var view;
   var website;
   function PropertyPurchasedPage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"propertyPurchasedPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      this.progressPanel.hide();
      this.view.title.autoSize = "left";
      this.view.message.autoSize = "left";
      if(this.website.initialPropertyIsOwned)
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.title,"MBA_RENOVATE_PROP_TITLE");
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.message,"MBA_RENOVATE_PROP_MSG");
      }
      else
      {
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.title,"MBA_PURCHASE_PROP_TITLE");
         com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.message,"MBA_PURCHASE_PROP_MSG");
      }
      this.view.title._x = 0.5 * (com.rockstargames.gtav.web.arena.Page.STAGE_WIDTH - this.view.title._width);
      this.view.titleGradientMask.autoSize = "left";
      this.view.titleGradientMask.text = this.view.title.text;
      this.view.titleGradientMask._x = this.view.title._x;
      this.view.titleGradient._x = this.view.title._x;
      this.view.titleGradient._width = this.view.title._width;
      this.view.waypointButton.wrapper.label.textAutoSize = "shrink";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.waypointButton.wrapper.label,"MBA_SET_WAYPOINT");
      this.website.dataTextScope.push(this.view.waypointButton.btnTxt);
      this.view.upgradeableButton.wrapper.label.textAutoSize = "shrink";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.upgradeableButton.wrapper.label,"MBA_BUY_UPGRADEABLE");
      this.website.dataTextScope.push(this.view.upgradeableButton.btnTxt);
      this.view.arenaReadyButton.wrapper.label.textAutoSize = "shrink";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.arenaReadyButton.wrapper.label,"MBA_BUY_ARENA_READY");
      this.website.dataTextScope.push(this.view.arenaReadyButton.btnTxt);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.website.setPageHeight(com.rockstargames.gtav.web.arena.Page.BASE_PAGE_HEIGHT);
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "upgradeableButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.UPGRADEABLE_VEHICLES_PAGE.name);
            break;
         case "arenaReadyButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.ARENA_READY_VEHICLES_PAGE.name);
         default:
            return;
      }
   }
}
