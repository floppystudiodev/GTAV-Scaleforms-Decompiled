class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var CONTENT;
   var SEND_COLUMN_PARAMS;
   var canMouseNav;
   var columnIsFocused;
   var customMC;
   var dbgID;
   var imgLdr;
   var menuContainer;
   var model;
   var scrollBase;
   var vidMemBar;
   var vidMemBar2;
   static var CUSTOM_ITEM_CONTROLS = 1;
   static var CUSTOM_ITEM_AUDIO = 2;
   static var CUSTOM_ITEM_SOCIAL = 3;
   static var CUSTOM_ITEM_VIDMEM = 4;
   static var CUSTOM_ITEM_VIDMEM_2 = 5;
   var customLinkageList = ["settingsControlsGraphic","settingsAudioGraphic","settingsSocialGraphic","settingsVideoMemory","settingsVideoMemory2"];
   var customLinkageRows = [8,16,1,14,14];
   var state = 0;
   function PAUSE_MENU_SETTINGS()
   {
      super();
      this.dbgID = "PAUSE_MENU_SETTINGS";
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      this.menuContainer = this.CONTENT.createEmptyMovieClip("menuMC",this.CONTENT.getNextHighestDepth());
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:0,columnSpacing:0,container:this.menuContainer,visibleItems:16,linkage:["settingsListItem"],viewMaskHeight:430,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      var _loc3_ = arguments;
      this.model.addDataToView(0,_viewIndex,_loc3_);
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      if(this.state == 0)
      {
         this.resetVisibleItems();
      }
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW(viewIndex,itemIndex);
      var _loc4_;
      var _loc5_;
      var _loc3_;
      if(this.state == com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_AUDIO)
      {
         _loc4_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView()).itemList.length;
         _loc5_ = 27;
         _loc3_ = 0;
         this.customMC._y = _loc4_ * (_loc5_ + _loc3_);
         this.customMC._visible = true;
      }
      else if(this.state == com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_VIDMEM || this.state == com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_VIDMEM_2)
      {
         if(this.customMC.tipText != undefined)
         {
            if(this.scrollBase._visible)
            {
               this.customMC.tipText._y = this.scrollBase._y + this.scrollBase._height + 2;
            }
            else
            {
               this.customMC.tipText._y = this.model.getCurrentView().viewContainer._y + this.model.getCurrentView().viewContainer._height + 2;
            }
         }
      }
      if(this.canMouseNav)
      {
         this.SEND_COLUMN_PARAMS();
      }
   }
   function SET_CONTROL_IMAGE(textureDictionary, textureName)
   {
      var _loc2_;
      if(textureDictionary != "" && textureName != "")
      {
         _loc2_ = 256;
         this.createTexture(textureDictionary,textureName,162,-19,_loc2_,_loc2_);
      }
   }
   function SET_CONTROL_LABELS()
   {
      if(this.customMC != undefined)
      {
         this.setControlsText(this.customMC.controllerText.l2TF,arguments[0]);
         this.setControlsText(this.customMC.controllerText.l1TF,arguments[1]);
         this.setControlsText(this.customMC.controllerText.selectTF,arguments[2]);
         this.setControlsText(this.customMC.controllerText.upTF,arguments[3]);
         this.setControlsText(this.customMC.controllerText.leftTF,arguments[4]);
         this.setControlsText(this.customMC.controllerText.downTF,arguments[5]);
         this.setControlsText(this.customMC.controllerText.rightTF,arguments[6]);
         this.setControlsText(this.customMC.controllerText.l3TF,arguments[7]);
         this.setControlsText(this.customMC.controllerText.lAnalogueTF,arguments[8]);
         this.setControlsText(this.customMC.controllerText.r2TF,arguments[9]);
         this.setControlsText(this.customMC.controllerText.r1TF,arguments[10]);
         this.setControlsText(this.customMC.controllerText.startTF,arguments[11]);
         this.setControlsText(this.customMC.controllerText.triangleTF,arguments[12]);
         this.setControlsText(this.customMC.controllerText.circleTF,arguments[13]);
         this.setControlsText(this.customMC.controllerText.squareTF,arguments[14]);
         this.setControlsText(this.customMC.controllerText.crossTF,arguments[15]);
         this.setControlsText(this.customMC.controllerText.rAnalogueTF,arguments[16]);
         this.setControlsText(this.customMC.controllerText.r3TF,arguments[17]);
         this.setControlsText(this.customMC.controllerText.controlTypeTF,arguments[18]);
      }
   }
   function SET_VIDEO_MEMORY_BAR(initialise, textlabel, percent, colour)
   {
      if(initialise)
      {
         this.SET_STATE(com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_VIDMEM);
         this.vidMemBar = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.customMC.percentMC);
         this.vidMemBar.init(colour);
         this.vidMemBar.percent(percent);
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView()).bgMC._visible = true;
      }
      else
      {
         this.vidMemBar.init(colour);
         this.vidMemBar.percent(percent);
      }
      var _loc3_ = 427;
      if(percent == -1)
      {
         this.customMC.percentMC._visible = false;
         _loc3_ = 558;
      }
      else
      {
         this.customMC.percentMC._visible = true;
      }
      this.customMC.titleTF.text = textlabel;
      this.customMC.titleTF.autoSize = true;
      this.customMC.titleTF._width = _loc3_;
      var _loc5_ = 26;
      if(this.customMC.titleTF._height > _loc5_)
      {
         this.customMC.titleTF._y = 8;
      }
      else
      {
         this.customMC.titleTF._y = 15;
      }
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc2_);
      com.rockstargames.ui.utils.Colour.Colourise(this.customMC.tipText.bgMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      this.customMC.tipText._visible = this.customMC.tipText.label.text.length > 0;
   }
   function SET_VIDEO_MEMORY_BAR_2(initialise, textlabel, percent, colour, percent2, colour2)
   {
      var _loc6_;
      if(percent2 > percent)
      {
         _loc6_ = percent;
         percent = percent2;
         percent2 = _loc6_;
         _loc6_ = colour;
         colour = colour2;
         colour2 = _loc6_;
      }
      if(initialise)
      {
         this.SET_STATE(com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_VIDMEM_2);
         this.vidMemBar = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.customMC.percentMC);
         this.vidMemBar.init(colour);
         this.vidMemBar.percent(percent);
         this.vidMemBar2 = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.customMC.percent2MC);
         this.vidMemBar2.init(colour2);
         this.vidMemBar2.percent(percent2);
         this.customMC.percent2MC.baralphaMC._visible = false;
         this.customMC.percent2MC.blackMC._visible = false;
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView()).bgMC._visible = true;
      }
      else
      {
         this.vidMemBar.init(colour);
         this.vidMemBar.percent(percent);
         this.vidMemBar2.init(colour2);
         this.vidMemBar2.percent(percent2);
         this.customMC.percent2MC.baralphaMC._visible = false;
         this.customMC.percent2MC.blackMC._visible = false;
      }
      var _loc4_ = 427;
      if(percent == -1)
      {
         this.customMC.percentMC._visible = false;
         _loc4_ = 558;
      }
      else
      {
         this.customMC.percentMC._visible = true;
      }
      this.customMC.titleTF.verticalAlign = "center";
      this.customMC.titleTF.html = true;
      this.customMC.titleTF.htmlText = textlabel;
      this.customMC.titleTF.autoSize = true;
      this.customMC.titleTF._width = _loc4_;
      _loc4_ = 427;
      if(percent2 == -1)
      {
         this.customMC.percent2MC._visible = false;
         _loc4_ = 558;
      }
      else
      {
         this.customMC.percent2MC._visible = true;
      }
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc2_);
      com.rockstargames.ui.utils.Colour.Colourise(this.customMC.tipText.bgMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      this.customMC.tipText._visible = this.customMC.tipText.label.text.length > 0;
   }
   function SET_TIP_TEXT(text)
   {
      if(this.customMC.tipText != undefined)
      {
         this.customMC.tipText.label.autoSize = "left";
         this.customMC.tipText.label.text = text;
         this.customMC.tipText._visible = text.length > 0;
         this.customMC.tipText.bgMC._height = this.customMC.tipText.label.textHeight + 9;
      }
   }
   function setControlsText(tf, str)
   {
      if(str != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(tf,str.toUpperCase(),true,false,-2);
      }
   }
   function SET_TITLE(title)
   {
      var _loc16_;
      var _loc13_;
      var _loc12_;
      var _loc11_;
      var _loc10_;
      var _loc9_;
      var _loc14_;
      var _loc8_;
      var _loc3_;
      var _loc6_;
      var _loc7_;
      var _loc4_;
      var _loc5_;
      var _loc15_;
      if(this.state == com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_AUDIO)
      {
         _loc16_ = arguments[1];
         _loc13_ = arguments[2];
         _loc12_ = arguments[3];
         _loc11_ = arguments[4];
         _loc10_ = arguments[5];
         _loc9_ = ["fw","fm","fn"];
         _loc14_ = ["rb","rm","rs"];
         _loc8_ = 30;
         _loc3_ = 0;
         while(_loc3_ < _loc9_.length)
         {
            _loc6_ = 100;
            _loc7_ = 100;
            _loc4_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
            _loc5_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
            if(_loc3_ == _loc13_ - 1)
            {
               if(_loc11_ != undefined)
               {
                  _loc4_ = _loc11_;
               }
            }
            else
            {
               _loc6_ = _loc8_;
            }
            if(_loc3_ == _loc12_ - 1)
            {
               if(_loc10_ != undefined)
               {
                  _loc5_ = _loc10_;
               }
            }
            else
            {
               _loc7_ = _loc8_;
            }
            this.setSpeaker(_loc9_[_loc3_],_loc4_,_loc6_);
            this.setSpeaker(_loc14_[_loc3_],_loc5_,_loc7_);
            _loc3_ = _loc3_ + 1;
         }
         if(_loc16_)
         {
            this.customMC._alpha = 100;
            _loc15_ = 9;
            this.model.getCurrentView().visibleItems = _loc15_;
            com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView()).maxVisibleItems = _loc15_;
         }
         else
         {
            this.customMC._alpha = 0;
         }
      }
   }
   function setSpeaker(strID, col, a)
   {
      var _loc3_ = this.customMC.surroundMC;
      var _loc7_;
      var _loc9_;
      var _loc6_;
      var _loc8_;
      var _loc2_;
      if(_loc3_ != undefined)
      {
         _loc7_ = _loc3_["LineR" + strID];
         _loc9_ = _loc3_["LineL" + strID];
         _loc6_ = _loc3_["R" + strID];
         _loc8_ = _loc3_["L" + strID];
         if(a == undefined)
         {
            a = 100;
         }
         if(col == undefined)
         {
            col = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
         }
         _loc2_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(col,_loc2_);
         com.rockstargames.ui.utils.Colour.Colourise(_loc7_,_loc2_.r,_loc2_.g,_loc2_.b,a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc9_,_loc2_.r,_loc2_.g,_loc2_.b,a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc6_,_loc2_.r,_loc2_.g,_loc2_.b,a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc8_,_loc2_.r,_loc2_.g,_loc2_.b,a);
      }
   }
   function createTexture(txD, txN, txX, txY, txW, txH)
   {
      if(this.imgLdr == undefined)
      {
         this.imgLdr = com.rockstargames.ui.media.ImageLoaderMC(this.customMC.attachMovie("GenericImageLoader","imgLdr",this.customMC.getNextHighestDepth(),{_x:txX,_y:txY}));
      }
      var _loc3_;
      var _loc2_;
      var _loc4_;
      if(!this.imgLdr.isLoaded && this.imgLdr.textureDict != txD && this.imgLdr.textureFilename != txN)
      {
         if(this.imgLdr.isLoaded)
         {
            this.imgLdr.removeTxdRef();
         }
         this.imgLdr.init("PAUSE_MENU_SP_CONTENT",txD,txN,!txW ? 256 : txW,!txH ? 64 : txH);
         _loc3_ = 3;
         _loc2_ = String(this.imgLdr).split(".");
         _loc4_ = _loc2_.slice(_loc2_.length - _loc3_).join(".");
         this.imgLdr.requestTxdRef(_loc4_,false,this.textureLoaded,this);
      }
   }
   function textureLoaded()
   {
      if(this.state != com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_CONTROLS)
      {
         this.imgLdr._alpha = 0;
         return undefined;
      }
      this.imgLdr._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imgLdr,0.1,{_alpha:100});
   }
   function SET_DESCRIPTION(description, txD, txN, txX, txY, txW, txH)
   {
      var _loc2_;
      var _loc0_;
      var _loc4_;
      var _loc5_;
      var _loc3_;
      switch(this.state)
      {
         case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_SOCIAL:
            if(this.customMC != undefined)
            {
               _loc2_ = this.customMC.descriptionTF;
               _loc2_.autoSize = true;
               _loc2_.multiline = true;
               _loc2_.html = true;
               _loc2_.htmlText = description;
               this.customMC.bgMC._visible = _loc0_ = true;
               this.customMC.headerBGMC._visible = _loc0_;
               this.createTexture(txD,txN,txX,txY,txW,txH);
            }
            break;
         case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_CONTROLS:
            if(description == "" || description == undefined)
            {
               this.model.getCurrentView().viewContainer._y = 0;
               this.model.getCurrentView().visibleItems = 16;
               com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView()).maxVisibleItems = 16;
               this.customMC._visible = false;
            }
            else
            {
               _loc4_ = this.state != com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_SOCIAL ? 2 : 0;
               _loc5_ = Math.round(this.customMC._y + this.customMC.bgMC._height) + _loc4_;
               _loc3_ = this.customLinkageRows[this.state - 1];
               this.model.getCurrentView().viewContainer._y = _loc5_;
               this.model.getCurrentView().visibleItems = _loc3_;
               com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView()).maxVisibleItems = _loc3_;
               this.customMC._visible = true;
            }
         default:
            return;
      }
   }
   function ON_DESTROY()
   {
      if(this.imgLdr.isLoaded == true)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.imgLdr);
         this.imgLdr.removeTxdRef();
      }
   }
   function resetVisibleItems()
   {
      if(this.imgLdr != undefined && this.imgLdr.isLoaded == true)
      {
         this.imgLdr.removeTxdRef();
      }
      if(this.customMC != undefined)
      {
         this.customMC.removeMovieClip();
         this.imgLdr = undefined;
      }
      com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView()).bgMC._visible = false;
      this.model.getCurrentView().viewContainer._y = 0;
      this.model.getCurrentView().visibleItems = 16;
      com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView()).maxVisibleItems = 16;
      com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView()).index = 0;
   }
   function SET_STATE(i)
   {
      this.state = i;
      this.resetVisibleItems();
      var _loc7_;
      var _loc8_;
      var _loc3_;
      var _loc9_;
      var _loc6_;
      var _loc4_;
      var _loc5_;
      var _loc2_;
      var _loc0_;
      if(this.state != 0)
      {
         _loc7_ = this.customLinkageList[this.state - 1];
         _loc8_ = this.customLinkageRows[this.state - 1];
         this.customMC = this.CONTENT.attachMovie(_loc7_,_loc7_ + "MC",this.CONTENT.getNextHighestDepth());
         _loc3_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         com.rockstargames.ui.utils.Colour.Colourise(this.customMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
         _loc9_ = this.state != com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_SOCIAL ? 2 : 0;
         _loc6_ = Math.round(this.customMC._y + this.customMC.bgMC._height) + _loc9_;
         switch(this.state)
         {
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_AUDIO:
               this.customMC._y = 0;
               this.customMC._visible = false;
               this.customMC._alpha = 0;
               _loc6_ = 0;
               break;
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_CONTROLS:
               _loc4_ = new com.rockstargames.ui.utils.HudColour();
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
               com.rockstargames.ui.utils.Colour.Colourise(this.customMC.controllerText,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
               _loc5_ = {};
               _loc5_.textureDictionary = "";
               _loc5_.textureName = "";
               com.rockstargames.ui.game.GameInterface.call("GET_CONTROLLER_IMG",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,_loc5_);
               break;
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_SOCIAL:
               _loc2_ = new com.rockstargames.ui.utils.HudColour();
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FACEBOOK_BLUE,_loc2_);
               com.rockstargames.ui.utils.Colour.Colourise(this.customMC.headerBGMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
               com.rockstargames.ui.utils.Colour.Colourise(this.customMC.footerBGMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
               this.customMC.bgMC._visible = _loc0_ = false;
               this.customMC.headerBGMC._visible = _loc0_;
               break;
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_VIDMEM:
               this.customMC._y = 0;
               break;
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_VIDMEM_2:
               this.customMC._y = 0;
         }
         this.model.getCurrentView().viewContainer._y = _loc6_;
         this.model.getCurrentView().visibleItems = _loc8_;
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView()).maxVisibleItems = _loc8_;
      }
      else
      {
         if(this.customMC != undefined)
         {
            this.customMC.removeMovieClip();
         }
         this.model.getCurrentView().viewContainer._y = 0;
         this.model.getCurrentView().visibleItems = 16;
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView()).maxVisibleItems = 16;
      }
   }
   function SET_FOCUS(isFocused)
   {
      this.columnIsFocused = isFocused;
      this.SEND_COLUMN_PARAMS();
      if(isFocused)
      {
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsModel(this.model).highlightNext();
      }
      else
      {
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsModel(this.model).clearHighlight();
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      var _loc2_ = 0;
      var _loc3_;
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
      {
         this.model.prevItem();
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
      {
         this.model.nextItem();
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADRIGHT)
      {
         _loc2_ = this.model.getCurrentView().highlightedItem;
         _loc3_ = this.model.getCurrentView().itemList;
         _loc3_[_loc2_].stepVal(1);
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADLEFT)
      {
         _loc2_ = this.model.getCurrentView().highlightedItem;
         _loc3_ = this.model.getCurrentView().itemList;
         _loc3_[_loc2_].stepVal(-1);
      }
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView());
      _loc2_.index = i;
   }
   function SET_CHANGED(menuIndex, isChanged)
   {
      var _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView());
      var _loc5_;
      var _loc4_;
      if(menuIndex < 0)
      {
         _loc5_ = menuIndex >= 0 ? menuIndex : _loc2_.highlightedItem;
         _loc4_ = _loc2_.itemList;
         _loc4_[_loc5_].isChanged = isChanged;
      }
      else
      {
         _loc2_.setActiveStateToDataList(menuIndex,isChanged);
      }
   }
   function REFRESH_CHANGED()
   {
      var _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView(this.model.getCurrentView());
      _loc2_.refreshStoredToItemList();
   }
}
