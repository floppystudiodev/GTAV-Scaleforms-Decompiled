class com.rockstargames.gtav.web.FORMAT_COLUMN
{
   function FORMAT_COLUMN()
   {
   }
   static function adjustPosition(data, scope, padding)
   {
      if(padding == undefined)
      {
         padding = 0;
      }
      var _loc7_ = data.length;
      var _loc2_ = 1;
      while(_loc2_ < _loc7_)
      {
         var _loc4_ = scope[data[_loc2_ - 1]];
         var _loc1_ = scope[data[_loc2_]];
         _loc1_._y = _loc4_._y + _loc4_._height + padding;
         var _loc3_ = undefined;
         if(_loc1_.header != undefined)
         {
            _loc3_ = _loc1_.header.text;
         }
         if(_loc1_.txt != undefined)
         {
            _loc3_ = _loc1_.txt.text;
         }
         if(_loc1_.btnTxt != undefined)
         {
            _loc3_ = _loc1_.btnTxt.text;
         }
         if(_loc3_ != undefined)
         {
            _loc1_._alpha = 100;
         }
         else
         {
            _loc1_._alpha = 0;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
