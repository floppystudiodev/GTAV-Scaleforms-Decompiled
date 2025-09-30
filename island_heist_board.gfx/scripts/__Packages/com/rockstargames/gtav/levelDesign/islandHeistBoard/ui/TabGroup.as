class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup
{
   var activeTabIndex;
   var tabs;
   var view;
   static var INTEL = 0;
   static var PREP = 1;
   static var FINALE = 2;
   function TabGroup(view, labels, locked, activeTabIndex, colourScheme)
   {
      this.view = view;
      this.activeTabIndex = activeTabIndex;
      this.tabs = [];
      this.tabs[com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.INTEL] = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Tab(view.intelTab,labels[0],locked[0],colourScheme);
      this.tabs[com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.PREP] = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Tab(view.prepTab,labels[1],locked[1],colourScheme);
      this.tabs[com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE] = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Tab(view.finaleTab,labels[2],locked[2],colourScheme);
      this.draw();
   }
   function getActiveTabIndex()
   {
      return this.activeTabIndex;
   }
   function prevTab()
   {
      var _loc2_ = this.activeTabIndex;
      do
      {
         this.activeTabIndex = (this.activeTabIndex - 1 + this.tabs.length) % this.tabs.length;
      }
      while(this.tabs[this.activeTabIndex].isLocked && this.activeTabIndex != _loc2_);
      
      this.draw();
      return this.activeTabIndex != _loc2_;
   }
   function nextTab()
   {
      var _loc2_ = this.activeTabIndex;
      do
      {
         this.activeTabIndex = (this.activeTabIndex + 1) % this.tabs.length;
      }
      while(this.tabs[this.activeTabIndex].isLocked && this.activeTabIndex != _loc2_);
      
      this.draw();
      return this.activeTabIndex != _loc2_;
   }
   function setTab(index)
   {
      if(this.activeTabIndex != index && !this.tabs[index].isLocked)
      {
         this.activeTabIndex = index;
         this.draw();
         return true;
      }
      return false;
   }
   function draw()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.tabs.length)
      {
         this.tabs[_loc2_].setActive(_loc2_ == this.activeTabIndex);
         _loc2_ = _loc2_ + 1;
      }
   }
   function dispose()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.tabs.length)
      {
         this.tabs[_loc2_].dispose();
         _loc2_ = _loc2_ + 1;
      }
      this.tabs = null;
      this.view = null;
   }
}
