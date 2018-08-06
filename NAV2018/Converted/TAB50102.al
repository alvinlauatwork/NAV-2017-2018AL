table 50102 "Snooker Match"
{
    // version Snooker

    DrillDownPageID = 50002;
    LookupPageID = 50001;

    fields
    {
        field(1;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Time;Time)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Snooker Player 1 No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Snooker Player";
        }
        field(5;"Snooker Player 2 No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Snooker Player";
        }
        field(6;"Snooker Player 1 Full Name";Text[100])
        {
            CalcFormula = Lookup(Contact.Name WHERE (No.=FIELD(Snooker Player 1 No.)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;"Snooker Player 2 Full Name";Text[100])
        {
            CalcFormula = Lookup(Contact.Name WHERE (No.=FIELD(Snooker Player 2 No.)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Best of Frames";Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            var
                SnookerFrame : Record "50101";
                i : Integer;
                currentCount : Integer;
            begin
                IF xRec."Best of Frames" <> Rec."Best of Frames" THEN
                  IF NOT CONFIRM(TxtConfirmChangeFrames,TRUE,xRec."Best of Frames", Rec."Best of Frames") THEN
                    ERROR('Process stopped');

                SnookerFrame.SETRANGE("Snooker Match No.","No.");
                currentCount := SnookerFrame.COUNT;

                IF SnookerFrame.FINDLAST THEN
                  lastFrameNo:=SnookerFrame."No."
                ELSE
                  lastFrameNo:=0;

                IF currentCount < Rec."Best of Frames" THEN BEGIN
                  // add frames
                  FOR i:=1 TO Rec."Best of Frames" - currentCount DO
                  BEGIN
                    SnookerFrame.INIT;
                    SnookerFrame."Snooker Match No." :="No.";
                    SnookerFrame."No.":=lastFrameNo+1;
                    SnookerFrame.INSERT;
                    lastFrameNo+=1;
                  END;

                END ELSE IF currentCount > Rec."Best of Frames" THEN BEGIN
                  // del frames
                  SnookerFrame.SETRANGE("Snooker Match No.");
                  SnookerFrame.SETCURRENTKEY("Snooker Match No." ,"No." );
                  SnookerFrame.SETASCENDING("No.",FALSE);
                  FOR i:=1 TO currentCount - Rec."Best of Frames"  DO
                  BEGIN
                    SnookerFrame.DELETE();
                    SnookerFrame.NEXT;
                  END;
                END ELSE BEGIN
                  // no change, do nothing
                END;
            end;
        }
        field(9;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Planned,WIP,Closed;
        }
        field(10;"Snooker Player 1 Frame Won";Integer)
        {
            CalcFormula = Count("Snooker Frame" WHERE (Status=CONST(Closed),
                                                       Winner No.=FIELD(Snooker Player 1 No.),
                                                       Snooker Match No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(11;"Snooker Player 2 Frames Won";Integer)
        {
            CalcFormula = Count("Snooker Frame" WHERE (Status=CONST(Closed),
                                                       Winner No.=FIELD(Snooker Player 2 No.),
                                                       Snooker Match No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(13;"Winner No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Snooker Player".No.;

            trigger OnLookup();
            var
                SnookerPlayerList : Page "50105";
                SnookerPlayer : Record "50103";
            begin
                /*
                Given that 3 times fout and a miss can lose a frame, let it be a input
                */
                CALCFIELDS("Snooker Player 1 No.","Snooker Player 2 No.");
                SnookerPlayer.SETFILTER("No.", '%1|%2',"Snooker Player 1 No.","Snooker Player 2 No.");
                SnookerPlayerList.SETTABLEVIEW(SnookerPlayer);
                SnookerPlayerList.LOOKUPMODE(TRUE);
                IF SnookerPlayerList.RUNMODAL() = ACTION::LookupOK THEN BEGIN
                  SnookerPlayerList.GETRECORD(SnookerPlayer);
                  "Winner No.":=SnookerPlayer."No.";
                END;

            end;
        }
        field(14;"Winner Full Name";Text[100])
        {
            CalcFormula = Lookup(Contact.Name WHERE (No.=FIELD(Winner No.)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        TxtConfirmChangeFrames : Label 'Are you sure you want to change the number of frame from %1 to %2?';
        lastFrameNo : Integer;
}

