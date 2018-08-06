page 50103 "Snooker Frame Listpart"
{
    // version Snooker

    Caption = 'Snooker Frames';
    CardPageID = "Snooker Frame Card";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = Table50101;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Snooker Match No.";"Snooker Match No.")
                {
                }
                field("No.";"No.")
                {
                }
                field(Status;Status)
                {
                }
                field("Winner Full Name";"Winner Full Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

