page 50106 "Snooker Player Card"
{
    // version Snooker

    PageType = Card;
    SourceTable = "Snooker Player";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                    DrillDownPageID = "Contact Card";
                    TableRelation = Contact."No." WHERE ("No."=FIELD("No."));
                }
                field(Name;Name)
                {
                }
                field("Mobile Phone No.";"Mobile Phone No.")
                {
                }
                field("E-Mail";"E-Mail")
                {
                }
            }
        }
    }

    actions
    {
    }
}

