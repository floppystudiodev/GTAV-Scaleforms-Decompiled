class com.rockstargames.gtav.web.prixluxuryrealestate.Page
{
   var nextPageName;
   var pageName;
   var prevPageName;
   var view;
   var website;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.web.prixluxuryrealestate.Page.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.web.prixluxuryrealestate.Page.STAGE_HEIGHT;
   static var BASE_PAGE_HEIGHT = 627;
   function Page(website, viewContainer, viewLinkage, pageName)
   {
      this.website = website;
      this.pageName = pageName;
      this.view = viewContainer.attachMovie(viewLinkage,pageName,viewContainer.getNextHighestDepth());
   }
   function initDynamicWidthButton(button, label)
   {
      button.btnTxt.autoSize = "left";
      button.btnTxt.verticalAlign = "center";
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(button.btnTxt,label);
      button.w = button.btnTxt._width + 2 * button.btnTxt._x;
      button.bg._width = button.w;
   }
   function initFixedWidthButton(button, label, width)
   {
      button.btnTxt.autoSize = "left";
      button.btnTxt.verticalAlign = "center";
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.setLocalisedText(button.btnTxt,label);
      button.w = width;
      button.bg._width = width;
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
}
