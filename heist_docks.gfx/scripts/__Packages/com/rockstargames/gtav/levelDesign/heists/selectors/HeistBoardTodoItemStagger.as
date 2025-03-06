class com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardTodoItemStagger extends com.rockstargames.ui.components.GUIMenuItem
{
   var tickMC;
   var todoItemTF;
   var highlightMC;
   function HeistBoardTodoItemStagger()
   {
      super();
   }
   function set data(_d)
   {
      this._data = _d;
      this.tickMC.gotoAndStop(!Boolean(this._data[0]) ? 1 : 2);
      this.todoItemTF.text = this._data[1];
      this.todoItemTF.autoSize = "left";
      this.todoItemTF.multiline = false;
      this.todoItemTF.wordWrap = false;
      this.tickMC._x = this.todoItemTF._x + this.todoItemTF._width + 5;
   }
   function clampText(obj, maxVal)
   {
      if(obj._width > maxVal)
      {
         obj._xscale = maxVal / obj._width * 100;
      }
   }
   function set highlighted(_h)
   {
      this.highlightMC.gotoAndStop(!_h ? 1 : 2);
      this._highlighted = _h;
   }
}
