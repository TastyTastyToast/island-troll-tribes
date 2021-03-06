
//===========================================================================
//TESH.scrollpos=6
//TESH.alwaysfold=0
function Trig_blow_gun_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A021'
endfunction

function Trig_blow_gun_Actions takes nothing returns nothing
local integer i = 0
local unit u = GetSpellAbilityUnit()
local unit t = GetSpellTargetUnit()
    loop
        exitwhen i > 5
        if GetItemTypeId(UnitItemInSlot(u, i)) == ITEM_THISTLES then
            call SetItemCharges( UnitItemInSlot(u, i), GetItemCharges(UnitItemInSlot(u, i)) - 1 )
            if GetItemCharges(UnitItemInSlot(u, i)) == 0 then
                call RemoveItem( UnitItemInSlot(u, i) )
            endif
            call masterCastAtCaster(u,t,0,0,'A01K',"shadowstrike")
            set i = 6
        elseif GetItemTypeId(UnitItemInSlot(u, i)) == ITEM_DARK_THISTLES then
            call SetItemCharges( UnitItemInSlot(u, i), GetItemCharges(UnitItemInSlot(u, i)) - 1 )
            if GetItemCharges(UnitItemInSlot(u, i)) == 0 then
                call RemoveItem( UnitItemInSlot(u, i) )
            endif
            call masterCastAtCaster(u,t,0,0,'A01L',"shadowstrike")
            set i = 6
        elseif GetItemTypeId(UnitItemInSlot(u, i)) == ITEM_BONE then
            call RemoveItem( UnitItemInSlot(u, i) )
            call masterCastAtCaster(u,t,0,0,'A015',"creepthunderbolt")
            set i = 6
        endif
        set i = i + 1
    endloop
    set u = null
    set t = null
endfunction

//===========================================================================
function InitTrig_blow_gun takes nothing returns nothing
    set gg_trg_blow_gun = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_blow_gun, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_blow_gun, Condition( function Trig_blow_gun_Conditions ) )
    call TriggerAddAction( gg_trg_blow_gun, function Trig_blow_gun_Actions )
endfunction

//===========================================================================
