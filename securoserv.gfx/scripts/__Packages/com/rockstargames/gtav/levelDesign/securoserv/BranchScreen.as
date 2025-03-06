class com.rockstargames.gtav.levelDesign.securoserv.BranchScreen extends com.rockstargames.gtav.levelDesign.securoserv.Screen
{
   var app;
   var view;
   var specialCargoButton;
   var importExportButton;
   var specialVehiclesButton;
   var cursor;
   var screensaver;
   static var SPECIAL_CARGO = 1001;
   static var SPECIAL_VEHICLES = 1002;
   static var IMPORT_EXPORT = 1003;
   function BranchScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"branchScreen");
      this.init();
   }
   function init()
   {
      var _loc2_ = this.app.getVehicleWarehouseByID(this.app.selectedWarehouseID);
      if(_loc2_)
      {
         _loc2_.stealCooldown = 0;
      }
      this.app.selectedWarehouseID = -1;
      this.app.imageManager.addImage("DYN_MPWH_GENERIC","SPECIAL_CARGO",this.view.leftButton.image);
      if(this.app.hasSpecialCargoMissions)
      {
         this.view.leftButton.greyOut._visible = false;
      }
      this.view.leftButton.greyOut.label._visible = false;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.leftButton.greyOut.label,"SECUROSERV_SPECIAL_CARGO_UNAVAIL");
      this.view.leftButton.label.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.leftButton.label,"SECUROSERV_SPECIAL_CARGO");
      this.specialCargoButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.BranchScreen.SPECIAL_CARGO,this.view.leftButton);
      this.app.imageManager.addImage("DYN_MPWH_GENERIC","IMPORT_EXPORT",this.view.centreButton.image);
      if(this.app.importExportMissions)
      {
         this.view.centreButton.greyOut._visible = false;
      }
      this.view.centreButton.greyOut.label._visible = false;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.centreButton.greyOut.label,"SECUROSERV_IMPORT_EXPORT_UNAVAIL");
      this.view.centreButton.label.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.centreButton.label,"SECUROSERV_IMPORT_EXPORT");
      this.importExportButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.BranchScreen.IMPORT_EXPORT,this.view.centreButton);
      this.app.imageManager.addImage("DYN_MPWH_GENERIC","SPECIAL_VEHICLES",this.view.rightButton.image);
      if(this.app.hasSpecialVehicleMissions)
      {
         this.view.rightButton.greyOut._visible = false;
      }
      this.view.rightButton.greyOut.label._visible = false;
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.rightButton.greyOut.label,"SECUROSERV_SPECIAL_VEHICLES_UNAVAIL");
      this.view.rightButton.label.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.rightButton.label,"SECUROSERV_SPECIAL_VEHICLES");
      this.specialVehiclesButton = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.BranchScreen.SPECIAL_VEHICLES,this.view.rightButton);
      this.cursor.setTargetRects([this.specialCargoButton,this.specialVehiclesButton,this.importExportButton]);
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
      this.onTargetChange(this.cursor.getTargetIDUnderCursor());
      this.flashElementIn(this.view.leftButton,0.1);
      this.flashElementIn(this.view.centreButton,0.2);
      this.flashElementIn(this.view.rightButton,0.3);
      this.screensaver = new com.rockstargames.gtav.levelDesign.securoserv.Screensaver(this.view.screensaver);
      this.view._visible = true;
      com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Draw_Choice_Screen");
   }
   function get isReady()
   {
      return true;
   }
   function handleButtonInput(inputID)
   {
      if(inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.ACCEPT || inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.LEFT_MOUSE)
      {
         switch(this.app.GET_CURRENT_SELECTION())
         {
            case this.specialCargoButton.id:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Main_Menu_Select");
               if(this.app.hasSpecialCargoMissions)
               {
                  this.app.showScreen(!this.app.returningPlayer ? this.app.MAP_SCREEN : this.app.STATS_SCREEN);
               }
               break;
            case this.importExportButton.id:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Main_Menu_Select");
               if(this.app.importExportMissions)
               {
                  this.app.showScreen(!this.app.returningVehiclePlayer ? this.app.IMPORT_EXPORT_MAP_SCREEN : this.app.IMPORT_EXPORT_STATS_SCREEN);
               }
               break;
            case this.specialVehiclesButton.id:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Main_Menu_Select");
               if(this.app.hasSpecialVehicleMissions)
               {
                  this.app.showScreen(this.app.SPECIAL_VEHICLES_SCREEN);
               }
         }
      }
   }
   function onTargetChange(targetID)
   {
      this.view.leftButton.gotoAndStop("off");
      this.view.leftButton.greyOut.label._visible = false;
      this.view.centreButton.gotoAndStop("off");
      this.view.centreButton.greyOut.label._visible = false;
      this.view.rightButton.gotoAndStop("off");
      this.view.rightButton.greyOut.label._visible = false;
      switch(targetID)
      {
         case com.rockstargames.gtav.levelDesign.securoserv.BranchScreen.SPECIAL_CARGO:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            this.view.leftButton.gotoAndStop("on");
            this.view.leftButton.greyOut.label._visible = true;
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.BranchScreen.IMPORT_EXPORT:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            this.view.centreButton.gotoAndStop("on");
            this.view.centreButton.greyOut.label._visible = true;
            break;
         case com.rockstargames.gtav.levelDesign.securoserv.BranchScreen.SPECIAL_VEHICLES:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            this.view.rightButton.gotoAndStop("on");
            this.view.rightButton.greyOut.label._visible = true;
      }
   }
   function dispose()
   {
      this.screensaver.dispose();
      com.rockstargames.gtav.levelDesign.securoserv.Screensaver.clearState();
      this.cursor.setChangeListener(null);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.leftButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.centreButton);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.rightButton);
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
