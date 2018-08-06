page 50104 "Snooker Frame Card"
{
    // version Snooker

    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Snooker Frame";

    layout
    {
        area(content)
        {
            group(General)
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
                field("Snooker Player 1 Full Name";"Snooker Player 1 Full Name")
                {
                }
                field("Snooker Player 1 Max. Break";"Snooker Player 1 Max. Break")
                {
                }
                field("Snooker Player 1 Total Score";"Snooker Player 1 Total Score")
                {
                }
                field("Snooker Player 2 Full Name";"Snooker Player 2 Full Name")
                {
                }
                field("Snooker Player 2 Max. Break";"Snooker Player 2 Max. Break")
                {
                }
                field("Snooker Player 2 Total Score";"Snooker Player 2 Total Score")
                {
                }
                field("Winner No.";"Winner No.")
                {
                }
            }
            part(SnookerFrameBreakListpart;50107)
            {
                SubPageLink = "Snooker Match No."=FIELD("Snooker Match No."),
                              "Snooker Frame No."=FIELD("No.");
                UpdatePropagation = Both;
            }
            part(SnookerFrameScoreListpart;50108)
            {
                Provider = SnookerFrameBreakListpart;
                SubPageLink = "Snooker Match No."=FIELD("Snooker Match No."),
                              "Snooker Frame No."=FIELD("Snooker Frame No."),
                              "Snooker Break No."=FIELD("Snooker Break No.");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Score Board")
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 50109;
                RunPageLink = "Snooker Match No."=FIELD("Snooker Match No."),
                              "No."=FIELD("No.");
            }
        }
    }
}

