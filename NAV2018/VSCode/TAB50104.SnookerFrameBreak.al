table 50104 "Snooker Frame Break"
{
    // version Snooker


    fields
    {
        field(1;"Snooker Match No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Snooker Match";
        }
        field(2;"Snooker Frame No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Snooker Break No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Snooker Player 1 No.";Code[20])
        {
            CalcFormula = Lookup("Snooker Match"."Snooker Player 1 No." WHERE ("No."=FIELD("Snooker Match No.")));
            FieldClass = FlowField;
            TableRelation = "Snooker Player";
        }
        field(7;"Snooker Player 2 No.";Code[20])
        {
            CalcFormula = Lookup("Snooker Match"."Snooker Player 2 No." WHERE ("No."=FIELD("Snooker Match No.")));
            FieldClass = FlowField;
            TableRelation = "Snooker Player";
        }
        field(50;"Snooker Player 1 Full Name";Text[100])
        {
            CalcFormula = Lookup("Snooker Player".Name WHERE ("No."=FIELD("Snooker Player 1 No.")));
            FieldClass = FlowField;
        }
        field(51;"Snooker Player 2 Full Name";Text[100])
        {
            CalcFormula = Lookup("Snooker Player".Name WHERE ("No."=FIELD("Snooker Player 2 No.")));
            FieldClass = FlowField;
        }
        field(52;"Snooker Player No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Snooker Player"."No.";
            trigger OnLookup();
            var
                SnookerPlayerList : Page "Snooker Player List";
                SnookerPlayer : Record "Snooker Player";
            begin
                CALCFIELDS("Snooker Player 1 No.","Snooker Player 2 No.");
                SnookerPlayer.SETFILTER("No.", '%1|%2',"Snooker Player 1 No.","Snooker Player 2 No.");
                SnookerPlayerList.SETTABLEVIEW(SnookerPlayer);
                SnookerPlayerList.LOOKUPMODE(TRUE);
                IF SnookerPlayerList.RUNMODAL() = ACTION::LookupOK THEN BEGIN
                  SnookerPlayerList.GETRECORD(SnookerPlayer);
                  "Snooker Player No.":=SnookerPlayer."No.";
                END;
            end;

        }
        field(53;"Total Score";Integer)
        {
            CalcFormula = Sum("Snooker Frame Score".Score WHERE ("Snooker Match No."=FIELD("Snooker Match No."),
                                                                 "Snooker Frame No."=FIELD("Snooker Frame No."),
                                                                 "Snooker Break No."=FIELD(UPPERLIMIT("Snooker Break No."))));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Snooker Match No.","Snooker Frame No.","Snooker Break No.")
        {
        }
    }

    fieldgroups
    {
    }
    trigger OnInsert();
    var
        SnookerFrameBreak : Record "Snooker Frame Break";
    begin
        IF "Snooker Break No." =0 THEN BEGIN
          SnookerFrameBreak.SETRANGE("Snooker Match No.","Snooker Match No.");
          SnookerFrameBreak.SETRANGE("Snooker Frame No.","Snooker Frame No.");

          IF SnookerFrameBreak.FINDLAST() THEN
            "Snooker Break No.":=SnookerFrameBreak."Snooker Break No."+1
          ELSE
            "Snooker Break No.":=1;
        END;
    end;

}

