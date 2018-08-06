page 50109 "Snooker Frame Control Card"
{
    // version Snooker

    PageType = Card;
    SourceTable = "Snooker Frame";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Snooker Match No."; "Snooker Match No.")
                {
                }
                field("No."; "No.")
                {
                }
                field("Snooker Player 1 No."; "Snooker Player 1 No.")
                {
                }
                field("Snooker Player 2 No."; "Snooker Player 2 No.")
                {
                }
            }
            group(SnookerBoard)
            {
                usercontrol(SnookerFrameControl; SnookerControlAddIn)
                {
                    // see https://community.dynamics.com/nav/b/dynamicsnavcloudfronts/archive/2018/02/09/creating-a-control-add-in-using-javascript-and-calling-it-in-al
                    trigger ControlAddInReady()
                    begin
                        UpdateClientScreen();
                    end;

                    trigger RequestUpdate()
                    begin
                        UpdateClientScreen();
                    end;

                    trigger Score(playerNo: Text; score: Integer; isNewBreak: Boolean)
                    var
                        SnookerFrameBreak: Record "Snooker Frame Break";
                        LastSnookerFrameBreak: Record "Snooker Frame Break";
                        BreakNo: Integer;
                        SnookerFrameScore: Record "Snooker Frame Score";
                        ShotNo: Integer;
                    begin
                        LastSnookerFrameBreak.SETRANGE("Snooker Match No.", Rec."Snooker Match No.");
                        LastSnookerFrameBreak.SETRANGE("Snooker Frame No.", Rec."No.");
                        IF LastSnookerFrameBreak.FINDLAST THEN BEGIN
                            BreakNo := LastSnookerFrameBreak."Snooker Break No.";
                        END ELSE BEGIN
                            BreakNo := 0;
                        END;


                        IF isNewBreak THEN BEGIN
                            BreakNo := BreakNo + 1;
                            SnookerFrameBreak.INIT;
                            SnookerFrameBreak."Snooker Match No." := Rec."Snooker Match No.";
                            SnookerFrameBreak."Snooker Frame No." := Rec."No.";
                            SnookerFrameBreak."Snooker Break No." := BreakNo;
                            SnookerFrameBreak."Snooker Player No." := playerNo;
                            SnookerFrameBreak.INSERT;
                        END ELSE BEGIN
                            SnookerFrameBreak.SETRANGE("Snooker Match No.", Rec."Snooker Match No.");
                            SnookerFrameBreak.SETRANGE("Snooker Frame No.", Rec."No.");
                            SnookerFrameBreak.SETRANGE("Snooker Break No.", BreakNo);
                            SnookerFrameBreak.FINDLAST;
                        END;

                        SnookerFrameScore.SETRANGE("Snooker Match No.", SnookerFrameBreak."Snooker Match No.");
                        SnookerFrameScore.SETRANGE("Snooker Frame No.", SnookerFrameBreak."Snooker Frame No.");
                        SnookerFrameScore.SETRANGE("Snooker Break No.", SnookerFrameBreak."Snooker Break No.");
                        IF SnookerFrameScore.FINDLAST THEN BEGIN
                            ShotNo := SnookerFrameScore."Shot No." + 1;
                        END ELSE BEGIN
                            ShotNo := 1;
                        END;


                        /**
                        handling of fout (player1)
                        1) player1 score 0
                        2) player1 new Break with +ve score with mininal of 4
                        **/
                        SnookerFrameScore.INIT;
                        SnookerFrameScore."Snooker Match No." := SnookerFrameBreak."Snooker Match No.";
                        SnookerFrameScore."Snooker Frame No." := SnookerFrameBreak."Snooker Frame No.";
                        SnookerFrameScore."Snooker Break No." := SnookerFrameBreak."Snooker Break No.";
                        SnookerFrameScore."Shot No." := ShotNo;
                        IF score >= 0 THEN
                            SnookerFrameScore.Score := score
                        ELSE
                            SnookerFrameScore.Score := 0;
                        SnookerFrameScore."Snooker Player No." := SnookerFrameBreak."Snooker Player No.";
                        SnookerFrameScore.INSERT;

                        IF score < 0 THEN BEGIN
                            SnookerFrameBreak.INIT;
                            SnookerFrameBreak."Snooker Match No." := Rec."Snooker Match No.";
                            SnookerFrameBreak."Snooker Frame No." := Rec."No.";
                            SnookerFrameBreak."Snooker Break No." := BreakNo + 1;
                            CALCFIELDS("Snooker Player 1 No.", "Snooker Player 2 No.");
                            IF "Snooker Player 1 No." = playerNo THEN
                                SnookerFrameBreak."Snooker Player No." := "Snooker Player 2 No."
                            ELSE
                                SnookerFrameBreak."Snooker Player No." := "Snooker Player 1 No.";
                            SnookerFrameBreak.INSERT;

                            SnookerFrameScore.INIT;
                            SnookerFrameScore."Snooker Match No." := SnookerFrameBreak."Snooker Match No.";
                            SnookerFrameScore."Snooker Frame No." := SnookerFrameBreak."Snooker Frame No.";
                            SnookerFrameScore."Snooker Break No." := SnookerFrameBreak."Snooker Break No.";
                            SnookerFrameScore."Shot No." := ShotNo;
                            IF score > -4 THEN
                                SnookerFrameScore.Score := 4
                            ELSE
                                SnookerFrameScore.Score := score * -1;
                            SnookerFrameScore."Snooker Player No." := SnookerFrameBreak."Snooker Player No.";
                            SnookerFrameScore.INSERT;
                        END;
                        UpdateClientScreen;

                    end;
                }
            }
        }
    }

    actions
    {
    }

    ///
    /// Helper procedure to update data to client
    ///
    local procedure UpdateClientScreen();
    begin
        /*AL: name of this field cannot contains space. see https://stackoverflow.com/questions/35371418/nav-javascript-addin-methods-not-working
        */
        CALCFIELDS("Snooker Player 1 No.", "Snooker Player 1 Full Name", "Snooker Player 1 Max. Break", "Snooker Player 1 Total Score");
        CALCFIELDS("Snooker Player 2 No.", "Snooker Player 2 Full Name", "Snooker Player 2 Max. Break", "Snooker Player 2 Total Score");

        //MESSAGE('%1 (%2) - %3 (%4)',"Snooker Player 1 Full Name","Snooker Player 1 Total Score","Snooker Player 2 Full Name","Snooker Player 2 Total Score");
        CurrPage.SnookerFrameControl.UpdateScreen(Rec."Snooker Player 1 No.", Rec."Snooker Player 1 Full Name", Rec."Snooker Player 1 Total Score",
          Rec."Snooker Player 2 No.", Rec."Snooker Player 2 Full Name", Rec."Snooker Player 2 Total Score");

    end;
}
