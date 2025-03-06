class com.rockstargames.gtav.minigames.horseracingwall.Navigation
{
   var elements;
   var activeElement;
   var navigationChangeListener;
   static var DOWN = 187;
   static var UP = 188;
   static var LEFT = 189;
   static var RIGHT = 190;
   function Navigation()
   {
      this.elements = [];
   }
   function reset()
   {
      this.elements.length = 0;
      this.activeElement = null;
      this.navigationChangeListener = null;
   }
   function setElements(elements)
   {
      this.elements = [].concat(elements);
      if(this.activeElement)
      {
         this.activeElement.active = false;
      }
      this.activeElement = elements[0];
      this.activeElement.active = true;
      if(this.navigationChangeListener)
      {
         this.navigationChangeListener(this.activeElement.id);
      }
   }
   function setListener(listener)
   {
      this.navigationChangeListener = listener;
      this.navigationChangeListener(this.activeElement.id);
   }
   function setActiveElement(id)
   {
      var _loc2_ = 0;
      var _loc4_ = this.elements.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.elements[_loc2_];
         if(_loc3_.id == id)
         {
            if(this.activeElement)
            {
               this.activeElement.active = false;
            }
            this.activeElement = _loc3_;
            this.activeElement.active = true;
            this.navigationChangeListener(this.activeElement.id);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function getActiveElement()
   {
      return this.activeElement;
   }
   function getActiveElementID()
   {
      if(this.activeElement)
      {
         return this.activeElement.id;
      }
      return -1;
   }
   function getElementByID(id)
   {
      var _loc2_ = 0;
      var _loc4_ = this.elements.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.elements[_loc2_];
         if(_loc3_.id == id)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function disableActiveElement()
   {
      this.navigationChangeListener(-1);
   }
   function enableActiveElement()
   {
      this.navigationChangeListener(this.activeElement.id);
   }
   function navigate(direction)
   {
      var _loc11_ = undefined;
      var _loc13_ = undefined;
      var _loc12_ = undefined;
      var _loc10_ = undefined;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      if(direction == com.rockstargames.gtav.minigames.horseracingwall.Navigation.LEFT || direction == com.rockstargames.gtav.minigames.horseracingwall.Navigation.RIGHT)
      {
         _loc11_ = "deltaX";
         _loc13_ = "deltaY";
         _loc12_ = this.activeElement.x;
         _loc10_ = this.activeElement.y;
      }
      else
      {
         _loc11_ = "deltaY";
         _loc13_ = "deltaX";
         _loc12_ = this.activeElement.y;
         _loc10_ = this.activeElement.x;
      }
      var _loc6_ = 1.7976931348623157e+308;
      var _loc7_ = 1.7976931348623157e+308;
      var _loc9_ = this.activeElement;
      var _loc14_ = !(direction == com.rockstargames.gtav.minigames.horseracingwall.Navigation.LEFT || direction == com.rockstargames.gtav.minigames.horseracingwall.Navigation.UP) ? 1 : -1;
      var _loc5_ = 0;
      var _loc8_ = this.elements.length;
      while(_loc5_ < _loc8_)
      {
         var _loc2_ = this.elements[_loc5_];
         if(!(_loc2_ == this.activeElement || !_loc2_.enabled))
         {
            _loc4_ = Math.abs(_loc2_[_loc13_](_loc10_));
            _loc3_ = _loc14_ * _loc2_[_loc11_](_loc12_);
            if(_loc3_ > _loc4_)
            {
               if(_loc4_ < _loc6_)
               {
                  _loc6_ = _loc4_;
                  _loc7_ = _loc3_;
                  _loc9_ = _loc2_;
               }
               else if(_loc4_ == _loc6_)
               {
                  if(_loc3_ > 0 && _loc3_ < _loc7_)
                  {
                     _loc6_ = _loc4_;
                     _loc7_ = _loc3_;
                     _loc9_ = _loc2_;
                  }
               }
            }
         }
         _loc5_ = _loc5_ + 1;
      }
      this.activeElement.active = false;
      if(this.activeElement != _loc9_)
      {
         this.activeElement = _loc9_;
         if(this.navigationChangeListener)
         {
            this.navigationChangeListener(this.activeElement.id);
         }
      }
      this.activeElement.active = true;
   }
}
