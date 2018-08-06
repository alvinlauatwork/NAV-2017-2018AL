page 50101 "Snooker Match List"
{
    // version Snooker

    CardPageID = "Snooker Match Card";
    PageType = List;
    SourceTable = "Snooker Match";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field(Date;Date)
                {
                }
                field("Snooker Player 1 Full Name";"Snooker Player 1 Full Name")
                {
                }
                field("Snooker Player 2 Full Name";"Snooker Player 2 Full Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

