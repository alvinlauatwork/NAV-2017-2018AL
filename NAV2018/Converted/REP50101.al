report 50101 "Snooker Match"
{
    // version Snooker

    DefaultLayout = RDLC;
    RDLCLayout = './Snooker Match.rdlc';

    dataset
    {
        dataitem(DataItem1000000000;Table50102)
        {
            column(No;"Snooker Match"."No.")
            {
            }
            column(Date;"Snooker Match".Date)
            {
            }
            column(Time;"Snooker Match".Time)
            {
            }
            column(Status;"Snooker Match".Status)
            {
            }
            column(BestOfFrames;"Snooker Match"."Best of Frames")
            {
            }
            column(Player1FullName;"Snooker Match"."Snooker Player 1 Full Name")
            {
            }
            column(Player2FullName;"Snooker Match"."Snooker Player 2 Full Name")
            {
            }
            column(WinnerFullName;"Snooker Match"."Winner Full Name")
            {
            }
            dataitem(DataItem1000000009;Table50101)
            {
                DataItemLink = Snooker Match No.=FIELD(No.);
                column(FrameStatus;"Snooker Frame".Status)
                {
                }
                column(FramePlayer1TotalScore;"Snooker Frame"."Snooker Player 1 Total Score")
                {
                }
                column(FramePlayer2TotalScore;"Snooker Frame"."Snooker Player 2 Total Score")
                {
                }
                column(FramePlayer1MaxBreak;"Snooker Frame"."Snooker Player 1 Max. Break")
                {
                }
                column(FramePlayer2MaxBreak;"Snooker Frame"."Snooker Player 2 Max. Break")
                {
                }
                column(FrameWinnerFullName;"Snooker Frame"."Winner Full Name")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
            }
        }

        actions
        {
        }
    }

    labels
    {
    }
}

