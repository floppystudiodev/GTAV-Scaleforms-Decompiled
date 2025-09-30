class com.rockstargames.gtav.levelDesign.BIKER_MISSION_WALL extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var imageQueue;
   var txdRefs;
   static var MAP_WIDTH = 280;
   static var MAP_HEIGHT = 373;
   static var MAP_SCALAR = 0.091064453125;
   static var MAP_COORD_SCALE = com.rockstargames.gtav.levelDesign.BIKER_MISSION_WALL.MAP_SCALAR * 0.3415;
   static var MAP_ORIGIN_X = com.rockstargames.gtav.levelDesign.BIKER_MISSION_WALL.MAP_SCALAR * 1415.5;
   static var MAP_ORIGIN_Y = com.rockstargames.gtav.levelDesign.BIKER_MISSION_WALL.MAP_SCALAR * 2774;
   static var DIM_TRANSFORM = new flash.geom.ColorTransform(0.5,0.5,0.5,1,0,0,0,0);
   static var NORMAL_TRANSFORM = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
   function BIKER_MISSION_WALL()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "BIKER_MISSION_WALL";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.txdRefs = [];
      this.imageQueue = [];
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 3)
      {
         _loc3_ = this.CONTENT.map["marker" + _loc2_];
         _loc3_.gotoAndStop(_loc2_ + 1);
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < 3)
      {
         this.HIDE_MISSION(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
      this.SET_SELECTED_MISSION(0);
   }
   function SET_MISSION(index, title, description, txd, x, y)
   {
      var _loc2_ = this.CONTENT["mission" + index];
      _loc2_.title.label.text = title;
      _loc2_.description.text = description;
      this.addImage(txd,txd,_loc2_.imageWrapper.image);
      _loc2_._visible = true;
      if(x != undefined && y != undefined)
      {
         this.setMapMarker(x,y,index);
      }
   }
   function SET_STAT(index, description, stat)
   {
      var _loc5_ = Math.floor(index / 5);
      var _loc4_ = this.CONTENT["statSet" + _loc5_];
      var _loc2_ = _loc4_["stat" + index + "Label"];
      var _loc3_ = _loc4_["stat" + index];
      _loc2_.textAutoSize = "shrink";
      _loc3_.autoSize = "right";
      _loc2_.text = description;
      _loc3_.text = stat;
      _loc2_._width = _loc3_._x - _loc2_._x;
   }
   function SET_SELECTED_MISSION(index)
   {
      var _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < 3)
      {
         _loc3_ = this.CONTENT["mission" + _loc2_];
         _loc4_ = _loc2_ != index ? com.rockstargames.gtav.levelDesign.BIKER_MISSION_WALL.DIM_TRANSFORM : com.rockstargames.gtav.levelDesign.BIKER_MISSION_WALL.NORMAL_TRANSFORM;
         _loc3_.imageWrapper.transform.colorTransform = _loc4_;
         _loc3_.fg.transform.colorTransform = _loc4_;
         _loc3_.bg.transform.colorTransform = _loc4_;
         _loc3_.title._alpha = _loc2_ != index ? 35 : 100;
         _loc3_.description._alpha = _loc2_ != index ? 35 : 100;
         _loc2_ = _loc2_ + 1;
      }
   }
   function HIDE_MISSION(index)
   {
      this.CONTENT["mission" + index]._visible = false;
      this.CONTENT.map["marker" + index]._visible = false;
   }
   function setMapMarker(x, y, index)
   {
      x = x * com.rockstargames.gtav.levelDesign.BIKER_MISSION_WALL.MAP_COORD_SCALE + com.rockstargames.gtav.levelDesign.BIKER_MISSION_WALL.MAP_ORIGIN_X;
      y = y * (- com.rockstargames.gtav.levelDesign.BIKER_MISSION_WALL.MAP_COORD_SCALE) + com.rockstargames.gtav.levelDesign.BIKER_MISSION_WALL.MAP_ORIGIN_Y;
      var _loc2_ = this.CONTENT.map["marker" + index];
      _loc2_._x = x;
      _loc2_._y = y;
      _loc2_._visible = true;
   }
   function addImage(txd, id, imageTextField)
   {
      var _loc2_ = false;
      if(_loc2_ && this.txdRefs[txd] == "loaded")
      {
         this.displayImage(txd,id,imageTextField);
      }
      else
      {
         if(this.txdRefs[txd] != "loading")
         {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BIKER_MISSION_WALL",txd,id,true);
            this.txdRefs[txd] = "loading";
         }
         this.imageQueue.push({txd:txd,id:id,path:String(imageTextField)});
      }
   }
   function textureLoaded(txd)
   {
      this.txdRefs[txd] = "loaded";
      var _loc6_ = this.imageQueue.length - 1;
      var _loc7_;
      var _loc5_;
      var _loc4_;
      var _loc3_;
      while(_loc6_ >= 0)
      {
         _loc7_ = this.imageQueue[_loc6_];
         if(_loc7_.txd == txd)
         {
            _loc5_ = _loc7_.path.split(".");
            _loc4_ = _root;
            _loc3_ = 1;
            while(_loc3_ < _loc5_.length)
            {
               _loc4_ = _loc4_[_loc5_[_loc3_]];
               _loc3_ = _loc3_ + 1;
            }
            if(_loc4_)
            {
               this.displayImage(txd,_loc7_.id,TextField(_loc4_));
            }
            this.imageQueue.splice(_loc6_,1);
         }
         _loc6_ = _loc6_ - 1;
      }
   }
   function clearImageQueue()
   {
      this.imageQueue.length = 0;
   }
   function displayImage(txd, id, imageTextField)
   {
      var _loc3_ = Math.round(imageTextField._width - 4);
      var _loc2_ = Math.round(imageTextField._height - 4);
      imageTextField.htmlText = "<img src=\'img://" + txd + "/" + id + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc3_ + "\' height=\'" + _loc2_ + "\'/>";
      imageTextField.onDisplayImage();
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success)
      {
         this.textureLoaded(txd);
      }
   }
   function dispose()
   {
      for(var _loc2_ in this.txdRefs)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BIKER_MISSION_WALL",_loc2_);
      }
   }
   function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
}
