class com.rockstargames.gtav.web.YachtImageManager
{
   var yachtImageQueue;
   var yachtTXDRefs;
   static var USE_REFERENCE_COUNTING = false;
   function YachtImageManager()
   {
      this.yachtTXDRefs = [];
      this.yachtImageQueue = [];
   }
   function addYachtImage(txd, id, imageTextField)
   {
      if(com.rockstargames.gtav.web.YachtImageManager.USE_REFERENCE_COUNTING && this.yachtTXDRefs[txd] == "loaded")
      {
         this.displayYachtImage(txd,id,imageTextField);
      }
      else
      {
         if(this.yachtTXDRefs[txd] != "loading")
         {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",txd,"yacht_" + id,true);
            this.yachtTXDRefs[txd] = "loading";
         }
         this.yachtImageQueue.push({txd:txd,id:id,path:String(imageTextField)});
      }
   }
   function yachtTextureLoaded(txd)
   {
      this.yachtTXDRefs[txd] = "loaded";
      var _loc6_ = this.yachtImageQueue.length - 1;
      var _loc7_;
      var _loc5_;
      var _loc4_;
      var _loc3_;
      while(_loc6_ >= 0)
      {
         _loc7_ = this.yachtImageQueue[_loc6_];
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
               this.displayYachtImage(txd,_loc7_.id,TextField(_loc4_));
            }
            this.yachtImageQueue.splice(_loc6_,1);
         }
         _loc6_ = _loc6_ - 1;
      }
   }
   function displayYachtImage(txd, id, imageTextField)
   {
      var _loc3_ = Math.round(imageTextField._width - 4);
      var _loc2_ = Math.round(imageTextField._height - 4);
      imageTextField.htmlText = "<img src=\'img://" + txd + "/" + id + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc3_ + "\' height=\'" + _loc2_ + "\'/>";
   }
   function dispose()
   {
      for(var _loc2_ in this.yachtTXDRefs)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",_loc2_);
      }
   }
}
