class com.rockstargames.gtav.levelDesign.nightclub.PersistentContent
{
   var app;
   var view;
   var navButtons;
   var popularityMeter;
   var currPopularity;
   var slideshow;
   var currPropertyTexture;
   var currPropertyDictionary;
   var currMugshotTexture;
   function PersistentContent(app, view)
   {
      this.app = app;
      this.view = view;
      this.init();
   }
   function init()
   {
      this.view.header.loggedIn.autoSize = "right";
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.header.loggedIn,"CLUB_LOGGED");
      this.view.header.gamerName.autoSize = "right";
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.statusPanel.organizationLabel,"CLUB_OWNER");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.statusPanel.locationLabel,"CLUB_LOCATION");
      this.navButtons = [];
      this.navButtons.push(new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.HOME_SCREEN,this.view.homeButton,"CLUB_HOME_BTN"));
      this.navButtons.push(new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.NIGHTCLUB_SCREEN,this.view.nightclubButton,"CLUB_NCLUB_BTN"));
      this.navButtons.push(new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.DJ_SCREEN,this.view.djButton,"CLUB_DJ_BTN"));
      this.navButtons.push(new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.WAREHOUSE_SCREEN,this.view.warehouseButton,"CLUB_WHSE_BTN"));
      this.navButtons.push(new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.UPGRADES_SCREEN,this.view.upgradesButton,"CLUB_UPG_BTN"));
      this.navButtons.push(new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.SELL_SCREEN,this.view.sellButton,"CLUB_SELL_BTN"));
      this.view.popularityMeter.label.textAutoSize = "shrink";
      this.popularityMeter = new com.rockstargames.gtav.levelDesign.nightclub.BarMeter(this.view.popularityMeter,"CLUB_POPULARITY",false,0);
      this.currPopularity = 0;
      this.slideshow = new com.rockstargames.gtav.levelDesign.nightclub.Slideshow();
   }
   function update()
   {
      this.view.header.gamerName.text = this.app.gamerName;
      this.view.header.loggedIn._x = this.view.header.gamerName._x + this.view.header.gamerName._width - this.view.header.gamerName.textWidth - this.view.header.loggedIn.textWidth - 10;
      this.view.statusPanel.location.text = this.app.propertyLocation;
      this.view.statusPanel.organization.text = this.app.organizationName;
      if(this.view.statusPanel.location.bottomScroll > 1)
      {
         this.view.statusPanel.locationLabel._y = 60;
         this.view.statusPanel.location._y = 80;
      }
      else
      {
         this.view.statusPanel.locationLabel._y = 70;
         this.view.statusPanel.location._y = 90;
      }
      this.updatePopularityMeter();
      var _loc2_ = this.currPropertyTexture != this.app.propertyTexture || this.currPropertyDictionary != this.app.propertyDictionary;
      if(_loc2_ && this.app.propertyDictionary.length > 0 && this.app.propertyTexture.length > 0)
      {
         this.currPropertyDictionary = this.app.propertyDictionary;
         this.currPropertyTexture = this.app.propertyTexture;
         this.app.imageManager.addImage(this.currPropertyDictionary,this.currPropertyTexture,this.view.slideshow.image2);
         if(!isNaN(this.app.clubNameID))
         {
            this.view.slideshow.image1._visible = true;
            this.app.imageManager.addImage("NIGHTCLUB_NAMES","NAME" + this.app.clubNameID,this.view.slideshow.image1);
            this.slideshow.startSlideshow(this.view.slideshow);
         }
         else
         {
            this.view.slideshow.image1._visible = false;
         }
      }
      if(this.app.mugshotTexture.length > 0 && this.currMugshotTexture != this.app.mugshotTexture)
      {
         this.currMugshotTexture = this.app.mugshotTexture;
         this.app.imageManager.addImage(this.currMugshotTexture,this.currMugshotTexture,this.view.header.mugshot);
      }
   }
   function updateNav(screenStep)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.navButtons.length)
      {
         this.navButtons[_loc2_].view.gotoAndStop(_loc2_ != screenStep ? "off" : "on");
         this.navButtons[_loc2_].enabled = _loc2_ != screenStep;
         _loc2_ = _loc2_ + 1;
      }
   }
   function setPopularityMeterVisible(isVisible)
   {
      this.popularityMeter.setVisible(isVisible);
   }
   function updatePopularityMeter()
   {
      if(this.currPopularity != this.app.popularity)
      {
         this.currPopularity = this.app.popularity;
         this.popularityMeter.setValue(this.app.popularity,0,100,false);
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.playSound("Show_Overview_Menu","GTAO_SMG_Hangar_Computer_Sounds");
      }
   }
   function resetPopularityMeter()
   {
      this.currPopularity = 0;
      this.popularityMeter.setValue(0,0,100,true);
   }
}
