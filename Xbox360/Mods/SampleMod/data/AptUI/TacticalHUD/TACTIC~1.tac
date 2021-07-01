movie 'D:\cnc\PRODUC~1\Data\APTBUI~1\034A3~1.0-D\pc\Output\TACTIC~1\\TACTIC~1.eaf' &compressed // flash 7, total frames: 21, frame rate: 30 fps, 1024x768 px

  &frame 0
    &constants 'letterBoxLayer', '_visible', 'hideMainCount', 'main', 'selectionFeedbackSurface', 'floatingTextSurface', '.inputShield', '.main.helpBox', '.selectionFeedbackSurface', '.main.radar', '.main.mainCommandBar', '.main.selectionDetails', '.main.resourceDisplay', 'resourceDisplay', '.main.commandModeBar', '.main.energyMeter', '.main.playerPowersBar', '.main.specialPowerTimerDisplay', 'dialogStage', 'cutSceneStage', '.main.objectiveIndicatorStage', '.main.militaryCaptionSurface', '.main.messageSurface', '.main.timerSurface', '.main.popUpMetaStage', '.main.commonCommandBar', '.main.observerControl', '.main.telestratorControl', '.main.voiceChatControl', '.main.ticker', '.main.telestratorSurface', '.main.gadgetFlashStage', '.main.gadgetInputShieldStage', 'subtitlePanelSurface', 'displayLeft', 'displayTop', 'displayWidth', 'displayHeight', 'leftAnchoredClips', 'length', '_x', 'leftMargins', 'rightAnchoredClips', 'rightMargins', 'topAnchoredClips', '_y', 'topMargins', 'bottomAnchoredClips', 'bottomMargins', 'fullScreenClips', '_width', '_height', 'inputShield', 'letterBoxVisible', '_fadeIn', 'gotoAndPlay', '_fadeOut', 'currentFaction', 'factionObserverMap', 'OnCurrentFactionChanged', 'Hide', 'Show', 'FadeIn', 'FadeOut', 'GetInputShield', 'GetHelpBox', 'GetSelectionFeedbackSurface', 'GetRadar', 'GetMainCommandBar', 'GetSelectionDetailsPanel', 'GetResourceDisplay', 'SetResourceDisplayVisibility', 'GetCommandModeBar', 'GetEnergyMeter', 'GetPlayerPowerBar', 'GetPlayerPowerTimerDisplay', 'GetDialogStage', 'GetCutSceneStage', 'GetObjectiveIndicatorStage', 'GetFloatingTextSurface', 'GetMilitaryCaptionSurface', 'GetMessageSurface', 'GetTimerSurface', 'GetPopUpMetaStage', 'GetCommonCommandBar', 'GetObserverControlPanel', 'GetTelestratorControlPanel', 'GetVoiceChatControlPanel', 'GetTickerPanel', 'GetTelestratorSurface', 'GetGadgetFlashStage', 'GetGadgetInputShieldStage', 'GetSubtitlePanelSurface', 'SetDisplayResolution', 'SetLetterBoxVisibility', 'SetCurrentFaction', 'onUnload', 'initialized', 'this', '_parent', 'OnContentLoaded', 'commonCommandBar', 'ticker', 'specialPowerTimerDisplay', 'playerPowersBar', 'militaryCaptionSurface', 'messageSurface', 'timerSurface', 'selectionDetails', 'sidebarFrame', 'mainCommandBar', 'radar', 'energyMeter', 'commandModeBar', 'voiceChatControl', 'observerControl', 'telestratorControl', 'telestratorSurface', 'Array', 'i', '_root', 'FSCommand:', ':OnInitialized', '', 'extern', 'InGame', '768', '1024', 'GDI'  
    &function Hide (    )    
      &pushsdbgv 0							//'letterBoxLayer'
      &pushsdb 1							//'_visible'
      &pushfalse
      &setMember
      &pushsdbgv 2							//'hideMainCount'
      &pushsdb 2							//'hideMainCount'
      &pushsdbgv 2							//'hideMainCount'
      &increment
      &setVariable
      &pushzero
      &equals
      &not
      &jnz label1      
      &pushsdbgv 3							//'main'
      &pushsdb 1							//'_visible'
      &pushfalse
      &setMember
     label1:
      &pushsdbgv 4							//'selectionFeedbackSurface'
      &pushsdb 1							//'_visible'
      &pushfalse
      &setMember
      &pushsdbgv 5							//'floatingTextSurface'
      &pushsdb 1							//'_visible'
      &pushfalse
      &setMember
    &end // of function Hide

    &function Show (    )    
      &pushsdbgv 0							//'letterBoxLayer'
      &pushsdb 1							//'_visible'
      &pushtrue
      &setMember
      &pushsdb 2							//'hideMainCount'
      &pushsdbgv 2							//'hideMainCount'
      &decrement
      &setRegister r:0
      &setVariable
      &push r:0      
      &pushzero
      &equals
      &not
      &jnz label2      
      &pushsdbgv 3							//'main'
      &pushsdb 1							//'_visible'
      &pushtrue
      &setMember
     label2:
      &pushsdbgv 4							//'selectionFeedbackSurface'
      &pushsdb 1							//'_visible'
      &pushtrue
      &setMember
      &pushsdbgv 5							//'floatingTextSurface'
      &pushsdb 1							//'_visible'
      &pushtrue
      &setMember
    &end // of function Show

    &function FadeIn (    )    
      &gotoLabel '_fadeIn'
      &play
      &pushsdb 2							//'hideMainCount'
      &pushsdbgv 2							//'hideMainCount'
      &decrement
      &setRegister r:0
      &setVariable
      &push r:0      
      &pushzero
      &equals
      &not
      &jnz label3      
      &pushsdbgv 3							//'main'
      &pushsdb 1							//'_visible'
      &pushtrue
      &setMember
     label3:
    &end // of function FadeIn

    &function FadeOut (    )    
      &gotoLabel '_fadeOut'
      &play
    &end // of function FadeOut

    &function2 GetInputShield () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 6							//'.inputShield'
      &add
      &return
    &end // of function GetInputShield

    &function2 GetHelpBox () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 7							//'.main.helpBox'
      &add
      &return
    &end // of function GetHelpBox

    &function2 GetSelectionFeedbackSurface () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 8							//'.selectionFeedbackSurface'
      &add
      &return
    &end // of function GetSelectionFeedbackSurface

    &function2 GetRadar () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 9							//'.main.radar'
      &add
      &return
    &end // of function GetRadar

    &function2 GetMainCommandBar () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 10							//'.main.mainCommandBar'
      &add
      &return
    &end // of function GetMainCommandBar

    &function2 GetSelectionDetailsPanel () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 11							//'.main.selectionDetails'
      &add
      &return
    &end // of function GetSelectionDetailsPanel

    &function2 GetResourceDisplay () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 12							//'.main.resourceDisplay'
      &add
      &return
    &end // of function GetResourceDisplay

    &function2 SetResourceDisplayVisibility (r:1='visArg') ()
      &pushsdbgv 3							//'main'
      &pushsdbgm 13							//'resourceDisplay'
      &pushsdb 1							//'_visible'
      &push r:1      
      &toNumber
      &pushzero
      &equals
      &not
      &setMember
    &end // of function SetResourceDisplayVisibility

    &function2 GetCommandModeBar () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 14							//'.main.commandModeBar'
      &add
      &return
    &end // of function GetCommandModeBar

    &function2 GetEnergyMeter () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 15							//'.main.energyMeter'
      &add
      &return
    &end // of function GetEnergyMeter

    &function2 GetPlayerPowersBar () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 16							//'.main.playerPowersBar'
      &add
      &return
    &end // of function GetPlayerPowersBar

    &function2 GetSpecialPowerTimerDisplay () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 17							//'.main.specialPowerTimerDisplay'
      &add
      &return
    &end // of function GetSpecialPowerTimerDisplay

    &function GetDialogStage (    )    
      &pushsdbgv 18							//'dialogStage'
      &toString
      &return
    &end // of function GetDialogStage

    &function GetCutSceneStage (    )    
      &pushsdbgv 19							//'cutSceneStage'
      &toString
      &return
    &end // of function GetCutSceneStage

    &function2 GetObjectiveIndicatorStage () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 20							//'.main.objectiveIndicatorStage'
      &add
      &return
    &end // of function GetObjectiveIndicatorStage

    &function GetFloatingTextSurface (    )    
      &pushsdbgv 5							//'floatingTextSurface'
      &toString
      &return
    &end // of function GetFloatingTextSurface

    &function2 GetMilitaryCaptionSurface () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 21							//'.main.militaryCaptionSurface'
      &add
      &return
    &end // of function GetMilitaryCaptionSurface

    &function2 GetMessageSurface () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 22							//'.main.messageSurface'
      &add
      &return
    &end // of function GetMessageSurface

    &function2 GetTimerSurface () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 23							//'.main.timerSurface'
      &add
      &return
    &end // of function GetTimerSurface

    &function2 GetPopUpMetaStage () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 24							//'.main.popUpMetaStage'
      &add
      &return
    &end // of function GetPopUpMetaStage

    &function2 GetCommonCommandBar () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 25							//'.main.commonCommandBar'
      &add
      &return
    &end // of function GetCommonCommandBar

    &function2 GetObserverControlPanel () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 26							//'.main.observerControl'
      &add
      &return
    &end // of function GetObserverControlPanel

    &function2 GetTelestratorControlPanel () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 27							//'.main.telestratorControl'
      &add
      &return
    &end // of function GetTelestratorControlPanel

    &function2 GetVoiceChatControlPanel () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 28							//'.main.voiceChatControl'
      &add
      &return
    &end // of function GetVoiceChatControlPanel

    &function2 GetTickerPanel () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 29							//'.main.ticker'
      &add
      &return
    &end // of function GetTickerPanel

    &function2 GetTelestratorSurface () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 30							//'.main.telestratorSurface'
      &add
      &return
    &end // of function GetTelestratorSurface

    &function2 GetGadgetFlashStage () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 31							//'.main.gadgetFlashStage'
      &add
      &return
    &end // of function GetGadgetFlashStage

    &function2 GetGadgetInputShieldStage () (r:1='this')
      &push r:1      
      &toString
      &pushsdb 32							//'.main.gadgetInputShieldStage'
      &add
      &return
    &end // of function GetGadgetInputShieldStage

    &function GetSubtitlePanelSurface (    )    
      &pushsdbgv 33							//'subtitlePanelSurface'
      &toString
      &return
    &end // of function GetSubtitlePanelSurface

    &function2 SetDisplayResolution (r:10='widthArg', r:9='heightArg') (r:1='_root')
      &push r:10      
      &toNumber
      &setRegister r:6
      &pop
      &pushshort 1024
      &push r:6      
      &subtract
      &pushbyte 2
      &divide
      &setRegister r:5
      &pop
      &push r:9      
      &toNumber
      &setRegister r:7
      &pop
      &pushshort 768
      &push r:7      
      &subtract
      &pushbyte 2
      &divide
      &setRegister r:4
      &pop
      &push r:1      
      &pushsdb 34							//'displayLeft'
      &push r:5      
      &setMember
      &push r:1      
      &pushsdb 35							//'displayTop'
      &push r:4      
      &setMember
      &push r:1      
      &pushsdb 36							//'displayWidth'
      &push r:6      
      &setMember
      &push r:1      
      &pushsdb 37							//'displayHeight'
      &push r:7      
      &setMember
      &pushzero
      &setRegister r:3
      &pop
     label4:
      &push r:3      
      &pushsdbgv 38							//'leftAnchoredClips'
      &pushsdbgm 39							//'length'
      &lessThan
      &not
      &jnz label5      
      &pushsdbgv 38							//'leftAnchoredClips'
      &push r:3      
      &getMember
      &pushsdb 40							//'_x'
      &push r:5      
      &pushsdbgv 41							//'leftMargins'
      &push r:3      
      &getMember
      &add
      &setMember
      &push r:3      
      &increment
      &setRegister r:3
      &pop
      &jmp label4      
     label5:
      &pushzero
      &setRegister r:3
      &pop
     label6:
      &push r:3      
      &pushsdbgv 42							//'rightAnchoredClips'
      &pushsdbgm 39							//'length'
      &lessThan
      &not
      &jnz label7      
      &pushsdbgv 42							//'rightAnchoredClips'
      &push r:3      
      &getMember
      &pushsdb 40							//'_x'
      &push r:5      
      &push r:6      
      &add
      &pushsdbgv 43							//'rightMargins'
      &push r:3      
      &getMember
      &subtract
      &setMember
      &push r:3      
      &increment
      &setRegister r:3
      &pop
      &jmp label6      
     label7:
      &pushzero
      &setRegister r:3
      &pop
     label8:
      &push r:3      
      &pushsdbgv 44							//'topAnchoredClips'
      &pushsdbgm 39							//'length'
      &lessThan
      &not
      &jnz label9      
      &pushsdbgv 44							//'topAnchoredClips'
      &push r:3      
      &getMember
      &pushsdb 45							//'_y'
      &push r:4      
      &pushsdbgv 46							//'topMargins'
      &push r:3      
      &getMember
      &add
      &setMember
      &push r:3      
      &increment
      &setRegister r:3
      &pop
      &jmp label8      
     label9:
      &pushzero
      &setRegister r:3
      &pop
     label10:
      &push r:3      
      &pushsdbgv 47							//'bottomAnchoredClips'
      &pushsdbgm 39							//'length'
      &lessThan
      &not
      &jnz label11      
      &pushsdbgv 47							//'bottomAnchoredClips'
      &push r:3      
      &getMember
      &pushsdb 45							//'_y'
      &push r:4      
      &push r:7      
      &add
      &pushsdbgv 48							//'bottomMargins'
      &push r:3      
      &getMember
      &subtract
      &setMember
      &push r:3      
      &increment
      &setRegister r:3
      &pop
      &jmp label10      
     label11:
      &pushzero
      &setRegister r:3
      &pop
     label12:
      &push r:3      
      &pushsdbgv 49							//'fullScreenClips'
      &pushsdbgm 39							//'length'
      &lessThan
      &not
      &jnz label13      
      &pushsdbgv 49							//'fullScreenClips'
      &push r:3      
      &getMember
      &setRegister r:2
      &pop
      &push r:2      
      &pushsdb 40							//'_x'
      &push r:5      
      &setMember
      &push r:2      
      &pushsdb 50							//'_width'
      &push r:6      
      &setMember
      &push r:2      
      &pushsdb 45							//'_y'
      &push r:4      
      &setMember
      &push r:2      
      &pushsdb 51							//'_height'
      &push r:7      
      &setMember
      &push r:3      
      &increment
      &setRegister r:3
      &pop
      &jmp label12      
     label13:
      &pushbyte 5
      &setRegister r:8
      &pop
      &pushsdbgv 52							//'inputShield'
      &pushsdb 40							//'_x'
      &push r:5      
      &push r:8      
      &subtract
      &setMember
      &pushsdbgv 52							//'inputShield'
      &pushsdb 50							//'_width'
      &push r:6      
      &push r:8      
      &pushbyte 2
      &multiply
      &add
      &setMember
      &pushsdbgv 52							//'inputShield'
      &pushsdb 45							//'_y'
      &push r:4      
      &push r:8      
      &subtract
      &setMember
      &pushsdbgv 52							//'inputShield'
      &pushsdb 51							//'_height'
      &push r:7      
      &push r:8      
      &pushbyte 2
      &multiply
      &add
      &setMember
    &end // of function SetDisplayResolution

    &function2 SetLetterBoxVisibility (r:2='visArg') ()
      &push r:2      
      &toNumber
      &pushzero
      &equals
      &not
      &setRegister r:1
      &pop
      &push r:1      
      &not
      &jnz label15      
      &pushsdbgv 53							//'letterBoxVisible'
      &not
      &not
      &jnz label14      
      &pushsdb 53							//'letterBoxVisible'
      &pushtrue
      &setVariable
      &pushsdb 54							//'_fadeIn'
      &pushone
      &pushsdbgv 0							//'letterBoxLayer'
      &dcallmp 55							// gotoAndPlay()
     label14:
      &jmp label16      
     label15:
      &pushsdbgv 53							//'letterBoxVisible'
      &not
      &jnz label16      
      &pushsdb 53							//'letterBoxVisible'
      &pushfalse
      &setVariable
      &pushsdb 56							//'_fadeOut'
      &pushone
      &pushsdbgv 0							//'letterBoxLayer'
      &dcallmp 55							// gotoAndPlay()
     label16:
    &end // of function SetLetterBoxVisibility

    &function2 SetCurrentFaction (r:3='faction') (r:1='_root')
      &push r:3      
      &push r:1      
      &pushsdbgm 57							//'currentFaction'
      &equals
      &not
      &not
      &jnz label18      
      &push r:1      
      &pushsdb 57							//'currentFaction'
      &push r:3      
      &setMember
      &push r:1      
      &pushsdbgm 58							//'factionObserverMap'
      &enumerateValue
     label17:
      &setRegister r:0
      &pushnull
      &equals
      &jnz label18      
      &push r:0      
      &setRegister r:4
      &pop
      &push r:1      
      &pushsdbgm 58							//'factionObserverMap'
      &push r:4      
      &getMember
      &setRegister r:2
      &pop
      &push r:3      
      &pushone
      &push r:2      
      &dcallmp 59							// OnCurrentFactionChanged()
      &jmp label17      
     label18:
    &end // of function SetCurrentFaction

    &function onUnload (    )    
      &pushsdb 60							//'Hide'
      &delete2
      &pop
      &pushsdb 61							//'Show'
      &delete2
      &pop
      &pushsdb 62							//'FadeIn'
      &delete2
      &pop
      &pushsdb 63							//'FadeOut'
      &delete2
      &pop
      &pushsdb 64							//'GetInputShield'
      &delete2
      &pop
      &pushsdb 65							//'GetHelpBox'
      &delete2
      &pop
      &pushsdb 66							//'GetSelectionFeedbackSurface'
      &delete2
      &pop
      &pushsdb 67							//'GetRadar'
      &delete2
      &pop
      &pushsdb 68							//'GetMainCommandBar'
      &delete2
      &pop
      &pushsdb 69							//'GetSelectionDetailsPanel'
      &delete2
      &pop
      &pushsdb 70							//'GetResourceDisplay'
      &delete2
      &pop
      &pushsdb 71							//'SetResourceDisplayVisibility'
      &delete2
      &pop
      &pushsdb 72							//'GetCommandModeBar'
      &delete2
      &pop
      &pushsdb 73							//'GetEnergyMeter'
      &delete2
      &pop
      &pushsdb 74							//'GetPlayerPowerBar'
      &delete2
      &pop
      &pushsdb 75							//'GetPlayerPowerTimerDisplay'
      &delete2
      &pop
      &pushsdb 76							//'GetDialogStage'
      &delete2
      &pop
      &pushsdb 77							//'GetCutSceneStage'
      &delete2
      &pop
      &pushsdb 78							//'GetObjectiveIndicatorStage'
      &delete2
      &pop
      &pushsdb 79							//'GetFloatingTextSurface'
      &delete2
      &pop
      &pushsdb 80							//'GetMilitaryCaptionSurface'
      &delete2
      &pop
      &pushsdb 81							//'GetMessageSurface'
      &delete2
      &pop
      &pushsdb 82							//'GetTimerSurface'
      &delete2
      &pop
      &pushsdb 83							//'GetPopUpMetaStage'
      &delete2
      &pop
      &pushsdb 84							//'GetCommonCommandBar'
      &delete2
      &pop
      &pushsdb 85							//'GetObserverControlPanel'
      &delete2
      &pop
      &pushsdb 86							//'GetTelestratorControlPanel'
      &delete2
      &pop
      &pushsdb 87							//'GetVoiceChatControlPanel'
      &delete2
      &pop
      &pushsdb 88							//'GetTickerPanel'
      &delete2
      &pop
      &pushsdb 89							//'GetTelestratorSurface'
      &delete2
      &pop
      &pushsdb 90							//'GetGadgetFlashStage'
      &delete2
      &pop
      &pushsdb 91							//'GetGadgetInputShieldStage'
      &delete2
      &pop
      &pushsdb 92							//'GetSubtitlePanelSurface'
      &delete2
      &pop
      &pushsdb 93							//'SetDisplayResolution'
      &delete2
      &pop
      &pushsdb 94							//'SetLetterBoxVisibility'
      &delete2
      &pop
      &pushsdb 95							//'SetCurrentFaction'
      &delete2
      &pop
      &pushsdb 96							//'onUnload'
      &delete2
      &pop
    &end // of function onUnload

    &pushsdbgv 97							//'initialized'
    &not
    &not
    &jnz label27    
    &pushthisgv
    &pushone
    &pushsdbgv 99							//'_parent'
    &dcallmp 100							// OnContentLoaded()
    &pushsdb 2							//'hideMainCount'
    &pushone
    &setVariable
    &pushsdbgv 3							//'main'
    &pushsdb 1							//'_visible'
    &pushfalse
    &setMember
    &pushsdb 53							//'letterBoxVisible'
    &pushfalse
    &setVariable
    &pushsdb 38							//'leftAnchoredClips'
    &pushsdbgv 3							//'main'
    &pushsdbgm 101							//'commonCommandBar'
    &pushsdbgv 3							//'main'
    &pushsdbgm 102							//'ticker'
    &pushsdbgv 3							//'main'
    &pushsdbgm 103							//'specialPowerTimerDisplay'
    &pushsdbgv 3							//'main'
    &pushsdbgm 104							//'playerPowersBar'
    &pushsdbgv 3							//'main'
    &pushsdbgm 105							//'militaryCaptionSurface'
    &pushsdbgv 3							//'main'
    &pushsdbgm 106							//'messageSurface'
    &pushsdbgv 3							//'main'
    &pushsdbgm 107							//'timerSurface'
    &pushbyte 7
    &initArray
    &setVariable
    &pushsdb 42							//'rightAnchoredClips'
    &pushsdbgv 3							//'main'
    &pushsdbgm 108							//'selectionDetails'
    &pushsdbgv 3							//'main'
    &pushsdbgm 109							//'sidebarFrame'
    &pushsdbgv 3							//'main'
    &pushsdbgm 110							//'mainCommandBar'
    &pushsdbgv 3							//'main'
    &pushsdbgm 13							//'resourceDisplay'
    &pushsdbgv 3							//'main'
    &pushsdbgm 111							//'radar'
    &pushsdbgv 3							//'main'
    &pushsdbgm 112							//'energyMeter'
    &pushsdbgv 3							//'main'
    &pushsdbgm 113							//'commandModeBar'
    &pushsdbgv 3							//'main'
    &pushsdbgm 114							//'voiceChatControl'
    &pushsdbgv 3							//'main'
    &pushsdbgm 115							//'observerControl'
    &pushsdbgv 3							//'main'
    &pushsdbgm 116							//'telestratorControl'
    &pushbyte 10
    &initArray
    &setVariable
    &pushsdb 44							//'topAnchoredClips'
    &pushsdbgv 3							//'main'
    &pushsdbgm 109							//'sidebarFrame'
    &pushsdbgv 3							//'main'
    &pushsdbgm 110							//'mainCommandBar'
    &pushsdbgv 3							//'main'
    &pushsdbgm 13							//'resourceDisplay'
    &pushsdbgv 3							//'main'
    &pushsdbgm 111							//'radar'
    &pushsdbgv 3							//'main'
    &pushsdbgm 112							//'energyMeter'
    &pushsdbgv 3							//'main'
    &pushsdbgm 113							//'commandModeBar'
    &pushsdbgv 3							//'main'
    &pushsdbgm 114							//'voiceChatControl'
    &pushsdbgv 3							//'main'
    &pushsdbgm 115							//'observerControl'
    &pushsdbgv 3							//'main'
    &pushsdbgm 116							//'telestratorControl'
    &pushsdbgv 3							//'main'
    &pushsdbgm 104							//'playerPowersBar'
    &pushsdbgv 3							//'main'
    &pushsdbgm 103							//'specialPowerTimerDisplay'
    &pushsdbgv 3							//'main'
    &pushsdbgm 105							//'militaryCaptionSurface'
    &pushsdbgv 3							//'main'
    &pushsdbgm 106							//'messageSurface'
    &pushbyte 13
    &initArray
    &setVariable
    &pushsdb 47							//'bottomAnchoredClips'
    &pushsdbgv 33							//'subtitlePanelSurface'
    &pushsdbgv 3							//'main'
    &pushsdbgm 108							//'selectionDetails'
    &pushsdbgv 3							//'main'
    &pushsdbgm 101							//'commonCommandBar'
    &pushsdbgv 3							//'main'
    &pushsdbgm 102							//'ticker'
    &pushsdbgv 3							//'main'
    &pushsdbgm 107							//'timerSurface'
    &pushbyte 5
    &initArray
    &setVariable
    &pushsdb 49							//'fullScreenClips'
    &pushsdbgv 5							//'floatingTextSurface'
    &pushsdbgv 4							//'selectionFeedbackSurface'
    &pushsdbgv 3							//'main'
    &pushsdbgm 117							//'telestratorSurface'
    &pushsdbgv 0							//'letterBoxLayer'
    &pushbyte 4
    &initArray
    &setVariable
    &pushsdb 41							//'leftMargins'
    &pushsdbgv 38							//'leftAnchoredClips'
    &pushsdbgm 39							//'length'
    &pushone
    &pushsdb 118							//'Array'
    &new
    &setVariable
    &pushsdb 119							//'i'
    &pushzero
    &varEquals
   label19:
    &pushsdbgv 119							//'i'
    &pushsdbgv 38							//'leftAnchoredClips'
    &pushsdbgm 39							//'length'
    &lessThan
    &not
    &jnz label20    
    &pushsdbgv 41							//'leftMargins'
    &pushsdbgv 119							//'i'
    &pushsdbgv 38							//'leftAnchoredClips'
    &pushsdbgv 119							//'i'
    &getMember
    &pushsdbgm 40							//'_x'
    &setMember
    &pushsdb 119							//'i'
    &pushsdbgv 119							//'i'
    &increment
    &setVariable
    &jmp label19    
   label20:
    &pushsdb 43							//'rightMargins'
    &pushsdbgv 42							//'rightAnchoredClips'
    &pushsdbgm 39							//'length'
    &pushone
    &pushsdb 118							//'Array'
    &new
    &setVariable
    &pushsdb 119							//'i'
    &pushzero
    &varEquals
   label21:
    &pushsdbgv 119							//'i'
    &pushsdbgv 42							//'rightAnchoredClips'
    &pushsdbgm 39							//'length'
    &lessThan
    &not
    &jnz label22    
    &pushsdbgv 43							//'rightMargins'
    &pushsdbgv 119							//'i'
    &pushshort 1024
    &pushsdbgv 42							//'rightAnchoredClips'
    &pushsdbgv 119							//'i'
    &getMember
    &pushsdbgm 40							//'_x'
    &subtract
    &setMember
    &pushsdb 119							//'i'
    &pushsdbgv 119							//'i'
    &increment
    &setVariable
    &jmp label21    
   label22:
    &pushsdb 46							//'topMargins'
    &pushsdbgv 44							//'topAnchoredClips'
    &pushsdbgm 39							//'length'
    &pushone
    &pushsdb 118							//'Array'
    &new
    &setVariable
    &pushsdb 119							//'i'
    &pushzero
    &varEquals
   label23:
    &pushsdbgv 119							//'i'
    &pushsdbgv 44							//'topAnchoredClips'
    &pushsdbgm 39							//'length'
    &lessThan
    &not
    &jnz label24    
    &pushsdbgv 46							//'topMargins'
    &pushsdbgv 119							//'i'
    &pushsdbgv 44							//'topAnchoredClips'
    &pushsdbgv 119							//'i'
    &getMember
    &pushsdbgm 45							//'_y'
    &setMember
    &pushsdb 119							//'i'
    &pushsdbgv 119							//'i'
    &increment
    &setVariable
    &jmp label23    
   label24:
    &pushsdb 48							//'bottomMargins'
    &pushsdbgv 47							//'bottomAnchoredClips'
    &pushsdbgm 39							//'length'
    &pushone
    &pushsdb 118							//'Array'
    &new
    &setVariable
    &pushsdb 119							//'i'
    &pushzero
    &varEquals
   label25:
    &pushsdbgv 119							//'i'
    &pushsdbgv 47							//'bottomAnchoredClips'
    &pushsdbgm 39							//'length'
    &lessThan
    &not
    &jnz label26    
    &pushsdbgv 48							//'bottomMargins'
    &pushsdbgv 119							//'i'
    &pushshort 768
    &pushsdbgv 47							//'bottomAnchoredClips'
    &pushsdbgv 119							//'i'
    &getMember
    &pushsdbgm 45							//'_y'
    &subtract
    &setMember
    &pushsdb 119							//'i'
    &pushsdbgv 119							//'i'
    &increment
    &setVariable
    &jmp label25    
   label26:
    &pushsdbgv 120							//'_root'
    &pushsdb 34							//'displayLeft'
    &pushzero
    &setMember
    &pushsdbgv 120							//'_root'
    &pushsdb 35							//'displayTop'
    &pushzero
    &setMember
    &pushsdbgv 120							//'_root'
    &pushsdb 36							//'displayWidth'
    &pushshort 1024
    &setMember
    &pushsdbgv 120							//'_root'
    &pushsdb 37							//'displayHeight'
    &pushshort 768
    &setMember
    &pushsdb 97							//'initialized'
    &pushtrue
    &setVariable
    &pushsdb 121							//'FSCommand:'
    &pushthisgv
    &toString
    &pushsdb 122							//':OnInitialized'
    &add
    &concat
    &pushsdb 123							//''
    &getURL2
    &pushsdbgv 124							//'extern'
    &pushsdbgm 125							//'InGame'
    &not
    &not
    &jnz label27    
    &pushsdb 126							//'768'
    &pushsdb 127							//'1024'
    &pushbyte 2
    &dcallfp 93							// SetDisplayResolution()
    &pushsdb 128							//'GDI'
    &pushone
    &dcallfp 95							// SetCurrentFaction()
    &pushzero
    &dcallfp 62							// FadeIn()
   label27:
  &end // of frame 0

  &frame 0
    &stop
  &end // of frame 0
  
  &importAssets &from 'libHUD.swf'
    'SimpleRenderingSurface' &as 1
  &end // of importAssets

  &defineMovieClip 3 // total frames: 1
  &end // of defineMovieClip 3

  &defineMovieClip 4 // total frames: 1

    &placeMovieClip 3 
    
      &onClipEvent &load
        &pushs ''
        &pushbyte 7
        &pushfalse
        &setProperty
      &end
    &end // of placeMovieClip 3
  &end // of defineMovieClip 4
  
  &importAssets &from 'libHUD.swf'
    'Dummy' &as 5
  &end // of importAssets

  &defineMovieClip 18 // total frames: 30

    &frame 0
      &constants 'DetachFactionObserver', 'OnCurrentFactionChanged', 'onUnload', 'initialized', '_root', 'GetCurrentFaction', 'this', 'AttachFactionObserver'  
      &function2 OnCurrentFactionChanged (r:1='faction') ()
        &push r:1        
        &gotoAndPlay      &end // of function OnCurrentFactionChanged

      &function2 onUnload () (r:1='this', r:2='_root')
        &push r:1        
        &pushone
        &push r:2        
        &dcallmp 0							// DetachFactionObserver()
        &pushsdb 1							//'OnCurrentFactionChanged'
        &delete2
        &pop
        &pushsdb 2							//'onUnload'
        &delete2
        &pop
      &end // of function onUnload

      &pushsdbgv 3							//'initialized'
      &not
      &not
      &jnz label1      
      &pushzero
      &pushsdbgv 4							//'_root'
      &pushsdb 5							//'GetCurrentFaction'
      &callMethod
      &gotoAndPlay      &pushthisgv
      &pushone
      &pushsdbgv 4							//'_root'
      &dcallmp 7							// AttachFactionObserver()
      &pushsdb 3							//'initialized'
      &pushtrue
      &setVariable
     label1:
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
  &end // of defineMovieClip 18

  &defineMovieClip 19 // total frames: 1
  &end // of defineMovieClip 19

  &defineMovieClip 20 // total frames: 1

    &placeMovieClip 3 
    
      &onClipEvent &load
        &pushs ''
        &pushbyte 7
        &pushfalse
        &setProperty
      &end
    &end // of placeMovieClip 3
  &end // of defineMovieClip 20

  &defineMovieClip 25 // total frames: 1
  &end // of defineMovieClip 25

  &defineMovieClip 26 // total frames: 1

    &placeMovieClip 3 
    
      &onClipEvent &load
        &pushs ''
        &pushbyte 7
        &pushfalse
        &setProperty
      &end
    &end // of placeMovieClip 3

    &placeMovieClip 25 
    
      &onClipEvent &load
        &pushs 'text'
        &pushs '$'
        &pushsgv '_parent'
        &toString
        &add
        &pushs ':Resource'
        &add
        &setVariable
      &end
    &end // of placeMovieClip 25
  &end // of defineMovieClip 26

  &defineMovieClip 27 // total frames: 1

    &placeMovieClip 3 
    
      &onClipEvent &load
        &pushs ''
        &pushbyte 7
        &pushfalse
        &setProperty
      &end
    &end // of placeMovieClip 3
  &end // of defineMovieClip 27
  
  &importAssets &from 'HelpBox.swf'
    'HelpBoxSite' &as 28
  &end // of importAssets

  &defineMovieClip 29 // total frames: 1

    &placeMovieClip 3 
    
      &onClipEvent &load
        &pushs ''
        &pushbyte 7
        &pushfalse
        &setProperty
      &end
    &end // of placeMovieClip 3
  &end // of defineMovieClip 29

  &defineMovieClip 30 // total frames: 1

    &placeMovieClip 3 
    
      &onClipEvent &load
        &pushs ''
        &pushbyte 7
        &pushfalse
        &setProperty
      &end
    &end // of placeMovieClip 3
  &end // of defineMovieClip 30

  &defineMovieClip 31 // total frames: 1

    &placeMovieClip 3 
    
      &onClipEvent &load
        &pushs ''
        &pushbyte 7
        &pushfalse
        &setProperty
      &end
    &end // of placeMovieClip 3
  &end // of defineMovieClip 31

  &defineMovieClip 32 // total frames: 1

    &placeMovieClip 3 
    
      &onClipEvent &load
        &pushs ''
        &pushbyte 7
        &pushfalse
        &setProperty
      &end
    &end // of placeMovieClip 3
  &end // of defineMovieClip 32

  &defineMovieClip 33 // total frames: 1

    &placeMovieClip 3 
    
      &onClipEvent &load
        &pushs ''
        &pushbyte 7
        &pushfalse
        &setProperty
      &end
    &end // of placeMovieClip 3
  &end // of defineMovieClip 33

  &defineMovieClip 34 // total frames: 1

    &frame 0
      &constants 'removeMovieClip', 'LoadMovieStage', 'attachMovie', 'AddStage', 'RemoveStage', 'onUnload', 'initialized', 'FSCommand:', 'this', ':OnInitialized', ''  
      &function2 AddStage (r:4='idArg') (r:1='this')
        &push r:4        
        &toNumber
        &setRegister r:3
        &pop
        &push r:1        
        &push r:3        
        &toString
        &getMember
        &setRegister r:2
        &pop
        &push r:2        
        &pushundef
        &equals
        &not
        &not
        &jnz label1        
        &pushzero
        &push r:2        
        &dcallmp 0							// removeMovieClip()
       label1:
        &push r:3        
        &push r:3        
        &toString
        &pushsdb 1							//'LoadMovieStage'
        &pushbyte 3
        &push r:1        
        &pushsdb 2							//'attachMovie'
        &callMethod
        &setRegister r:2
        &pop
        &push r:2        
        &toString
        &return
      &end // of function AddStage

      &function2 RemoveStage (r:4='idArg') (r:1='this')
        &push r:4        
        &toNumber
        &setRegister r:3
        &pop
        &push r:1        
        &push r:3        
        &toString
        &getMember
        &setRegister r:2
        &pop
        &pushzero
        &push r:2        
        &dcallmp 0							// removeMovieClip()
      &end // of function RemoveStage

      &function onUnload (      )      
        &pushsdb 3							//'AddStage'
        &delete2
        &pop
        &pushsdb 4							//'RemoveStage'
        &delete2
        &pop
        &pushsdb 5							//'onUnload'
        &delete2
        &pop
      &end // of function onUnload

      &pushsdbgv 6							//'initialized'
      &not
      &not
      &jnz label2      
      &pushsdb 6							//'initialized'
      &pushtrue
      &setVariable
      &pushsdb 7							//'FSCommand:'
      &pushthisgv
      &toString
      &pushsdb 9							//':OnInitialized'
      &add
      &concat
      &pushsdb 10							//''
      &getURL2
     label2:
      &stop
    &end // of frame 0
  &end // of defineMovieClip 34

  &defineMovieClip 35 // total frames: 1

    &frame 0
      &constants 'energyMeter', 'helpSite', 'energyMeterHelpSite', 'OnContentLoaded', 'onUnload', 'initialized', 'GadgetFlashStage.swf', 'gadgetFlashStage', 'loadMovie', 'GadgetInputShieldStage.swf', 'gadgetInputShieldStage', 'HelpBox.swf', 'helpBox', 'TacticalHUDObjectiveIndicatorStage.swf', 'objectiveIndicatorStage', 'TacticalHUDPlayerPowersBar.swf', 'playerPowersBar', 'HUDTickerPanel.swf', 'ticker', 'TacticalHUDCommonCommandBar.swf', 'commonCommandBar', 'TacticalHUDSpecialPowerTimers.swf', 'specialPowerTimerDisplay', 'TacticalHUDTelestratorControlPanel.swf', 'telestratorControl', 'TacticalHUDObserverControlPanel.swf', 'observerControl', 'HUDVoiceChatControlPanel.swf', 'voiceChatControl', 'TacticalHUDCommandModeBar.swf', 'commandModeBar', 'TacticalHUDEnergyMeter.swf', 'TacticalHUDRadar.swf', 'radar', 'TacticalHUDMainCommandBar.swf', 'mainCommandBar', 'TacticalHUDSelectionDetails.swf', 'selectionDetails'  
      &function2 OnContentLoaded (r:1='clip') ()
        &push r:1        
        &pushsdbgv 0							//'energyMeter'
        &equals
        &not
        &jnz label1        
        &pushsdbgv 0							//'energyMeter'
        &pushsdb 1							//'helpSite'
        &pushsdbgv 2							//'energyMeterHelpSite'
        &setMember
       label1:
      &end // of function OnContentLoaded

      &function onUnload (      )      
        &pushsdb 3							//'OnContentLoaded'
        &delete2
        &pop
        &pushsdb 4							//'onUnload'
        &delete2
        &pop
      &end // of function onUnload

      &pushsdbgv 5							//'initialized'
      &not
      &not
      &jnz label2      
      &pushsdb 6							//'GadgetFlashStage.swf'
      &pushone
      &pushsdbgv 7							//'gadgetFlashStage'
      &dcallmp 8							// loadMovie()
      &pushsdb 9							//'GadgetInputShieldStage.swf'
      &pushone
      &pushsdbgv 10							//'gadgetInputShieldStage'
      &dcallmp 8							// loadMovie()
      &pushsdb 11							//'HelpBox.swf'
      &pushone
      &pushsdbgv 12							//'helpBox'
      &dcallmp 8							// loadMovie()
      &pushsdb 13							//'TacticalHUDObjectiveIndicatorStage.swf'
      &pushone
      &pushsdbgv 14							//'objectiveIndicatorStage'
      &dcallmp 8							// loadMovie()
      &pushsdb 15							//'TacticalHUDPlayerPowersBar.swf'
      &pushone
      &pushsdbgv 16							//'playerPowersBar'
      &dcallmp 8							// loadMovie()
      &pushsdb 17							//'HUDTickerPanel.swf'
      &pushone
      &pushsdbgv 18							//'ticker'
      &dcallmp 8							// loadMovie()
      &pushsdb 19							//'TacticalHUDCommonCommandBar.swf'
      &pushone
      &pushsdbgv 20							//'commonCommandBar'
      &dcallmp 8							// loadMovie()
      &pushsdb 21							//'TacticalHUDSpecialPowerTimers.swf'
      &pushone
      &pushsdbgv 22							//'specialPowerTimerDisplay'
      &dcallmp 8							// loadMovie()
      &pushsdb 23							//'TacticalHUDTelestratorControlPanel.swf'
      &pushone
      &pushsdbgv 24							//'telestratorControl'
      &dcallmp 8							// loadMovie()
      &pushsdb 25							//'TacticalHUDObserverControlPanel.swf'
      &pushone
      &pushsdbgv 26							//'observerControl'
      &dcallmp 8							// loadMovie()
      &pushsdb 27							//'HUDVoiceChatControlPanel.swf'
      &pushone
      &pushsdbgv 28							//'voiceChatControl'
      &dcallmp 8							// loadMovie()
      &pushsdb 29							//'TacticalHUDCommandModeBar.swf'
      &pushone
      &pushsdbgv 30							//'commandModeBar'
      &dcallmp 8							// loadMovie()
      &pushsdb 31							//'TacticalHUDEnergyMeter.swf'
      &pushone
      &pushsdbgv 0							//'energyMeter'
      &dcallmp 8							// loadMovie()
      &pushsdb 32							//'TacticalHUDRadar.swf'
      &pushone
      &pushsdbgv 33							//'radar'
      &dcallmp 8							// loadMovie()
      &pushsdb 34							//'TacticalHUDMainCommandBar.swf'
      &pushone
      &pushsdbgv 35							//'mainCommandBar'
      &dcallmp 8							// loadMovie()
      &pushsdb 36							//'TacticalHUDSelectionDetails.swf'
      &pushone
      &pushsdbgv 37							//'selectionDetails'
      &dcallmp 8							// loadMovie()
      &pushsdb 5							//'initialized'
      &pushtrue
      &setVariable
     label2:
      &stop
    &end // of frame 0

    &placeMovieClip 28 &as 'energyMeterHelpSite'
    
      &onClipEvent &construct
        &pushs 'vertAlignment'
        &pushssv 'top'
        &pushs 'horzAlignment'
        &pushssv 'right'
      &end
    &end // of placeMovieClip 28
  &end // of defineMovieClip 35

  &defineMovieClip 36 // total frames: 1
  &end // of defineMovieClip 36

  &defineMovieClip 37 // total frames: 33

    &frame 0
      &constants 'initialized', 'content', '_visible', '_parent', 'letterBoxVisible'  
      &pushsdbgv 0							//'initialized'
      &not
      &not
      &jnz label2      
      &pushsdbgv 1							//'content'
      &pushsdb 2							//'_visible'
      &pushfalse
      &setMember
      &pushsdbgv 3							//'_parent'
      &pushsdbgm 4							//'letterBoxVisible'
      &not
      &jnz label1      
      &gotoLabel '_fadeIn'
      &play
     label1:
      &pushsdb 0							//'initialized'
      &pushtrue
      &setVariable
     label2:
    &end // of frame 0

    &frame 0
      &pushsgv 'content'
      &pushs '_visible'
      &pushfalse
      &setMember
    &end // of frame 0

    &frame 1
      &stop
    &end // of frame 1

    &frame 2
      &pushsgv 'content'
      &pushs '_visible'
      &pushtrue
      &setMember
    &end // of frame 2

    &frame 21
      &stop
    &end // of frame 21

    &frame 32
      &gotoLabel '_hide'
      &play
    &end // of frame 32
  &end // of defineMovieClip 37

  &defineMovieClip 38 // total frames: 1

    &frame 0
      &constants '', 'Raise', 'Lower', 'onUnload', 'initialized', 'intialized', 'FSCommand:', 'this', ':OnInitialized'  
      &function Raise (      )      
        &pushsdb 0							//''
        &pushbyte 7
        &pushtrue
        &setProperty
      &end // of function Raise

      &function Lower (      )      
        &pushsdb 0							//''
        &pushbyte 7
        &pushfalse
        &setProperty
      &end // of function Lower

      &function onUnload (      )      
        &pushsdb 1							//'Raise'
        &delete2
        &pop
        &pushsdb 2							//'Lower'
        &delete2
        &pop
        &pushsdb 3							//'onUnload'
        &delete2
        &pop
      &end // of function onUnload

      &pushsdbgv 4							//'initialized'
      &not
      &not
      &jnz label1      
      &pushsdb 0							//''
      &pushbyte 7
      &pushfalse
      &setProperty
      &pushsdb 5							//'intialized'
      &pushtrue
      &setVariable
      &pushsdb 6							//'FSCommand:'
      &pushthisgv
      &toString
      &pushsdb 8							//':OnInitialized'
      &add
      &concat
      &pushsdb 0							//''
      &getURL2
     label1:
      &stop
    &end // of frame 0

    &placeMovieClip 3 
    
      &onClipEvent &load
        &pushs ''
        &pushbyte 7
        &pushfalse
        &setProperty
      &end
    &end // of placeMovieClip 3
  &end // of defineMovieClip 38
  
  &importAssets &from 'libHUD.swf'
    'LoadMovieStage' &as 39
  &end // of importAssets
  
  &importAssets &from 'libHUD.swf'
    'SimpleRenderingSurfaceContentPlaceholder' &as 40
  &end // of importAssets

  &defineMovieClip 41 // total frames: 1

    &frame 0
      &constants 'x', 'site', '_x', 'y', '_y', '_parent', 'localToGlobal', 'globalToLocal', '', 'onEnterFrame', 'TrackSite', 'baseLeft', 'baseBottom', 'SetSubtitlePanel', 'OnSubtitlePanelSiteSet', 'OnSubtitlePanelSiteCleared', 'onUnload', 'initialized', 'this', '_root'  
      &function2 TrackSite () (r:1='this')
        &pushsdb 0							//'x'
        &pushsdbgv 1							//'site'
        &pushsdbgm 2							//'_x'
        &pushsdb 3							//'y'
        &pushsdbgv 1							//'site'
        &pushsdbgm 4							//'_y'
        &pushbyte 2
        &initObject
        &setRegister r:2
        &pop
        &push r:2        
        &pushone
        &pushsdbgv 1							//'site'
        &pushsdbgm 5							//'_parent'
        &dcallmp 6							// localToGlobal()
        &push r:2        
        &pushone
        &push r:1        
        &dcallmp 7							// globalToLocal()
        &pushsdb 8							//''
        &pushzero
        &push r:2        
        &pushsdbgm 0							//'x'
        &setProperty
        &pushsdb 8							//''
        &pushone
        &push r:2        
        &pushsdbgm 3							//'y'
        &pushsdb 8							//''
        &pushbyte 9
        &getProperty
        &subtract
        &setProperty
      &end // of function TrackSite

      &function2 OnSubtitlePanelSiteSet (r:1='panelSite') ()
        &pushsdb 1							//'site'
        &push r:1        
        &setVariable
        &pushsdb 9							//'onEnterFrame'
        &function  (        )        
          &pushzero
          &dcallfp 10							// TrackSite()
        &end // of function 

        &setVariable
        &pushzero
        &dcallfp 10							// TrackSite()
      &end // of function OnSubtitlePanelSiteSet

      &function OnSubtitlePanelSiteCleared (      )      
        &pushsdb 9							//'onEnterFrame'
        &delete2
        &pop
        &pushsdb 1							//'site'
        &pushnull
        &setVariable
        &pushsdb 8							//''
        &pushzero
        &pushsdbgv 11							//'baseLeft'
        &setProperty
        &pushsdb 8							//''
        &pushone
        &pushsdbgv 12							//'baseBottom'
        &pushsdb 8							//''
        &pushbyte 9
        &getProperty
        &subtract
        &setProperty
      &end // of function OnSubtitlePanelSiteCleared

      &function2 onUnload () (r:1='_root')
        &pushnull
        &pushone
        &push r:1        
        &dcallmp 13							// SetSubtitlePanel()
        &pushsdb 10							//'TrackSite'
        &delete2
        &pop
        &pushsdb 14							//'OnSubtitlePanelSiteSet'
        &delete2
        &pop
        &pushsdb 15							//'OnSubtitlePanelSiteCleared'
        &delete2
        &pop
        &pushsdb 9							//'onEnterFrame'
        &delete2
        &pop
        &pushsdb 16							//'onUnload'
        &delete2
        &pop
      &end // of function onUnload

      &pushsdbgv 17							//'initialized'
      &not
      &not
      &jnz label1      
      &pushsdb 1							//'site'
      &pushnull
      &setVariable
      &pushsdb 11							//'baseLeft'
      &pushsdb 8							//''
      &pushzero
      &getProperty
      &setVariable
      &pushsdb 12							//'baseBottom'
      &pushsdb 8							//''
      &pushone
      &getProperty
      &pushsdb 8							//''
      &pushbyte 9
      &getProperty
      &add
      &setVariable
      &pushthisgv
      &pushone
      &pushsdbgv 19							//'_root'
      &dcallmp 13							// SetSubtitlePanel()
      &pushsdb 17							//'initialized'
      &pushtrue
      &setVariable
     label1:
      &stop
    &end // of frame 0

    &placeMovieClip 40 
    
      &onClipEvent &construct
        &pushs '_type'
        &pushssv ''
      &end
    
      &onClipEvent &load
        &pushs '_type'
        &pushsgv '_parent'
        &toString
        &pushs ':Render'
        &add
        &setVariable
      &end
    &end // of placeMovieClip 40
  &end // of defineMovieClip 41

  &frame 1
    &play
  &end // of frame 1

  &frame 7
    &pushs 'FSCommand:'
    &pushthisgv
    &toString
    &pushs ':OnFadeInComplete'
    &add
    &concat
    &pushs ''
    &getURL2
  &end // of frame 7

  &frame 13
    &stop
  &end // of frame 13

  &frame 14
    &play
  &end // of frame 14

  &frame 20
    &constants 'hideMainCount', 'main', '_visible', 'FSCommand:', 'this', ':OnFadeOutComplete', ''  
    &pushsdbgv 0							//'hideMainCount'
    &pushundef
    &equals
    &not
    &dup
    &not
    &jnz label1    
    &pop
    &pushsdbgv 0							//'hideMainCount'
    &pushsdb 0							//'hideMainCount'
    &pushsdbgv 0							//'hideMainCount'
    &increment
    &setVariable
    &pushzero
    &equals
   label1:
    &not
    &jnz label2    
    &pushsdbgv 1							//'main'
    &pushsdb 2							//'_visible'
    &pushfalse
    &setMember
   label2:
    &stop
    &pushsdb 3							//'FSCommand:'
    &pushthisgv
    &toString
    &pushsdb 5							//':OnFadeOutComplete'
    &add
    &concat
    &pushsdb 6							//''
    &getURL2
  &end // of frame 20
&end
