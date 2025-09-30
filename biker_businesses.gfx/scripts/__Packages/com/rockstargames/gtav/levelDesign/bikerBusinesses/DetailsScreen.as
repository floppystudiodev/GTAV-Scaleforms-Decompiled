class com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen extends com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen
{
   var app;
   var controls;
   var cursor;
   var mapButton;
   var mapImages;
   var overlay;
   var showingMap;
   var slideshow;
   var slideshowImages;
   var txds;
   var view;
   static var OVERLAY_ACCEPT_BUTTON = 101;
   static var OVERLAY_CANCEL_BUTTON = 102;
   static var BUY_BUTTON = 2001;
   static var VIEW_BUTTON = 2002;
   static var BACK_BUTTON = 2003;
   function DetailsScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"detailsScreen");
      this.init();
   }
   function init()
   {
      this.controls = [];
      this.showingMap = false;
      var _loc2_ = this.app.getBusinessByID(this.app.GET_SELECTED_BUSINESS_ID());
      this.initText(_loc2_);
      this.initButtons(_loc2_);
      this.initImage(_loc2_);
      this.initSlideshow(_loc2_);
      this.initOverlay();
      this.view._visible = true;
      this.cursor.setTargetRects(this.controls);
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
   }
   function initText(business)
   {
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.header.version,"BIKEBIZ_VERSION");
      this.view.type.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.type,com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.DESCS[business.type]);
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.locationLabel,"BIKEBIZ_LOCATION");
      this.view.location.autoSize = "left";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.location,business.location);
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.description,business.description);
      this.view.description._y = this.view.location._y + this.view.location._height + 2;
      this.view.description._height = this.view.viewButton._y - this.view.description._y - 10;
   }
   function initButtons(business)
   {
      var _loc2_;
      _loc2_ = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen.BUY_BUTTON,this.view.buyButton,"BIKEBIZ_BUY");
      this.view.buyButton.price.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(business.price);
      if(business.salePrice > -1)
      {
         this.view.buyButton.originalPrice.autoSize = "left";
         this.view.buyButton.originalPrice.text = "$" + com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.formatNumber(business.originalPrice);
         this.view.buyButton.originalPrice._x = this.view.buyButton.price._x + this.view.buyButton.price._width - this.view.buyButton.price.textWidth - this.view.buyButton.originalPrice.textWidth - 25;
         this.view.buyButton.reductionLine._x = this.view.buyButton.originalPrice._x + this.view.buyButton.originalPrice._width - this.view.buyButton.originalPrice.textWidth;
         this.view.buyButton.reductionLine._width = this.view.buyButton.originalPrice.textWidth;
         this.view.buyButton.reductionLine._visible = true;
      }
      else
      {
         this.view.buyButton.originalPrice.text = "";
         this.view.buyButton.reductionLine._visible = false;
      }
      this.controls.push(_loc2_);
      this.mapButton = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen.VIEW_BUTTON,this.view.viewButton,"BIKEBIZ_MAP_VIEW");
      this.controls.push(this.mapButton);
      _loc2_ = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen.BACK_BUTTON,this.view.backButton);
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.backButton.sortLabel,"BIKEBIZ_BACK");
      this.controls.push(_loc2_);
   }
   function initImage(business)
   {
      this.app.imageManager.addImage("MP_BWH_GENERIC","TYPE_" + business.type,this.view.image);
   }
   function initSlideshow(business)
   {
      this.slideshow = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Slideshow(this.app.imageManager,this.view.slideshow);
      this.txds = [business.txd];
      this.slideshowImages = [business.txd + "_EXT_L"];
      this.mapImages = [business.txd + "_MAP"];
      this.showSlideshow();
   }
   function initOverlay()
   {
      this.overlay = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Overlay(this.view.overlay,com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen.OVERLAY_ACCEPT_BUTTON,com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen.OVERLAY_CANCEL_BUTTON);
   }
   function onTargetChange(targetID)
   {
   }
   function showOverlay(title, message, acceptButton, cancelButton)
   {
      this.overlay.show(title,message,acceptButton,cancelButton);
      this.cursor.setTargetRects(this.overlay.controls);
   }
   function hideOverlay()
   {
      this.cursor.setTargetRects(this.controls);
      this.overlay.hide();
   }
   function get isReady()
   {
      return true;
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.ACCEPT:
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.LEFT_MOUSE:
            this.handleAcceptInput(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.CANCEL:
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.RIGHT_MOUSE:
            this.app.showScreen(this.app.BUSINESSES_SCREEN);
         default:
            return;
      }
   }
   function handleAcceptInput(inputID)
   {
      switch(this.app.GET_CURRENT_SELECTION())
      {
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen.VIEW_BUTTON:
            com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
            this.toggleSlideshow();
            return;
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen.BACK_BUTTON:
            com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
            this.app.showScreen(this.app.BUSINESSES_SCREEN);
            return;
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen.BUY_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen.OVERLAY_ACCEPT_BUTTON:
         case com.rockstargames.gtav.levelDesign.bikerBusinesses.DetailsScreen.OVERLAY_CANCEL_BUTTON:
            com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
            return;
         default:
            com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Generic");
            return;
      }
   }
   function toggleSlideshow()
   {
      this.showingMap = !this.showingMap;
      if(this.showingMap)
      {
         this.showMap();
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.viewButton.label,"BIKEBIZ_IMAGE_VIEW");
      }
      else
      {
         this.showSlideshow();
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.viewButton.label,"BIKEBIZ_MAP_VIEW");
      }
      this.mapButton.updateBounds();
      this.cursor.setTargetRects(this.controls);
   }
   function showSlideshow()
   {
      this.slideshow.show(this.txds,this.slideshowImages);
      this.view.eyeFindLogo._visible = false;
   }
   function showMap()
   {
      this.slideshow.show(this.txds,this.mapImages);
      this.view.eyeFindLogo._visible = true;
   }
   function dispose()
   {
      this.cursor.setChangeListener(null);
      this.slideshow.dispose();
      super.dispose();
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
}
