movie 'E:\Projects\CNC3\Data\APTBUI~1\034A3~1.0-D\pc\Output\HUDREP~1\\HUDREP~1.eaf' &compressed // flash 7, total frames: 1, frame rate: 30 fps, 1024x768 px

  &frame 0
    &constants 'ff', '', 'GetFastForwardButton', 'SetVisibility', 'onUnload', 'initialized', 'this', '_parent', 'OnContentLoaded', 'helpSite', 'ffHelpSite', 'FSCommand:', ':OnInitialized'  
    &function GetFastForwardButton (    )    
      &pushsdbgv 0							//'ff'
      &toString
      &return
    &end // of function GetFastForwardButton

    &function2 SetVisibility (r:2='visArg') ()
      &push r:2      
      &toNumber
      &pushzero
      &equals
      &not
      &setRegister r:1
      &pop
      &pushsdb 1							//''
      &pushbyte 7
      &push r:1      
      &setProperty
    &end // of function SetVisibility

    &function onUnload (    )    
      &pushsdb 2							//'GetFastForwardButton'
      &delete2
      &pop
      &pushsdb 3							//'SetVisibility'
      &delete2
      &pop
      &pushsdb 4							//'onUnload'
      &delete2
      &pop
    &end // of function onUnload

    &pushsdbgv 5							//'initialized'
    &not
    &not
    &jnz label1    
    &pushthisgv
    &pushone
    &pushsdbgv 7							//'_parent'
    &dcallmp 8							// OnContentLoaded()
    &pushsdbgv 0							//'ff'
    &pushsdb 9							//'helpSite'
    &pushsdbgv 10							//'ffHelpSite'
    &setMember
    &pushsdb 5							//'initialized'
    &pushtrue
    &setVariable
    &pushsdb 11							//'FSCommand:'
    &pushthisgv
    &toString
    &pushsdb 12							//':OnInitialized'
    &add
    &concat
    &pushsdb 1							//''
    &getURL2
   label1:
    &stop
  &end // of frame 0
  
  &importAssets &from 'HelpBox.swf'
    'HelpBoxSite' &as 3
  &end // of importAssets

  &placeMovieClip 3 &as 'ffHelpSite'
  
    &onClipEvent &construct
      &pushs 'vertAlignment'
      &pushssv 'top'
      &pushs 'horzAlignment'
      &pushssv 'left'
    &end
  &end // of placeMovieClip 3

  &defineButton 5
  
    &on     &overUpToOverDown
      &gotoLabel '_down'
      &play
    &end
  
    &on     &overDownToOverUp
      &gotoLabel '_over'
      &play
      &pushs 'FSCommand:'
      &pushthisgv
      &toString
      &pushs ':OnClicked'
      &add
      &concat
      &pushs ''
      &getURL2
    &end
  
    &on     &idleToOverUp
      &gotoLabel '_over'
      &play
      &pushs 'FSCommand:'
      &pushthisgv
      &toString
      &pushs ':OnRollOver'
      &add
      &concat
      &pushs ''
      &getURL2
    &end
  
    &on     &overUpToIdle
      &gotoLabel '_up'
      &play
      &pushs 'FSCommand:'
      &pushthisgv
      &toString
      &pushs ':OnRollOut'
      &add
      &concat
      &pushs ''
      &getURL2
    &end
  &end // of defineButton 5

  &defineMovieClip 10 // total frames: 20

    &frame 9
      &stop
    &end // of frame 9

    &frame 19
      &stop
    &end // of frame 19
  &end // of defineMovieClip 10

  &defineMovieClip 11 // total frames: 30

    &frame 0
      &function2 SetSelected (r:2='valArg') ()
        &push r:2        
        &toNumber
        &pushzero
        &equals
        &not
        &setRegister r:1
        &pop
        &push r:1        
        &jnz label1        
        &pushs '_normal'
        &jmp label2        
       label1:
        &pushs '_selected'
       label2:
        &pushone
        &pushsgv 'image'
        &pushs 'gotoAndPlay'
        &callmp
      &end // of function SetSelected

      &function GetHelpSite (      )      
        &pushsgv 'helpSite'
        &toString
        &return
      &end // of function GetHelpSite

      &function onUnload (      )      
        &pushs 'SetSelected'
        &delete2
        &pop
        &pushs 'GetHelpSite'
        &delete2
        &pop
        &pushs 'onUnload'
        &delete2
        &pop
      &end // of function onUnload

      &pushsgv 'initialized'
      &not
      &not
      &jnz label3      
      &pushs 'intialized'
      &pushtrue
      &setVariable
      &pushs 'FSCommand:'
      &pushthisgv
      &toString
      &pushs ':OnInitialized'
      &add
      &concat
      &pushs ''
      &getURL2
     label3:
    &end // of frame 0

    &frame 9
      &stop
    &end // of frame 9

    &frame 19
      &stop
    &end // of frame 19

    &frame 29
      &stop
    &end // of frame 29
  &end // of defineMovieClip 11
&end
