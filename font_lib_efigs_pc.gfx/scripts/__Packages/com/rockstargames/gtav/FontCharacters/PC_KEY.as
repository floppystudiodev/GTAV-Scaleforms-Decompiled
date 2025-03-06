class com.rockstargames.gtav.FontCharacters.PC_KEY
{
   var button;
   function PC_KEY()
   {
      var _loc2_ = this.button._parent._name;
      var _loc3_ = _loc2_.substr(0,_loc2_.indexOf("_"));
      if(this.button != undefined)
      {
         this.button.Char.text = _loc3_;
      }
   }
}
