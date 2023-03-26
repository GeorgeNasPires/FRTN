
using { /Verse.org/Simulation }
using { /Fortnite.com/Devices }

# A Verse-authored creative device that can be placed in a level
SpawnConsumable := class<concrete>(creative_device):
#SpawnItem<public>()<varies><transacts><no_rollback>:void
    # Runs when the device is started in a running game

    ###Random Spawn On Press Button###
    @editable
    Button:button_device = button_device{}
    @editable
    ItemSpawner:item_spawner_device = item_spawner_device{}
    ###################################


    OnBegin<override>()<suspends>:void=
        #Assign button event to interact with item spawner
        Button.InteractedWithEvent.Subscribe(OnButtonInteractedWith) 

 
    OnButtonInteractedWith(Agent : agent) : void=
        ItemSpawner.CycleToNextItem()