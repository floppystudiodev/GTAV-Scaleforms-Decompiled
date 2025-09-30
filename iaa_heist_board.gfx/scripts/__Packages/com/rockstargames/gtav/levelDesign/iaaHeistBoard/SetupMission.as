class com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission
{
   var activeNavigationElements;
   var descriptions;
   var finalStat;
   var finalState;
   var finalTexture;
   var index;
   var isActive;
   var lockedMessage;
   var prep1Stat;
   var prep1State;
   var prep1Texture;
   var prep2Stat;
   var prep2State;
   var prep2Texture;
   var titleIndex;
   var titles;
   var txd;
   var view;
   static var STATE_NULL = -1;
   static var STATE_AVAILABLE = 0;
   static var STATE_LOCKED = 1;
   static var STATE_COMPLETE = 2;
   static var STATE_STOLEN = 3;
   static var STATE_PURCHASED = 4;
   static var STATUS_HIDDEN_Y = 19;
   static var STATUS_SHOWING_Y = 42;
   function SetupMission()
   {
      this.activeNavigationElements = [];
      this.isActive = false;
      this.titles = [];
      this.descriptions = [];
      this.titleIndex = -1;
      this.init(-1,"","",-1,"","","",-1,"","","",-1,"","","","","","");
   }
   function init(index, prep1Title, prep1Description, prep1State, prep1Texture, prep2Title, prep2Description, prep2State, prep2Texture, finalTitle, finalDescription, finalState, finalTexture, lockedMessage, prep1Stat, prep2Stat, finalStat, txd)
   {
      if(prep1Stat == undefined)
      {
         prep1Stat = "";
      }
      if(prep2Stat == undefined)
      {
         prep2Stat = "";
      }
      if(finalStat == undefined)
      {
         finalStat = "";
      }
      var _loc10_ = this.prep1Texture != prep1Texture;
      var _loc9_ = this.prep2Texture != prep2Texture;
      var _loc4_ = this.finalTexture != finalTexture;
      this.index = index;
      this.titles[0] = prep1Title.toUpperCase();
      this.descriptions[0] = prep1Description;
      this.prep1State = prep1State;
      this.prep1Stat = prep1Stat;
      this.prep1Texture = prep1Texture;
      this.titles[1] = prep2Title.toUpperCase();
      this.descriptions[1] = prep2Description;
      this.prep2State = prep2State;
      this.prep2Stat = prep2Stat;
      this.prep2Texture = prep2Texture;
      this.titles[2] = finalTitle.toUpperCase();
      this.descriptions[2] = finalDescription;
      this.finalState = finalState;
      this.finalStat = finalStat;
      this.finalTexture = finalTexture;
      this.lockedMessage = lockedMessage;
      this.txd = txd;
      if(this.view)
      {
         this.setText();
         if(_loc10_ && prep1State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL)
         {
            this.loadTexture(prep2State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL ? this.view.prep1Single.texture : this.view.prep1Double.texture,prep1Texture);
         }
         if(_loc9_ && prep2State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL)
         {
            this.loadTexture(this.view.prep2.texture,prep2Texture);
         }
         if(_loc4_ && finalState != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL)
         {
            this.loadTexture(this.view.final.texture,finalTexture);
         }
         this.view.prep1Double._visible = prep2State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL;
         this.view.prep1Single._visible = prep2State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL;
         this.view.prep2._visible = prep2State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL;
      }
   }
   function setView(view, textPrintManager)
   {
      if(view != this.view)
      {
         this.view = view;
         this.setText(textPrintManager);
         this.setNavigationElements();
         this.updateHighlights(-1);
         this.loadTexture(this.prep2State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL ? view.prep1Single.texture : view.prep1Double.texture,this.prep1Texture);
         this.loadTexture(view.prep2.texture,this.prep2Texture);
         this.loadTexture(view.final.texture,this.finalTexture);
         view.prep1Double._visible = this.prep2State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL;
         view.prep1Single._visible = this.prep2State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL;
         view.prep2._visible = this.prep2State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL;
         this.updateActiveView();
      }
      view._visible = this.prep1State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL || this.prep2State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL || this.finalState != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL;
   }
   function updateHighlights(activeElementID)
   {
      if(!this.view)
      {
         return undefined;
      }
      var _loc7_ = false;
      var _loc3_ = 0;
      var _loc5_ = this.activeNavigationElements.length;
      var _loc4_;
      var _loc2_;
      while(_loc3_ < _loc5_)
      {
         _loc4_ = this.activeNavigationElements[_loc3_];
         _loc2_ = _loc4_.view._parent;
         if(_loc4_.id == activeElementID)
         {
            _loc7_ = true;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.status,0.2,{_y:com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATUS_SHOWING_Y});
            _loc2_.inactive._visible = false;
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.status,0.2,{_y:com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATUS_HIDDEN_Y});
            _loc2_.inactive._visible = true;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this.isActive != _loc7_)
      {
         this.isActive = _loc7_;
         this.updateActiveView();
      }
   }
   function updateTitle(activeElementID, textPrintManager, delay)
   {
      if(!this.view)
      {
         return undefined;
      }
      var _loc3_ = Math.floor((activeElementID - 1) / 3);
      var _loc4_ = (activeElementID - 1) % 3;
      var _loc2_;
      if(_loc3_ == this.index)
      {
         _loc2_ = _loc4_;
      }
      else if(this.prep1State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_AVAILABLE)
      {
         _loc2_ = 0;
      }
      else if(this.prep2State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_AVAILABLE)
      {
         _loc2_ = 1;
      }
      else if(this.finalState == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_AVAILABLE)
      {
         _loc2_ = 2;
      }
      else if(this.prep1State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_LOCKED && (this.prep2State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_LOCKED || this.prep2State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL) && this.finalState == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_LOCKED)
      {
         _loc2_ = 0;
      }
      else
      {
         _loc2_ = 2;
      }
      if(this.titleIndex != _loc2_)
      {
         this.titleIndex = _loc2_;
         this.view.titleBlock.title.label.textAutoSize = "shrink";
         if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
         {
            this.view.titleBlock.title.label.text = this.titles[this.titleIndex].toUpperCase();
         }
         else
         {
            textPrintManager.printText(this.titles[this.titleIndex].toUpperCase(),this.view.titleBlock.title.label,delay * 5,2);
         }
         textPrintManager.printText(this.descriptions[this.titleIndex],this.view.titleBlock.description.label,delay * 5,1);
      }
   }
   function updateActiveView()
   {
      this.view.inactive._visible = !this.isActive;
      var _loc2_ = !this.isActive ? 0 : 100;
      this.view.prep1Double.inactive._alpha = _loc2_;
      this.view.prep1Single.inactive._alpha = _loc2_;
      this.view.prep2.inactive._alpha = _loc2_;
      this.view.final.inactive._alpha = _loc2_;
      this.view.prep1Double.outline._visible = this.isActive;
      this.view.prep1Single.outline._visible = this.isActive;
      this.view.prep2.outline._visible = this.isActive;
      this.view.final.outline._visible = this.isActive;
      this.view.titleBlock.gotoAndStop(!this.isActive ? "inactive" : "active");
   }
   function clearView()
   {
      this.view = null;
   }
   function get numComplete()
   {
      var _loc2_ = 0;
      if(this.prep1State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_COMPLETE || this.prep1State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_STOLEN || this.prep1State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_PURCHASED)
      {
         _loc2_ = _loc2_ + 1;
      }
      if(this.prep2State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_COMPLETE || this.prep2State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_STOLEN || this.prep2State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_PURCHASED)
      {
         _loc2_ = _loc2_ + 1;
      }
      if(this.finalState == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_COMPLETE || this.finalState == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_STOLEN || this.finalState == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_PURCHASED)
      {
         _loc2_ = _loc2_ + 1;
      }
      return _loc2_;
   }
   function get numAvailable()
   {
      var _loc2_ = 0;
      if(this.prep1State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_AVAILABLE)
      {
         _loc2_ = _loc2_ + 1;
      }
      if(this.prep2State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_AVAILABLE)
      {
         _loc2_ = _loc2_ + 1;
      }
      if(this.finalState == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_AVAILABLE)
      {
         _loc2_ = _loc2_ + 1;
      }
      return _loc2_;
   }
   function get numLocked()
   {
      var _loc2_ = 0;
      if(this.prep1State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_LOCKED)
      {
         _loc2_ = _loc2_ + 1;
      }
      if(this.prep2State == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_LOCKED)
      {
         _loc2_ = _loc2_ + 1;
      }
      if(this.finalState == com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_LOCKED)
      {
         _loc2_ = _loc2_ + 1;
      }
      return _loc2_;
   }
   function get isInUse()
   {
      return this.finalState != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL;
   }
   function setText(textPrintManager)
   {
      this.view.titleBlock.digit.label.text = this.index != -1 ? ("0" + (this.index + 1)).substr(-2) : "";
      this.setEllipsis(this.titles[0],this.view.prep1Single.title);
      this.setEllipsis(this.titles[0],this.view.prep1Double.title);
      this.setEllipsis(this.titles[1],this.view.prep2.title);
      this.setEllipsis(this.titles[2],this.view.final.title);
      var _loc2_;
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         _loc2_ = this.view.prep1Single.title.getTextFormat();
         _loc2_.size = 20;
         this.view.prep1Single.title.setTextFormat(_loc2_);
         _loc2_ = this.view.prep1Double.title.getTextFormat();
         _loc2_.size = 20;
         this.view.prep1Double.title.setTextFormat(_loc2_);
         _loc2_ = this.view.prep2.title.getTextFormat();
         _loc2_.size = 20;
         this.view.prep2.title.setTextFormat(_loc2_);
         _loc2_ = this.view.final.title.getTextFormat();
         _loc2_.size = 20;
         this.view.final.title.setTextFormat(_loc2_);
      }
      this.setState(this.view.prep1Single.status,this.prep1State,this.prep1Stat);
      this.setState(this.view.prep1Double.status,this.prep1State,this.prep1Stat);
      this.setState(this.view.prep2.status,this.prep2State,this.prep2Stat);
      this.setState(this.view.final.status,this.finalState,this.finalStat,this.lockedMessage);
   }
   function setState(block, state, stat, lockedMessage)
   {
      var _loc3_;
      switch(state)
      {
         case com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_AVAILABLE:
            block.gotoAndStop("available");
            block._parent.complete._visible = false;
            block._parent.statusBG._visible = false;
            this.setLocalisedText(block.label,"IAA_LAUNCH");
            break;
         case com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_COMPLETE:
            block.gotoAndStop("complete");
            block._parent.complete._visible = true;
            block._parent.complete.gotoAndStop("complete");
            block._parent.statusBG._visible = true;
            block._parent.statusBG.gotoAndStop("complete");
            this.setLocalisedText(block.label,"IAA_COMPLETE");
            block._parent.complete.label.text = "";
            break;
         case com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_STOLEN:
            block.gotoAndStop("complete");
            block._parent.complete._visible = true;
            block._parent.complete.gotoAndStop("stolen");
            block._parent.statusBG._visible = true;
            block._parent.statusBG.gotoAndStop("complete");
            this.setLocalisedText(block.label,"IAA_COMPLETE");
            block._parent.complete.label.verticalAlign = "bottom";
            this.setLocalisedText(block._parent.complete.label,"IAA_STOLEN");
            if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
            {
               _loc3_ = block._parent.complete.label.getTextFormat();
               _loc3_.size = 20;
               block._parent.complete.label.setTextFormat(_loc3_);
            }
            if(block._parent.complete.labelBG)
            {
               block._parent.complete.labelBG._height = block._parent.complete.label.bottomScroll != 1 ? 55 : 30;
               block._parent.complete.labelBG._y = block._parent.complete.label.bottomScroll != 1 ? 0 : 23;
            }
            break;
         case com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_PURCHASED:
            block.gotoAndStop("complete");
            block._parent.complete._visible = true;
            block._parent.complete.gotoAndStop("purchased");
            block._parent.statusBG._visible = true;
            block._parent.statusBG.gotoAndStop("complete");
            this.setLocalisedText(block.label,"IAA_COMPLETE");
            block._parent.complete.label.verticalAlign = "bottom";
            this.setLocalisedText(block._parent.complete.label,"IAA_PURCHASED");
            if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
            {
               _loc3_ = block._parent.complete.label.getTextFormat();
               _loc3_.size = 20;
               block._parent.complete.label.setTextFormat(_loc3_);
            }
            if(block._parent.complete.labelBG)
            {
               block._parent.complete.labelBG._height = block._parent.complete.label.bottomScroll != 1 ? 55 : 30;
               block._parent.complete.labelBG._y = block._parent.complete.label.bottomScroll != 1 ? 0 : 23;
            }
            break;
         case com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_LOCKED:
            block.gotoAndStop("locked");
            block._parent.complete._visible = false;
            block._parent.statusBG._visible = true;
            block._parent.statusBG.gotoAndStop("locked");
            if(lockedMessage == undefined || lockedMessage.length == 0)
            {
               this.setLocalisedText(block.label,"IAA_LOCKED");
               break;
            }
            block.label.text = lockedMessage;
            break;
         default:
            block.gotoAndStop("available");
            block._parent.complete._visible = false;
            block._parent.statusBG._visible = false;
            block.label.text = "";
      }
      block.stat.autoSize = "right";
      block.stat.text = stat;
      block.label._width = block.stat._x - block.label._x;
      block.label.textAutoSize = "shrink";
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(block);
      block._y = com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATUS_HIDDEN_Y;
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         _loc3_ = block.label.getTextFormat();
         _loc3_.size = 20;
         block.label.setTextFormat(_loc3_);
      }
   }
   function setNavigationElements()
   {
      this.activeNavigationElements.length = 0;
      if(this.prep2State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL)
      {
         if(this.prep1State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL)
         {
            this.activeNavigationElements.push(new com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationElement(this.view.prep1Single.nav,com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["SETUP_MISSION_" + this.index + "_PREP_1"]));
         }
         this.activeNavigationElements.push(new com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationElement(this.view.prep2.nav,com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["SETUP_MISSION_" + this.index + "_PREP_2"]));
      }
      else if(this.prep1State != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL)
      {
         this.activeNavigationElements.push(new com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationElement(this.view.prep1Double.nav,com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["SETUP_MISSION_" + this.index + "_PREP_1"]));
      }
      if(this.finalState != com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission.STATE_NULL)
      {
         this.activeNavigationElements.push(new com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationElement(this.view.final.nav,com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["SETUP_MISSION_" + this.index + "_FINAL"]));
      }
   }
   function loadTexture(mc, texture)
   {
      if(texture.length > 0 && this.txd.length > 0)
      {
         com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.imageManager.addImage(this.txd,texture,mc);
      }
   }
   function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   function setEllipsis(label, tf)
   {
      tf.text = label;
      var _loc1_;
      if(tf.textWidth > tf._width - 4)
      {
         _loc1_ = label.length;
         while(_loc1_ > 0)
         {
            tf.text = label.substring(0,_loc1_) + "...";
            if(tf.textWidth <= tf._width - 4)
            {
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
}
