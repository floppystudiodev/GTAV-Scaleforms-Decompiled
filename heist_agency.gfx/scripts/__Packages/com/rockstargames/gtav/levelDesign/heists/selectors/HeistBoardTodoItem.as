class com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardTodoItem extends com.rockstargames.ui.components.GUIMenuItem
{
   var tickMC;
   var todoItemTF;
   var highlightMC;
   function HeistBoardTodoItem()
   {
      super();
   }
   function set data(_d)
   {
      this._data = _d;
      this.tickMC.gotoAndStop(!Boolean(this._data[0]) ? 1 : 2);
      this.todoItemTF.text = this._data[1];
      this.todoItemTF.autoSize = "left";
      this.todoItemTF.wordWrap = false;
      this.clampText(this.todoItemTF,74);
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
