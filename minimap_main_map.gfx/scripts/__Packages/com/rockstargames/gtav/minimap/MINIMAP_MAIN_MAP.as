class com.rockstargames.gtav.minimap.MINIMAP_MAIN_MAP extends MovieClip
{
   var ROADS;
   var TIMELINE;
   var TXDLAYER;
   var mapComponents;
   function MINIMAP_MAIN_MAP(mc)
   {
      super();
      this.TIMELINE = mc;
      this.mapComponents = new Array();
      this.mapComponents.push("component_0");
      this.mapComponents.push("component_1");
      this.mapComponents.push("component_2");
      this.mapComponents.push("component_3");
      this.mapComponents.push("component_4");
      this.mapComponents.push(undefined);
      this.mapComponents.push("component_5");
      this.mapComponents.push("component_6");
      this.mapComponents.push("component_7");
      this.mapComponents.push("component_8");
      this.mapComponents.push("component_9");
      this.mapComponents.push("component_10");
      this.mapComponents.push("component_11");
      this.mapComponents.push("component_12");
      this.mapComponents.push("component_13");
      this.mapComponents.push("component_14");
   }
   function REGISTER_MAP_LAYER(_MAP)
   {
      this.TXDLAYER = _MAP.attachMovie("TXD_MC","TXD_MC",_MAP.getNextHighestDepth(),{_x:0,_y:0});
   }
   function REGISTER_ROADS_LAYER(_ROADS)
   {
      this.ROADS = _ROADS;
   }
   function hideALlComponents()
   {
      var _loc4_ = _level0.asRootContainer.asMapContainer.asMapContainer.map;
      var _loc2_;
      _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.mapComponents.length)
      {
         _loc3_ = _loc4_.main_map[this.mapComponents[_loc2_]];
         _loc3_._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function TOGGLE_COMPONENT(component, visible, hudColour)
   {
      var _loc5_ = _level0.asRootContainer.asMapContainer.asMapContainer.map;
      var _loc2_;
      var _loc7_ = 4;
      var _loc3_;
      var _loc4_;
      if(component == _loc7_)
      {
         _loc3_ = _level0.asRootContainer.asMapContainer.asMapContainer.asBackgroundOverlay3D.asFreewayLayer;
         if(this.ROADS != undefined)
         {
            _loc3_ = this.ROADS;
         }
         _loc2_ = _loc3_.roads_overlay;
      }
      else if(component < this.mapComponents.length)
      {
         _loc4_ = this.mapComponents[component];
         _loc2_ = _loc5_.main_map[_loc4_];
      }
      _loc2_._visible = visible;
      if(_loc2_ != undefined && hudColour != undefined)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_,hudColour);
      }
   }
   function debug(component, visible, hudColour)
   {
      var _loc5_ = _level0.asRootContainer.asMapContainer.asMapContainer.map;
      var _loc2_;
      var _loc7_ = 4;
      var _loc3_;
      var _loc4_;
      if(component == _loc7_)
      {
         _loc3_ = _level0.asRootContainer.asMapContainer.asMapContainer.asBackgroundOverlay3D.asFreewayLayer;
         if(this.ROADS != undefined)
         {
            _loc3_ = this.ROADS;
         }
         _loc2_ = _loc3_.roads_overlay;
      }
      else if(component < this.mapComponents.length)
      {
         _loc4_ = this.mapComponents[component];
         _loc2_ = _loc5_.main_map[_loc4_];
      }
      _loc2_._visible = visible;
      if(_loc2_ != undefined && hudColour != undefined)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_,hudColour);
      }
   }
   function SHOW_AIRCRAFT_COMPONENTS(shouldBeVisible)
   {
      var _loc2_ = _level0.asRootContainer.asMapContainer.asMapContainer.map;
      var _loc4_ = _loc2_.main_map[this.mapComponents[0]];
      var _loc7_ = _loc2_.main_map[this.mapComponents[1]];
      var _loc5_ = _loc2_.main_map[this.mapComponents[2]];
      var _loc6_ = _loc2_.main_map[this.mapComponents[3]];
      _loc4_._visible = shouldBeVisible;
      _loc7_._visible = shouldBeVisible;
      _loc5_._visible = shouldBeVisible;
      _loc6_._visible = shouldBeVisible;
   }
   function SET_BITMAP_MAP_ON(txd, xpos, ypos)
   {
      if(this.TXDLAYER[txd] != undefined)
      {
         this.SET_BITMAP_MAP_OFF(txd);
      }
      var _loc3_ = this.TXDLAYER.attachMovie("TXD_MC",txd,this.TXDLAYER.getNextHighestDepth(),{_x:xpos,_y:ypos});
      _loc3_.SET_BITMAP_MAP_ON(txd,xpos,ypos);
   }
   function SET_BITMAP_MAP_OFF(txd)
   {
      this.TXDLAYER[txd].removeMovieClip();
   }
}
