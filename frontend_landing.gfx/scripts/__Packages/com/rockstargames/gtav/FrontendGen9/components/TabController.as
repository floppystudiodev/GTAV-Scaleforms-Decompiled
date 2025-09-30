class com.rockstargames.gtav.FrontendGen9.components.TabController extends MovieClip
{
   var _tabItems;
   var leftTabButton;
   var rightTabButton;
   var _tabItemStartPos = 25;
   var _rightTabButtonPadding = 13.333;
   function TabController()
   {
      super();
      this._tabItems = [];
      this.leftTabButton._visible = !com.rockstargames.gtav.FrontendGen9.FRONTEND_LANDING.IS_PC;
      this.rightTabButton._visible = !com.rockstargames.gtav.FrontendGen9.FRONTEND_LANDING.IS_PC;
   }
   function ADD_TAB_ITEM(title)
   {
      var _loc3_ = this._tabItems.length;
      var _loc5_ = "item" + _loc3_;
      var _loc4_ = com.rockstargames.gtav.FrontendGen9.components.TabItem(this._tabItems[_loc3_ - 1]);
      var _loc2_ = com.rockstargames.gtav.FrontendGen9.components.TabItem(this.attachMovie("tabItem",_loc5_,this.getNextHighestDepth()));
      _loc2_.SET_TITLE(title);
      if(_loc3_ < 1)
      {
         _loc2_._index = 0;
         if(com.rockstargames.gtav.FrontendGen9.FRONTEND_LANDING.IS_PC)
         {
            _loc2_._x = 0;
         }
         else
         {
            _loc2_._x = this.rightTabButton._width + this._rightTabButtonPadding;
         }
      }
      else
      {
         _loc2_._index = _loc3_;
         _loc2_._x = _loc4_._x + _loc4_._width;
      }
      this._tabItems.push(_loc2_);
      this.rightTabButton._x = _loc2_._x + _loc2_._width + this._rightTabButtonPadding;
   }
   function SET_TAB_STATE(whichTab, state, enabled)
   {
      this.UNHIGHLIGHT_ALL_TABS();
      var _loc2_ = this._tabItems[whichTab];
      _loc2_.SET_STATE(state);
      if(_loc2_.SET_ENABLED(enabled))
      {
         this.adjustPositions();
      }
   }
   function UNHIGHLIGHT_ALL_TABS()
   {
      var _loc3_;
      var _loc2_ = 0;
      while(_loc2_ < this._tabItems.length)
      {
         _loc3_ = this._tabItems[_loc2_];
         _loc3_.SET_STATE(0);
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_TAB_HOVER_STATE(whichTab, state, enabled)
   {
      var _loc2_ = this._tabItems[whichTab];
      _loc2_.SET_HOVER_STATE(state);
   }
   function ANIMATE_IN()
   {
      var _loc2_ = 0.133;
      var _loc3_ = 0.133;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc2_,{_alpha:100,delay:_loc3_});
   }
   function SET_IS_PC(isPC)
   {
      trace("************************************************************");
      trace("TabController.as::SET_IS_PC - " + [arguments]);
      trace("************************************************************");
      this.leftTabButton._visible = !isPC;
      this.rightTabButton._visible = !isPC;
      this.adjustPositions();
   }
   function adjustPositions()
   {
      var _loc3_ = !this.rightTabButton._visible ? 0 : this.rightTabButton._width + this._rightTabButtonPadding;
      var _loc2_ = 0;
      while(_loc2_ < this._tabItems.length)
      {
         this._tabItems[_loc2_]._x = _loc3_;
         if(this._tabItems[_loc2_]._visible)
         {
            _loc3_ += this._tabItems[_loc2_]._width;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
