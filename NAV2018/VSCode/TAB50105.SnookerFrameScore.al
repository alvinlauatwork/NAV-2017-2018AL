table 50105 "Snooker Frame Score"
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
        field(4;"Shot No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Snooker Player No.";Code[20])
        {
            CalcFormula = Lookup("Snooker Frame Break"."Snooker Player No." WHERE ("Snooker Match No."=FIELD("Snooker Match No."),
                                                                                   "Snooker Frame No."=FIELD("Snooker Frame No."),
                                                                                   "Snooker Break No."=FIELD("Snooker Break No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;Score;Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Snooker Match No.","Snooker Frame No.","Snooker Break No.","Shot No.")
        {
        }
    }

    fieldgroups
    {
    }
    trigger OnInsert();
    var
        SnookerFrameScore : Record "Snooker Frame Score";
    begin
        IF "Shot No." =0 THEN BEGIN
          SnookerFrameScore.SETRANGE("Snooker Match No.","Snooker Match No.");
          SnookerFrameScore.SETRANGE("Snooker Frame No.","Snooker Frame No.");
          SnookerFrameScore.SETRANGE("Snooker Break No.","Snooker Break No.");
          IF SnookerFrameScore.FINDLAST() THEN
            "Shot No.":=SnookerFrameScore."Shot No."+1
          ELSE
            "Shot No.":=1;
        END;
    end;

}

