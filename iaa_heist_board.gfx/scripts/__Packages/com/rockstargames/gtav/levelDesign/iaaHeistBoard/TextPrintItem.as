class com.rockstargames.gtav.levelDesign.iaaHeistBoard.TextPrintItem
{
   var index;
   var preDelay;
   var text;
   var textField;
   var updateCount;
   var updateMultiplier;
   function TextPrintItem(text, textField, preDelay, updateMultiplier)
   {
      this.text = text;
      this.textField = textField;
      this.preDelay = preDelay;
      this.updateMultiplier = updateMultiplier;
      this.index = 0;
      this.updateCount = 0;
      this.convertLineBreaksToNewlines();
   }
   function textFieldMatches(textField)
   {
      return this.textField == textField;
   }
   function textMatches(text)
   {
      return this.text == text;
   }
   function update()
   {
      if(++this.updateCount % this.updateMultiplier > 0)
      {
         return false;
      }
      if(--this.preDelay > 0)
      {
         return false;
      }
      if(this.index < this.text.length)
      {
         this.textField.appendText(this.text.charAt(this.index++));
         return false;
      }
      return true;
   }
   function convertLineBreaksToNewlines()
   {
      this.textField.text = this.text;
      this.text = "";
      var _loc2_ = 0;
      var _loc3_ = this.textField.numLines - 1;
      while(_loc2_ < _loc3_)
      {
         this.text += this.textField.getLineText(_loc2_) + "\n";
         _loc2_ = _loc2_ + 1;
      }
      this.text += this.textField.getLineText(_loc2_);
      this.textField.text = "";
   }
}
