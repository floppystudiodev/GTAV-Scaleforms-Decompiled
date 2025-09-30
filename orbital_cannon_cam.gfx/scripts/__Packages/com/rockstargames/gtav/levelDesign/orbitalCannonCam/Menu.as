class com.rockstargames.gtav.levelDesign.orbitalCannonCam.Menu
{
   var highlightedItem;
   var items;
   var itemsContainer;
   var scrollGoalY;
   var scrollMaxY;
   var updateScrollArgs;
   var view;
   static var DOWN = 187;
   static var UP = 188;
   static var MAX_HEIGHT = 574;
   static var SCROLL_DAMPING = 0.35;
   function Menu(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.items = [];
      this.itemsContainer = this.view.createEmptyMovieClip("itemsContainer",this.view.getNextHighestDepth());
      this.itemsContainer._x = this.view.listMask._x;
      this.itemsContainer._y = this.view.listMask._y;
      this.itemsContainer.setMask(this.view.listMask);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CANNON_CAM_TITLE",this.view.title,false);
      this.view.helpText.message.autoSize = "left";
      this.view.helpText.bg.scale9Grid = new flash.geom.Rectangle(5,5,300,40);
      this.view.scrollbar.bg.scale9Grid = new flash.geom.Rectangle(2,2,6,26);
      this.scrollGoalY = 0;
      this.updateScrollArgs = {onCompleteScope:this,onComplete:this.updateScroll};
      this.view.bg.scale9Grid = new flash.geom.Rectangle(5,5,350,140);
      this.updateView();
      this.updateScrollGoal();
      this.updateScroll();
   }
   function set _visible(isVisible)
   {
      this.view._visible = isVisible;
   }
   function setTitle(title)
   {
      this.view.title.text = title;
   }
   function setHelpText(message)
   {
      this.view.helpText.message.htmlText = message;
      this.view.helpText.bg._height = Math.round(Math.max(33,this.view.helpText.message._height + 12));
      this.updateView();
   }
   function addItem(id, leftText, rightText, strikethroughText, isActive)
   {
      var _loc2_ = 0;
      var _loc3_ = this.items.length;
      var _loc9_;
      while(_loc2_ < _loc3_)
      {
         _loc9_ = this.items[_loc2_];
         if(_loc9_.id == id)
         {
            _loc9_.update(leftText,rightText,strikethroughText,isActive);
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc9_ = new com.rockstargames.gtav.levelDesign.orbitalCannonCam.MenuItem(this.itemsContainer,id,leftText,rightText,strikethroughText,isActive);
      if(this.items.length == 0)
      {
         this.highlightedItem = _loc9_;
         _loc9_.setHighlight(true);
      }
      this.items.push(_loc9_);
      this.updateView();
   }
   function removeItem(id)
   {
      var _loc2_ = 0;
      var _loc4_ = this.items.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this.items[_loc2_];
         if(_loc3_.id == id)
         {
            if(this.highlightedItem == _loc3_)
            {
               this.highlightedItem = _loc2_ != 0 ? this.items[_loc2_ - 1] : this.items[1];
               if(this.highlightedItem)
               {
                  this.highlightedItem.setHighlight(true);
               }
            }
            _loc3_.dispose();
            this.items.splice(_loc2_,1);
            this.updateView();
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setItemState(id, isActive)
   {
      var _loc2_ = 0;
      var _loc4_ = this.items.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this.items[_loc2_];
         if(_loc3_.id == id)
         {
            _loc3_.setState(isActive);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function moveHighlight(inputID)
   {
      var _loc4_ = -1;
      var _loc2_ = 0;
      var _loc3_ = this.items.length;
      while(_loc2_ < _loc3_)
      {
         if(this.items[_loc2_] == this.highlightedItem)
         {
            _loc4_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(inputID == com.rockstargames.gtav.levelDesign.orbitalCannonCam.Menu.DOWN)
      {
         _loc4_ = Math.min(_loc4_ + 1,this.items.length - 1);
         if(this.highlightedItem)
         {
            this.highlightedItem.setHighlight(false);
         }
         this.highlightedItem = this.items[_loc4_];
         this.highlightedItem.setHighlight(true);
      }
      else if(inputID == com.rockstargames.gtav.levelDesign.orbitalCannonCam.Menu.UP)
      {
         _loc4_ = Math.max(_loc4_ - 1,0);
         if(this.highlightedItem)
         {
            this.highlightedItem.setHighlight(false);
         }
         this.highlightedItem = this.items[_loc4_];
         this.highlightedItem.setHighlight(true);
      }
      this.updateScrollGoal();
   }
   function getHighlightID()
   {
      return !this.highlightedItem ? -1 : this.highlightedItem.id;
   }
   function updateView()
   {
      var _loc5_ = 0;
      var _loc2_ = 0;
      var _loc4_ = this.items.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this.items[_loc2_];
         _loc3_.view._y = _loc5_;
         _loc5_ += Math.round(_loc3_.view._height) - 1;
         _loc2_ = _loc2_ + 1;
      }
      var _loc6_ = com.rockstargames.gtav.levelDesign.orbitalCannonCam.Menu.MAX_HEIGHT - this.view.helpText._height - this.view.listMask._y - 10;
      this.view.listMask._height = Math.min(_loc6_,this.itemsContainer._height);
      this.view.helpText._y = this.view.listMask._y + this.view.listMask._height - 1;
      this.view.bg._height = this.view.helpText._y + this.view.helpText._height + 10;
      this.view.scrollbar.bg._height = this.view.listMask._height;
      this.view.scrollbar.track._height = this.view.scrollbar.bg._height - 2;
      this.view.scrollbar.handle._height = this.view.scrollbar.track._height * this.view.listMask._height / this.itemsContainer._height;
      this.scrollMaxY = this.view.listMask._height - this.itemsContainer._height;
      this.updateScrollGoal();
   }
   function updateScrollGoal()
   {
      var _loc2_ = this.highlightedItem.view._y + this.itemsContainer._y;
      var _loc4_ = _loc2_ + this.highlightedItem.view._height;
      var _loc3_ = this.view.listMask._y;
      var _loc5_ = _loc3_ + this.view.listMask._height;
      if(_loc4_ > _loc5_)
      {
         this.scrollGoalY = this.itemsContainer._y - (_loc4_ - _loc5_);
      }
      else if(_loc2_ < _loc3_)
      {
         this.scrollGoalY = this.itemsContainer._y + (_loc3_ - _loc2_);
      }
      else
      {
         this.scrollGoalY = this.itemsContainer._y;
      }
   }
   function updateScroll()
   {
      this.itemsContainer._y += com.rockstargames.gtav.levelDesign.orbitalCannonCam.Menu.SCROLL_DAMPING * (this.scrollGoalY - this.itemsContainer._y);
      this.view.scrollbar.handle._y = (this.view.scrollbar.track._height - this.view.scrollbar.handle._height) * (this.itemsContainer._y - this.view.listMask._y) / this.scrollMaxY;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.03,this.updateScrollArgs);
   }
}
