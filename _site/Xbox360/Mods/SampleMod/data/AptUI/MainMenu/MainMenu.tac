movie 'E:\Projects\CNC3_P~1\Data\APTBUI~1\034A3~1.0-D\pc\Output\MainMenu\\MainMenu.eaf' &compressed // flash 7, total frames: 1, frame rate: 30 fps, 1024x768 px

  &defineMovieClip 3 // total frames: 1

    &frame 0
      &constants 'ButtonClass', 'ButtonQuit', 'AddClass', 'NavButtonMultiplayer', 'NavButtonOptions', 'NavButtonProfiles', 'NavButtonSoloPlay', 'NavMpSub0', 'NavMpSub1', 'NavMpSub2', 'NavOptionsSub0', 'NavOptionsSub1', 'NavOptionsSub2', 'NavProfilesSub0', 'NavProfilesSub1', 'NavProfilesSub2', 'NavSoloPlaySub0', 'NavSoloPlaySub1', 'NavSoloPlaySub2', 'NavSoloPlaySub3', 'NavSoloPlaySub4', 'NavSoloPlaySub5'  
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 1							//'ButtonQuit'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 3							//'NavButtonMultiplayer'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 4							//'NavButtonOptions'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 5							//'NavButtonProfiles'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 6							//'NavButtonSoloPlay'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 7							//'NavMpSub0'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 8							//'NavMpSub1'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 9							//'NavMpSub2'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 10							//'NavOptionsSub0'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 11							//'NavOptionsSub1'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 12							//'NavOptionsSub2'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 13							//'NavProfilesSub0'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 14							//'NavProfilesSub1'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 15							//'NavProfilesSub2'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 16							//'NavSoloPlaySub0'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 17							//'NavSoloPlaySub1'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 18							//'NavSoloPlaySub2'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 19							//'NavSoloPlaySub3'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 20							//'NavSoloPlaySub4'
      &pushbyte 2
      &dcallfp 2							// AddClass()
      &pushsdbgv 0							//'ButtonClass'
      &pushsdb 21							//'NavSoloPlaySub5'
      &pushbyte 2
      &dcallfp 2							// AddClass()
    &end // of frame 0
  &end // of defineMovieClip 3
  
  &exportAssets
    3 &as 'AptZombieClass'
  &end // of exportAssets

  &defineMovieClip 6 // total frames: 1
  &end // of defineMovieClip 6
  
  &exportAssets
    6 &as 'SmokeColor_mc'
  &end // of exportAssets

  &defineMovieClip 9 // total frames: 1
  &end // of defineMovieClip 9

  &defineMovieClip 12 // total frames: 1
  &end // of defineMovieClip 12

  &defineMovieClip 16 // total frames: 10

    &frame 0
      &stop
      &pushs ''
      &pushone
      &pushs 'SetMode'
      &callfp
      &pushs '$Tutorial'
      &pushone
      &pushs 'SetText'
      &callfp
      &pushs 'RollOverCallback'
      &function2  () (r:1='this', r:2='_parent')
        &push r:1        
        &pushone
        &push r:2        
        &pushs 'ActivateNav'
        &callmp
      &end // of function 

      &setVariable
      &pushs 'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsgm 'MainMenu'
        &pushs 'OnTutorialsButton'
        &callmp
      &end // of function 

      &setVariable
    &end // of frame 0
  &end // of defineMovieClip 16
  
  &exportAssets
    16 &as 'NavButtonTutorial'
  &end // of exportAssets

  &defineMovieClip 17 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 17

  &defineMovieClip 20 // total frames: 1
  &end // of defineMovieClip 20

  &defineMovieClip 25 // total frames: 1
  &end // of defineMovieClip 25
  
  &exportAssets
    25 &as 'NavSoloPlaySub0'
  &end // of exportAssets

  &defineMovieClip 26 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 26

  &defineMovieClip 29 // total frames: 1
  &end // of defineMovieClip 29

  &defineMovieClip 34 // total frames: 1
  &end // of defineMovieClip 34
  
  &exportAssets
    34 &as 'NavSoloPlaySub1'
  &end // of exportAssets

  &defineMovieClip 35 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 35

  &defineMovieClip 38 // total frames: 1
  &end // of defineMovieClip 38

  &defineMovieClip 43 // total frames: 1
  &end // of defineMovieClip 43
  
  &exportAssets
    43 &as 'NavSoloPlaySub2'
  &end // of exportAssets

  &defineMovieClip 44 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 44

  &defineMovieClip 47 // total frames: 1
  &end // of defineMovieClip 47

  &defineMovieClip 52 // total frames: 1
  &end // of defineMovieClip 52
  
  &exportAssets
    52 &as 'NavSoloPlaySub3'
  &end // of exportAssets

  &defineMovieClip 53 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 53

  &defineMovieClip 56 // total frames: 1
  &end // of defineMovieClip 56

  &defineMovieClip 61 // total frames: 1
  &end // of defineMovieClip 61
  
  &exportAssets
    61 &as 'NavSoloPlaySub4'
  &end // of exportAssets

  &defineMovieClip 64 // total frames: 1
  &end // of defineMovieClip 64

  &defineMovieClip 67 // total frames: 1
  &end // of defineMovieClip 67
  
  &exportAssets
    61 &as 'NavSoloPlaySub4'
  &end // of exportAssets
  
  &exportAssets
    52 &as 'NavSoloPlaySub3'
  &end // of exportAssets
  
  &exportAssets
    43 &as 'NavSoloPlaySub2'
  &end // of exportAssets
  
  &exportAssets
    34 &as 'NavSoloPlaySub1'
  &end // of exportAssets
  
  &exportAssets
    25 &as 'NavSoloPlaySub0'
  &end // of exportAssets

  &defineMovieClip 71 // total frames: 1

    &frame 0
      &constants 'ButtonClass', 'debug', 'Enable', '$ContinueCampaign', 'Sub0', 'SetText', '$LoadGame', 'Sub1', '$CampaignName0', 'Sub2', '$CampaignName1', 'Sub3', '$CampaignName2', 'Sub4', '_root', 'MainMenu', 'IsAlienReveal', 'ReleaseCallback', 'ContinueCampaignButton', 'LoadCampaignGameButton', 'Campaign0Button', 'Campaign1Button', 'Campaign2Button', 'InitLoadCampaign', 'InitContinueCampaign', '', 'SetMode', 'HiddenBttn', 'HiddenUpState', 'HiddenText', 'InitAlienCampaign', 'MouseLeaveBttn', 'onRollOver', 'OnMouseLeaveMenu'  
      &pushtrue
      &pushone
      &pushsdbgv 0							//'ButtonClass'
      &pushsdbgm 1							//'debug'
      &dcallmp 2							// Enable()
      &pushsdb 3							//'$ContinueCampaign'
      &pushone
      &pushsdbgv 4							//'Sub0'
      &dcallmp 5							// SetText()
      &pushsdb 6							//'$LoadGame'
      &pushone
      &pushsdbgv 7							//'Sub1'
      &dcallmp 5							// SetText()
      &pushsdb 8							//'$CampaignName0'
      &pushone
      &pushsdbgv 9							//'Sub2'
      &dcallmp 5							// SetText()
      &pushsdb 10							//'$CampaignName1'
      &pushone
      &pushsdbgv 11							//'Sub3'
      &dcallmp 5							// SetText()
      &pushsdb 12							//'$CampaignName2'
      &pushone
      &pushsdbgv 13							//'Sub4'
      &dcallmp 5							// SetText()
      &pushzero
      &pushsdbgv 14							//'_root'
      &pushsdbgm 15							//'MainMenu'
      &pushsdb 16							//'IsAlienReveal'
      &callMethod
      &not
      &not
      &jnz label1      
      &pushsdbgv 4							//'Sub0'
      &pushsdb 17							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 15							//'MainMenu'
        &dcallmp 18							// ContinueCampaignButton()
      &end // of function 

      &setMember
      &pushsdbgv 7							//'Sub1'
      &pushsdb 17							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 15							//'MainMenu'
        &dcallmp 19							// LoadCampaignGameButton()
      &end // of function 

      &setMember
      &pushsdbgv 9							//'Sub2'
      &pushsdb 17							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 15							//'MainMenu'
        &dcallmp 20							// Campaign0Button()
      &end // of function 

      &setMember
      &pushsdbgv 11							//'Sub3'
      &pushsdb 17							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 15							//'MainMenu'
        &dcallmp 21							// Campaign1Button()
      &end // of function 

      &setMember
      &pushsdbgv 13							//'Sub4'
      &pushsdb 17							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 15							//'MainMenu'
        &dcallmp 22							// Campaign2Button()
      &end // of function 

      &setMember
     label1:
      &pushsdbgv 4							//'Sub0'
      &pushone
      &pushsdbgv 14							//'_root'
      &pushsdbgm 15							//'MainMenu'
      &dcallmp 23							// InitLoadCampaign()
      &pushsdbgv 7							//'Sub1'
      &pushone
      &pushsdbgv 14							//'_root'
      &pushsdbgm 15							//'MainMenu'
      &dcallmp 24							// InitContinueCampaign()
      &pushsdb 25							//''
      &pushone
      &pushsdbgv 9							//'Sub2'
      &dcallmp 26							// SetMode()
      &pushsdb 25							//''
      &pushone
      &pushsdbgv 11							//'Sub3'
      &dcallmp 26							// SetMode()
      &pushsdbgv 13							//'Sub4'
      &pushsdb 27							//'HiddenBttn'
      &pushfalse
      &setMember
      &pushsdbgv 13							//'Sub4'
      &pushsdb 28							//'HiddenUpState'
      &pushfalse
      &setMember
      &pushsdbgv 13							//'Sub4'
      &pushsdb 29							//'HiddenText'
      &pushfalse
      &setMember
      &pushsdbgv 13							//'Sub4'
      &pushone
      &pushsdbgv 14							//'_root'
      &pushsdbgm 15							//'MainMenu'
      &dcallmp 30							// InitAlienCampaign()
      &pushsdbgv 31							//'MouseLeaveBttn'
      &pushsdb 32							//'onRollOver'
      &function2  () (r:1='_parent')
        &pushzero
        &push r:1        
        &dcallmp 33							// OnMouseLeaveMenu()
      &end // of function 

      &setMember
    &end // of frame 0
  &end // of defineMovieClip 71

  &defineMovieClip 72 // total frames: 20

    &frame 0
      &constants 'GetMode', 'Selected', 'SetMode', 'OnDebugClickCampaign', 'MainMenu', 'OnDebugButton', 'TutorialNav', '_alpha', 'SkirmishNav', 'MultiplayerNav', 'ProfilesNav', 'OptionsNav', 'QuitMainMenu', 'vRevealFrame', 'Globe', 'OnAlienReveal', 'MovieLoop', 'RollOverCallback', 'SubMenu', 'Sub0', 'RollOver', 'RollOut', 'vBttn0Fade', 'Sub1', 'vBttn1Fade', 'Sub2', 'vBttn2Fade', 'Sub3', 'vBttn3Fade', '', 'Sub4', 'Press', 'ClearAlienRevealCallback', '$Campaign', 'SetText', 'AlienRevealUpdate', '_root', 'RegisterAlienRevealCallback'  
      &function RollOverCallback (      )      
        &pushzero
        &pushsdb 0							//'GetMode'
        &callFunction
        &pushsdb 1							//'Selected'
        &equals
        &not
        &not
        &jnz label1        
        &pushsdb 1							//'Selected'
        &pushone
        &dcallfp 2							// SetMode()
        &gotoLabel '_over'
        &play
       label1:
      &end // of function RollOverCallback

      &function2 ReleaseCallback () (r:1='_root')
        &pushsdb 3							//'OnDebugClickCampaign'
        &pushone
        &push r:1        
        &pushsdbgm 4							//'MainMenu'
        &dcallmp 5							// OnDebugButton()
      &end // of function ReleaseCallback

      &function2 AlienRevealUpdate () (r:1='_root', r:2='_parent')
        &push r:2        
        &pushsdbgm 6							//'TutorialNav'
        &pushsdb 7							//'_alpha'
        &push r:2        
        &pushsdbgm 6							//'TutorialNav'
        &pushsdbgm 7							//'_alpha'
        &pushfloat 1.500000000000000
        &subtract
        &setMember
        &push r:2        
        &pushsdbgm 8							//'SkirmishNav'
        &pushsdb 7							//'_alpha'
        &push r:2        
        &pushsdbgm 8							//'SkirmishNav'
        &pushsdbgm 7							//'_alpha'
        &pushfloat 1.399999976158142
        &subtract
        &setMember
        &push r:2        
        &pushsdbgm 9							//'MultiplayerNav'
        &pushsdb 7							//'_alpha'
        &push r:2        
        &pushsdbgm 9							//'MultiplayerNav'
        &pushsdbgm 7							//'_alpha'
        &pushfloat 1.299999952316284
        &subtract
        &setMember
        &push r:2        
        &pushsdbgm 10							//'ProfilesNav'
        &pushsdb 7							//'_alpha'
        &push r:2        
        &pushsdbgm 10							//'ProfilesNav'
        &pushsdbgm 7							//'_alpha'
        &pushfloat 1.200000047683716
        &subtract
        &setMember
        &push r:2        
        &pushsdbgm 11							//'OptionsNav'
        &pushsdb 7							//'_alpha'
        &push r:2        
        &pushsdbgm 11							//'OptionsNav'
        &pushsdbgm 7							//'_alpha'
        &pushfloat 1.100000023841858
        &subtract
        &setMember
        &push r:2        
        &pushsdbgm 12							//'QuitMainMenu'
        &pushsdb 7							//'_alpha'
        &push r:2        
        &pushsdbgm 12							//'QuitMainMenu'
        &pushsdbgm 7							//'_alpha'
        &pushone
        &subtract
        &setMember
        &pushsdbgv 13							//'vRevealFrame'
        &setRegister r:0
        &pushzero
        &strictEquals
        &jnz label2        
        &push r:0        
        &pushbyte 35
        &strictEquals
        &jnz label3        
        &push r:0        
        &pushbyte 55
        &strictEquals
        &jnz label4        
        &push r:0        
        &pushbyte 70
        &strictEquals
        &jnz label5        
        &push r:0        
        &pushbyte 95
        &strictEquals
        &jnz label6        
        &push r:0        
        &pushbyte 110
        &strictEquals
        &jnz label7        
        &push r:0        
        &pushbyte 120
        &strictEquals
        &jnz label8        
        &push r:0        
        &pushshort 140
        &strictEquals
        &jnz label9        
        &push r:0        
        &pushshort 185
        &strictEquals
        &jnz label10        
        &jmp label11        
       label2:
        &getURL 'FSCommand:PlaySound'         'GuiAlienStartReveal'        
        &getURL 'FSCommand:PlaySound'         '$OverButton'        
        &pushzero
        &push r:1        
        &pushsdbgm 4							//'MainMenu'
        &pushsdbgm 14							//'Globe'
        &dcallmp 15							// OnAlienReveal()
        &pushzero
        &push r:1        
        &pushsdbgm 4							//'MainMenu'
        &pushsdbgm 16							//'MovieLoop'
        &dcallmp 15							// OnAlienReveal()
        &pushzero
        &dcallfp 17							// RollOverCallback()
        &jmp label11        
       label3:
        &pushzero
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 19							//'Sub0'
        &dcallmp 20							// RollOver()
        &jmp label11        
       label4:
        &pushzero
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 19							//'Sub0'
        &dcallmp 21							// RollOut()
        &pushsdb 22							//'vBttn0Fade'
        &pushbyte 2
        &setVariable
        &pushzero
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 23							//'Sub1'
        &dcallmp 20							// RollOver()
        &jmp label11        
       label5:
        &pushzero
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 23							//'Sub1'
        &dcallmp 21							// RollOut()
        &pushsdb 24							//'vBttn1Fade'
        &pushfloat 2.200000047683716
        &setVariable
        &pushzero
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 25							//'Sub2'
        &dcallmp 20							// RollOver()
        &jmp label11        
       label6:
        &pushzero
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 25							//'Sub2'
        &dcallmp 21							// RollOut()
        &pushsdb 26							//'vBttn2Fade'
        &pushfloat 2.400000095367432
        &setVariable
        &pushzero
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 27							//'Sub3'
        &dcallmp 20							// RollOver()
        &jmp label11        
       label7:
        &pushzero
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 27							//'Sub3'
        &dcallmp 21							// RollOut()
        &pushsdb 28							//'vBttn3Fade'
        &pushfloat 2.599999904632568
        &setVariable
        &jmp label11        
       label8:
        &getURL 'FSCommand:PlaySound'         'GuiAlienReveal'        
        &pushsdb 29							//''
        &pushone
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 30							//'Sub4'
        &dcallmp 2							// SetMode()
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 19							//'Sub0'
        &pushsdb 7							//'_alpha'
        &pushbyte 50
        &setMember
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 23							//'Sub1'
        &pushsdb 7							//'_alpha'
        &pushbyte 50
        &setMember
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 25							//'Sub2'
        &pushsdb 7							//'_alpha'
        &pushbyte 50
        &setMember
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 27							//'Sub3'
        &pushsdb 7							//'_alpha'
        &pushbyte 50
        &setMember
        &jmp label11        
       label9:
        &pushzero
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 30							//'Sub4'
        &dcallmp 20							// RollOver()
        &jmp label11        
       label10:
        &pushzero
        &pushsdbgv 18							//'SubMenu'
        &pushsdbgm 30							//'Sub4'
        &dcallmp 31							// Press()
        &pushzero
        &push r:1        
        &pushsdbgm 4							//'MainMenu'
        &dcallmp 32							// ClearAlienRevealCallback()
        &jmp label11        
       label11:
        &pushsdb 13							//'vRevealFrame'
        &pushsdbgv 13							//'vRevealFrame'
        &increment
        &setVariable
      &end // of function AlienRevealUpdate

      &pushsdb 29							//''
      &pushone
      &dcallfp 2							// SetMode()
      &pushsdb 33							//'$Campaign'
      &pushone
      &dcallfp 34							// SetText()
      &pushsdb 13							//'vRevealFrame'
      &pushzero
      &varEquals
      &pushsdb 22							//'vBttn0Fade'
      &pushzero
      &varEquals
      &pushsdb 24							//'vBttn1Fade'
      &pushzero
      &varEquals
      &pushsdb 26							//'vBttn2Fade'
      &pushzero
      &varEquals
      &pushsdb 28							//'vBttn3Fade'
      &pushzero
      &varEquals
      &pushsdbgv 35							//'AlienRevealUpdate'
      &pushone
      &pushsdbgv 36							//'_root'
      &pushsdbgm 4							//'MainMenu'
      &dcallmp 37							// RegisterAlienRevealCallback()
    &end // of frame 0

    &frame 1
      &stop
    &end // of frame 1

    &frame 10
      &stop
      &pushthisgv
      &pushone
      &pushsgv '_parent'
      &pushs 'ActivateNav'
      &callmp
    &end // of frame 10
  &end // of defineMovieClip 72
  
  &exportAssets
    72 &as 'NavButtonSoloPlay'
  &end // of exportAssets

  &defineMovieClip 73 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 73

  &defineMovieClip 76 // total frames: 1
  &end // of defineMovieClip 76

  &defineMovieClip 81 // total frames: 1
  &end // of defineMovieClip 81
  
  &exportAssets
    81 &as 'NavSkirmishSub0'
  &end // of exportAssets

  &defineMovieClip 82 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 82

  &defineMovieClip 85 // total frames: 1
  &end // of defineMovieClip 85

  &defineMovieClip 90 // total frames: 1
  &end // of defineMovieClip 90
  
  &exportAssets
    90 &as 'NavSkirmishSub1'
  &end // of exportAssets

  &defineMovieClip 91 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 91

  &defineMovieClip 94 // total frames: 1
  &end // of defineMovieClip 94

  &defineMovieClip 99 // total frames: 1
  &end // of defineMovieClip 99
  
  &exportAssets
    99 &as 'NavSkirmishSub2'
  &end // of exportAssets

  &defineMovieClip 102 // total frames: 1
  &end // of defineMovieClip 102

  &defineMovieClip 105 // total frames: 1
  &end // of defineMovieClip 105
  
  &exportAssets
    99 &as 'NavSkirmishSub2'
  &end // of exportAssets
  
  &exportAssets
    90 &as 'NavSkirmishSub1'
  &end // of exportAssets
  
  &exportAssets
    81 &as 'NavSkirmishSub0'
  &end // of exportAssets

  &defineMovieClip 109 // total frames: 1

    &frame 0
      &constants 'OnMouseLeaveMenu', '$NewSkirmish', 'Sub0', 'SetText', '$LoadGame', 'Sub1', '$CustomMap', 'Sub2', 'ReleaseCallback', 'MainMenu', 'SkirmishButton', 'LoadSkirmishGameButton', 'CustomMapButton', '', 'SetMode', 'MouseLeaveBttn', 'onRollOver'  
      &function2 OnMouseLeaveMenu ('Void') (r:1='_parent')
        &pushzero
        &push r:1        
        &dcallmp 0							// OnMouseLeaveMenu()
      &end // of function OnMouseLeaveMenu

      &pushsdb 1							//'$NewSkirmish'
      &pushone
      &pushsdbgv 2							//'Sub0'
      &dcallmp 3							// SetText()
      &pushsdb 4							//'$LoadGame'
      &pushone
      &pushsdbgv 5							//'Sub1'
      &dcallmp 3							// SetText()
      &pushsdb 6							//'$CustomMap'
      &pushone
      &pushsdbgv 7							//'Sub2'
      &dcallmp 3							// SetText()
      &pushsdbgv 2							//'Sub0'
      &pushsdb 8							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 9							//'MainMenu'
        &dcallmp 10							// SkirmishButton()
      &end // of function 

      &setMember
      &pushsdbgv 5							//'Sub1'
      &pushsdb 8							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 9							//'MainMenu'
        &dcallmp 11							// LoadSkirmishGameButton()
      &end // of function 

      &setMember
      &pushsdbgv 7							//'Sub2'
      &pushsdb 8							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 9							//'MainMenu'
        &dcallmp 12							// CustomMapButton()
      &end // of function 

      &setMember
      &pushsdb 13							//''
      &pushone
      &pushsdbgv 2							//'Sub0'
      &dcallmp 14							// SetMode()
      &pushsdb 13							//''
      &pushone
      &pushsdbgv 5							//'Sub1'
      &dcallmp 14							// SetMode()
      &pushsdb 13							//''
      &pushone
      &pushsdbgv 7							//'Sub2'
      &dcallmp 14							// SetMode()
      &pushsdbgv 15							//'MouseLeaveBttn'
      &pushsdb 16							//'onRollOver'
      &function2  () (r:1='_parent')
        &pushzero
        &push r:1        
        &dcallmp 0							// OnMouseLeaveMenu()
      &end // of function 

      &setMember
    &end // of frame 0
  &end // of defineMovieClip 109

  &defineMovieClip 110 // total frames: 20

    &frame 0
      &constants 'GetMode', 'Selected', 'SetMode', 'OnDebugLoadMap', 'MainMenu', 'OnDebugButton', '', '$Skirmish', 'SetText'  
      &function RollOverCallback (      )      
        &pushzero
        &pushsdb 0							//'GetMode'
        &callFunction
        &pushsdb 1							//'Selected'
        &equals
        &not
        &not
        &jnz label1        
        &pushsdb 1							//'Selected'
        &pushone
        &dcallfp 2							// SetMode()
        &gotoLabel '_over'
        &play
       label1:
      &end // of function RollOverCallback

      &function2 ReleaseCallback () (r:1='_root')
        &pushsdb 3							//'OnDebugLoadMap'
        &pushone
        &push r:1        
        &pushsdbgm 4							//'MainMenu'
        &dcallmp 5							// OnDebugButton()
      &end // of function ReleaseCallback

      &pushsdb 6							//''
      &pushone
      &dcallfp 2							// SetMode()
      &pushsdb 7							//'$Skirmish'
      &pushone
      &dcallfp 8							// SetText()
    &end // of frame 0

    &frame 1
      &stop
    &end // of frame 1

    &frame 10
      &stop
      &pushthisgv
      &pushone
      &pushsgv '_parent'
      &pushs 'ActivateNav'
      &callmp
    &end // of frame 10
  &end // of defineMovieClip 110
  
  &exportAssets
    110 &as 'NavButtonSkirmish'
  &end // of exportAssets

  &defineMovieClip 111 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 111

  &defineMovieClip 114 // total frames: 1
  &end // of defineMovieClip 114

  &defineMovieClip 119 // total frames: 1
  &end // of defineMovieClip 119
  
  &exportAssets
    119 &as 'NavMultiplayerSub0 '
  &end // of exportAssets

  &defineMovieClip 120 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 120

  &defineMovieClip 123 // total frames: 1
  &end // of defineMovieClip 123

  &defineMovieClip 128 // total frames: 1
  &end // of defineMovieClip 128
  
  &exportAssets
    128 &as 'NavMultiplayerSub1'
  &end // of exportAssets

  &defineMovieClip 129 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 129

  &defineMovieClip 132 // total frames: 1
  &end // of defineMovieClip 132

  &defineMovieClip 137 // total frames: 1
  &end // of defineMovieClip 137
  
  &exportAssets
    137 &as 'NavMultiplayerSub2'
  &end // of exportAssets

  &defineMovieClip 140 // total frames: 1
  &end // of defineMovieClip 140

  &defineMovieClip 143 // total frames: 1
  &end // of defineMovieClip 143
  
  &exportAssets
    137 &as 'NavMultiplayerSub2'
  &end // of exportAssets
  
  &exportAssets
    128 &as 'NavMultiplayerSub1'
  &end // of exportAssets
  
  &exportAssets
    119 &as 'NavMultiplayerSub0 '
  &end // of exportAssets

  &defineMovieClip 147 // total frames: 1

    &frame 0
      &constants 'OnMouseLeaveMenu', '$Network', 'Sub0', 'SetText', '$Online', 'Sub1', '$Replays', 'Sub2', 'ReleaseCallback', 'MainMenu', 'LocalNetworkButton', 'OnlineButton', 'ReplayButton', '', 'SetMode', 'MouseLeaveBttn', 'onRollOver'  
      &function2 OnMouseLeaveMenu ('Void') (r:1='_parent')
        &pushzero
        &push r:1        
        &dcallmp 0							// OnMouseLeaveMenu()
      &end // of function OnMouseLeaveMenu

      &pushsdb 1							//'$Network'
      &pushone
      &pushsdbgv 2							//'Sub0'
      &dcallmp 3							// SetText()
      &pushsdb 4							//'$Online'
      &pushone
      &pushsdbgv 5							//'Sub1'
      &dcallmp 3							// SetText()
      &pushsdb 6							//'$Replays'
      &pushone
      &pushsdbgv 7							//'Sub2'
      &dcallmp 3							// SetText()
      &pushsdbgv 2							//'Sub0'
      &pushsdb 8							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 9							//'MainMenu'
        &dcallmp 10							// LocalNetworkButton()
      &end // of function 

      &setMember
      &pushsdbgv 5							//'Sub1'
      &pushsdb 8							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 9							//'MainMenu'
        &dcallmp 11							// OnlineButton()
      &end // of function 

      &setMember
      &pushsdbgv 7							//'Sub2'
      &pushsdb 8							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 9							//'MainMenu'
        &dcallmp 12							// ReplayButton()
      &end // of function 

      &setMember
      &pushsdb 13							//''
      &pushone
      &pushsdbgv 2							//'Sub0'
      &dcallmp 14							// SetMode()
      &pushsdb 13							//''
      &pushone
      &pushsdbgv 5							//'Sub1'
      &dcallmp 14							// SetMode()
      &pushsdb 13							//''
      &pushone
      &pushsdbgv 7							//'Sub2'
      &dcallmp 14							// SetMode()
      &pushsdbgv 15							//'MouseLeaveBttn'
      &pushsdb 16							//'onRollOver'
      &function2  () (r:1='_parent')
        &pushzero
        &push r:1        
        &dcallmp 0							// OnMouseLeaveMenu()
      &end // of function 

      &setMember
    &end // of frame 0
  &end // of defineMovieClip 147

  &defineMovieClip 148 // total frames: 20

    &frame 0
      &constants 'GetMode', 'Selected', 'SetMode', 'OnDebugGuiTest', 'MainMenu', 'OnDebugButton', '', '$MultiPlayer', 'SetText'  
      &function RollOverCallback (      )      
        &pushzero
        &pushsdb 0							//'GetMode'
        &callFunction
        &pushsdb 1							//'Selected'
        &equals
        &not
        &not
        &jnz label1        
        &pushsdb 1							//'Selected'
        &pushone
        &dcallfp 2							// SetMode()
        &gotoLabel '_over'
        &play
       label1:
      &end // of function RollOverCallback

      &function2 ReleaseCallback () (r:1='_root')
        &pushsdb 3							//'OnDebugGuiTest'
        &pushone
        &push r:1        
        &pushsdbgm 4							//'MainMenu'
        &dcallmp 5							// OnDebugButton()
      &end // of function ReleaseCallback

      &pushsdb 6							//''
      &pushone
      &dcallfp 2							// SetMode()
      &pushsdb 7							//'$MultiPlayer'
      &pushone
      &dcallfp 8							// SetText()
    &end // of frame 0

    &frame 1
      &stop
    &end // of frame 1

    &frame 10
      &stop
      &pushthisgv
      &pushone
      &pushsgv '_parent'
      &pushs 'ActivateNav'
      &callmp
    &end // of frame 10
  &end // of defineMovieClip 148
  
  &exportAssets
    148 &as 'NavButtonMultiplayer'
  &end // of exportAssets

  &defineMovieClip 149 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 149

  &defineMovieClip 152 // total frames: 1
  &end // of defineMovieClip 152

  &defineMovieClip 157 // total frames: 1
  &end // of defineMovieClip 157
  
  &exportAssets
    157 &as 'NavProfilesSub0'
  &end // of exportAssets

  &defineMovieClip 158 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 158

  &defineMovieClip 161 // total frames: 1
  &end // of defineMovieClip 161

  &defineMovieClip 166 // total frames: 1
  &end // of defineMovieClip 166
  
  &exportAssets
    166 &as 'NavProfilesSub1'
  &end // of exportAssets

  &defineMovieClip 167 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 167

  &defineMovieClip 170 // total frames: 1
  &end // of defineMovieClip 170

  &defineMovieClip 175 // total frames: 1
  &end // of defineMovieClip 175
  
  &exportAssets
    175 &as 'NavProfilesSub2'
  &end // of exportAssets

  &defineMovieClip 176 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 176

  &defineMovieClip 179 // total frames: 1
  &end // of defineMovieClip 179

  &defineMovieClip 184 // total frames: 1
  &end // of defineMovieClip 184
  
  &exportAssets
    184 &as 'NavProfilesSub3'
  &end // of exportAssets

  &defineMovieClip 187 // total frames: 1
  &end // of defineMovieClip 187

  &defineMovieClip 190 // total frames: 1
  &end // of defineMovieClip 190
  
  &exportAssets
    184 &as 'NavProfilesSub3'
  &end // of exportAssets
  
  &exportAssets
    175 &as 'NavProfilesSub2'
  &end // of exportAssets
  
  &exportAssets
    166 &as 'NavProfilesSub1'
  &end // of exportAssets
  
  &exportAssets
    157 &as 'NavProfilesSub0'
  &end // of exportAssets

  &defineMovieClip 194 // total frames: 1

    &frame 0
      &constants '$ManageProfile', 'Sub0', 'SetText', '$Stats', 'Sub1', '$IntelDB', 'Sub2', '$VIDEO:TransmissionLog', 'Sub3', 'ReleaseCallback', 'MainMenu', 'ManageProfileButton', 'ProfileStatsButton', 'IntelDBButton', 'TransmissionLogButton', '', 'SetMode', 'MouseLeaveBttn', 'onRollOver', 'OnMouseLeaveMenu'  
      &pushsdb 0							//'$ManageProfile'
      &pushone
      &pushsdbgv 1							//'Sub0'
      &dcallmp 2							// SetText()
      &pushsdb 3							//'$Stats'
      &pushone
      &pushsdbgv 4							//'Sub1'
      &dcallmp 2							// SetText()
      &pushsdb 5							//'$IntelDB'
      &pushone
      &pushsdbgv 6							//'Sub2'
      &dcallmp 2							// SetText()
      &pushsdb 7							//'$VIDEO:TransmissionLog'
      &pushone
      &pushsdbgv 8							//'Sub3'
      &dcallmp 2							// SetText()
      &pushsdbgv 1							//'Sub0'
      &pushsdb 9							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 10							//'MainMenu'
        &dcallmp 11							// ManageProfileButton()
      &end // of function 

      &setMember
      &pushsdbgv 4							//'Sub1'
      &pushsdb 9							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 10							//'MainMenu'
        &dcallmp 12							// ProfileStatsButton()
      &end // of function 

      &setMember
      &pushsdbgv 6							//'Sub2'
      &pushsdb 9							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 10							//'MainMenu'
        &dcallmp 13							// IntelDBButton()
      &end // of function 

      &setMember
      &pushsdbgv 8							//'Sub3'
      &pushsdb 9							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 10							//'MainMenu'
        &dcallmp 14							// TransmissionLogButton()
      &end // of function 

      &setMember
      &pushsdb 15							//''
      &pushone
      &pushsdbgv 1							//'Sub0'
      &dcallmp 16							// SetMode()
      &pushsdb 15							//''
      &pushone
      &pushsdbgv 4							//'Sub1'
      &dcallmp 16							// SetMode()
      &pushsdb 15							//''
      &pushone
      &pushsdbgv 6							//'Sub2'
      &dcallmp 16							// SetMode()
      &pushsdb 15							//''
      &pushone
      &pushsdbgv 8							//'Sub3'
      &dcallmp 16							// SetMode()
      &pushsdbgv 17							//'MouseLeaveBttn'
      &pushsdb 18							//'onRollOver'
      &function2  () (r:1='_parent')
        &pushzero
        &push r:1        
        &dcallmp 19							// OnMouseLeaveMenu()
      &end // of function 

      &setMember
    &end // of frame 0
  &end // of defineMovieClip 194

  &defineMovieClip 195 // total frames: 20

    &frame 0
      &constants 'GetMode', 'Selected', 'SetMode', '', '$Profiles', 'SetText'  
      &function RollOverCallback (      )      
        &pushzero
        &pushsdb 0							//'GetMode'
        &callFunction
        &pushsdb 1							//'Selected'
        &equals
        &not
        &not
        &jnz label1        
        &pushsdb 1							//'Selected'
        &pushone
        &dcallfp 2							// SetMode()
        &gotoLabel '_over'
        &play
       label1:
      &end // of function RollOverCallback

      &pushsdb 3							//''
      &pushone
      &dcallfp 2							// SetMode()
      &pushsdb 4							//'$Profiles'
      &pushone
      &dcallfp 5							// SetText()
    &end // of frame 0

    &frame 1
      &stop
    &end // of frame 1

    &frame 10
      &stop
      &pushthisgv
      &pushone
      &pushsgv '_parent'
      &pushs 'ActivateNav'
      &callmp
    &end // of frame 10
  &end // of defineMovieClip 195
  
  &exportAssets
    195 &as 'NavButtonProfiles'
  &end // of exportAssets

  &defineMovieClip 196 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 196

  &defineMovieClip 199 // total frames: 1
  &end // of defineMovieClip 199

  &defineMovieClip 204 // total frames: 1
  &end // of defineMovieClip 204
  
  &exportAssets
    204 &as 'NavOptionsSub0'
  &end // of exportAssets

  &defineMovieClip 205 // total frames: 1

    &frame 0
      &pushthisgv
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 205

  &defineMovieClip 208 // total frames: 1
  &end // of defineMovieClip 208

  &defineMovieClip 213 // total frames: 1
  &end // of defineMovieClip 213
  
  &exportAssets
    213 &as 'NavOptionsSub1'
  &end // of exportAssets

  &defineMovieClip 216 // total frames: 1
  &end // of defineMovieClip 216

  &defineMovieClip 219 // total frames: 1
  &end // of defineMovieClip 219
  
  &exportAssets
    213 &as 'NavOptionsSub1'
  &end // of exportAssets
  
  &exportAssets
    204 &as 'NavOptionsSub0'
  &end // of exportAssets

  &defineMovieClip 223 // total frames: 1

    &frame 0
      &constants 'OnMouseLeaveMenu', '$Settings', 'Sub0', 'SetText', '$Credits', 'Sub1', 'ReleaseCallback', 'MainMenu', 'SettingsButton', 'CreditsButton', '_CreditsMovie', 'ShowCreditsMovie', 'gotoAndPlay', '', 'SetMode', 'MouseLeaveBttn', 'onRollOver'  
      &function2 OnMouseLeaveMenu ('Void') (r:1='_parent')
        &pushzero
        &push r:1        
        &dcallmp 0							// OnMouseLeaveMenu()
      &end // of function OnMouseLeaveMenu

      &pushsdb 1							//'$Settings'
      &pushone
      &pushsdbgv 2							//'Sub0'
      &dcallmp 3							// SetText()
      &pushsdb 4							//'$Credits'
      &pushone
      &pushsdbgv 5							//'Sub1'
      &dcallmp 3							// SetText()
      &pushsdbgv 2							//'Sub0'
      &pushsdb 6							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 7							//'MainMenu'
        &dcallmp 8							// SettingsButton()
      &end // of function 

      &setMember
      &pushsdbgv 5							//'Sub1'
      &pushsdb 6							//'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 7							//'MainMenu'
        &dcallmp 9							// CreditsButton()
        &pushsdb 10							//'_CreditsMovie'
        &pushone
        &push r:1        
        &pushsdbgm 7							//'MainMenu'
        &pushsdbgm 11							//'ShowCreditsMovie'
        &dcallmp 12							// gotoAndPlay()
      &end // of function 

      &setMember
      &pushsdb 13							//''
      &pushone
      &pushsdbgv 2							//'Sub0'
      &dcallmp 14							// SetMode()
      &pushsdb 13							//''
      &pushone
      &pushsdbgv 5							//'Sub1'
      &dcallmp 14							// SetMode()
      &pushsdbgv 15							//'MouseLeaveBttn'
      &pushsdb 16							//'onRollOver'
      &function2  () (r:1='_parent')
        &pushzero
        &push r:1        
        &dcallmp 0							// OnMouseLeaveMenu()
      &end // of function 

      &setMember
    &end // of frame 0
  &end // of defineMovieClip 223

  &defineMovieClip 224 // total frames: 20

    &frame 0
      &constants 'GetMode', 'Selected', 'SetMode', '', '$Options', 'SetText'  
      &function RollOverCallback (      )      
        &pushzero
        &pushsdb 0							//'GetMode'
        &callFunction
        &pushsdb 1							//'Selected'
        &equals
        &not
        &not
        &jnz label1        
        &pushsdb 1							//'Selected'
        &pushone
        &dcallfp 2							// SetMode()
        &gotoLabel '_over'
        &play
       label1:
      &end // of function RollOverCallback

      &pushsdb 3							//''
      &pushone
      &dcallfp 2							// SetMode()
      &pushsdb 4							//'$Options'
      &pushone
      &dcallfp 5							// SetText()
    &end // of frame 0

    &frame 1
      &stop
    &end // of frame 1

    &frame 10
      &stop
      &pushthisgv
      &pushone
      &pushsgv '_parent'
      &pushs 'ActivateNav'
      &callmp
    &end // of frame 10
  &end // of defineMovieClip 224
  
  &exportAssets
    224 &as 'NavButtonOptions'
  &end // of exportAssets

  &defineMovieClip 227 // total frames: 1
  &end // of defineMovieClip 227

  &defineMovieClip 230 // total frames: 1
  &end // of defineMovieClip 230

  &defineMovieClip 234 // total frames: 1

    &frame 0
      &pushs '$Quit'
      &pushone
      &pushs 'SetText'
      &callfp
      &pushs ''
      &pushone
      &pushs 'SetMode'
      &callfp
      &pushs 'ReleaseCallback'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsgm 'MainMenu'
        &pushs 'QuitButton'
        &callmp
      &end // of function 

      &setVariable
      &pushs 'RollOverCallback'
      &function2  () (r:1='this', r:2='_parent')
        &push r:1        
        &pushone
        &push r:2        
        &pushs 'ActivateNav'
        &callmp
      &end // of function 

      &setVariable
      &stop
    &end // of frame 0
  &end // of defineMovieClip 234
  
  &exportAssets
    234 &as 'ButtonQuit'
  &end // of exportAssets

  &defineMovieClip 236 // total frames: 1
  &end // of defineMovieClip 236
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets

  &defineMovieClip 239 // total frames: 1
  &end // of defineMovieClip 239
  
  &importAssets &from 'GameWindowGadgets.swf'
    'View3D' &as 240
  &end // of importAssets

  &defineMovieClip 241 // total frames: 203

    &frame 0
      &function2 OnAlienReveal ('Void') (r:1='this')
        &pushs 'Reveal:'
        &push r:1        
        &add
        &trace
        &play
      &end // of function OnAlienReveal

      &stop
    &end // of frame 0

    &placeMovieClip 240 
    
      &onClipEvent &construct
        &pushs '_RenderObj'
        &pushssv 'ShellEarth'
        &pushs '_type'
        &pushssv 'View3D'
        &pushs '_KeepAspectRatio'
        &pushtrue
        &setVariable
        &pushs '_AnimMode'
        &pushssv 'LOOP'
        &pushs '_Frame'
        &pushzerosv
      &end
    &end // of placeMovieClip 240

    &frame 202
      &stop
    &end // of frame 202
  &end // of defineMovieClip 241
  
  &importAssets &from 'ShellContent.swf'
    'ShellContent_Hexes' &as 242
  &end // of importAssets

  &defineMovieClip 243 // total frames: 1
  &end // of defineMovieClip 243
  
  &importAssets &from 'ShellContent.swf'
    'ShellContent_Guage' &as 244
  &end // of importAssets

  &defineButton 246
  
    &on     &keyPress 'x'
      &pushglobalgv
      &pushsgm 'InGame'
      &not
      &not
      &jnz label1      
      &pushzero
      &pushsgv '_root'
      &pushs 'EscapeKeyPressed'
      &callmp
     label1:
    &end
  
    &on     &overUpToOverDown
      &pushs 'ResetResolution'
      &pushone
      &pushsgv '_root'
      &pushs 'GameCode'
      &callmp
    &end
  &end // of defineButton 246
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets

  &defineMovieClip 247 // total frames: 1
  &end // of defineMovieClip 247
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets
  
  &exportAssets
    236 &as 'GameMovie'
  &end // of exportAssets

  &defineMovieClip 248 // total frames: 34

    &frame 0
      &function2 OnAlienReveal () (r:1='this')
        &pushs 'Reveal:'
        &push r:1        
        &add
        &trace
        &gotoLabel '_hide'
        &play
      &end // of function OnAlienReveal

      &stop
    &end // of frame 0

    &placeMovieClip 236 &as 'TiberimFieldMovie'
    
      &onClipEvent &construct
        &constants '_MovieName', 'MainMenu', '_CallOnLastFrame', '', '_Loop', '_UseAlpha', '_HoldLastFrame', '_type', 'GameMovie', '_Init', 'GameMovieInit', '_Load'  
        &pushsdb 0							//'_MovieName'
        &pushsdb 1							//'MainMenu'
        &setVariable
        &pushsdb 2							//'_CallOnLastFrame'
        &pushsdb 3							//''
        &setVariable
        &pushsdb 4							//'_Loop'
        &pushtrue
        &setVariable
        &pushsdb 5							//'_UseAlpha'
        &pushfalse
        &setVariable
        &pushsdb 6							//'_HoldLastFrame'
        &pushfalse
        &setVariable
        &pushsdb 7							//'_type'
        &pushsdb 8							//'GameMovie'
        &setVariable
        &pushsdb 9							//'_Init'
        &pushsdb 10							//'GameMovieInit'
        &setVariable
        &pushsdb 11							//'_Load'
        &pushsdb 8							//'GameMovie'
        &setVariable
      &end
    &end // of placeMovieClip 236

    &frame 33
      &stop
    &end // of frame 33
  &end // of defineMovieClip 248

  &defineMovieClip 253 // total frames: 1
  &end // of defineMovieClip 253

  &defineMovieClip 254 // total frames: 26

    &frame 0
      &function Reveal (      )      
        &gotoLabel '_reveal'
        &play
      &end // of function Reveal

      &stop
    &end // of frame 0

    &frame 25
      &pushzero
      &pushsgv '_parent'
      &pushsgm 'Menu'
      &pushs 'Reveal'
      &callmp
      &stop
    &end // of frame 25
  &end // of defineMovieClip 254

  &defineMovieClip 255 // total frames: 36

    &frame 35
      &pushzero
      &pushsgv '_parent'
      &pushsgm 'BgReveal'
      &pushs 'Reveal'
      &callmp
      &stop
    &end // of frame 35
  &end // of defineMovieClip 255

  &defineMovieClip 256 // total frames: 1
  &end // of defineMovieClip 256
  
  &exportAssets
    234 &as 'ButtonQuit'
  &end // of exportAssets
  
  &exportAssets
    224 &as 'NavButtonOptions'
  &end // of exportAssets
  
  &exportAssets
    195 &as 'NavButtonProfiles'
  &end // of exportAssets
  
  &exportAssets
    148 &as 'NavButtonMultiplayer'
  &end // of exportAssets
  
  &exportAssets
    110 &as 'NavButtonSkirmish'
  &end // of exportAssets
  
  &exportAssets
    72 &as 'NavButtonSoloPlay'
  &end // of exportAssets
  
  &exportAssets
    16 &as 'NavButtonTutorial'
  &end // of exportAssets

  &defineMovieClip 261 // total frames: 1
  &end // of defineMovieClip 261

  &defineMovieClip 262 // total frames: 1

    &frame 0
      &constants 'ActiveNav', 'ClearMode', '_up', 'gotoAndPlay', 'MouseLeaveBttn', 'onRelease', 'ActivateNav'  
      &function2 ActivateNav (r:1='mc') ()
        &pushsdbgv 0							//'ActiveNav'
        &push r:1        
        &equals
        &not
        &not
        &jnz label2        
        &pushsdbgv 0							//'ActiveNav'
        &pushundef
        &equals
        &not
        &not
        &jnz label1        
        &pushzero
        &pushsdbgv 0							//'ActiveNav'
        &dcallmp 1							// ClearMode()
        &pushsdb 2							//'_up'
        &pushone
        &pushsdbgv 0							//'ActiveNav'
        &dcallmp 3							// gotoAndPlay()
       label1:
        &pushsdb 0							//'ActiveNav'
        &push r:1        
        &setVariable
       label2:
      &end // of function ActivateNav

      &stop
      &pushsdbgv 4							//'MouseLeaveBttn'
      &pushsdb 5							//'onRelease'
      &function  (      )      
        &pushundef
        &pushone
        &dcallfp 6							// ActivateNav()
      &end // of function 

      &setMember
      &pushsdb 0							//'ActiveNav'
      &pushundef
      &varEquals
    &end // of frame 0
  &end // of defineMovieClip 262

  &defineMovieClip 264 // total frames: 1
  &end // of defineMovieClip 264

  &defineMovieClip 267 // total frames: 1
  &end // of defineMovieClip 267

  &defineMovieClip 269 // total frames: 1
  &end // of defineMovieClip 269

  &defineMovieClip 270 // total frames: 10

    &frame 0
      &pushzero
      &pushsgv '_root'
      &pushsgm 'MainMenu'
      &pushs 'IsShowKane'
      &callMethod
      &not
      &jnz label1      
      &gotoLabel '_kane'
      &play
      &jmp label2      
     label1:
      &stop
     label2:
    &end // of frame 0

    &placeMovieClip 269 &as 'Logo'
    
      &onClipEvent &construct
        &pushs '_type'
        &pushssv 'RenderImage'
        &pushs '_imageMap'
        &pushssv 'MainMenuLogo'
        &pushs '_mode'
        &pushssv 'ALPHA'
      &end
    &end // of placeMovieClip 269

    &frame 1
      &stop
    &end // of frame 1

    &placeMovieClip 269 &as 'Logo'
    
      &onClipEvent &construct
        &pushs '_type'
        &pushssv 'RenderImage'
        &pushs '_imageMap'
        &pushssv 'MainMenuLogoKane'
        &pushs '_mode'
        &pushssv 'ALPHA'
      &end
    &end // of placeMovieClip 269
  &end // of defineMovieClip 270

  &defineMovieClip 273 // total frames: 1
  &end // of defineMovieClip 273

  &defineMovieClip 274 // total frames: 50

    &frame 0
      &function Reveal (      )      
        &gotoLabel '_reveal'
        &play
      &end // of function Reveal

      &stop
    &end // of frame 0

    &frame 49
      &stop
    &end // of frame 49
  &end // of defineMovieClip 274

  &defineMovieClip 276 // total frames: 1

    &frame 0
      &constants '_parent', 'streak', 'Array', 'heading', 'vert', 'alphaHeading', 'up', 'length', 'this', '_alpha'  
      &pushsdbgv 0							//'_parent'
      &pushsdbgm 1							//'streak'
      &pushundef
      &equals
      &not
      &jnz label1      
      &pushsdbgv 0							//'_parent'
      &pushsdb 1							//'streak'
      &pushzero
      &pushsdb 2							//'Array'
      &new
      &setMember
     label1:
      &pushsdb 3							//'heading'
      &pushsdb 4							//'vert'
      &setVariable
      &pushsdb 5							//'alphaHeading'
      &pushsdb 6							//'up'
      &setVariable
      &pushsdbgv 0							//'_parent'
      &pushsdbgm 1							//'streak'
      &pushsdbgv 0							//'_parent'
      &pushsdbgm 1							//'streak'
      &pushsdbgm 7							//'length'
      &pushthisgv
      &setMember
      &pushthisgv
      &pushsdb 9							//'_alpha'
      &pushzero
      &setMember
    &end // of frame 0
  &end // of defineMovieClip 276

  &defineMovieClip 277 // total frames: 1

    &frame 0
      &constants '_parent', 'streak', 'Array', 'heading', 'horiz', 'alphaHeading', 'up', 'length', 'this', '_alpha'  
      &pushsdbgv 0							//'_parent'
      &pushsdbgm 1							//'streak'
      &pushundef
      &equals
      &not
      &jnz label1      
      &pushsdbgv 0							//'_parent'
      &pushsdb 1							//'streak'
      &pushzero
      &pushsdb 2							//'Array'
      &new
      &setMember
     label1:
      &pushsdb 3							//'heading'
      &pushsdb 4							//'horiz'
      &setVariable
      &pushsdb 5							//'alphaHeading'
      &pushsdb 6							//'up'
      &setVariable
      &pushsdbgv 0							//'_parent'
      &pushsdbgm 1							//'streak'
      &pushsdbgv 0							//'_parent'
      &pushsdbgm 1							//'streak'
      &pushsdbgm 7							//'length'
      &pushthisgv
      &setMember
      &pushthisgv
      &pushsdb 9							//'_alpha'
      &pushzero
      &setMember
      &stop
    &end // of frame 0
  &end // of defineMovieClip 277

  &defineMovieClip 278 // total frames: 2

    &frame 0
      &constants 'ChooseNewStreak', 'DreiveStreak', 'streak', 'length', 'DriveStreak', 'startPosition', 'alphaCeil', 'speed', 'alphaSpeed', 'delayLength', 'frameDelay', 'obj', 'heading', 'vert', '_y', '_height', '_x', '_width', 'onEnterFrame', 'alphaHeading', 'up', '_alpha', 'down'  
      &function onUnload (      )      
        &pushsdb 0							//'ChooseNewStreak'
        &delete2
        &pop
        &pushsdb 1							//'DreiveStreak'
        &delete2
        &pop
      &end // of function onUnload

      &function2 ChooseNewStreak ('Void') ()
        &pushsdbgv 2							//'streak'
        &pushsdbgm 3							//'length'
        &setRegister r:1
        &pop
        &pushsdbgv 2							//'streak'
        &push r:1        
        &random
        &getMember
        &setRegister r:2
        &pop
        &push r:2        
        &pushone
        &dcallfp 4							// DriveStreak()
      &end // of function ChooseNewStreak

      &function DriveStreak ('obj'      )      
        &pushsdb 5							//'startPosition'
        &pushbyte 2
        &random
        &varEquals
        &pushsdb 6							//'alphaCeil'
        &pushbyte 50
        &varEquals
        &pushsdb 7							//'speed'
        &pushbyte 25
        &varEquals
        &pushsdb 8							//'alphaSpeed'
        &pushfloat 2.500000000000000
        &varEquals
        &pushsdb 9							//'delayLength'
        &pushbyte 50
        &varEquals
        &pushsdb 10							//'frameDelay'
        &pushzero
        &varEquals
        &pushsdbgv 11							//'obj'
        &pushsdbgm 12							//'heading'
        &pushsdb 13							//'vert'
        &equals
        &not
        &jnz label3        
        &pushsdbgv 5							//'startPosition'
        &pushzero
        &equals
        &not
        &jnz label1        
        &pushsdbgv 11							//'obj'
        &pushsdb 14							//'_y'
        &pushzero
        &pushsdbgv 11							//'obj'
        &pushsdbgm 15							//'_height'
        &subtract
        &setMember
        &jmp label2        
       label1:
        &pushsdbgv 11							//'obj'
        &pushsdb 14							//'_y'
        &pushshort 768
        &pushsdbgv 11							//'obj'
        &pushsdbgm 15							//'_height'
        &add
        &setMember
       label2:
        &jmp label5        
       label3:
        &pushsdbgv 5							//'startPosition'
        &pushzero
        &equals
        &not
        &jnz label4        
        &pushsdbgv 11							//'obj'
        &pushsdb 16							//'_x'
        &pushzero
        &pushsdbgv 11							//'obj'
        &pushsdbgm 17							//'_width'
        &subtract
        &setMember
        &jmp label5        
       label4:
        &pushsdbgv 11							//'obj'
        &pushsdb 16							//'_x'
        &pushshort 1024
        &pushsdbgv 11							//'obj'
        &pushsdbgm 17							//'_width'
        &add
        &setMember
       label5:
        &pushsdbgv 11							//'obj'
        &pushsdb 18							//'onEnterFrame'
        &function  (        )        
          &pushsdbgv 10							//'frameDelay'
          &pushsdbgv 9							//'delayLength'
          &equals
          &not
          &jnz label16          
          &pushsdbgv 11							//'obj'
          &pushsdbgm 12							//'heading'
          &pushsdb 13							//'vert'
          &equals
          &not
          &jnz label8          
          &pushsdbgv 5							//'startPosition'
          &pushzero
          &equals
          &not
          &jnz label6          
          &pushsdbgv 11							//'obj'
          &pushsdb 14							//'_y'
          &pushsdbgv 11							//'obj'
          &pushsdbgm 14							//'_y'
          &pushsdbgv 7							//'speed'
          &add
          &setMember
          &jmp label7          
         label6:
          &pushsdbgv 11							//'obj'
          &pushsdb 14							//'_y'
          &pushsdbgv 11							//'obj'
          &pushsdbgm 14							//'_y'
          &pushsdbgv 7							//'speed'
          &subtract
          &setMember
         label7:
          &jmp label10          
         label8:
          &pushsdbgv 5							//'startPosition'
          &pushzero
          &equals
          &not
          &jnz label9          
          &pushsdbgv 11							//'obj'
          &pushsdb 16							//'_x'
          &pushsdbgv 11							//'obj'
          &pushsdbgm 16							//'_x'
          &pushsdbgv 7							//'speed'
          &add
          &setMember
          &jmp label10          
         label9:
          &pushsdbgv 11							//'obj'
          &pushsdb 16							//'_x'
          &pushsdbgv 11							//'obj'
          &pushsdbgm 16							//'_x'
          &pushsdbgv 7							//'speed'
          &subtract
          &setMember
         label10:
          &pushsdbgv 11							//'obj'
          &pushsdbgm 19							//'alphaHeading'
          &pushsdb 20							//'up'
          &equals
          &not
          &jnz label13          
          &pushsdbgv 11							//'obj'
          &pushsdbgm 21							//'_alpha'
          &pushsdbgv 6							//'alphaCeil'
          &lessThan
          &not
          &jnz label11          
          &pushsdbgv 11							//'obj'
          &pushsdb 21							//'_alpha'
          &pushsdbgv 11							//'obj'
          &pushsdbgm 21							//'_alpha'
          &pushsdbgv 8							//'alphaSpeed'
          &add
          &setMember
          &jmp label12          
         label11:
          &pushsdbgv 11							//'obj'
          &pushsdb 19							//'alphaHeading'
          &pushsdb 22							//'down'
          &setMember
         label12:
          &jmp label15          
         label13:
          &pushsdbgv 11							//'obj'
          &pushsdbgm 21							//'_alpha'
          &pushzero
          &greaterThan
          &not
          &jnz label14          
          &pushsdbgv 11							//'obj'
          &pushsdb 21							//'_alpha'
          &pushsdbgv 11							//'obj'
          &pushsdbgm 21							//'_alpha'
          &pushsdbgv 8							//'alphaSpeed'
          &subtract
          &setMember
          &jmp label15          
         label14:
          &pushsdbgv 11							//'obj'
          &pushsdb 19							//'alphaHeading'
          &pushsdb 20							//'up'
          &setMember
          &pushsdbgv 11							//'obj'
          &pushsdb 18							//'onEnterFrame'
          &delete
          &pop
          &pushzero
          &dcallfp 0							// ChooseNewStreak()
         label15:
          &jmp label17          
         label16:
          &pushsdb 10							//'frameDelay'
          &pushsdbgv 10							//'frameDelay'
          &increment
          &setVariable
         label17:
        &end // of function 

        &setMember
      &end // of function DriveStreak

    &end // of frame 0

    &frame 1
      &pushzero
      &pushs 'ChooseNewStreak'
      &callfp
      &stop
    &end // of frame 1
  &end // of defineMovieClip 278

  &defineMovieClip 281 // total frames: 36

    &frame 0
      &pushzero
      &pushsgv '_root'
      &pushsgm 'MainMenu'
      &pushs 'IsAlienReveal'
      &callMethod
      &not
      &jnz label1      
      &stop
      &pushsgv 'WaitForClick'
      &pushs 'onPress'
      &function  (      )      
        &gotoLabel '_reveal'
        &play
      &end // of function 

      &setMember
      &jmp label2      
     label1:
      &gotoLabel '_normal'
      &play
     label2:
    &end // of frame 0

    &frame 1
      &constants 'onEnterFrame', 'MainMenu', 'UpdateAlienReveal', '_root', 'OnAlienRevealStarted'  
      &stop
      &pushsdb 0							//'onEnterFrame'
      &function2  () (r:1='_root')
        &pushzero
        &push r:1        
        &pushsdbgm 1							//'MainMenu'
        &pushsdb 2							//'UpdateAlienReveal'
        &callMethod
        &not
        &not
        &jnz label1        
        &gotoLabel '_dim'
        &play
       label1:
      &end // of function 

      &setVariable
      &pushzero
      &pushsdbgv 3							//'_root'
      &pushsdbgm 1							//'MainMenu'
      &dcallmp 4							// OnAlienRevealStarted()
    &end // of frame 1

    &frame 11
      &stop
    &end // of frame 11

    &frame 21
      &constants 'onEnterFrame', 'MainMenu', '_alpha'  
      &stop
      &pushsdb 0							//'onEnterFrame'
      &delete2
      &pop
      &pushsdb 0							//'onEnterFrame'
      &function2  () (r:1='_root')
        &push r:1        
        &pushsdbgm 1							//'MainMenu'
        &pushsdb 2							//'_alpha'
        &push r:1        
        &pushsdbgm 1							//'MainMenu'
        &pushsdbgm 2							//'_alpha'
        &pushbyte 5
        &subtract
        &setMember
        &push r:1        
        &pushsdbgm 1							//'MainMenu'
        &pushsdbgm 2							//'_alpha'
        &pushone
        &greaterThan
        &not
        &not
        &jnz label1        
        &gotoLabel '_done'
        &play
       label1:
      &end // of function 

      &setVariable
    &end // of frame 21

    &frame 29
      &stop
      &pushs 'onEnterFrame'
      &delete2
      &pop
      &pushzero
      &pushsgv '_root'
      &pushsgm 'MainMenu'
      &pushs 'OnAlienRevealDone'
      &callmp
    &end // of frame 29
  &end // of defineMovieClip 281

  &defineMovieClip 286 // total frames: 1
  &end // of defineMovieClip 286
  
  &exportAssets
    6 &as 'SmokeColor_mc'
  &end // of exportAssets
  
  &exportAssets
    6 &as 'SmokeColor_mc'
  &end // of exportAssets

  &defineMovieClip 287 // total frames: 1

    &frame 0
      &constants 'vFront', '_x', 'vBack', '_width', 'vOffset', 'intervalId', 'clearInterval', 'Smoking', 'onUnload', 'Smoke1', 'Smoke2', 'setInterval'  
      &function2 Smoking () ()
        &pushsdbgv 0							//'vFront'
        &pushsdb 1							//'_x'
        &pushsdbgv 0							//'vFront'
        &pushsdbgm 1							//'_x'
        &pushbyte 2
        &subtract
        &setMember
        &pushsdbgv 2							//'vBack'
        &pushsdb 1							//'_x'
        &pushsdbgv 2							//'vBack'
        &pushsdbgm 1							//'_x'
        &pushbyte 2
        &subtract
        &setMember
        &pushzero
        &pushsdbgv 0							//'vFront'
        &pushsdbgm 1							//'_x'
        &subtract
        &pushsdbgv 0							//'vFront'
        &pushsdbgm 3							//'_width'
        &greaterThan
        &not
        &jnz label1        
        &pushsdbgv 0							//'vFront'
        &pushsdb 1							//'_x'
        &pushsdbgv 2							//'vBack'
        &pushsdbgm 1							//'_x'
        &pushsdbgv 2							//'vBack'
        &pushsdbgm 3							//'_width'
        &pushsdbgv 4							//'vOffset'
        &subtract
        &add
        &setMember
        &pushsdbgv 0							//'vFront'
        &setRegister r:1
        &pop
        &pushsdb 0							//'vFront'
        &pushsdbgv 2							//'vBack'
        &setVariable
        &pushsdb 2							//'vBack'
        &push r:1        
        &setVariable
       label1:
      &end // of function Smoking

      &function onUnload (      )      
        &pushsdbgv 5							//'intervalId'
        &pushone
        &dcallfp 6							// clearInterval()
        &pushsdb 7							//'Smoking'
        &delete2
        &pop
        &pushsdb 8							//'onUnload'
        &delete2
        &pop
      &end // of function onUnload

      &pushsdb 4							//'vOffset'
      &pushbyte 100
      &varEquals
      &pushsdb 0							//'vFront'
      &pushsdbgv 9							//'Smoke1'
      &varEquals
      &pushsdb 2							//'vBack'
      &pushsdbgv 10							//'Smoke2'
      &varEquals
      &pushsdbgv 0							//'vFront'
      &pushsdb 1							//'_x'
      &pushzero
      &setMember
      &pushsdbgv 2							//'vBack'
      &pushsdb 1							//'_x'
      &pushsdbgv 0							//'vFront'
      &pushsdbgm 3							//'_width'
      &pushsdbgv 4							//'vOffset'
      &subtract
      &setMember
      &pushsdb 5							//'intervalId'
      &pushfloat 33.333332061767578
      &pushsdbgv 7							//'Smoking'
      &pushbyte 2
      &pushsdb 11							//'setInterval'
      &callFunction
      &varEquals
    &end // of frame 0
  &end // of defineMovieClip 287

  &defineMovieClip 290 // total frames: 1
  &end // of defineMovieClip 290

  &defineMovieClip 293 // total frames: 1
  &end // of defineMovieClip 293

  &defineMovieClip 294 // total frames: 1
  &end // of defineMovieClip 294

  &defineMovieClip 295 // total frames: 48

    &frame 47
      &stop
    &end // of frame 47
  &end // of defineMovieClip 295

  &defineMovieClip 297 // total frames: 1
  &end // of defineMovieClip 297
  
  &importAssets &from 'ShellButtons.swf'
    'ShellButtons Small' &as 298
  &end // of importAssets

  &defineMovieClip 299 // total frames: 24

    &frame 0
      &stop
    &end // of frame 0

    &frame 9
      &constants 'Credits Playing', '$Exit', 'ExitCredits', '_root', 'LocalComponentLoader', 'InitNewButton', 'ReleaseCallback', 'HIDE'  
      &pushsdb 0							//'Credits Playing'
      &trace
      &pushsdb 1							//'$Exit'
      &pushsdbgv 2							//'ExitCredits'
      &pushbyte 2
      &pushsdbgv 3							//'_root'
      &pushsdbgm 4							//'LocalComponentLoader'
      &dcallmp 5							// InitNewButton()
      &pushsdbgv 2							//'ExitCredits'
      &pushsdb 6							//'ReleaseCallback'
      &function  (      )      
        &pushsdb 7							//'HIDE'
        &trace
        &gotoLabel '_Exit'
        &play
      &end // of function 

      &setMember
    &end // of frame 9

    &placeMovieClip 297 
    
      &onClipEvent &construct
        &pushs '_type'
        &pushssv 'AptMainMenu::RenderCredits'
      &end
    &end // of placeMovieClip 297

    &placeMovieClip 298 &as 'ExitCredits'
    
      &onClipEvent &construct
        &pushs 'vStartMode'
        &pushssv ''
      &end
    &end // of placeMovieClip 298

    &frame 17
      &stop
      &pushs 'Credits Playing......'
      &trace
    &end // of frame 17

    &frame 18
      &stop
      &gotoLabel '_hide'
      &pushzero
      &pushsgv '_root'
      &pushsgm 'MainMenu'
      &pushs 'ExitCreditsButton'
      &callmp
    &end // of frame 18
  &end // of defineMovieClip 299

  &defineMovieClip 300 // total frames: 20

    &frame 0
      &constants '_root', 'MainMenu', 'DetermineForceCreate', 'SetGoToActivate', 'LoadProfileManagerMovie'  
      &pushzero
      &pushsdbgv 0							//'_root'
      &pushsdbgm 1							//'MainMenu'
      &pushsdb 2							//'DetermineForceCreate'
      &callMethod
      &not
      &jnz label1      
      &stop
      &pushzero
      &pushsdbgv 0							//'_root'
      &pushsdbgm 1							//'MainMenu'
      &dcallmp 3							// SetGoToActivate()
      &pushfalse
      &pushone
      &dcallfp 4							// LoadProfileManagerMovie()
      &jmp label2      
     label1:
      &gotoLabel '_active'
      &play
     label2:
    &end // of frame 0

    &frame 0
    &end // of frame 0

    &frame 19
      &stop
    &end // of frame 19
  &end // of defineMovieClip 300
  
  &exportAssets
    300 &as 'MainMenuClass'
  &end // of exportAssets
  
  &exportAssets
    300 &as 'MainMenuClass'
  &end // of exportAssets
  
  &exportAssets
    3 &as 'AptZombieClass'
  &end // of exportAssets

  &defineMovieClip 301 // total frames: 0
  &end // of defineMovieClip 301
  
  &exportAssets
    301 &as '__Packages.DebugClass'
  &end // of exportAssets
  
  &initMovieClip 301
    &constants '_global', 'DebugClass', 'prototype', 'InitDebugClass', 'm_codePrefix', ':', 'Enable', 'extern', 'InGame', 'Boolean', 'DoTrace', 'm_enabled', 'Trace', 'Dump', 'Dump:', '\t', ': ', ' : ', '', 'ASSetPropFlags'  
    &pushglobalgv
    &pushsdbgm 1							//'DebugClass'
    &not
    &not
    &jnz label5    
    &pushglobalgv
    &pushsdb 1							//'DebugClass'
    &function  (    )    
    &end // of function 

    &setRegister r:0
    &setMember
    &push r:0    
    &pushsdbgm 2							//'prototype'
    &setRegister r:1
    &pop
    &push r:1    
    &pushsdb 3							//'InitDebugClass'
    &function2  (r:2='codePrefix') (r:1='this')
      &push r:1      
      &pushsdb 4							//'m_codePrefix'
      &push r:2      
      &pushsdb 5							//':'
      &add
      &setMember
      &pushfalse
      &pushone
      &push r:1      
      &dcallmp 6							// Enable()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 6							//'Enable'
    &function2  (r:2='enable') (r:1='this')
      &push r:1      
      &pushsdbgm 7							//'extern'
      &pushsdbgm 8							//'InGame'
      &toNumber
      &pushone
      &pushsdb 9							//'Boolean'
      &callFunction
      &not
      &not
      &jnz label1      
      &push r:1      
      &pushsdbgm 7							//'extern'
      &pushsdb 10							//'DoTrace'
      &push r:2      
      &setMember
     label1:
      &push r:1      
      &pushsdb 11							//'m_enabled'
      &push r:1      
      &pushsdbgm 7							//'extern'
      &pushsdbgm 10							//'DoTrace'
      &toNumber
      &pushone
      &pushsdb 9							//'Boolean'
      &callFunction
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 12							//'Trace'
    &function2  (r:2='show') (r:1='this')
      &push r:1      
      &pushsdbgm 11							//'m_enabled'
      &not
      &jnz label2      
      &push r:1      
      &pushsdbgm 4							//'m_codePrefix'
      &push r:2      
      &add
      &trace
     label2:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 13							//'Dump'
    &function2  (r:2='obj', r:4='msg') (r:1='this')
      &push r:1      
      &pushsdbgm 11							//'m_enabled'
      &not
      &jnz label4      
      &pushsdb 14							//'Dump:'
      &push r:4      
      &add
      &pushsdb 5							//':'
      &add
      &push r:2      
      &typeof
      &add
      &trace
      &push r:2      
      &enumerateValue
     label3:
      &setRegister r:0
      &pushnull
      &equals
      &jnz label4      
      &push r:0      
      &setRegister r:3
      &pop
      &pushsdb 15							//'\t'
      &push r:3      
      &add
      &pushsdb 16							//': '
      &add
      &push r:2      
      &push r:3      
      &getMember
      &add
      &pushsdb 17							//' : '
      &add
      &push r:2      
      &push r:3      
      &getMember
      &typeof
      &add
      &trace
      &jmp label3      
     label4:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 7							//'extern'
    &pushsdb 10							//'DoTrace'
    &pushone
    &pushsdb 8							//'InGame'
    &pushzero
    &pushbyte 2
    &initObject
    &setMember
    &push r:1    
    &pushsdb 4							//'m_codePrefix'
    &pushsdb 18							//''
    &setMember
    &pushone
    &pushnull
    &pushglobalgv
    &pushsdbgm 1							//'DebugClass'
    &pushsdbgm 2							//'prototype'
    &pushbyte 3
    &pushsdb 19							//'ASSetPropFlags'
    &callFunction
   label5:
    &pop
  &end // of initMovieClip 301

  &defineMovieClip 302 // total frames: 0
  &end // of defineMovieClip 302
  
  &exportAssets
    302 &as '__Packages.ButtonClass'
  &end // of exportAssets
  
  &initMovieClip 302
    &constants '_global', 'ButtonClass', 'm_text', '$', '_name', 'movieclip', '_visible', 'Show', 'gotoAndPlay', 'Text', 'indexOf', 'State', 'Trans', 'Bttn', 'onPress', '_parent', 'Press', 'onRelease', 'Release', 'onRollOver', 'RollOver', 'onRollOut', 'RollOut', 'onDragOut', 'DragOut', 'onDragOver', 'DragOver', 'WARNING:ButtonClass:', '_target', '/', ' is an unknown movie clip!', 'MovieClip', 'prototype', 'SetText', 'SetSfxClick', 'm_sfxClick', 'SetSfxRollOver', 'm_sfxRollOver', 'SetSfxRollOut', 'm_sfxRollOut', 'SetMode', 'm_mode', 'm_state', 'UpState', 'ChangeState', 'ClearMode', '', 'GetMode', 'onUnload', 'AptZombieClass', 'DeleteFunctions', 'Button::ChangeState(', '):(', ')', '->', ' (', 'm_curStateMc', ':', 'm_curBttnMc', 'm_curTextMc', ')->(', 'm_nextState', 'GetText', 'SwitchObject', 'GetBttn', 'GetStateClip', 'StartTransition', 'EndTransition', 'stop', 'GetObject', 'PressCallback', 'DownState', 'FSCommand:PlaySound', 'ReleaseCallback', 'ReleaseTrans', 'OverState', 'RollOverCallback', 'RollOutCallback', 'RollOutTrans', 'DragOutCallback', 'OutState', 'DragOverCallback', 'debug', 'ButtonClass::', 'DebugClass', '$ClickButton', '$OverButton', '$OutButton', 'ASSetPropFlags'  
    &pushglobalgv
    &pushsdbgm 1							//'ButtonClass'
    &not
    &not
    &jnz label24    
    &pushglobalgv
    &pushsdb 1							//'ButtonClass'
    &function2  () (r:1='this', r:2='super')
      &pushzero
      &push r:2      
      &pushundef
      &callmp
      &push r:1      
      &pushsdb 2							//'m_text'
      &pushsdb 3							//'$'
      &push r:1      
      &pushsdbgm 4							//'_name'
      &add
      &setMember
      &push r:1      
      &enumerateValue
     label1:
      &setRegister r:0
      &pushnull
      &equals
      &jnz label8      
      &push r:0      
      &setRegister r:5
      &pop
      &push r:1      
      &push r:5      
      &getMember
      &pushundef
      &equals
      &not
      &not
      &jnz label7      
      &push r:1      
      &push r:5      
      &getMember
      &setRegister r:3
      &pop
      &push r:3      
      &typeof
      &pushsdb 5							//'movieclip'
      &equals
      &setRegister r:4
      &pop
      &push r:3      
      &pushsdb 6							//'_visible'
      &pushfalse
      &setMember
      &push r:4      
      &not
      &jnz label2      
      &push r:3      
      &pushsdbgm 7							//'Show'
      &pushundef
      &equals
      &not
      &jnz label2      
      &push r:3      
      &pushsdb 7							//'Show'
      &function2  ('previous') (r:1='this')
        &pushone
        &pushone
        &push r:1        
        &dcallmp 8							// gotoAndPlay()
      &end // of function 

      &setMember
     label2:
      &pushsdb 9							//'Text'
      &pushone
      &push r:5      
      &pushsdb 10							//'indexOf'
      &callMethod
      &pushzero
      &lessThan
      &not
      &not
      &jnz label3      
      &jmp label7      
     label3:
      &pushsdb 11							//'State'
      &pushone
      &push r:5      
      &pushsdb 10							//'indexOf'
      &callMethod
      &pushzero
      &lessThan
      &not
      &dup
      &jnz label4      
      &pop
      &pushsdb 12							//'Trans'
      &pushone
      &push r:5      
      &pushsdb 10							//'indexOf'
      &callMethod
      &pushzero
      &lessThan
      &not
     label4:
      &not
      &jnz label5      
      &jmp label7      
     label5:
      &pushsdb 13							//'Bttn'
      &pushone
      &push r:5      
      &pushsdb 10							//'indexOf'
      &callMethod
      &pushzero
      &lessThan
      &not
      &not
      &jnz label6      
      &push r:3      
      &pushsdb 14							//'onPress'
      &function2  () (r:1='this')
        &pushzero
        &push r:1        
        &pushsdbgm 15							//'_parent'
        &dcallmp 16							// Press()
      &end // of function 

      &setMember
      &push r:3      
      &pushsdb 17							//'onRelease'
      &function2  () (r:1='this')
        &pushzero
        &push r:1        
        &pushsdbgm 15							//'_parent'
        &dcallmp 18							// Release()
      &end // of function 

      &setMember
      &push r:3      
      &pushsdb 19							//'onRollOver'
      &function2  () (r:1='this')
        &pushzero
        &push r:1        
        &pushsdbgm 15							//'_parent'
        &dcallmp 20							// RollOver()
      &end // of function 

      &setMember
      &push r:3      
      &pushsdb 21							//'onRollOut'
      &function2  () (r:1='this')
        &pushzero
        &push r:1        
        &pushsdbgm 15							//'_parent'
        &dcallmp 22							// RollOut()
      &end // of function 

      &setMember
      &push r:3      
      &pushsdb 23							//'onDragOut'
      &function2  () (r:1='this')
        &pushzero
        &push r:1        
        &pushsdbgm 15							//'_parent'
        &dcallmp 24							// DragOut()
      &end // of function 

      &setMember
      &push r:3      
      &pushsdb 25							//'onDragOver'
      &function2  () (r:1='this')
        &pushzero
        &push r:1        
        &pushsdbgm 15							//'_parent'
        &dcallmp 26							// DragOver()
      &end // of function 

      &setMember
      &jmp label7      
     label6:
      &push r:4      
      &not
      &jnz label7      
      &pushsdb 27							//'WARNING:ButtonClass:'
      &push r:1      
      &pushsdbgm 28							//'_target'
      &add
      &pushsdb 29							//'/'
      &add
      &push r:5      
      &add
      &pushsdb 30							//' is an unknown movie clip!'
      &add
      &trace
      &push r:3      
      &pushsdb 6							//'_visible'
      &pushtrue
      &setMember
     label7:
      &jmp label1      
     label8:
    &end // of function 

    &setRegister r:0
    &setMember
    &pushglobalgv
    &pushsdbgm 1							//'ButtonClass'
    &pushsdbgv 31							//'MovieClip'
    &extends
    &push r:0    
    &pushsdbgm 32							//'prototype'
    &setRegister r:1
    &pop
    &push r:1    
    &pushsdb 33							//'SetText'
    &function2  (r:2='textString') (r:1='this')
      &push r:1      
      &pushsdb 2							//'m_text'
      &push r:2      
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 34							//'SetSfxClick'
    &function2  (r:2='sfx') (r:1='this')
      &push r:1      
      &pushsdb 35							//'m_sfxClick'
      &push r:2      
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 36							//'SetSfxRollOver'
    &function2  (r:2='sfx') (r:1='this')
      &push r:1      
      &pushsdb 37							//'m_sfxRollOver'
      &push r:2      
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 38							//'SetSfxRollOut'
    &function2  (r:2='sfx') (r:1='this')
      &push r:1      
      &pushsdb 39							//'m_sfxRollOut'
      &push r:2      
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 40							//'SetMode'
    &function2  (r:2='mode') (r:1='this')
      &push r:1      
      &pushsdb 41							//'m_mode'
      &push r:2      
      &setMember
      &push r:1      
      &pushsdbgm 42							//'m_state'
      &pushundef
      &equals
      &not
      &jnz label9      
      &push r:1      
      &pushsdb 42							//'m_state'
      &pushsdb 43							//'UpState'
      &setMember
     label9:
      &push r:1      
      &pushsdbgm 42							//'m_state'
      &pushone
      &push r:1      
      &dcallmp 44							// ChangeState()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 45							//'ClearMode'
    &function2  ('Void') (r:1='this')
      &pushsdb 46							//''
      &pushone
      &push r:1      
      &dcallmp 40							// SetMode()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 47							//'GetMode'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdbgm 41							//'m_mode'
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 48							//'onUnload'
    &function2  () (r:1='this')
      &push r:1      
      &pushone
      &pushsdbgv 49							//'AptZombieClass'
      &dcallmp 50							// DeleteFunctions()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 44							//'ChangeState'
    &function2  (r:2='stateStr') (r:1='this')
      &pushsdb 51							//'Button::ChangeState('
      &push r:1      
      &pushsdbgm 4							//'_name'
      &add
      &pushsdb 52							//'):('
      &add
      &push r:1      
      &pushsdbgm 41							//'m_mode'
      &add
      &pushsdb 53							//')'
      &add
      &push r:1      
      &pushsdbgm 42							//'m_state'
      &add
      &pushsdb 54							//'->'
      &add
      &push r:2      
      &add
      &pushsdb 55							//' ('
      &add
      &push r:1      
      &pushsdbgm 56							//'m_curStateMc'
      &pushsdbgm 4							//'_name'
      &add
      &pushsdb 57							//':'
      &add
      &push r:1      
      &pushsdbgm 58							//'m_curBttnMc'
      &pushsdbgm 4							//'_name'
      &add
      &pushsdb 57							//':'
      &add
      &push r:1      
      &pushsdbgm 59							//'m_curTextMc'
      &pushsdbgm 4							//'_name'
      &add
      &pushsdb 60							//')->('
      &add
      &setRegister r:3
      &pop
      &push r:1      
      &pushsdb 42							//'m_state'
      &push r:2      
      &setMember
      &push r:1      
      &pushsdb 61							//'m_nextState'
      &pushundef
      &setMember
      &push r:1      
      &pushsdb 59							//'m_curTextMc'
      &push r:2      
      &pushone
      &push r:1      
      &pushsdb 62							//'GetText'
      &callMethod
      &push r:1      
      &pushsdbgm 59							//'m_curTextMc'
      &pushbyte 2
      &push r:1      
      &pushsdb 63							//'SwitchObject'
      &callMethod
      &setMember
      &push r:1      
      &pushsdb 58							//'m_curBttnMc'
      &push r:2      
      &pushone
      &push r:1      
      &pushsdb 64							//'GetBttn'
      &callMethod
      &push r:1      
      &pushsdbgm 58							//'m_curBttnMc'
      &pushbyte 2
      &push r:1      
      &pushsdb 63							//'SwitchObject'
      &callMethod
      &setMember
      &push r:1      
      &pushsdb 56							//'m_curStateMc'
      &push r:2      
      &pushone
      &push r:1      
      &pushsdb 65							//'GetStateClip'
      &callMethod
      &push r:1      
      &pushsdbgm 56							//'m_curStateMc'
      &pushbyte 2
      &push r:1      
      &pushsdb 63							//'SwitchObject'
      &callMethod
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 66							//'StartTransition'
    &function2  (r:3='transition', r:4='nextState') (r:1='this')
      &push r:3      
      &pushone
      &push r:1      
      &pushsdb 65							//'GetStateClip'
      &callMethod
      &setRegister r:2
      &pop
      &push r:2      
      &pushundef
      &equals
      &not
      &not
      &jnz label10      
      &push r:1      
      &pushsdb 42							//'m_state'
      &push r:3      
      &setMember
      &push r:1      
      &pushsdb 61							//'m_nextState'
      &push r:4      
      &setMember
      &push r:1      
      &pushsdbgm 58							//'m_curBttnMc'
      &pushsdb 6							//'_visible'
      &pushfalse
      &setMember
      &push r:1      
      &pushsdb 58							//'m_curBttnMc'
      &pushundef
      &setMember
      &push r:1      
      &pushsdb 59							//'m_curTextMc'
      &push r:3      
      &pushone
      &push r:1      
      &pushsdb 62							//'GetText'
      &callMethod
      &push r:1      
      &pushsdbgm 59							//'m_curTextMc'
      &pushbyte 2
      &push r:1      
      &pushsdb 63							//'SwitchObject'
      &callMethod
      &setMember
      &push r:1      
      &pushsdb 56							//'m_curStateMc'
      &push r:2      
      &push r:1      
      &pushsdbgm 56							//'m_curStateMc'
      &pushbyte 2
      &push r:1      
      &pushsdb 63							//'SwitchObject'
      &callMethod
      &setMember
      &pushtrue
      &return
     label10:
      &pushfalse
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 67							//'EndTransition'
    &function2  (r:2='transition') (r:1='this')
      &push r:2      
      &push r:1      
      &pushsdbgm 56							//'m_curStateMc'
      &equals
      &dup
      &not
      &jnz label11      
      &pop
      &push r:1      
      &pushsdbgm 61							//'m_nextState'
      &pushundef
      &equals
      &not
     label11:
      &not
      &jnz label12      
      &push r:1      
      &pushsdbgm 61							//'m_nextState'
      &pushone
      &push r:1      
      &dcallmp 44							// ChangeState()
     label12:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 63							//'SwitchObject'
    &function2  (r:1='current', r:3='next') ()
      &push r:3      
      &pushundef
      &equals
      &not
      &not
      &jnz label14      
      &push r:1      
      &setRegister r:2
      &pop
      &push r:3      
      &typeof
      &pushsdb 5							//'movieclip'
      &equals
      &setRegister r:4
      &pop
      &push r:1      
      &not
      &jnz label13      
      &push r:1      
      &pushsdb 6							//'_visible'
      &pushfalse
      &setMember
      &pushzero
      &push r:1      
      &dcallmp 68							// stop()
     label13:
      &push r:3      
      &setRegister r:1
      &pop
      &push r:1      
      &pushsdb 6							//'_visible'
      &pushtrue
      &setMember
      &push r:2      
      &pushone
      &push r:1      
      &dcallmp 7							// Show()
     label14:
      &push r:1      
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 65							//'GetStateClip'
    &function2  (r:3='stateStr') (r:1='this')
      &push r:1      
      &push r:1      
      &pushsdbgm 41							//'m_mode'
      &push r:3      
      &add
      &getMember
      &setRegister r:2
      &pop
      &push r:2      
      &pushundef
      &equals
      &not
      &jnz label15      
      &push r:1      
      &push r:3      
      &getMember
      &setRegister r:2
      &pop
     label15:
      &push r:2      
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 62							//'GetText'
    &function2  (r:3='stateStr') (r:1='this')
      &pushsdb 9							//'Text'
      &push r:3      
      &pushbyte 2
      &push r:1      
      &pushsdb 69							//'GetObject'
      &callMethod
      &setRegister r:2
      &pop
      &push r:2      
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 64							//'GetBttn'
    &function2  (r:3='stateStr') (r:1='this')
      &pushsdb 13							//'Bttn'
      &push r:3      
      &pushbyte 2
      &push r:1      
      &pushsdb 69							//'GetObject'
      &callMethod
      &setRegister r:2
      &pop
      &push r:2      
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 69							//'GetObject'
    &function2  (r:4='stateStr', r:3='postfix') (r:1='this')
      &push r:1      
      &push r:1      
      &pushsdbgm 41							//'m_mode'
      &push r:4      
      &add
      &push r:3      
      &add
      &getMember
      &setRegister r:2
      &pop
      &push r:2      
      &pushundef
      &equals
      &not
      &jnz label16      
      &push r:1      
      &push r:1      
      &pushsdbgm 41							//'m_mode'
      &push r:3      
      &add
      &getMember
      &setRegister r:2
      &pop
      &push r:2      
      &pushundef
      &equals
      &not
      &jnz label16      
      &push r:1      
      &push r:4      
      &push r:3      
      &add
      &getMember
      &setRegister r:2
      &pop
      &push r:2      
      &pushundef
      &equals
      &not
      &jnz label16      
      &push r:1      
      &push r:3      
      &getMember
      &setRegister r:2
      &pop
     label16:
      &push r:2      
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 16							//'Press'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdbgm 13							//'Bttn'
      &pushsdbgm 6							//'_visible'
      &not
      &jnz label17      
      &pushzero
      &push r:1      
      &dcallmp 70							// PressCallback()
      &pushsdb 71							//'DownState'
      &pushone
      &push r:1      
      &dcallmp 44							// ChangeState()
      &pushsdb 72							//'FSCommand:PlaySound'
      &push r:1      
      &pushsdbgm 35							//'m_sfxClick'
      &getURL2
     label17:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 18							//'Release'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdbgm 13							//'Bttn'
      &pushsdbgm 6							//'_visible'
      &not
      &jnz label18      
      &pushzero
      &push r:1      
      &dcallmp 73							// ReleaseCallback()
      &pushsdb 43							//'UpState'
      &pushsdb 74							//'ReleaseTrans'
      &pushbyte 2
      &push r:1      
      &pushsdb 66							//'StartTransition'
      &callMethod
      &not
      &not
      &jnz label18      
      &pushsdb 75							//'OverState'
      &pushone
      &push r:1      
      &dcallmp 44							// ChangeState()
     label18:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 20							//'RollOver'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdbgm 13							//'Bttn'
      &pushsdbgm 6							//'_visible'
      &not
      &jnz label19      
      &pushzero
      &push r:1      
      &dcallmp 76							// RollOverCallback()
      &pushsdb 75							//'OverState'
      &pushone
      &push r:1      
      &dcallmp 44							// ChangeState()
      &pushsdb 72							//'FSCommand:PlaySound'
      &push r:1      
      &pushsdbgm 37							//'m_sfxRollOver'
      &getURL2
     label19:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 22							//'RollOut'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdbgm 13							//'Bttn'
      &pushsdbgm 6							//'_visible'
      &not
      &jnz label21      
      &pushzero
      &push r:1      
      &dcallmp 77							// RollOutCallback()
      &pushsdb 43							//'UpState'
      &pushsdb 78							//'RollOutTrans'
      &pushbyte 2
      &push r:1      
      &pushsdb 66							//'StartTransition'
      &callMethod
      &not
      &not
      &jnz label20      
      &pushsdb 43							//'UpState'
      &pushone
      &push r:1      
      &dcallmp 44							// ChangeState()
     label20:
      &pushsdb 72							//'FSCommand:PlaySound'
      &push r:1      
      &pushsdbgm 39							//'m_sfxRollOut'
      &getURL2
     label21:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 24							//'DragOut'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdbgm 13							//'Bttn'
      &pushsdbgm 6							//'_visible'
      &not
      &jnz label22      
      &pushzero
      &push r:1      
      &dcallmp 79							// DragOutCallback()
      &pushsdb 43							//'UpState'
      &pushone
      &push r:1      
      &dcallmp 44							// ChangeState()
      &pushsdb 80							//'OutState'
      &pushone
      &push r:1      
      &dcallmp 44							// ChangeState()
     label22:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 26							//'DragOver'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdbgm 13							//'Bttn'
      &pushsdbgm 6							//'_visible'
      &not
      &jnz label23      
      &pushzero
      &push r:1      
      &dcallmp 81							// DragOverCallback()
      &pushsdb 71							//'DownState'
      &pushone
      &push r:1      
      &dcallmp 44							// ChangeState()
     label23:
    &end // of function 

    &setMember
    &push r:0    
    &pushsdb 82							//'debug'
    &pushsdb 83							//'ButtonClass::'
    &pushone
    &pushsdb 84							//'DebugClass'
    &new
    &setMember
    &push r:1    
    &pushsdb 42							//'m_state'
    &pushundef
    &setMember
    &push r:1    
    &pushsdb 41							//'m_mode'
    &pushundef
    &setMember
    &push r:1    
    &pushsdb 61							//'m_nextState'
    &pushundef
    &setMember
    &push r:1    
    &pushsdb 56							//'m_curStateMc'
    &pushundef
    &setMember
    &push r:1    
    &pushsdb 59							//'m_curTextMc'
    &pushundef
    &setMember
    &push r:1    
    &pushsdb 58							//'m_curBttnMc'
    &pushundef
    &setMember
    &push r:1    
    &pushsdb 35							//'m_sfxClick'
    &pushsdb 85							//'$ClickButton'
    &setMember
    &push r:1    
    &pushsdb 37							//'m_sfxRollOver'
    &pushsdb 86							//'$OverButton'
    &setMember
    &push r:1    
    &pushsdb 39							//'m_sfxRollOut'
    &pushsdb 87							//'$OutButton'
    &setMember
    &pushone
    &pushnull
    &pushglobalgv
    &pushsdbgm 1							//'ButtonClass'
    &pushsdbgm 32							//'prototype'
    &pushbyte 3
    &pushsdb 88							//'ASSetPropFlags'
    &callFunction
   label24:
    &pop
  &end // of initMovieClip 302

  &defineMovieClip 303 // total frames: 0
  &end // of defineMovieClip 303
  
  &exportAssets
    303 &as '__Packages.AptZombieClass'
  &end // of exportAssets
  
  &initMovieClip 303
    &constants '_global', 'AptZombieClass', '_visible', 'MovieClip', 'prototype', 'AddClass', 's_classes', 'push', 'Object', 'registerClass', 'AddObject', 'AddObject:', 'debug', 'Trace', 's_objects', 'DeleteClass', 'DeleteClass:', 'DeleteFunctions', 'DeleteFunctions:', '_target', '   ', ':', 'movieclip', 'function', 'onUnload', 'length', 'Array', 'AptZombieClass::', 'DebugClass', 'ASSetPropFlags'  
    &pushglobalgv
    &pushsdbgm 1							//'AptZombieClass'
    &not
    &not
    &jnz label9    
    &pushglobalgv
    &pushsdb 1							//'AptZombieClass'
    &function2  () (r:1='this', r:2='super')
      &pushzero
      &push r:2      
      &pushundef
      &callmp
      &push r:1      
      &pushsdb 2							//'_visible'
      &pushfalse
      &setMember
    &end // of function 

    &setRegister r:0
    &setMember
    &pushglobalgv
    &pushsdbgm 1							//'AptZombieClass'
    &pushsdbgv 3							//'MovieClip'
    &extends
    &push r:0    
    &pushsdbgm 4							//'prototype'
    &setRegister r:1
    &pop
    &push r:0    
    &pushsdb 5							//'AddClass'
    &function2  (r:1='linkageIdentifier', r:2='className') ()
      &push r:1      
      &pushone
      &pushsdbgv 1							//'AptZombieClass'
      &pushsdbgm 6							//'s_classes'
      &dcallmp 7							// push()
      &push r:2      
      &push r:1      
      &pushbyte 2
      &pushsdbgv 8							//'Object'
      &dcallmp 9							// registerClass()
    &end // of function 

    &setMember
    &push r:0    
    &pushsdb 10							//'AddObject'
    &function2  (r:1='obj') ()
      &pushsdb 11							//'AddObject:'
      &push r:1      
      &add
      &pushone
      &pushsdbgv 1							//'AptZombieClass'
      &pushsdbgm 12							//'debug'
      &dcallmp 13							// Trace()
      &push r:1      
      &pushone
      &pushsdbgv 1							//'AptZombieClass'
      &pushsdbgm 14							//'s_objects'
      &dcallmp 7							// push()
    &end // of function 

    &setMember
    &push r:0    
    &pushsdb 15							//'DeleteClass'
    &function2  (r:2='className') (r:1='_global')
      &pushsdb 16							//'DeleteClass:'
      &push r:2      
      &add
      &pushone
      &pushsdbgv 1							//'AptZombieClass'
      &pushsdbgm 12							//'debug'
      &dcallmp 13							// Trace()
      &pushnull
      &push r:2      
      &pushbyte 2
      &pushsdbgv 8							//'Object'
      &dcallmp 9							// registerClass()
      &push r:1      
      &push r:2      
      &delete
      &pop
    &end // of function 

    &setMember
    &push r:0    
    &pushsdb 17							//'DeleteFunctions'
    &function2  (r:2='obj') ()
      &pushsdb 18							//'DeleteFunctions:'
      &push r:2      
      &pushsdbgm 19							//'_target'
      &add
      &pushone
      &pushsdbgv 1							//'AptZombieClass'
      &pushsdbgm 12							//'debug'
      &dcallmp 13							// Trace()
      &push r:2      
      &enumerateValue
     label1:
      &setRegister r:0
      &pushnull
      &equals
      &jnz label4      
      &push r:0      
      &setRegister r:3
      &pop
      &push r:2      
      &push r:3      
      &getMember
      &typeof
      &setRegister r:1
      &pop
      &pushsdb 20							//'   '
      &push r:3      
      &add
      &pushsdb 21							//':'
      &add
      &push r:1      
      &add
      &pushone
      &pushsdbgv 1							//'AptZombieClass'
      &pushsdbgm 12							//'debug'
      &dcallmp 13							// Trace()
      &push r:1      
      &pushsdb 22							//'movieclip'
      &stringEq
      &not
      &jnz label2      
      &pushtrue
      &push r:2      
      &push r:3      
      &getMember
      &pushbyte 2
      &pushsdbgv 1							//'AptZombieClass'
      &dcallmp 17							// DeleteFunctions()
      &jmp label3      
     label2:
      &push r:1      
      &pushsdb 23							//'function'
      &stringEq
      &not
      &jnz label3      
      &push r:2      
      &push r:3      
      &delete
      &pop
     label3:
      &jmp label1      
     label4:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 24							//'onUnload'
    &function2  () ()
      &pushzero
      &setRegister r:1
      &pop
     label5:
      &push r:1      
      &pushsdbgv 1							//'AptZombieClass'
      &pushsdbgm 14							//'s_objects'
      &pushsdbgm 25							//'length'
      &lessThan
      &not
      &jnz label6      
      &push r:1      
      &increment
      &setRegister r:1
      &pop
      &jmp label5      
     label6:
      &pushzero
      &setRegister r:1
      &pop
     label7:
      &push r:1      
      &pushsdbgv 1							//'AptZombieClass'
      &pushsdbgm 6							//'s_classes'
      &pushsdbgm 25							//'length'
      &lessThan
      &not
      &jnz label8      
      &push r:1      
      &increment
      &setRegister r:1
      &pop
      &jmp label7      
     label8:
    &end // of function 

    &setMember
    &push r:0    
    &pushsdb 6							//'s_classes'
    &pushzero
    &pushsdb 26							//'Array'
    &new
    &setMember
    &push r:0    
    &pushsdb 14							//'s_objects'
    &pushzero
    &pushsdb 26							//'Array'
    &new
    &setMember
    &push r:0    
    &pushsdb 12							//'debug'
    &pushsdb 27							//'AptZombieClass::'
    &pushone
    &pushsdb 28							//'DebugClass'
    &new
    &setMember
    &pushone
    &pushnull
    &pushglobalgv
    &pushsdbgm 1							//'AptZombieClass'
    &pushsdbgm 4							//'prototype'
    &pushbyte 3
    &pushsdb 29							//'ASSetPropFlags'
    &callFunction
   label9:
    &pop
  &end // of initMovieClip 303

  &defineMovieClip 304 // total frames: 0
  &end // of defineMovieClip 304
  
  &exportAssets
    304 &as '__Packages.MainMenuClass'
  &end // of exportAssets
  
  &initMovieClip 304
    &constants '_global', 'MainMenuClass', 'm_apt', 'm_classRoot', 'AptApiClass', 'MovieClip', 'prototype', 'onUnload', 'debug', 'AptZombieClass', 'DeleteFunctions', 'Class', 'DeleteClass', 'ShowMainMenu', 'ReshowMainMenu', 'CreditsButton', 'Credits', 'Call', 'ExitCreditsButton', 'CreditsExit', 'OnCreditsLoad', 'OnMultiPlayerButton', 'OnDebugButton', 'OnTutorialsButton', 'Enable', 'OnTutorial', 'QuitButton', 'ExitGame', 'QuitAfterPurchaseButton', 'PurchaseScreen', 'OpenAndQuit', 'OnBttnPurchaseInfo', 'Open', 'LoadSkirmishGameButton', 'LoadGame', 'CustomMapButton', 'LoadCustomMap', 'LoadCampaignGameButton', 'LoadCampaign', 'StartCampaign', 'index=', 'OnStartCampaign', 'Campaign0Button', '', 'Campaign1Button', 'Campaign2Button', 'SkirmishButton', 'Skirmish', 'OnlineButton', 'OnlineButtonPressed', 'LocalNetworkButton', 'LAN', 'ReplayButton', 'LoadReplay', 'ProfileStatsButton', 'LoadStats', 'IntelDBButton', 'IntelDB', 'TransmissionLogButton', 'TransmissionLog', 'SettingsButton', 'false', 'Options', 'AdvancedSettingsButton', 'true', 'TutoralButton', 'OnProfilesClick', 'On', 'LoadProfileManagerMovie', 'ProfileManagerLoader', 'unloadMovie', 'createEmptyMovieClip', 'm_profileManagerShow', 'ProfileManager.swf', 'loadMovie', 'ManageProfileButton', 'ContinueCampaignButton', 'ContinueCampaign', 'RegisterCloseFunction', 'm_closeCreateProfileDialog', 'InitContinueCampaign', '0', 'MainMenuContinueCampaign', 'GetExtern', '1', 'Enable continue', 'SetMode', 'Disabled', 'InitLoadCampaign', 'MainMenuLoadCampaign', 'Enable load', 'InitAlienCampaign', 'MainMenuAlienCampaign', 'Hidden', 'OpenedProfileCreateDialog', 'OpenedProfileManager', '_ForceCreateProfile', 'DetermineForceCreate', 'ForceProfileCreate', 'SetGoToActivate', 'm_goToActivate', 'RegisterAcceptNewProfile', 'CreateProfileButton', 'OnAcceptNewProfile', 'OnProfileCreate', '_GoToActive', 'OnCancelNewProfile', 'OnProfileCancelCreate', 'OnChangeProfile', 'OnProfileChange', 'OnDeleteProfile', 'OnProfileDelete', '_UnloadProfileManagerDialog', 'SetProfileManagerState', 'm_profileManager', '_active', 'gotoAndPlay', '_CloseCreateProfileDialog', '_EnableCreateProfile', '_DisableCreateProfile', 'Disable', '_CloseCreditScreen', '_Exit', 'MainMenu', 'ShowCreditsMovie', 'EscapeKeyPressed', 'IsProfileManagerShow', 'IsAlienReveal', 'RegisterAlienRevealCallback', 'm_alienRevealUpdate', 'OnAlienRevealDone', '_visible', 'index=2', 'OnAlienRevealStarted', 'ClearAlienRevealCallback', 'UpdateAlienReveal', 'IsShowKane', 'IsSpecialEditionExe', 'OnBttnPurchaseNow', 'OnBttnPurchase', 'RegisterProfileManager', 'm_profileManagerState', '_ExitProfileManager', 'CreateNewProfile', 'vFadeIn', '_managerNoFade', 'ManageProfile', 'DebugClass', 'ASSetPropFlags'  
    &pushglobalgv
    &pushsdbgm 1							//'MainMenuClass'
    &not
    &not
    &jnz label14    
    &pushglobalgv
    &pushsdb 1							//'MainMenuClass'
    &function2  () (r:1='this', r:2='super')
      &pushzero
      &push r:2      
      &pushundef
      &callmp
      &push r:1      
      &pushsdb 2							//'m_apt'
      &push r:1      
      &pushsdbgv 1							//'MainMenuClass'
      &pushsdbgm 3							//'m_classRoot'
      &pushbyte 2
      &pushsdb 4							//'AptApiClass'
      &new
      &setMember
    &end // of function 

    &setRegister r:0
    &setMember
    &pushglobalgv
    &pushsdbgm 1							//'MainMenuClass'
    &pushsdbgv 5							//'MovieClip'
    &extends
    &push r:0    
    &pushsdbgm 6							//'prototype'
    &setRegister r:1
    &pop
    &push r:1    
    &pushsdb 7							//'onUnload'
    &function2  () (r:1='this')
      &push r:1      
      &pushsdb 2							//'m_apt'
      &delete
      &pop
      &pushsdbgv 1							//'MainMenuClass'
      &pushsdb 8							//'debug'
      &delete
      &pop
      &push r:1      
      &pushone
      &pushsdbgv 9							//'AptZombieClass'
      &dcallmp 10							// DeleteFunctions()
      &pushsdbgv 1							//'MainMenuClass'
      &pushsdbgm 3							//'m_classRoot'
      &pushsdb 11							//'Class'
      &add
      &pushone
      &pushsdbgv 9							//'AptZombieClass'
      &dcallmp 12							// DeleteClass()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 13							//'ShowMainMenu'
    &function  ('Void'    )    
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 14							//'ReshowMainMenu'
    &function  ('Void'    )    
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 15							//'CreditsButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 16							//'Credits'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 18							//'ExitCreditsButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 19							//'CreditsExit'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 20							//'OnCreditsLoad'
    &function  ('Void'    )    
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 21							//'OnMultiPlayerButton'
    &function  ('Void'    )    
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 22							//'OnDebugButton'
    &function2  (r:2='callFunc') (r:1='this')
      &push r:2      
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 23							//'OnTutorialsButton'
    &function2  ('Void') (r:1='this')
      &pushtrue
      &pushone
      &pushsdbgv 4							//'AptApiClass'
      &pushsdbgm 8							//'debug'
      &dcallmp 24							// Enable()
      &pushsdb 25							//'OnTutorial'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 26							//'QuitButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 27							//'ExitGame'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 28							//'QuitAfterPurchaseButton'
    &function2  ('Void') (r:1='this')
      &pushzero
      &push r:1      
      &pushsdbgm 29							//'PurchaseScreen'
      &dcallmp 30							// OpenAndQuit()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 31							//'OnBttnPurchaseInfo'
    &function2  ('Void') (r:1='this')
      &pushzero
      &push r:1      
      &pushsdbgm 29							//'PurchaseScreen'
      &dcallmp 32							// Open()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 33							//'LoadSkirmishGameButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 34							//'LoadGame'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 35							//'CustomMapButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 36							//'LoadCustomMap'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 37							//'LoadCampaignGameButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 38							//'LoadCampaign'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 39							//'StartCampaign'
    &function2  (r:2='side', 'level') (r:1='this')
      &pushsdb 40							//'index='
      &push r:2      
      &add
      &pushsdb 41							//'OnStartCampaign'
      &pushbyte 2
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 42							//'Campaign0Button'
    &function2  ('Void') (r:1='this')
      &pushsdb 43							//''
      &pushzero
      &pushbyte 2
      &push r:1      
      &dcallmp 39							// StartCampaign()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 44							//'Campaign1Button'
    &function2  ('Void') (r:1='this')
      &pushsdb 43							//''
      &pushone
      &pushbyte 2
      &push r:1      
      &dcallmp 39							// StartCampaign()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 45							//'Campaign2Button'
    &function2  ('Void') (r:1='this')
      &pushsdb 43							//''
      &pushbyte 2
      &pushbyte 2
      &push r:1      
      &dcallmp 39							// StartCampaign()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 46							//'SkirmishButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 47							//'Skirmish'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 48							//'OnlineButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 49							//'OnlineButtonPressed'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 50							//'LocalNetworkButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 51							//'LAN'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 52							//'ReplayButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 53							//'LoadReplay'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 54							//'ProfileStatsButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 55							//'LoadStats'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 56							//'IntelDBButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 57							//'IntelDB'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 58							//'TransmissionLogButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 59							//'TransmissionLog'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 60							//'SettingsButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 61							//'false'
      &pushsdb 62							//'Options'
      &pushbyte 2
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 63							//'AdvancedSettingsButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 64							//'true'
      &pushsdb 62							//'Options'
      &pushbyte 2
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 65							//'TutoralButton'
    &function  ('Void'    )    
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 66							//'OnProfilesClick'
    &function2  (r:2='name') (r:1='this')
      &pushsdb 67							//'On'
      &push r:2      
      &add
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 68							//'LoadProfileManagerMovie'
    &function2  (r:2='vShowManager') (r:1='this')
      &push r:1      
      &pushsdbgm 69							//'ProfileManagerLoader'
      &pushundef
      &equals
      &not
      &not
      &jnz label1      
      &pushzero
      &push r:1      
      &pushsdbgm 69							//'ProfileManagerLoader'
      &dcallmp 70							// unloadMovie()
     label1:
      &pushbyte 100
      &pushsdb 69							//'ProfileManagerLoader'
      &pushbyte 2
      &push r:1      
      &dcallmp 71							// createEmptyMovieClip()
      &push r:1      
      &pushsdb 72							//'m_profileManagerShow'
      &push r:2      
      &setMember
      &pushsdb 73							//'ProfileManager.swf'
      &pushone
      &push r:1      
      &pushsdbgm 69							//'ProfileManagerLoader'
      &dcallmp 74							// loadMovie()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 75							//'ManageProfileButton'
    &function2  ('Void') (r:1='this')
      &pushtrue
      &pushone
      &push r:1      
      &dcallmp 68							// LoadProfileManagerMovie()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 76							//'ContinueCampaignButton'
    &function2  ('Void') (r:1='this')
      &pushsdb 77							//'ContinueCampaign'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 78							//'RegisterCloseFunction'
    &function2  (r:2='closeFunction') (r:1='this')
      &push r:1      
      &pushsdb 79							//'m_closeCreateProfileDialog'
      &push r:2      
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 80							//'InitContinueCampaign'
    &function2  (r:2='bttn') (r:1='this')
      &pushsdb 81							//'0'
      &pushsdb 82							//'MainMenuContinueCampaign'
      &pushbyte 2
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &pushsdb 83							//'GetExtern'
      &callMethod
      &pushsdb 84							//'1'
      &equals
      &not
      &jnz label2      
      &pushsdb 85							//'Enable continue'
      &trace
      &pushsdb 43							//''
      &pushone
      &push r:2      
      &dcallmp 86							// SetMode()
      &jmp label3      
     label2:
      &pushsdb 87							//'Disabled'
      &pushone
      &push r:2      
      &dcallmp 86							// SetMode()
     label3:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 88							//'InitLoadCampaign'
    &function2  (r:2='bttn') (r:1='this')
      &pushsdb 81							//'0'
      &pushsdb 89							//'MainMenuLoadCampaign'
      &pushbyte 2
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &pushsdb 83							//'GetExtern'
      &callMethod
      &pushsdb 84							//'1'
      &equals
      &not
      &jnz label4      
      &pushsdb 90							//'Enable load'
      &trace
      &pushsdb 43							//''
      &pushone
      &push r:2      
      &dcallmp 86							// SetMode()
      &jmp label5      
     label4:
      &pushsdb 87							//'Disabled'
      &pushone
      &push r:2      
      &dcallmp 86							// SetMode()
     label5:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 91							//'InitAlienCampaign'
    &function2  (r:2='bttn') (r:1='this')
      &pushsdb 81							//'0'
      &pushsdb 92							//'MainMenuAlienCampaign'
      &pushbyte 2
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &pushsdb 83							//'GetExtern'
      &callMethod
      &pushsdb 84							//'1'
      &equals
      &not
      &jnz label6      
      &pushsdb 43							//''
      &pushone
      &push r:2      
      &dcallmp 86							// SetMode()
      &jmp label7      
     label6:
      &pushsdb 93							//'Hidden'
      &pushone
      &push r:2      
      &dcallmp 86							// SetMode()
     label7:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 94							//'OpenedProfileCreateDialog'
    &function2  ('Void') (r:1='this')
      &pushsdb 94							//'OpenedProfileCreateDialog'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 95							//'OpenedProfileManager'
    &function2  ('Void') (r:1='this')
      &pushsdb 95							//'OpenedProfileManager'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 96							//'_ForceCreateProfile'
    &function2  ('Void') (r:1='this')
      &pushfalse
      &pushone
      &push r:1      
      &dcallmp 68							// LoadProfileManagerMovie()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 97							//'DetermineForceCreate'
    &function2  ('Void') (r:1='this')
      &pushsdb 81							//'0'
      &pushsdb 98							//'ForceProfileCreate'
      &pushbyte 2
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &pushsdb 83							//'GetExtern'
      &callMethod
      &pushsdb 84							//'1'
      &equals
      &not
      &jnz label8      
      &pushtrue
      &return
     label8:
      &pushfalse
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 99							//'SetGoToActivate'
    &function2  () (r:1='this')
      &push r:1      
      &pushsdb 100							//'m_goToActivate'
      &pushtrue
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 101							//'RegisterAcceptNewProfile'
    &function2  (r:2='acceptNewProfile') (r:1='this')
      &push r:1      
      &pushsdb 102							//'CreateProfileButton'
      &push r:2      
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 103							//'OnAcceptNewProfile'
    &function2  (r:2='closeFunction') (r:1='this')
      &push r:1      
      &pushsdb 79							//'m_closeCreateProfileDialog'
      &push r:2      
      &setMember
      &pushsdb 104							//'OnProfileCreate'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
      &pushzero
      &push r:1      
      &dcallmp 105							// _GoToActive()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 106							//'OnCancelNewProfile'
    &function2  (r:2='closeFunction') (r:1='this')
      &push r:1      
      &pushsdb 79							//'m_closeCreateProfileDialog'
      &push r:2      
      &setMember
      &pushsdb 107							//'OnProfileCancelCreate'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 108							//'OnChangeProfile'
    &function2  ('Void') (r:1='this')
      &pushsdb 109							//'OnProfileChange'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 110							//'OnDeleteProfile'
    &function2  ('Void') (r:1='this')
      &pushsdb 111							//'OnProfileDelete'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 112							//'_UnloadProfileManagerDialog'
    &function2  ('Void') (r:1='this')
      &pushzero
      &push r:1      
      &pushsdbgm 69							//'ProfileManagerLoader'
      &dcallmp 70							// unloadMovie()
      &push r:1      
      &pushsdb 72							//'m_profileManagerShow'
      &pushfalse
      &setMember
      &pushsdb 43							//''
      &pushone
      &push r:1      
      &dcallmp 113							// SetProfileManagerState()
      &push r:1      
      &pushsdb 114							//'m_profileManager'
      &pushundef
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 105							//'_GoToActive'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdbgm 100							//'m_goToActivate'
      &not
      &jnz label9      
      &pushsdb 115							//'_active'
      &pushone
      &push r:1      
      &pushsdb 116							//'gotoAndPlay'
      &callMethod
     label9:
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 117							//'_CloseCreateProfileDialog'
    &function2  ('Void') (r:1='this')
      &pushzero
      &push r:1      
      &dcallmp 79							// m_closeCreateProfileDialog()
      &push r:1      
      &pushsdb 79							//'m_closeCreateProfileDialog'
      &pushundef
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 118							//'_EnableCreateProfile'
    &function2  ('Void') (r:1='this')
      &pushzero
      &push r:1      
      &pushsdbgm 102							//'CreateProfileButton'
      &dcallmp 24							// Enable()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 119							//'_DisableCreateProfile'
    &function2  ('Void') (r:1='this')
      &pushzero
      &push r:1      
      &pushsdbgm 102							//'CreateProfileButton'
      &dcallmp 120							// Disable()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 121							//'_CloseCreditScreen'
    &function2  ('Void') (r:1='_root')
      &pushsdb 122							//'_Exit'
      &pushone
      &push r:1      
      &pushsdbgm 123							//'MainMenu'
      &pushsdbgm 124							//'ShowCreditsMovie'
      &dcallmp 116							// gotoAndPlay()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 125							//'EscapeKeyPressed'
    &function2  ('Void') (r:1='this')
      &pushzero
      &push r:1      
      &dcallmp 14							// ReshowMainMenu()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 126							//'IsProfileManagerShow'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdbgm 72							//'m_profileManagerShow'
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 127							//'IsAlienReveal'
    &function2  ('Void') (r:1='this')
      &pushsdb 84							//'1'
      &pushsdb 127							//'IsAlienReveal'
      &pushbyte 2
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &pushsdb 83							//'GetExtern'
      &callMethod
      &pushsdb 84							//'1'
      &equals
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 128							//'RegisterAlienRevealCallback'
    &function2  (r:2='update') (r:1='this')
      &push r:1      
      &pushsdb 129							//'m_alienRevealUpdate'
      &push r:2      
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 130							//'OnAlienRevealDone'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdb 131							//'_visible'
      &pushfalse
      &setMember
      &pushsdb 132							//'index=2'
      &pushsdb 41							//'OnStartCampaign'
      &pushbyte 2
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 133							//'OnAlienRevealStarted'
    &function2  () (r:1='this')
      &pushsdb 133							//'OnAlienRevealStarted'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 134							//'ClearAlienRevealCallback'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdb 129							//'m_alienRevealUpdate'
      &pushundef
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 135							//'UpdateAlienReveal'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdbgm 129							//'m_alienRevealUpdate'
      &pushundef
      &equals
      &not
      &jnz label10      
      &pushfalse
      &return
     label10:
      &pushzero
      &push r:1      
      &dcallmp -127							// (null)()
      &pushtrue
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 136							//'IsShowKane'
    &function2  ('Void') (r:1='this')
      &pushzero
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &pushsdb 137							//'IsSpecialEditionExe'
      &callMethod
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 138							//'OnBttnPurchaseNow'
    &function2  ('Void') (r:1='this')
      &pushsdb 139							//'OnBttnPurchase'
      &pushone
      &push r:1      
      &pushsdbgm 2							//'m_apt'
      &dcallmp 17							// Call()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 140							//'RegisterProfileManager'
    &function2  (r:2='manager') (r:1='this')
      &push r:1      
      &pushsdb 114							//'m_profileManager'
      &push r:2      
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 113							//'SetProfileManagerState'
    &function2  (r:2='state') (r:1='this')
      &push r:1      
      &pushsdb 141							//'m_profileManagerState'
      &push r:2      
      &setMember
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 142							//'_ExitProfileManager'
    &function2  ('Void') (r:1='this')
      &push r:1      
      &pushsdbgm 141							//'m_profileManagerState'
      &pushsdb 143							//'CreateNewProfile'
      &equals
      &not
      &jnz label12      
      &push r:1      
      &pushsdbgm 114							//'m_profileManager'
      &pushundef
      &equals
      &not
      &not
      &jnz label11      
      &push r:1      
      &pushsdbgm 114							//'m_profileManager'
      &pushsdb 144							//'vFadeIn'
      &pushfalse
      &setMember
      &pushsdb 145							//'_managerNoFade'
      &pushone
      &push r:1      
      &pushsdbgm 114							//'m_profileManager'
      &dcallmp 116							// gotoAndPlay()
     label11:
      &jmp label13      
     label12:
      &push r:1      
      &pushsdbgm 141							//'m_profileManagerState'
      &pushsdb 146							//'ManageProfile'
      &equals
      &not
      &jnz label13      
      &push r:1      
      &pushsdbgm 114							//'m_profileManager'
      &pushundef
      &equals
      &not
      &not
      &jnz label13      
      &pushzero
      &push r:1      
      &dcallmp 112							// _UnloadProfileManagerDialog()
     label13:
    &end // of function 

    &setMember
    &push r:0    
    &pushsdb 3							//'m_classRoot'
    &pushsdb 123							//'MainMenu'
    &setMember
    &push r:1    
    &pushsdb 69							//'ProfileManagerLoader'
    &pushundef
    &setMember
    &push r:1    
    &pushsdb 114							//'m_profileManager'
    &pushundef
    &setMember
    &push r:1    
    &pushsdb 141							//'m_profileManagerState'
    &pushsdb 43							//''
    &setMember
    &push r:1    
    &pushsdb 72							//'m_profileManagerShow'
    &pushfalse
    &setMember
    &push r:1    
    &pushsdb 100							//'m_goToActivate'
    &pushfalse
    &setMember
    &push r:0    
    &pushsdb 8							//'debug'
    &pushsdbgv 1							//'MainMenuClass'
    &pushsdbgm 3							//'m_classRoot'
    &pushone
    &pushsdb 147							//'DebugClass'
    &new
    &setMember
    &pushone
    &pushnull
    &pushglobalgv
    &pushsdbgm 1							//'MainMenuClass'
    &pushsdbgm 6							//'prototype'
    &pushbyte 3
    &pushsdb 148							//'ASSetPropFlags'
    &callFunction
   label14:
    &pop
  &end // of initMovieClip 304

  &defineMovieClip 305 // total frames: 0
  &end // of defineMovieClip 305
  
  &exportAssets
    305 &as '__Packages.AptApiClass'
  &end // of exportAssets
  
  &initMovieClip 305
    &constants '_global', 'AptApiClass', 'm_codePrefix', 'Apt', '::', 'm_aptActive', 'InGame', '_target', 'RegisterScreen', 'Call', 'prototype', 'extern', 'Boolean', '__get__Active', 'AptCall ', '(', ')', 'debug', 'Trace', 'FSCommand:', 'CallAbs', 'CallAbs ', 'LoadVariables', 'Object', '_loadVariables', 'ConvertObjectMembers', 'LoadVariables:', 'Dump', ',', 'split', 'length', '=', 'Array', 'Number', 'ERROR: AptLoadVariables - Unable to convert : ', 'GetExtern', 'GetExtern(', ')=>', 'SetExtern', 'SetExtern(', 'ToggleExtern', 'PlaySound', 'FSCommand:PlaySound', 'IsCnc3Demo', 'Cnc3PcDemo', '0', 'IsSpecialEdition', '1', 'IsSpecialEditionExe', '============TESTING KANE', 'IsSpectatorClient', 'EnableEngineComponents', 'EnableEngineComponents:', 'FSCommand:EnableComponents', 'DisableEngineComponents', 'DisableEngineComponents:', 'FSCommand:DisableComponents', 'DoTrace', 'AptApiClass::', 'DebugClass', '', 'Active', 'addProperty', 'ASSetPropFlags'  
    &pushglobalgv
    &pushsdbgm 1							//'AptApiClass'
    &not
    &not
    &jnz label25    
    &pushglobalgv
    &pushsdb 1							//'AptApiClass'
    &function2  (r:3='className', r:2='screen') (r:1='this')
      &push r:1      
      &pushsdb 2							//'m_codePrefix'
      &pushsdb 3							//'Apt'
      &push r:3      
      &add
      &pushsdb 4							//'::'
      &add
      &setMember
      &pushsdbgv 1							//'AptApiClass'
      &pushsdb 5							//'m_aptActive'
      &pushzero
      &pushsdbgv 1							//'AptApiClass'
      &pushsdb 6							//'InGame'
      &callMethod
      &setMember
      &push r:2      
      &pushsdbgm 7							//'_target'
      &pushsdb 8							//'RegisterScreen'
      &pushbyte 2
      &push r:1      
      &dcallmp 9							// Call()
    &end // of function 

    &setRegister r:0
    &setMember
    &push r:0    
    &pushsdbgm 10							//'prototype'
    &setRegister r:1
    &pop
    &push r:0    
    &pushsdb 6							//'InGame'
    &function  ('Void'    )    
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 5							//'m_aptActive'
      &pushundef
      &equals
      &not
      &jnz label1      
      &pushsdbgv 1							//'AptApiClass'
      &pushsdb 5							//'m_aptActive'
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 11							//'extern'
      &pushsdbgm 6							//'InGame'
      &toNumber
      &pushone
      &pushsdb 12							//'Boolean'
      &callFunction
      &setMember
     label1:
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 5							//'m_aptActive'
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 13							//'__get__Active'
    &function  (    )    
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 5							//'m_aptActive'
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 9							//'Call'
    &function2  (r:2='func', r:3='params') (r:1='this')
      &pushsdb 14							//'AptCall '
      &push r:1      
      &pushsdbgm 2							//'m_codePrefix'
      &add
      &push r:2      
      &add
      &pushsdb 15							//'('
      &add
      &push r:3      
      &add
      &pushsdb 16							//')'
      &add
      &pushone
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 17							//'debug'
      &dcallmp 18							// Trace()
      &pushsdb 19							//'FSCommand:'
      &push r:1      
      &pushsdbgm 2							//'m_codePrefix'
      &push r:2      
      &add
      &concat
      &push r:3      
      &getURL2
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 20							//'CallAbs'
    &function2  (r:1='func', r:2='params') ()
      &pushsdb 16							//')'
      &push r:2      
      &pushsdb 21							//'CallAbs '
      &push r:1      
      &add
      &pushsdb 15							//'('
      &add
      &pushbyte 3
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 17							//'debug'
      &dcallmp 18							// Trace()
      &pushsdb 19							//'FSCommand:'
      &push r:1      
      &concat
      &push r:2      
      &getURL2
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 22							//'LoadVariables'
    &function2  (r:4='varName', r:2='obj', r:3='convertStr') (r:1='this')
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 5							//'m_aptActive'
      &not
      &jnz label2      
      &pushzero
      &pushsdb 23							//'Object'
      &new
      &setRegister r:2
      &pop
      &push r:2      
      &push r:1      
      &pushsdbgm 2							//'m_codePrefix'
      &push r:4      
      &add
      &pushbyte 2
      &pushsdbgv 1							//'AptApiClass'
      &dcallmp 24							// _loadVariables()
     label2:
      &push r:3      
      &pushundef
      &equals
      &not
      &not
      &jnz label3      
      &push r:3      
      &push r:2      
      &pushbyte 2
      &push r:1      
      &dcallmp 25							// ConvertObjectMembers()
     label3:
      &pushsdb 26							//'LoadVariables:'
      &push r:4      
      &add
      &push r:2      
      &pushbyte 2
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 17							//'debug'
      &dcallmp 27							// Dump()
      &push r:2      
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 25							//'ConvertObjectMembers'
    &function2  (r:3='obj', r:7='convertStr') ()
      &pushsdb 28							//','
      &pushone
      &push r:7      
      &pushsdb 29							//'split'
      &callMethod
      &setRegister r:5
      &pop
      &push r:5      
      &pushsdbgm 30							//'length'
      &setRegister r:6
      &pop
      &pushzero
      &setRegister r:2
      &pop
     label4:
      &push r:2      
      &push r:6      
      &lessThan
      &not
      &jnz label12      
      &pushsdb 31							//'='
      &pushone
      &push r:5      
      &push r:2      
      &getMember
      &pushsdb 29							//'split'
      &callMethod
      &setRegister r:4
      &pop
      &push r:4      
      &pushzero
      &getMember
      &setRegister r:1
      &pop
      &push r:4      
      &pushone
      &getMember
      &setRegister r:0
      &pushsdb 32							//'Array'
      &strictEquals
      &jnz label5      
      &push r:0      
      &pushsdb 12							//'Boolean'
      &strictEquals
      &jnz label6      
      &push r:0      
      &pushsdb 33							//'Number'
      &strictEquals
      &jnz label9      
      &jmp label10      
     label5:
      &push r:3      
      &push r:1      
      &pushsdb 28							//','
      &pushone
      &push r:3      
      &push r:1      
      &getMember
      &pushsdb 29							//'split'
      &callMethod
      &setMember
      &jmp label11      
     label6:
      &push r:3      
      &push r:1      
      &push r:3      
      &push r:1      
      &getMember
      &toNumber
      &jnz label7      
      &pushfalse
      &jmp label8      
     label7:
      &pushtrue
     label8:
      &setMember
      &jmp label11      
     label9:
      &push r:3      
      &push r:1      
      &push r:3      
      &push r:1      
      &getMember
      &toNumber
      &setMember
      &jmp label11      
     label10:
      &pushsdb 34							//'ERROR: AptLoadVariables - Unable to convert : '
      &push r:5      
      &push r:2      
      &getMember
      &add
      &trace
      &jmp label11      
     label11:
      &push r:2      
      &increment
      &setRegister r:2
      &pop
      &jmp label4      
     label12:
    &end // of function 

    &setMember
    &push r:0    
    &pushsdb 24							//'_loadVariables'
    &function2  (r:2='varName', r:1='obj') ()
      &push r:2      
      &push r:1      
      &loadVariables
      &push r:1      
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 35							//'GetExtern'
    &function2  (r:3='ext', r:4='testDefault') (r:1='this')
      &pushundef
      &setRegister r:2
      &pop
      &push r:1      
      &pushsdbgm 2							//'m_codePrefix'
      &push r:3      
      &add
      &setRegister r:3
      &pop
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 5							//'m_aptActive'
      &not
      &jnz label13      
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 11							//'extern'
      &push r:3      
      &getMember
      &setRegister r:2
      &pop
      &jmp label16      
     label13:
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 11							//'extern'
      &push r:3      
      &getMember
      &pushundef
      &equals
      &not
      &jnz label14      
      &push r:4      
      &setRegister r:2
      &pop
      &jmp label15      
     label14:
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 11							//'extern'
      &push r:3      
      &getMember
      &setRegister r:2
      &pop
     label15:
      &pushsdb 36							//'GetExtern('
      &push r:3      
      &add
      &pushsdb 37							//')=>'
      &add
      &push r:2      
      &add
      &pushone
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 17							//'debug'
      &dcallmp 18							// Trace()
     label16:
      &push r:2      
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 38							//'SetExtern'
    &function2  (r:2='ext', r:3='to') (r:1='this')
      &push r:1      
      &pushsdbgm 2							//'m_codePrefix'
      &push r:2      
      &add
      &setRegister r:2
      &pop
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 11							//'extern'
      &push r:2      
      &push r:3      
      &setMember
      &pushsdb 39							//'SetExtern('
      &push r:2      
      &add
      &pushsdb 37							//')=>'
      &add
      &push r:3      
      &add
      &pushone
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 17							//'debug'
      &dcallmp 18							// Trace()
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 40							//'ToggleExtern'
    &function2  (r:3='ext') (r:1='this')
      &push r:1      
      &pushsdbgm 2							//'m_codePrefix'
      &push r:3      
      &add
      &setRegister r:3
      &pop
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 11							//'extern'
      &push r:3      
      &getMember
      &toNumber
      &not
      &setRegister r:2
      &pop
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 11							//'extern'
      &push r:3      
      &push r:2      
      &setMember
      &push r:2      
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 41							//'PlaySound'
    &function2  (r:1='name') ()
      &pushsdb 42							//'FSCommand:PlaySound'
      &push r:1      
      &getURL2
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 43							//'IsCnc3Demo'
    &function2  (r:1='testDefault') ()
      &pushzero
      &pushsdbgv 1							//'AptApiClass'
      &pushsdb 6							//'InGame'
      &callMethod
      &jnz label17      
      &push r:1      
      &jmp label18      
     label17:
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 11							//'extern'
      &pushsdbgm 44							//'Cnc3PcDemo'
      &pushsdb 45							//'0'
      &equals
      &not
     label18:
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 46							//'IsSpecialEdition'
    &function2  (r:1='testDefault') ()
      &pushzero
      &pushsdbgv 1							//'AptApiClass'
      &pushsdb 6							//'InGame'
      &callMethod
      &jnz label19      
      &push r:1      
      &jmp label20      
     label19:
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 11							//'extern'
      &pushsdbgm 46							//'IsSpecialEdition'
      &pushsdb 47							//'1'
      &equals
     label20:
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 48							//'IsSpecialEditionExe'
    &function2  (r:1='testDefault') ()
      &pushsdb 49							//'============TESTING KANE'
      &trace
      &pushzero
      &pushsdbgv 1							//'AptApiClass'
      &pushsdb 6							//'InGame'
      &callMethod
      &jnz label21      
      &push r:1      
      &jmp label22      
     label21:
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 11							//'extern'
      &pushsdbgm 48							//'IsSpecialEditionExe'
      &pushsdb 47							//'1'
      &equals
     label22:
      &return
    &end // of function 

    &setMember
    &push r:1    
    &pushsdb 50							//'IsSpectatorClient'
    &function2  (r:1='testDefault') ()
      &pushzero
      &pushsdbgv 1							//'AptApiClass'
      &pushsdb 6							//'InGame'
      &callMethod
      &jnz label23      
      &push r:1      
      &jmp label24      
     label23:
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 11							//'extern'
      &pushsdbgm 50							//'IsSpectatorClient'
      &pushsdb 45							//'0'
      &equals
      &not
     label24:
      &return
    &end // of function 

    &setMember
    &push r:0    
    &pushsdb 51							//'EnableEngineComponents'
    &function2  (r:1='path') ()
      &pushsdb 52							//'EnableEngineComponents:'
      &push r:1      
      &add
      &pushone
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 17							//'debug'
      &dcallmp 18							// Trace()
      &pushsdb 53							//'FSCommand:EnableComponents'
      &push r:1      
      &getURL2
    &end // of function 

    &setMember
    &push r:0    
    &pushsdb 54							//'DisableEngineComponents'
    &function2  (r:1='path') ()
      &pushsdb 55							//'DisableEngineComponents:'
      &push r:1      
      &add
      &pushone
      &pushsdbgv 1							//'AptApiClass'
      &pushsdbgm 17							//'debug'
      &dcallmp 18							// Trace()
      &pushsdb 56							//'FSCommand:DisableComponents'
      &push r:1      
      &getURL2
    &end // of function 

    &setMember
    &push r:0    
    &pushsdb 11							//'extern'
    &pushsdb 57							//'DoTrace'
    &pushzero
    &pushsdb 6							//'InGame'
    &pushzero
    &pushsdb 44							//'Cnc3PcDemo'
    &pushzero
    &pushbyte 3
    &initObject
    &setMember
    &push r:0    
    &pushsdb 17							//'debug'
    &pushsdb 58							//'AptApiClass::'
    &pushone
    &pushsdb 59							//'DebugClass'
    &new
    &setMember
    &push r:0    
    &pushsdb 5							//'m_aptActive'
    &pushundef
    &setMember
    &push r:1    
    &pushsdb 2							//'m_codePrefix'
    &pushsdb 60							//''
    &setMember
    &function  (    )    
    &end // of function 

    &push r:1    
    &pushsdbgm 13							//'__get__Active'
    &pushsdb 61							//'Active'
    &pushbyte 3
    &push r:1    
    &pushsdb 62							//'addProperty'
    &callMethod
    &pushone
    &pushnull
    &pushglobalgv
    &pushsdbgm 1							//'AptApiClass'
    &pushsdbgm 10							//'prototype'
    &pushbyte 3
    &pushsdb 63							//'ASSetPropFlags'
    &callFunction
   label25:
    &pop
  &end // of initMovieClip 305
  
  &initMovieClip 16
    &pushsgv 'ButtonClass'
    &pushs 'NavButtonTutorial'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 16
  
  &initMovieClip 25
    &pushsgv 'ButtonClass'
    &pushs 'NavSoloPlaySub0'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 25
  
  &initMovieClip 34
    &pushsgv 'ButtonClass'
    &pushs 'NavSoloPlaySub1'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 34
  
  &initMovieClip 43
    &pushsgv 'ButtonClass'
    &pushs 'NavSoloPlaySub2'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 43
  
  &initMovieClip 52
    &pushsgv 'ButtonClass'
    &pushs 'NavSoloPlaySub3'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 52
  
  &initMovieClip 61
    &pushsgv 'ButtonClass'
    &pushs 'NavSoloPlaySub4'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 61
  
  &initMovieClip 72
    &pushsgv 'ButtonClass'
    &pushs 'NavButtonSoloPlay'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 72
  
  &initMovieClip 81
    &pushsgv 'ButtonClass'
    &pushs 'NavSkirmishSub0'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 81
  
  &initMovieClip 90
    &pushsgv 'ButtonClass'
    &pushs 'NavSkirmishSub1'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 90
  
  &initMovieClip 99
    &pushsgv 'ButtonClass'
    &pushs 'NavSkirmishSub2'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 99
  
  &initMovieClip 110
    &pushsgv 'ButtonClass'
    &pushs 'NavButtonSkirmish'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 110
  
  &initMovieClip 119
    &pushsgv 'ButtonClass'
    &pushs 'NavMultiplayerSub0 '
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 119
  
  &initMovieClip 128
    &pushsgv 'ButtonClass'
    &pushs 'NavMultiplayerSub1'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 128
  
  &initMovieClip 137
    &pushsgv 'ButtonClass'
    &pushs 'NavMultiplayerSub2'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 137
  
  &initMovieClip 148
    &pushsgv 'ButtonClass'
    &pushs 'NavButtonMultiplayer'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 148
  
  &initMovieClip 157
    &pushsgv 'ButtonClass'
    &pushs 'NavProfilesSub0'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 157
  
  &initMovieClip 166
    &pushsgv 'ButtonClass'
    &pushs 'NavProfilesSub1'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 166
  
  &initMovieClip 175
    &pushsgv 'ButtonClass'
    &pushs 'NavProfilesSub2'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 175
  
  &initMovieClip 184
    &pushsgv 'ButtonClass'
    &pushs 'NavProfilesSub3'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 184
  
  &initMovieClip 195
    &pushsgv 'ButtonClass'
    &pushs 'NavButtonProfiles'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 195
  
  &initMovieClip 204
    &pushsgv 'ButtonClass'
    &pushs 'NavOptionsSub0'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 204
  
  &initMovieClip 213
    &pushsgv 'ButtonClass'
    &pushs 'NavOptionsSub1'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 213
  
  &initMovieClip 224
    &pushsgv 'ButtonClass'
    &pushs 'NavButtonOptions'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 224
  
  &initMovieClip 234
    &pushsgv 'ButtonClass'
    &pushs 'ButtonQuit'
    &pushbyte 2
    &pushsgv 'Object'
    &pushs 'registerClass'
    &callmp
  &end // of initMovieClip 234
  
  &initMovieClip 300
    &constants 'MainMenuClass', 'Object', 'registerClass'  
    &pushsdbgv 0							//'MainMenuClass'
    &pushsdb 0							//'MainMenuClass'
    &pushbyte 2
    &pushsdbgv 1							//'Object'
    &dcallmp 2							// registerClass()
  &end // of initMovieClip 300
  
  &initMovieClip 3
    &constants 'AptZombieClass', 'Object', 'registerClass'  
    &pushsdbgv 0							//'AptZombieClass'
    &pushsdb 0							//'AptZombieClass'
    &pushbyte 2
    &pushsdbgv 1							//'Object'
    &dcallmp 2							// registerClass()
  &end // of initMovieClip 3
&end
