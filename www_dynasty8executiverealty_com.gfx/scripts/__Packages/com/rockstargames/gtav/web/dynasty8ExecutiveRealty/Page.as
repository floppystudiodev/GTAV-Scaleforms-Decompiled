class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var website;
   var pageName;
   var view;
   var progressPanel;
   var summaryPageName;
   static var MAP_START_X = -370;
   static var MAP_START_Y = -2703.8;
   static var MAP_START_SCALE = 0.5;
   static var DROP_DOWN_GREEN = 1141559;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_HEIGHT;
   function Page(website, viewContainer, viewLinkage, pageName, isFirstPage, progressPanel, header)
   {
      this.website = website;
      this.pageName = pageName;
      this.view = viewContainer.attachMovie(viewLinkage,pageName,viewContainer.getNextHighestDepth());
      this.progressPanel = progressPanel;
      this.summaryPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUMMARY_PAGE.name;
      header._y = 0;
      header.label.text = "";
      this.initMap(isFirstPage);
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
   function initMap(isFirstPage)
   {
      if(this.website.mapX == undefined)
      {
         this.view.map._x = this.website.mapX = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.MAP_START_X;
      }
      else
      {
         this.view.map._x = this.website.mapX;
      }
      if(this.website.mapY == undefined)
      {
         this.view.map._y = this.website.mapY = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.MAP_START_Y;
      }
      else
      {
         this.view.map._y = this.website.mapY;
      }
      if(this.website.mapMatrix == undefined)
      {
         var _loc2_ = this.view.map.transform.matrix;
         var _loc3_ = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.MAP_START_SCALE / _loc2_.a;
         _loc2_.translate(- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_X,- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_Y);
         _loc2_.scale(_loc3_,_loc3_);
         _loc2_.translate(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_X,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.STAGE_CENTRE_Y);
         this.view.map.transform.matrix = _loc2_;
         this.website.mapMatrix = _loc2_.clone();
      }
      else
      {
         this.view.map.transform.matrix = this.website.mapMatrix;
      }
      if(isFirstPage)
      {
         this.view.map._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.map,0.35,{_alpha:100});
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.map);
      this.website = null;
      this.view.removeMovieClip();
      this.view = null;
   }
}
