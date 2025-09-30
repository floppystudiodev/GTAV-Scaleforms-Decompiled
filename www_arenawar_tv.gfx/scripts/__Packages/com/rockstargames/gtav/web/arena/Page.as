class com.rockstargames.gtav.web.arena.Page
{
   var pageName;
   var progressPanel;
   var view;
   var website;
   static var BUTTON_COLOUR = 15213100;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.web.arena.Page.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.web.arena.Page.STAGE_HEIGHT;
   static var BASE_PAGE_HEIGHT = 627;
   function Page(website, viewContainer, viewLinkage, pageName, isFirstPage, progressPanel)
   {
      this.website = website;
      this.pageName = pageName;
      this.progressPanel = progressPanel;
      this.view = viewContainer.attachMovie(viewLinkage,pageName,viewContainer.getNextHighestDepth());
      progressPanel.updateCosts();
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
   }
   function handleRB()
   {
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
      this.progressPanel.setDisabledButtons();
   }
   function dispose()
   {
      this.progressPanel = null;
      this.website = null;
      this.view.removeMovieClip();
      this.view = null;
   }
}
