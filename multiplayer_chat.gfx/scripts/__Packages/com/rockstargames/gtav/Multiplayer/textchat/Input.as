class com.rockstargames.gtav.Multiplayer.textchat.Input
{
   var mc;
   var prefix;
   var text;
   static var PREFIX_FORMAT = new TextFormat("$Font2",14,10197915);
   static var INPUT_FORMAT = new TextFormat("$Font2",14,16777215);
   function Input(container, x, y)
   {
      this.init(container,x,y);
   }
   function show()
   {
      this.mc._visible = true;
   }
   function hide()
   {
      this.mc._visible = false;
   }
   function addText(text)
   {
      this.text += text;
      this.formatText();
   }
   function backspace()
   {
      this.text = this.text.substr(0,this.text.length - 1);
      this.formatText();
   }
   function clear()
   {
      this.text = "";
      this.formatText();
   }
   function getInput()
   {
      return this.text;
   }
   function setPrefix(prefix)
   {
      if(!prefix || prefix.length == 0)
      {
         this.prefix = "";
      }
      else
      {
         this.prefix = "[" + prefix.toUpperCase() + "] ";
      }
      this.formatText();
   }
   function reset()
   {
      this.text = "";
      this.prefix = "";
      this.formatText();
   }
   function init(container, x, y)
   {
      this.mc = container.attachMovie("TextInput","textInput",container.getNextHighestDepth(),{_x:x,_y:y});
      this.text = "";
      this.prefix = "";
      this.hide();
   }
   function RepositionMoviePostScreeenAdjust(x, y)
   {
      this.mc._x = x;
      this.mc._y = y;
      this.formatText();
   }
   function formatText()
   {
      this.mc.prefix.text = this.prefix;
      this.mc.input.text = this.text;
      this.mc.input._x = this.mc.prefix._x + this.mc.prefix.textWidth;
      this.mc.input._width = this.mc.prefix._width - this.mc.input._x + this.mc.prefix._x;
      this.mc.prefix.setTextFormat(com.rockstargames.gtav.Multiplayer.textchat.Input.PREFIX_FORMAT);
      this.mc.prefix.selectable = false;
      this.mc.input.setTextFormat(com.rockstargames.gtav.Multiplayer.textchat.Input.INPUT_FORMAT);
      this.mc.input.selectable = false;
      this.mc.input.type = "input";
      Selection.setFocus(this.mc.input);
      Selection.setSelection(this.mc.input.text.length,this.mc.input.text.length);
      this.mc.input.hscroll = this.mc.input.maxhscroll;
   }
}
