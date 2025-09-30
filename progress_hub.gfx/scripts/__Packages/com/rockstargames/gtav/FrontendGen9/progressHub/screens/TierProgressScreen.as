class com.rockstargames.gtav.FrontendGen9.progressHub.screens.TierProgressScreen extends com.rockstargames.gtav.FrontendGen9.progressHub.screens.Screen
{
   var _carousel;
   var _sticker;
   var app;
   var cursor;
   var dataObject;
   var screenDataArray;
   var screenDataObject;
   var scroller;
   var setUpLabel;
   var setUpText;
   var setupCarousel;
   var view;
   var informationArray = new Array();
   var numStatus = 4;
   var lastInformationArrayLength = 0;
   function TierProgressScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"TierProgressScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.setUpText(this.view.screenTitle,this.dataObject.screenTitle,false,"center");
      this.setUpText(this.view.messageText,this.dataObject.message,false,"center",-0.3);
      this.setUpLabel(this.view.rewardLabel,"PHUB_REWARD",false,"center",-0.3);
      this._sticker = com.rockstargames.gtav.FrontendGen9.progressHub.ui.Sticker(this.view.attachMovie("sticker","sticker",this.view.getNextHighestDepth(),{_x:60,_y:130}));
      this.setupCarousel();
      this.scroller = new com.rockstargames.gtav.FrontendGen9.progressHub.ui.Scroller(this.view.information,this.view.scrollContentMask,this.view.scrollHandle,this.view.scrollTrack);
   }
   function updateScreen(index)
   {
      this.screenDataObject = this.screenDataArray[index];
      this.setUpText(this.view.titleText,this.screenDataObject.title,true,"center");
      this.setUpText(this.view.rewardText,this.screenDataObject.reward,false,"center",-0.3);
      this.setUpText(this.view.messageText,this.dataObject.message,false,"center",-0.3);
      this.app.imageManager.addImage(this.screenDataObject.backgroundTXD,this.screenDataObject.backgroundImage,this.view.backgroundImage);
      if(this.screenDataObject.status == 3)
      {
         this._sticker.setStatus(5);
      }
      else
      {
         this._sticker.setStatus(this.screenDataObject.status);
      }
      var _loc2_;
      var _loc5_;
      _loc2_ = 0;
      while(_loc2_ < this.lastInformationArrayLength)
      {
         this.view.information["informationItem_" + _loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ = this.informationArray[index].length;
      _loc2_ = 0;
      var _loc4_;
      while(_loc2_ < _loc5_)
      {
         this.view.information.attachMovie("informationItem","informationItem_" + _loc2_,this.view.information.getNextHighestDepth());
         this.view.information["informationItem_" + _loc2_].textField.text = this.informationArray[index][_loc2_].informationText;
         this.view.information["informationItem_" + _loc2_].textField.wordWrap = true;
         this.view.information["informationItem_" + _loc2_].textField.autoSize = "left";
         _loc4_ = this.informationArray[index][_loc2_].status;
         if(_loc4_ < this.numStatus)
         {
            this.view.information["informationItem_" + _loc2_].icon.gotoAndStop(this.informationArray[index][_loc2_].status + 1);
         }
         else
         {
            this.view.information["informationItem_" + _loc2_].icon.gotoAndStop(1);
         }
         if(_loc4_ == 3)
         {
            this.view.information["informationItem_" + _loc2_].textField.textColor = 10066329;
         }
         else
         {
            this.view.information["informationItem_" + _loc2_].textField.textColor = 16777215;
         }
         if(this.informationArray[index][_loc2_].isSubItem)
         {
            this.view.information["informationItem_" + _loc2_]._x = 20;
         }
         if(_loc2_ > 0)
         {
            this.view.information["informationItem_" + _loc2_]._y = this.view.information["informationItem_" + (_loc2_ - 1)]._y + this.view.information["informationItem_" + (_loc2_ - 1)].textField.textHeight + 8;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.scroller.reset();
      this.scroller.update();
      this.lastInformationArrayLength = _loc5_;
      this._carousel.SHOW_CURRENT_ITEM();
   }
   function ADD_CAROUSEL_ITEM(itemDataObject)
   {
      this.informationArray.push(new Array());
      super.ADD_CAROUSEL_ITEM(itemDataObject);
   }
   function addInformation(newDataObject)
   {
      var _loc2_ = newDataObject.index;
      if(_loc2_ > -1 && _loc2_ < this.informationArray.length)
      {
         this.informationArray[_loc2_].push(newDataObject);
      }
   }
   function clearInformation(index)
   {
      this.informationArray[index] = [];
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
      var _loc5_;
      var _loc4_;
      var _loc2_;
      if(isMouseWheel)
      {
         if(y != 127)
         {
            if(this._carousel.bounds.containsPoint(this.cursor.getPosition()))
            {
               y += 0.17 * (127 - y);
               if(Math.abs(y - 127) > 1)
               {
                  _loc5_ = (y - 127) / 127;
                  _loc4_ = this._carousel.GET_INDEX();
                  if(_loc5_ < -0.5)
                  {
                     this._carousel.NAV_LEFT();
                     _loc2_ = this._carousel.GET_INDEX();
                     if(_loc2_ != _loc4_)
                     {
                        this.updateScreen(_loc2_);
                     }
                  }
                  else if(_loc5_ > 0.5)
                  {
                     this._carousel.NAV_RIGHT();
                     _loc2_ = this._carousel.GET_INDEX();
                     if(_loc2_ != _loc4_)
                     {
                        this.updateScreen(_loc2_);
                     }
                  }
               }
            }
            else
            {
               this.scroller.scrollBy(y,isMouseWheel);
            }
         }
      }
      else if(!isLeftStick)
      {
         this.scroller.scrollBy(y,isMouseWheel);
      }
   }
   function scrollbarIsShowing()
   {
      return this.scroller.showing;
   }
   function dispose()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.informationArray.length)
      {
         this.informationArray[_loc3_] = [];
         _loc3_ = _loc3_ + 1;
      }
      this.informationArray = [];
      this.scroller.dispose();
      this.scroller = null;
      super.dispose();
   }
}
