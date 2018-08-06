page 50102 "Snooker Match Card"
{
    // version Snooker

    SourceTable = "Snooker Match";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                }
                field(Date;Date)
                {
                }
                field(Time;Time)
                {
                }
                field("Best of Frames";"Best of Frames")
                {
                }
                field(Status;Status)
                {
                }
            }
            group(Players)
            {
                field("Snooker Player 1 No.";"Snooker Player 1 No.")
                {

                    trigger OnValidate();
                    begin
                        CALCFIELDS("Snooker Player 1 Full Name");
                        CurrPage.UPDATE();
                    end;
                }
                field("Snooker Player 1 Full Name";"Snooker Player 1 Full Name")
                {
                }
                field("Snooker Player 1 Frame Won";"Snooker Player 1 Frame Won")
                {
                }
                field("Snooker Player 2 No.";"Snooker Player 2 No.")
                {

                    trigger OnValidate();
                    begin
                        CALCFIELDS("Snooker Player 2 Full Name");
                        CurrPage.UPDATE();
                    end;
                }
                field("Snooker Player 2 Full Name";"Snooker Player 2 Full Name")
                {
                }
                field("Snooker Player 2 Frames Won";"Snooker Player 2 Frames Won")
                {
                }
            }
            part(SnookerFrameListpart;50103)
            {
                SubPageLink = "Snooker Match No."=FIELD("No.");
            }
        }
    }

    actions
    {
    }
}

