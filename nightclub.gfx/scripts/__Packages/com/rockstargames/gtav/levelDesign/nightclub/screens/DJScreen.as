class com.rockstargames.gtav.levelDesign.nightclub.screens.DJScreen extends com.rockstargames.gtav.levelDesign.nightclub.screens.Screen
{
   var _buttons;
   var app;
   var audioButtons;
   var baseButtons;
   var checkNavigationButtons;
   var currDJDictionaries;
   var currDJTextures;
   var cursor;
   var djPanelPositions;
   var djPanels;
   var overlay;
   var persistentContent;
   var selectButtonPositions;
   var selectButtons;
   var view;
   function DJScreen(app, viewContainer, cursor, persistentContent, overlay)
   {
      super(app,viewContainer,cursor,persistentContent,overlay,"djScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.persistentContent.updateNav(2);
      this.persistentContent.updatePopularityMeter();
      this.persistentContent.setPopularityMeterVisible(true);
      this.baseButtons = [].concat(this._buttons);
      this.initDJPanels();
      this.initDJSelectButtons();
      this.initAudioButtons();
      this.update();
   }
   function initDJPanels()
   {
      this.currDJTextures = [];
      this.currDJDictionaries = [];
      this.djPanelPositions = [];
      this.djPanels = [];
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_DJS)
      {
         _loc2_ = this.view["djPanel" + _loc3_];
         _loc2_._visible = false;
         _loc2_.label.textAutoSize = "shrink";
         this.djPanels.push(_loc2_);
         this.djPanelPositions[_loc3_] = new flash.geom.Point(_loc2_._x,_loc2_._y);
         _loc3_ = _loc3_ + 1;
      }
   }
   function initDJSelectButtons()
   {
      this.selectButtonPositions = [];
      this.selectButtons = [];
      var _loc3_ = 0;
      var _loc2_;
      var _loc4_;
      while(_loc3_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_DJS)
      {
         _loc2_ = this.view["selectButton" + _loc3_];
         _loc2_._visible = false;
         _loc2_.booked.label.autoSize = "left";
         _loc4_ = new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs["DJ_SELECT_" + _loc3_],_loc2_);
         _loc4_.enabled = false;
         this._buttons.push(_loc4_);
         this.selectButtons.push(_loc4_);
         this.selectButtonPositions[_loc3_] = new flash.geom.Point(_loc2_._x,_loc2_._y);
         _loc3_ = _loc3_ + 1;
      }
   }
   function initAudioButtons()
   {
      this.audioButtons = [];
      var _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_DJS)
      {
         _loc3_ = this.view["djPanel" + _loc2_].audioButton;
         _loc3_.icon.gotoAndStop("on");
         _loc4_ = new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs["DJ_AUDIO_" + _loc2_],_loc3_,"CLUB_AUDIO_PLAY",false);
         this._buttons.push(_loc4_);
         this.audioButtons[_loc2_] = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
   }
   function update()
   {
      var _loc7_ = 0;
      var _loc2_ = 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      var _loc6_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_DJS)
      {
         _loc3_ = this.app.djs[_loc2_];
         _loc5_ = _loc3_ != undefined && _loc3_.isAvailable;
         _loc4_ = this.djPanels[_loc2_];
         _loc6_ = this.selectButtons[_loc2_].view;
         if(_loc5_)
         {
            _loc4_.label.text = _loc3_.name;
            this.updateDJImage(_loc2_,_loc3_.texture,_loc3_.textureDictionary,_loc4_.image);
            this.showStatus(_loc3_,_loc6_);
            _loc4_._x = this.djPanelPositions[_loc7_].x;
            _loc4_._y = this.djPanelPositions[_loc7_].y;
            _loc6_._x = this.selectButtonPositions[_loc7_].x;
            _loc6_._y = this.selectButtonPositions[_loc7_].y;
            this.selectButtons[_loc2_].updateBounds();
            this.audioButtons[_loc2_].updateBounds();
            _loc7_ = _loc7_ + 1;
         }
         _loc4_._visible = _loc5_;
         _loc6_._visible = _loc5_;
         this.selectButtons[_loc2_].enabled = _loc5_;
         this.audioButtons[_loc2_].enabled = _loc5_;
         _loc2_ = _loc2_ + 1;
      }
      this.cursor.setTargetRects(this._buttons);
   }
   function updateAudioButton(index, isPlaying)
   {
      var _loc2_ = this.audioButtons[index].view;
      if(isPlaying)
      {
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(_loc2_.label,"CLUB_AUDIO_STOP");
         _loc2_.icon.gotoAndStop("off");
      }
      else
      {
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(_loc2_.label,"CLUB_AUDIO_PLAY");
         _loc2_.icon.gotoAndStop("on");
      }
   }
   function resetAudioButtons()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_DJS)
      {
         _loc3_ = this.audioButtons[_loc2_].view;
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(_loc3_.label,"CLUB_AUDIO_PLAY");
         _loc3_.icon.gotoAndStop("on");
         _loc2_ = _loc2_ + 1;
      }
   }
   function showStatus(dj, buttonView)
   {
      var _loc4_ = !dj.isSolo ? "_PLURAL" : (!dj.isMale ? "_F" : "_M");
      switch(dj.state)
      {
         case com.rockstargames.gtav.levelDesign.nightclub.structs.DJ.STATE_BOOK:
            com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(buttonView.label,"CLUB_DJ_BOOK");
            this.updateCost(buttonView,dj.isOnSale,dj.cost,dj.saleCost);
            buttonView.booked._visible = false;
            return;
         case com.rockstargames.gtav.levelDesign.nightclub.structs.DJ.STATE_COLLECT:
            this.showBooked(buttonView,"CLUB_DJ_COLLECT");
            return;
         case com.rockstargames.gtav.levelDesign.nightclub.structs.DJ.STATE_AVAILABLE:
            com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(buttonView.label,"CLUB_DJ_REBOOK");
            this.updateCost(buttonView,dj.isOnSale,dj.cost,dj.saleCost);
            buttonView.booked._visible = false;
            return;
         case com.rockstargames.gtav.levelDesign.nightclub.structs.DJ.STATE_RESIDENT:
            this.showBooked(buttonView,"CLUB_DJ_RESIDENT" + _loc4_);
            return;
         default:
            buttonView.label.text = "";
            buttonView.cost.text = "";
            buttonView.strikethrough._visible = false;
            buttonView.booked._visible = false;
            return;
      }
   }
   function showBooked(buttonView, label)
   {
      buttonView.label.text = "";
      buttonView.cost.text = "";
      buttonView.strikethrough._visible = false;
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(buttonView.booked.label,label);
      buttonView.booked._x = 0.5 * (buttonView._width - buttonView.booked._width);
      buttonView.booked._visible = true;
   }
   function updateCost(panel, isOnSale, originalCost, saleCost)
   {
      panel.cost.textAutoSize = "none";
      var _loc2_;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      if(isOnSale)
      {
         _loc2_ = "$" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(originalCost);
         _loc3_ = saleCost <= 0 ? "  " + com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(panel.cost,"CLUB_FREE") : "  $" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(saleCost);
         panel.cost.text = _loc2_ + _loc3_;
         if(panel.cost.textWidth > panel.cost._width)
         {
            panel.cost.textAutoSize = "shrink";
            panel.strikethrough._x = 0;
            panel.strikethrough._width = panel.cost.getExactCharBoundaries(_loc2_.length - 1).right + 4;
         }
         else
         {
            panel.cost.text = _loc2_;
            _loc5_ = panel.cost.textWidth;
            panel.cost.appendText(_loc3_);
            _loc4_ = panel.cost.textWidth;
            panel.strikethrough._x = 0.5 * (panel.cost._width - _loc4_) + panel.cost._x;
            panel.strikethrough._width = _loc5_ + 4;
         }
         panel.strikethrough._visible = true;
      }
      else if(originalCost <= 0)
      {
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(panel.cost,"CLUB_FREE");
         panel.strikethrough._visible = false;
      }
      else
      {
         panel.cost.text = "$" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(originalCost);
         panel.strikethrough._visible = false;
      }
   }
   function updateDJImage(index, texture, dictionary, imageView)
   {
      if(this.currDJTextures[index] != texture && this.currDJDictionaries[index] != dictionary)
      {
         this.currDJTextures[index] = texture;
         this.currDJDictionaries[index] = dictionary;
         this.app.imageManager.addImage(dictionary,texture,imageView);
      }
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.ACCEPT:
            this.handleAcceptButton(this.app.GET_CURRENT_SELECTION());
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.LB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.NIGHTCLUB_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.RB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.WAREHOUSE_SCREEN);
            }
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.CANCEL:
         default:
            return;
      }
   }
   function handleAcceptButton(id)
   {
      this.checkNavigationButtons(id);
   }
   function dispose()
   {
      this.baseButtons = null;
      this.selectButtons = null;
      this.audioButtons = null;
      this.djPanels = null;
      this.currDJTextures = null;
      this.currDJDictionaries = null;
      this.djPanelPositions = null;
      this.selectButtonPositions = null;
      super.dispose();
   }
}
