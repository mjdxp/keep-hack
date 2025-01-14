VictoryRoad2F_Script:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, VictoryRoad2Script_517c4
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	call nz, VictoryRoad2Script_517c9
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad2TrainerHeaders
	ld de, VictoryRoad2F_ScriptPointers
	ld a, [wVictoryRoad2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wVictoryRoad2FCurScript], a
	ret

VictoryRoad2Script_517c4:
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
VictoryRoad2Script_517c9:
	CheckEvent EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	jr z, .asm_517da
	push af
	ld a, $15
	lb bc, 4, 3
	call VictoryRoad2Script_517e2
	pop af
.asm_517da
	bit 7, a
	ret z
	ld a, $1d
	lb bc, 7, 11
VictoryRoad2Script_517e2:
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ret

VictoryRoad2F_ScriptPointers:
	dw VictoryRoad2Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad2Script0:
	ld hl, CoordsData_51816
	call CheckBoulderCoords
	jp nc, CheckFightingMapTrainers
	EventFlagAddress hl, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	ld a, [wCoordIndex]
	cp $2
	jr z, .asm_5180b
	CheckEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	SetEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	ret nz
	jr .asm_51810
.asm_5180b
	CheckEventAfterBranchReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	SetEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2
	ret nz
.asm_51810
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ret

CoordsData_51816:
	dbmapcoord  1, 16
	dbmapcoord  9, 16
	db -1 ; end

VictoryRoad2F_TextPointers:
	dw VictoryRoad2Text1
	dw VictoryRoad2Text2
	dw VictoryRoad2Text3
	dw VictoryRoad2Text4
	dw VictoryRoad2Text5
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw BoulderText
	dw BoulderText
	dw BoulderText
	dw DoubleEdgeGuy

VictoryRoad2TrainerHeaders:
	def_trainers
VictoryRoad2TrainerHeader0:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_0, 4, VictoryRoad2BattleText1, VictoryRoad2EndBattleText1, VictoryRoad2AfterBattleText1
VictoryRoad2TrainerHeader1:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_1, 3, VictoryRoad2BattleText2, VictoryRoad2EndBattleText2, VictoryRoad2AfterBattleText2
VictoryRoad2TrainerHeader2:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_2, 3, VictoryRoad2BattleText3, VictoryRoad2EndBattleText3, VictoryRoad2AfterBattleText3
VictoryRoad2TrainerHeader3:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_3, 1, VictoryRoad2BattleText4, VictoryRoad2EndBattleText4, VictoryRoad2AfterBattleText4
VictoryRoad2TrainerHeader4:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_4, 3, VictoryRoad2BattleText5, VictoryRoad2EndBattleText5, VictoryRoad2AfterBattleText5
	db -1 ; end

VictoryRoad2Text1:
	text_asm
	ld hl, VictoryRoad2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text2:
	text_asm
	ld hl, VictoryRoad2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text3:
	text_asm
	ld hl, VictoryRoad2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text4:
	text_asm
	ld hl, VictoryRoad2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text5:
	text_asm
	ld hl, VictoryRoad2TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2BattleText1:
	text_far _VictoryRoad2BattleText1
	text_end

VictoryRoad2EndBattleText1:
	text_far _VictoryRoad2EndBattleText1
	text_end

VictoryRoad2AfterBattleText1:
	text_far _VictoryRoad2AfterBattleText1
	text_end

VictoryRoad2BattleText2:
	text_far _VictoryRoad2BattleText2
	text_end

VictoryRoad2EndBattleText2:
	text_far _VictoryRoad2EndBattleText2
	text_end

VictoryRoad2AfterBattleText2:
	text_far _VictoryRoad2AfterBattleText2
	text_end

VictoryRoad2BattleText3:
	text_far _VictoryRoad2BattleText3
	text_end

VictoryRoad2EndBattleText3:
	text_far _VictoryRoad2EndBattleText3
	text_end

VictoryRoad2AfterBattleText3:
	text_far _VictoryRoad2AfterBattleText3
	text_end

VictoryRoad2BattleText4:
	text_far _VictoryRoad2BattleText4
	text_end

VictoryRoad2EndBattleText4:
	text_far _VictoryRoad2EndBattleText4
	text_end

VictoryRoad2AfterBattleText4:
	text_far _VictoryRoad2AfterBattleText4
	text_end

VictoryRoad2BattleText5:
	text_far _VictoryRoad2BattleText5
	text_end

VictoryRoad2EndBattleText5:
	text_far _VictoryRoad2EndBattleText5
	text_end

VictoryRoad2AfterBattleText5:
	text_far _VictoryRoad2AfterBattleText5
	text_end

; FireRed NPC
DoubleEdgeGuy:
	text_asm
	CheckEvent EVENT_GOT_TM10
	jr nz, .got_item
	ld hl, TM10PreReceiveText
	call PrintText
	
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	
	lb bc, TM_DOUBLE_EDGE, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedTM10Text
	call PrintText
	SetEvent EVENT_GOT_TM10
	jr .done
.refused
	ld hl, TM10Refused
	call PrintText
	jr .done
.bag_full
	ld hl, DoubleEdgeNoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, TM10ExplanationText
	call PrintText
.done
	jp TextScriptEnd

TM10PreReceiveText:
	text "You should be"
	line "proud of"
	cont "yourself,"
	cont "having battled"
	cont "your way through"
	cont "VICTORY ROAD so"
	cont "courageously."
	
	para "In recognition"
	line "of your feat,"
	cont "I can teach your"
	cont "#MON"
	cont "DOUBLE-EDGE."
	prompt

ReceivedTM10Text:
	text_far _ReceivedTM10Text
	sound_get_item_1
	text_end

TM10ExplanationText:
	text "Keep that drive"
	line "going for the"
	cont "#MON LEAGUE!"
	
	para "Take a run at"
	line "them and knock"
	cont "em out!"
	done

TM10Refused:
	text "I'll teach your"
	line "#MON anytime."
	done

DoubleEdgeNoRoomText:
	text_far _TMNPCNoRoomText
	text_end
