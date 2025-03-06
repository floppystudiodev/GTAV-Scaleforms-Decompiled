class com.rockstargames.gtav.levelDesign.salvagePlanning.ui.LightsOffContent
{
   var app;
   var view;
   static var TEXTURE_DICTIONARY = "SALVAGE_PLANNING_IMG";
   function LightsOffContent(app, viewContainer)
   {
      this.app = app;
      var _loc2_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie("mainScreen","lightsOffContent",_loc2_);
      this.view.todoHighlight._visible = false;
      this.view.taskHighlight._visible = false;
      this.view.prep1Highlight._visible = false;
      this.view.prep2Highlight._visible = false;
      this.view.prep3Highlight._visible = false;
      this.view.startHighlight._visible = false;
      this.view.targetVehicle._visible = false;
      this.view.heading._visible = false;
      this.view.todoList._visible = false;
      this.view.optionalList._visible = false;
      this.view.startButton._visible = false;
      this.view.task.content._visible = false;
      this.view.preps.content._visible = false;
      this.view.preps.contentTopmost._visible = false;
   }
   function setViewVisible(isVisible)
   {
      this.view._visible = isVisible;
   }
   function setTask(heading, state, texture)
   {
      this.view.task._visible = state >= 0;
      if(heading.length > 0)
      {
         if(texture == undefined || texture.length == 0)
         {
            this.view.task.image._visible = false;
         }
         else
         {
            this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.salvagePlanning.ui.LightsOffContent.TEXTURE_DICTIONARY,texture + "_off",this.view.task.image);
            this.view.task.image._visible = true;
         }
      }
   }
   function setPrep(index, heading, state, texture)
   {
      var _loc2_ = this.view.preps["prep" + (index + 1) + "Image"];
      if(heading.length == 0)
      {
         _loc2_._visible = false;
      }
      else
      {
         _loc2_._visible = true;
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.salvagePlanning.ui.LightsOffContent.TEXTURE_DICTIONARY,texture + "_off",_loc2_);
      }
      this.view.preps._visible = true;
   }
   function hidePreps()
   {
      this.view.preps._visible = false;
   }
   function dispose()
   {
      this.app = null;
      this.view.removeMovieClip();
      this.view = null;
   }
}
