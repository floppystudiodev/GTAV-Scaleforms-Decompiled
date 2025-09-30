class com.rockstargames.gtav.levelDesign.starterPackBrowser.ItemScreen extends com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen
{
   var app;
   var buyButton;
   var cursor;
   var handleMin;
   var handleRange;
   var imageButton;
   var safeZoneRight;
   var scrollTimeDelta;
   var view;
   function ItemScreen(app, viewContainer, cursor, items, activeItem)
   {
      super(app,cursor,viewContainer,"itemScreen");
      this.init(items,activeItem);
   }
   function init(items, activeItem)
   {
      this.initSafeZone();
      this.scrollTimeDelta = 0;
      this.view.itemList.category.autoSize = "left";
      this.view.itemList.item.autoSize = "left";
      this.view.itemList.category.text = this.app.setLocalisedText(this.view.itemList.category,"SPK_CAT_" + activeItem.category) + "  |";
      this.view.itemList.item._x = this.view.itemList.category._x + this.view.itemList.category.textWidth + 10;
      this.view.itemList.item.text = activeItem.title;
      this.view.itemList.description.autoSize = "left";
      this.view.itemList.description.text = activeItem.description;
      this.view.itemList.panelBG._height = this.view.itemList.description._y - this.view.itemList.panelBG._y + this.view.itemList.description._height + 20;
      this.view.itemList.background._height = this.view.itemList.panelBG._y + this.view.itemList.panelBG._height + 20;
      this.view.itemList.tick._visible = activeItem.equipped;
      this.view.itemList.buy.label.autoSize = "left";
      this.view.itemList.buy.label.text = activeItem.link;
      this.view.itemList.buy._visible = activeItem.link.length > 0;
      this.view.itemList.buy.bgRight._x = this.view.itemList.buy.label._x + this.view.itemList.buy.label.textWidth;
      this.view.itemList.buy.bgCentre._width = this.view.itemList.buy.bgRight._x - this.view.itemList.buy.bgCentre._x + 10;
      this.view.itemList.buy._x = 1090 - this.view.itemList.buy._width;
      this.app.imageManager.addImage(activeItem.textureDictionary,activeItem.texture,this.view.itemList.texture);
      this.view.scrollbar.handle._y = this.view.scrollbar.track._y;
      this.view.scrollbar.handle._height = this.view.scrollbar.track._height * com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT / this.view.itemList._height;
      this.view.scrollbar._visible = this.view.scrollbar.handle._height < this.view.scrollbar.track._height;
      this.handleMin = this.view.scrollbar.track._y;
      var _loc3_ = this.view.scrollbar.track._y + this.view.scrollbar.track._height - this.view.scrollbar.handle._height;
      this.handleRange = _loc3_ - this.handleMin;
      this.view.scrollbar._x = this.safeZoneRight - this.view.scrollbar._width;
      if(activeItem.link.length > 0)
      {
         this.buyButton = new com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement(this.view.itemList.buy,com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElementIDs.BUY);
         this.view.itemList.buy._visible = true;
         this.imageButton = new com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement(this.view.itemList.texture,com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElementIDs.BUY);
         this.cursor.setTargetRects([this.buyButton,this.imageButton]);
         this.cursor.setChangeListener(this.app.delegate(this,this.onTargetChange));
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.scrollbar,1,{_alpha:0});
   }
   function handleAccept(activeElement)
   {
      this.app.showScreen(this.app.ITEM_SCREEN);
   }
   function handleCancel()
   {
      this.app.showScreen(this.app.CATEGORY_SCREEN);
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
      if(this.view.itemList._height < com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT)
      {
         return undefined;
      }
      var _loc5_ = (y - 128) / 128;
      if(isMouseWheel)
      {
         _loc5_ *= 2;
      }
      var _loc6_;
      var _loc3_;
      var _loc7_;
      var _loc2_;
      var _loc4_;
      var _loc8_;
      if(!isLeftStick)
      {
         _loc6_ = getTimer();
         _loc3_ = _loc6_ - this.scrollTimeDelta;
         _loc3_ = Math.max(16,Math.min(40,_loc3_));
         _loc7_ = com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STICK_SCROLL_SPEED * _loc3_ / 32;
         this.scrollTimeDelta = _loc6_;
         _loc2_ = this.view.itemList._y - _loc7_ * _loc5_;
         _loc4_ = com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT - this.view.itemList._height;
         if(_loc2_ > 0)
         {
            _loc2_ = 0;
         }
         else if(_loc2_ < _loc4_)
         {
            _loc2_ = _loc4_;
         }
         this.view.itemList._y = _loc2_;
         _loc8_ = _loc2_ / _loc4_;
         this.view.scrollbar.handle._y = _loc8_ * this.handleRange + this.handleMin;
         if(this.buyButton != undefined)
         {
            this.buyButton.updateBounds();
            this.imageButton.updateBounds();
            this.cursor.setTargetRects([this.buyButton,this.imageButton]);
         }
         this.view.scrollbar._alpha = 50;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.scrollbar,1,{_alpha:0});
      }
   }
   function onTargetChange(activeElementID)
   {
      var _loc2_ = this.view.itemList.buy.label.getTextFormat();
      _loc2_.color = activeElementID != -1 ? 16777215 : 0;
      this.view.itemList.buy.label.setTextFormat(_loc2_);
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.scrollbar);
      super.dispose();
   }
}
