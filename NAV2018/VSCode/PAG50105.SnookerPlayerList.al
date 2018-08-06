page 50105 "Snooker Player List"
{
    // version Snooker

    CardPageID = "Snooker Player Card";
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Snooker Player";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field(Name;Name)
                {
                }
            }
        }
    }

    actions
    {
    }
}

