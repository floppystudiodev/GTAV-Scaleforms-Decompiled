class com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_VEHICLE_INFO extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var CONTENT;
   var dbg;
   var dbgID;
   var manufLoader;
   var isStandaloneGfx = false;
   var firstload = false;
   function MP_MATCHMAKING_VEHICLE_INFO()
   {
      super();
      this.dbgID = "MP_MATCHMAKING_VEHICLE_INFO";
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
         this.isStandaloneGfx = true;
      }
      else
      {
         this.CONTENT = this;
      }
      this.CONTENT.bgMC._visible = this.CONTENT.innerMC._visible = false;
      this.CONTENT.innerMC.nameTF.autoSize = "left";
      this.SET_DESCRIPTION("");
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.innerMC.statusMC.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
   }
   function SET_TITLE(nameStr, classStr)
   {
      if(nameStr != undefined)
      {
         this.CONTENT.innerMC.nameTF.text = nameStr;
      }
      if(classStr != undefined)
      {
         this.CONTENT.innerMC.classTF.text = classStr;
      }
      var _loc11_ = arguments[2];
      var _loc7_ = arguments[3];
      var _loc12_ = arguments[4];
      var _loc10_ = arguments[5];
      var _loc8_ = arguments[6];
      var _loc9_ = arguments[7];
      if(this.CONTENT.innerMC.classIconL != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.innerMC.classIconL,_loc11_,_loc7_,_loc12_,100);
      }
      if(this.CONTENT.innerMC.classIconR != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.innerMC.classIconR,_loc10_,_loc8_,_loc9_,100);
      }
      this.CONTENT.innerMC.colourStrokeMC._alpha = 30;
      var _loc3_ = arguments[8];
      var _loc4_ = arguments[9];
      if(this.manufLoader == undefined)
      {
         this.manufLoader = this.CONTENT.innerMC.attachMovie("GenericImageLoader","manuLoader",this.CONTENT.innerMC.getNextHighestDepth(),{_x:14,_y:7});
      }
      var _loc5_ = !this.isStandaloneGfx ? "PAUSE_MENU_SP_CONTENT" : "MP_VEHICLE_INFO";
      var _loc6_;
      if(this.manufLoader.textureDict == _loc3_)
      {
         this.manufLoader.init(_loc5_,_loc3_,_loc4_,54,54);
         this.manufLoader.displayTxdResponse(_loc3_);
      }
      else
      {
         if(this.manufLoader.isLoaded)
         {
            this.manufLoader.removeTxdRef();
         }
         _loc6_ = this.manufLoader.splitPath(String(this.manufLoader),3);
         this.manufLoader.init(_loc5_,_loc3_,_loc4_,54,54);
         this.manufLoader.requestTxdRef(_loc6_,this.firstload,this.imageLoaded,this);
      }
      this.CONTENT.bgMC._visible = this.CONTENT.innerMC._visible = true;
      this.resizeBG();
   }
   function SET_DESCRIPTION(statusStr)
   {
      if(statusStr && statusStr != "")
      {
         this.CONTENT.innerMC.statusMC._visible = true;
         this.CONTENT.innerMC.statusMC.labelMC.itemTF.text = statusStr;
         this.CONTENT.innerMC.statusMC.bgMC._width = this.CONTENT.innerMC.statusMC.labelMC.itemTF.textWidth + 10;
         this.CONTENT.innerMC.statusMC.bgMC._x = 145 - this.CONTENT.innerMC.statusMC.bgMC._width;
         this.CONTENT.innerMC.statusMC._x = this.CONTENT.innerMC.classTF._x + this.CONTENT.innerMC.classTF.textWidth + 15 - (this.CONTENT.innerMC.statusMC._width - this.CONTENT.innerMC.statusMC.bgMC._width);
         this.resizeBG();
      }
      else
      {
         this.CONTENT.innerMC.statusMC._visible = false;
      }
   }
   function imageLoaded()
   {
      this.firstload = true;
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      this.dbg("TXD_HAS_LOADED textureDict: " + textureDict + " success: " + success + " uniqueID: " + uniqueID);
      if(success == true)
      {
         if(this.manufLoader != undefined)
         {
            this.manufLoader.displayTxdResponse(textureDict,success);
         }
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      this.dbg("TXD_ALREADY_LOADED textureDict: " + textureDict + " uniqueID: " + uniqueID);
      if(this.manufLoader != undefined)
      {
         this.manufLoader.displayTxdResponse(textureDict,true);
      }
   }
   function resizeBG()
   {
      var _loc3_ = this.CONTENT.innerMC.nameTF._x + this.CONTENT.innerMC.nameTF.textWidth;
      var _loc2_ = this.CONTENT.innerMC.classTF._x + this.CONTENT.innerMC.classTF.textWidth + (!this.CONTENT.innerMC.statusMC._visible ? 0 : 10 + this.CONTENT.innerMC.statusMC.bgMC._width);
      this.CONTENT.bgMC._width = Math.max(_loc3_,_loc2_) + 100;
   }
}
