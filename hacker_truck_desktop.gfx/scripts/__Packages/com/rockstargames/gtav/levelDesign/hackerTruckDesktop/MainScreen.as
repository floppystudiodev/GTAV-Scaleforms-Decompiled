class com.rockstargames.gtav.levelDesign.hackerTruckDesktop.MainScreen extends com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen
{
   var _buttons;
   var app;
   var cursor;
   var jobButtons;
   var missionButtons;
   var overlay;
   var slideshow;
   var view;
   function MainScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"mainScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.missionButtons = [];
      this.initMissionButton(com.rockstargames.gtav.levelDesign.hackerTruckDesktop.ButtonIDs.WORK,this.view.workButton,"HTD_WORK","HTD_WORK_DESC",1,1);
      this.initMissionButton(com.rockstargames.gtav.levelDesign.hackerTruckDesktop.ButtonIDs.AIR_FREIGHT,this.view.airFreightButton,"HTD_AIR","HTD_AIR_DESC",2,2);
      this.initMissionButton(com.rockstargames.gtav.levelDesign.hackerTruckDesktop.ButtonIDs.SPECIAL_CARGO,this.view.specialCargoButton,"HTD_SPEC","HTD_SPEC_DESC",3,3);
      this.initMissionButton(com.rockstargames.gtav.levelDesign.hackerTruckDesktop.ButtonIDs.VEHICLE_CARGO,this.view.vehicleCargoButton,"HTD_VEH","HTD_VEH_DESC",4,4);
      this.initMissionButton(com.rockstargames.gtav.levelDesign.hackerTruckDesktop.ButtonIDs.GUNRUNNING_SUPPLIES,this.view.gunrunningSuppliesButton,"HTD_GUN","HTD_GUN_DESC",5,5);
      this.initMissionButton(com.rockstargames.gtav.levelDesign.hackerTruckDesktop.ButtonIDs.BIKER_SUPPLIES,this.view.bikerSuppliesButton,"HTD_BIKER","HTD_BIKER_DESC",6,6);
      this.jobButtons = [];
      var _loc3_ = 0;
      while(_loc3_ < 9)
      {
         this.jobButtons.push(new com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Button(com.rockstargames.gtav.levelDesign.hackerTruckDesktop.ButtonIDs["JOB_" + _loc3_],this.view.jobOverlay.panel["jobButton" + _loc3_]));
         _loc3_ = _loc3_ + 1;
      }
      this.view.jobOverlay._visible = false;
      this.view.jobOverlay.panel.tooltip.label.autoSize = "left";
      this.cursor.setTargetRects(this._buttons);
      this.slideshow = new com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Slideshow();
      this.update();
   }
   function initMissionButton(id, view, title, description, iconFrame, imageFrame)
   {
      var _loc4_ = new com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Button(id,view);
      view.title.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.setLocalisedText(view.title.label,title);
      com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.setLocalisedText(view.description.label,description);
      var _loc3_;
      if(this.app.displayConfig.isAsian)
      {
         _loc3_ = view.description.label.getTextFormat();
         _loc3_.leading = 2;
         view.description.label.setTextFormat(_loc3_);
      }
      view.icon.gotoAndStop(iconFrame);
      view.image.gotoAndStop(imageFrame);
      this.missionButtons.push(_loc4_);
      this._buttons.push(_loc4_);
   }
   function update()
   {
      var _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < this.app.missionStates.length)
      {
         _loc3_ = this.missionButtons[_loc2_].view;
         _loc4_ = this.app.missionStates[_loc2_];
         _loc3_.padlock._visible = !_loc4_;
         _loc3_.image._alpha = !_loc4_ ? 30 : 100;
         _loc3_.cooldown.text = this.app.missionCooldowns[_loc2_] <= 0 ? "" : com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.formatTime(this.app.missionCooldowns[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function showJobOverlay(missionIndex, title, jobs)
   {
      this.stopSlideshow();
      var _loc3_ = 0;
      var _loc4_ = this.missionButtons.length;
      var _loc5_;
      while(_loc3_ < _loc4_)
      {
         this.missionButtons[_loc3_].view.gotoAndStop("off");
         _loc5_ = (button.view.image._currentFrame - 1) % _loc4_ + 1;
         button.view.image.gotoAndStop(_loc5_);
         _loc3_ = _loc3_ + 1;
      }
      this.view.jobOverlay.panel._x = this.missionButtons[missionIndex].view._x;
      this.view.jobOverlay.panel._y = this.missionButtons[missionIndex].view._y;
      this.view.jobOverlay.panel.title.verticalAlign = "center";
      this.view.jobOverlay.panel.title.text = title.toUpperCase();
      this.view.jobOverlay.panel.icon.gotoAndStop(missionIndex + 1);
      var _loc9_ = this.view.jobOverlay.panel._x >= 0.5 * com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Screen.STAGE_WIDTH ? -1 : 1;
      this.view.jobOverlay.panel.tooltip._x = _loc9_ * Math.abs(this.view.jobOverlay.panel.tooltip._x);
      this.view.jobOverlay.panel.tooltip._visible = false;
      this._buttons.length = 0;
      var _loc6_ = this.jobButtons[0].view._y;
      _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < this.jobButtons.length)
      {
         var button = this.jobButtons[_loc3_];
         _loc2_ = jobs[_loc3_];
         if(_loc2_.title.length > 0)
         {
            button.updateBounds();
            this._buttons.push(button);
            if(_loc2_.valueType == com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Job.VALUE_TYPE_CASH)
            {
               this.updateRightAlignedCost(button.view,_loc2_.salePrice > 0,_loc2_.value,_loc2_.salePrice);
               button.view._alpha = !_loc2_.isAvailable ? 50 : 100;
               button.view.padlock._visible = false;
            }
            else if(_loc2_.valueType == com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Job.VALUE_TYPE_SECONDS)
            {
               button.view.value.text = _loc2_.value <= 0 ? "" : com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.formatTime(_loc2_.value);
               button.view.strikethrough._visible = false;
               button.view._alpha = !(_loc2_.value == 0 && _loc2_.isAvailable) ? 50 : 100;
               button.view.padlock._visible = _loc2_.value == 0 && !_loc2_.isAvailable;
            }
            else
            {
               button.view.value.text = "";
               button.view.strikethrough._visible = false;
               button.view._alpha = !_loc2_.isAvailable ? 50 : 100;
               button.view.padlock._visible = !_loc2_.isAvailable;
            }
            button.view.label._width = button.view.value._width - button.view.value.textWidth - 10;
            com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.truncate(button.view.label,_loc2_.title);
            button.view._visible = true;
            _loc6_ = button.view._y + button.view._height;
         }
         else
         {
            button.view._visible = false;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.view.jobOverlay.panel.bg._height = _loc6_ + 1;
      this.view.jobOverlay.panel.bottomCorners._y = _loc6_ + 1;
      this.view.jobOverlay._visible = true;
      if(!this.overlay.isShowing)
      {
         this.cursor.setTargetRects(this._buttons);
         this.onTargetChange(this.cursor.getTargetIDUnderCursor());
      }
   }
   function updateRightAlignedCost(panel, isOnSale, originalCost, saleCost)
   {
      var _loc1_ = panel.value;
      var _loc2_ = panel.strikethrough;
      _loc1_.textAutoSize = "none";
      var _loc3_;
      var _loc4_;
      if(isOnSale)
      {
         _loc3_ = "$" + com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.formatNumber(originalCost);
         _loc4_ = saleCost <= 0 ? "  " + com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.setLocalisedText(_loc1_,"CLUB_FREE") : "  $" + com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.formatNumber(saleCost);
         _loc1_.text = _loc4_ + "  " + _loc3_;
         if(_loc1_.textWidth > _loc1_._width)
         {
            _loc1_.textAutoSize = "shrink";
            _loc2_._width = _loc1_._x + _loc1_.getExactCharBoundaries(_loc3_.length - 1).right + 4;
         }
         else
         {
            _loc1_.text = _loc3_;
            _loc2_._width = _loc1_.textWidth + 4;
            _loc1_.text = _loc4_ + "  " + _loc3_;
         }
         _loc2_._x = _loc1_._x + _loc1_._width - _loc2_._width;
         _loc2_._visible = true;
      }
      else if(originalCost <= 0)
      {
         com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.setLocalisedText(_loc1_,"CLUB_FREE");
         _loc2_._visible = false;
      }
      else
      {
         _loc1_.text = "$" + com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.formatNumber(originalCost);
         _loc2_._visible = false;
      }
   }
   function hideJobOverlay()
   {
      if(this.view.jobOverlay._visible && !this.overlay.isShowing)
      {
         this._buttons = [].concat(this.missionButtons);
         this.cursor.setTargetRects(this._buttons);
         this.view.jobOverlay._visible = false;
      }
   }
   function updateCooldown(index)
   {
      var _loc2_;
      var _loc3_;
      if(this.view.jobOverlay._visible)
      {
         _loc2_ = this.app.jobs[index];
         if(_loc2_.valueType == com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Job.VALUE_TYPE_SECONDS)
         {
            _loc3_ = this.jobButtons[index].view;
            _loc3_.value.text = _loc2_.value <= 0 ? "" : com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.formatTime(_loc2_.value);
            _loc3_._alpha = !(_loc2_.value == 0 && _loc2_.isAvailable) ? 50 : 100;
            _loc3_.padlock._visible = _loc2_.value == 0 && !_loc2_.isAvailable;
         }
      }
   }
   function onTargetChange(targetID)
   {
      super.onTargetChange(targetID);
      this.stopSlideshow();
      var _loc4_ = 0;
      var _loc8_ = this.missionButtons.length;
      var _loc6_;
      var _loc5_;
      while(_loc4_ < _loc8_)
      {
         _loc6_ = this.missionButtons[_loc4_];
         if(_loc6_.enabled && !_loc6_.view.padlock._visible)
         {
            _loc5_ = (_loc6_.view.image._currentFrame - 1) % _loc8_ + 1;
            if(_loc6_.id == targetID)
            {
               _loc6_.view.image.gotoAndStop(_loc5_ + _loc8_);
               this.startSlideshow(_loc6_.view.image.slideshow);
            }
            else
            {
               _loc6_.view.image.gotoAndStop(_loc5_);
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      var _loc10_ = false;
      var _loc3_ = this.view.jobOverlay.panel.tooltip;
      _loc4_ = 0;
      _loc8_ = this.jobButtons.length;
      var _loc7_;
      while(_loc4_ < _loc8_)
      {
         _loc6_ = this.jobButtons[_loc4_];
         if(_loc6_.id == targetID)
         {
            _loc7_ = this.app.jobs[_loc4_].tooltip;
            if(_loc7_.length > 0)
            {
               _loc3_._y = _loc6_.view._y;
               _loc3_.label.text = _loc7_;
               _loc3_.bg._height = _loc3_.label._y + _loc3_.label.textHeight + 15;
               _loc3_.bottomCorners._y = _loc3_.bg._height;
               _loc10_ = true;
            }
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc3_._visible = _loc10_;
   }
   function startSlideshow(slideshowView)
   {
      if(slideshowView != undefined)
      {
         this.slideshow.startSlideshow(slideshowView);
      }
   }
   function stopSlideshow()
   {
      this.slideshow.stopSlideshow();
   }
   function dispose()
   {
      this.slideshow.dispose();
      this.slideshow = null;
      this.missionButtons = null;
      this.jobButtons = null;
      super.dispose();
   }
}
