class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map
{
   var colourScheme;
   var currentView;
   var heistData;
   var iconRevealOrder;
   var view;
   static var MAIN_MAP = 0;
   static var COMPOUND_MAP = 1;
   static var ICON_LINKAGES = ["entryPointIcon","exitPointIcon","itemOfInterestIcon","weedIcon","cashIcon","goldIcon","cocaineIcon","paintingsIcon","compoundIcon","coastlineIcon"];
   static var ICON_COLLISION = [true,true,true,true,true,true,true,true,false,false];
   function Map(view, heistData, colourScheme)
   {
      this.view = view;
      this.heistData = heistData;
      this.colourScheme = colourScheme;
      var _loc7_ = view.main._width;
      var _loc4_ = view.main._height;
      var _loc5_ = view.compound._width;
      var _loc6_ = view.compound._height;
      view.main.outline.transform.colorTransform = colourScheme.light;
      view.main.background.transform.colorTransform = colourScheme.mid;
      view.main.reveal.transform.colorTransform = colourScheme.dark;
      view.compound.outline.transform.colorTransform = colourScheme.light;
      view.compound.background.transform.colorTransform = colourScheme.mid;
      view.compound.reveal.transform.colorTransform = colourScheme.dark;
      this.initIcons(heistData.icons,_loc7_,_loc4_,_loc5_,_loc6_);
   }
   function initIcons(icons, mainMapWidth, mainMapHeight, compoundMapWidth, compoundMapHeight)
   {
      this.iconRevealOrder = [];
      this.iconRevealOrder[com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.MAIN_MAP] = [];
      this.iconRevealOrder[com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.COMPOUND_MAP] = [];
      var _loc7_ = [];
      var _loc6_ = [];
      var _loc3_ = 0;
      var _loc2_;
      var _loc4_;
      while(_loc3_ < icons.length)
      {
         _loc2_ = icons[_loc3_];
         if(_loc2_.mapID == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.MAIN_MAP)
         {
            _loc2_.view = this.initIconView(this.view.main,mainMapWidth,mainMapHeight,_loc2_);
            this.iconRevealOrder[com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.MAIN_MAP].push(_loc3_);
            if(com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.ICON_COLLISION[_loc2_.iconID])
            {
               _loc7_.push(_loc2_.view);
            }
         }
         else
         {
            _loc4_ = !_loc2_.isWorldCoordinates ? this.view.compound : this.view.compound.iconContainer;
            _loc2_.view = this.initIconView(_loc4_,compoundMapWidth,compoundMapHeight,_loc2_);
            this.iconRevealOrder[com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.COMPOUND_MAP].push(_loc3_);
            if(com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.ICON_COLLISION[_loc2_.iconID])
            {
               _loc6_.push(_loc2_.view);
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      this.resolveIconPositions(_loc7_);
      this.resolveIconPositions(_loc6_);
   }
   function initIconView(mapView, mapWidth, mapHeight, icon)
   {
      var _loc2_;
      var _loc5_;
      if(icon.iconID == 9)
      {
         _loc2_ = mapView.highlight;
      }
      else
      {
         _loc5_ = mapView.getNextHighestDepth();
         _loc2_ = mapView.attachMovie(com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.ICON_LINKAGES[icon.iconID],"icon" + _loc5_,_loc5_);
         if(icon.iconID == 8)
         {
            _loc2_.swapDepths(0);
         }
         if(_loc2_.foreground)
         {
            _loc2_.foreground.transform.colorTransform = this.colourScheme.mid;
            _loc2_.background.transform.colorTransform = this.colourScheme.dark;
         }
         else
         {
            _loc2_.transform.colorTransform = this.colourScheme.mid;
         }
         if(icon.isWorldCoordinates)
         {
            _loc2_._x = icon.x;
            _loc2_._y = icon.y;
         }
         else
         {
            _loc2_._x = icon.x * mapWidth;
            _loc2_._y = icon.y * mapHeight;
         }
         _loc2_._rotation = - mapView._rotation;
      }
      return _loc2_;
   }
   function resolveIconPositions(icons)
   {
      var _loc3_ = 5;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if(this.resolveCollisions(icons) == 0)
         {
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function resolveCollisions(icons)
   {
      var _loc11_ = 32;
      var _loc14_ = _loc11_ * _loc11_;
      var _loc12_ = icons.length;
      var _loc13_ = 0;
      var _loc3_ = 0;
      var _loc2_;
      var _loc5_;
      var _loc4_;
      var _loc6_;
      var _loc7_;
      var _loc8_;
      var _loc9_;
      var _loc10_;
      while(_loc3_ < _loc12_ - 1)
      {
         _loc2_ = _loc3_ + 1;
         while(_loc2_ < _loc12_)
         {
            _loc5_ = icons[_loc2_]._x - icons[_loc3_]._x;
            _loc4_ = icons[_loc2_]._y - icons[_loc3_]._y;
            _loc6_ = _loc5_ * _loc5_ + _loc4_ * _loc4_;
            if(_loc6_ < _loc14_)
            {
               if(_loc6_ == 0)
               {
                  _loc7_ = 0.5 * _loc11_;
                  _loc8_ = 0;
               }
               else
               {
                  _loc9_ = Math.sqrt(_loc6_);
                  _loc10_ = 0.5 * (_loc11_ - _loc9_) / _loc9_;
                  _loc7_ = _loc5_ * _loc10_;
                  _loc8_ = _loc4_ * _loc10_;
               }
               icons[_loc3_]._x -= _loc7_;
               icons[_loc3_]._y -= _loc8_;
               icons[_loc2_]._x += _loc7_;
               icons[_loc2_]._y += _loc8_;
               _loc13_ = _loc13_ + 1;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc13_;
   }
   function update(activeItem, parentItem)
   {
      var _loc4_ = "";
      var _loc3_ = 0;
      while(_loc3_ < activeItem.items.length)
      {
         _loc4_ += "<" + activeItem.items[_loc3_].id + ">";
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < parentItem.items.length)
      {
         _loc4_ += "<" + parentItem.items[_loc3_].id + ">";
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < this.heistData.icons.length)
      {
         _loc2_ = this.heistData.icons[_loc3_];
         if(_loc2_.setupItemID == activeItem.id || _loc2_.finaleItemID == activeItem.id)
         {
            if(_loc2_.view.foreground)
            {
               _loc2_.view.foreground.gotoAndPlay("active");
               _loc2_.view.background.gotoAndPlay("active");
               _loc2_.view.foreground.transform.colorTransform = this.colourScheme.light;
            }
            else
            {
               _loc2_.view.gotoAndPlay("active");
               _loc2_.view.transform.colorTransform = this.colourScheme.light;
            }
         }
         else if(_loc4_.indexOf("<" + _loc2_.setupItemID + ">") != -1 || _loc4_.indexOf("<" + _loc2_.finaleItemID + ">") != -1)
         {
            if(_loc2_.view.foreground)
            {
               _loc2_.view.foreground.gotoAndStop("on");
               _loc2_.view.background.gotoAndStop("on");
               _loc2_.view.foreground.transform.colorTransform = this.colourScheme.light;
            }
            else
            {
               _loc2_.view.gotoAndStop("on");
               _loc2_.view.transform.colorTransform = this.colourScheme.light;
            }
         }
         else if(_loc2_.view.foreground)
         {
            _loc2_.view.foreground.gotoAndStop("off");
            _loc2_.view.background.gotoAndStop("off");
            _loc2_.view.foreground.transform.colorTransform = this.colourScheme.mid;
         }
         else
         {
            _loc2_.view.gotoAndStop("off");
            _loc2_.view.transform.colorTransform = this.colourScheme.mid;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.setView(this.currentView != this.view.compound ? com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.MAIN_MAP : com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.COMPOUND_MAP);
   }
   function setView(mapView)
   {
      if(mapView == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.MAIN_MAP)
      {
         this.showMapView(this.view.main,this.view.compound,this.iconRevealOrder[com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.MAIN_MAP]);
      }
      else
      {
         this.showMapView(this.view.compound,this.view.main,this.iconRevealOrder[com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.COMPOUND_MAP]);
      }
   }
   function showMapView(mainView, prevView, iconRevealOrder)
   {
      var _loc2_;
      var _loc3_;
      if(this.currentView != mainView)
      {
         if(this.currentView == undefined)
         {
            mainView._alpha = 100;
            mainView.reveal.gotoAndPlay("preroll");
            prevView._alpha = 0;
         }
         else
         {
            prevView.swapDepths(prevView._parent.getNextHighestDepth());
            prevView._alpha = 30;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(prevView,com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_CURVE});
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mainView);
            mainView._alpha = 100;
            mainView.reveal.gotoAndPlay("show");
         }
         this.shuffleArray(iconRevealOrder);
         _loc2_ = 0;
         while(_loc2_ < iconRevealOrder.length)
         {
            _loc3_ = this.heistData.icons[iconRevealOrder[_loc2_]].view;
            _loc3_._visible = false;
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc3_,(_loc2_ + 25) / 30,{onCompleteScope:this,onComplete:this.showIcon,onCompleteArgs:[_loc3_]});
            _loc2_ = _loc2_ + 1;
         }
         this.currentView = mainView;
      }
   }
   function showIcon(iconView)
   {
      iconView._visible = true;
   }
   function shuffleArray(a)
   {
      var _loc4_ = a.length - 1;
      var _loc1_ = 0;
      var _loc3_;
      var _loc2_;
      while(_loc1_ < _loc4_)
      {
         _loc3_ = Math.random() * (_loc4_ - _loc1_) + _loc1_ + 1;
         _loc2_ = a.splice(_loc3_,1)[0];
         a.splice(_loc1_,0,_loc2_);
         _loc1_ = _loc1_ + 1;
      }
   }
   function dispose()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.heistData.icons.length)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.heistData.icons[_loc2_].view);
         this.heistData.icons[_loc2_].view = null;
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.main);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.compound);
      this.view = null;
      this.heistData = null;
      this.colourScheme = null;
      this.currentView = null;
      this.iconRevealOrder = null;
   }
}
