class com.rockstargames.gtav.web.prixluxuryrealestate.pages.MansionPurchasePage extends com.rockstargames.gtav.web.prixluxuryrealestate.Page
{
   var initDynamicWidthButton;
   var pageName;
   var view;
   var website;
   function MansionPurchasePage(website, viewContainer, pageName)
   {
      super(website,viewContainer,"mansionPurchasePage",pageName);
      this.init();
   }
   function init()
   {
      var _loc3_ = com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(this.view.titlebarLocaliser,"PLRE_TITLEBAR");
      this.website.browser.SET_TITLEBAR_TEXT(_loc3_,14474460);
      this.initDynamicWidthButton(this.view.waypointButton,"PLRE_COMPLETE_WAYPOINT");
      this.initDynamicWidthButton(this.view.homeButton,"PLRE_COMPLETE_MAP");
      this.website.dataTextScope.push(this.view.waypointButton.btnTxt);
      this.website.dataTextScope.push(this.view.homeButton.btnTxt);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      if(this.website.dataProviderUI[1][0] != undefined)
      {
         this.view.heading.text = this.website.dataProviderUI[1][0];
      }
      if(this.website.dataProviderUI[2][0] != undefined)
      {
         this.view.subheading.text = this.website.dataProviderUI[2][0];
      }
      var _loc2_;
      if(this.pageName == com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_PURCHASE_SUCCESS_PAGE.name)
      {
         this.view.cross._visible = false;
         _loc2_ = this.view.waypointButton._width + this.view.homeButton._width + 20;
         this.view.waypointButton._x = com.rockstargames.gtav.web.prixluxuryrealestate.Page.STAGE_CENTRE_X - 0.5 * _loc2_;
         this.view.homeButton._x = this.view.waypointButton._x + this.view.waypointButton._width + 20;
         _loc2_ = this.view.tick._width + this.view.heading.textWidth + 4;
         this.view.tick._x = com.rockstargames.gtav.web.prixluxuryrealestate.Page.STAGE_CENTRE_X - 0.5 * _loc2_;
         this.view.heading._x = this.view.tick._x + this.view.tick._width + 4;
      }
      else
      {
         this.view.tick._visible = false;
         this.view.waypointButton.disabled = true;
         this.view.waypointButton._visible = false;
         this.view.homeButton._x = com.rockstargames.gtav.web.prixluxuryrealestate.Page.STAGE_CENTRE_X - 0.5 * this.view.homeButton._width;
         _loc2_ = this.view.cross._width + this.view.heading.textWidth + 8;
         this.view.cross._x = com.rockstargames.gtav.web.prixluxuryrealestate.Page.STAGE_CENTRE_X - 0.5 * _loc2_;
         this.view.heading._x = this.view.cross._x + this.view.cross._width + 8;
      }
      this.website.setPageHeight(this.view.background._height);
      this.website.activeMansion = null;
   }
   function handleClick(type, id)
   {
      var _loc0_;
      if((_loc0_ = type) === "homeButton")
      {
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.PAGES.MANSION_MAP_PAGE.name);
      }
   }
   function dispose()
   {
      super.dispose();
   }
}
