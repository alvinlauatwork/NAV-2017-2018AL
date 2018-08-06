table 50101 "Snooker Frame"
{
    // version Snooker

    DrillDownPageID = 50104;
    LookupPageID = 50103;

    fields
    {
        field(1;"Snooker Match No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Snooker Match";
        }
        field(2;"No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Snooker Player 1 No.";Code[20])
        {
            CalcFormula = Lookup("Snooker Match"."Snooker Player 1 No." WHERE (No.=FIELD(Snooker Match No.)));
            FieldClass = FlowField;
            TableRelation = "Snooker Player";
        }
        field(5;"Snooker Player 2 No.";Code[20])
        {
            CalcFormula = Lookup("Snooker Match"."Snooker Player 2 No." WHERE (No.=FIELD(Snooker Match No.)));
            FieldClass = FlowField;
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
        field(8;"Snooker Player 1 Total Score";Integer)
        {
            CalcFormula = Sum("Snooker Frame Score".Score WHERE (Snooker Match No.=FIELD(Snooker Match No.),
                                                                 Snooker Frame No.=FIELD(No.),
                                                                 Snooker Player No.=FIELD(Snooker Player 1 No.)));
            FieldClass = FlowField;
        }
        field(9;"Snooker Player 2 Total Score";Integer)
        {
            CalcFormula = Sum("Snooker Frame Score".Score WHERE (Snooker Match No.=FIELD(Snooker Match No.),
                                                                 Snooker Frame No.=FIELD(No.),
                                                                 Snooker Player No.=FIELD(Snooker Player 2 No.)));
            FieldClass = FlowField;
        }
        field(10;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Closed;
        }
        field(11;"Winner No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Snooker Player".No.;

            trigger OnLookup();
            var
                SnookerPlayerList : Page "50105";
                SnookerPlayer : Record "50103";
            begin
                /*
                3 times fout and a miss can lose a frame, let it be a input
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
        field(12;"Winner Full Name";Text[100])
        {
            CalcFormula = Lookup(Contact.Name WHERE (No.=FIELD(Winner No.)));
            FieldClass = FlowField;
        }
        field(13;"Snooker Player 1 Max. Break";Integer)
        {
            CalcFormula = Max("Snooker Frame Score".Score WHERE (Snooker Match No.=FIELD(Snooker Match No.),
                                                                 Snooker Frame No.=FIELD(No.),
                                                                 Snooker Player No.=FIELD(Snooker Player 1 No.)));
            FieldClass = FlowField;
        }
        field(14;"Snooker Player 2 Max. Break";Integer)
        {
            CalcFormula = Max("Snooker Frame Score".Score WHERE (Snooker Match No.=FIELD(Snooker Match No.),
                                                                 Snooker Frame No.=FIELD(No.),
                                                                 Snooker Player No.=FIELD(Snooker Player 2 No.)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Snooker Match No.","No.")
        {
        }
    }

    fieldgroups
    {
    }
}

