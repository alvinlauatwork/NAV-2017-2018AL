codeunit 50101 "Snooker Management"
{
    // version Snooker


    trigger OnRun();
    begin
    end;

    procedure "Create Snooker Player From Contact"(Contact : Record Contact);
    var
        SnookerPlayer : Record "Snooker Player";
    begin
        IF SnookerPlayer.GET(Contact."No.") THEN
          ERROR('Snooker player with No. %1 already exist', Contact."No.");
        IF Contact.Type<> Contact.Type::Person THEN
          ERROR('Contact must be a person.');
        SnookerPlayer.INIT;
        SnookerPlayer."No.":=Contact."No.";
        SnookerPlayer.INSERT;
        MESSAGE('Snooker player %1 is created.', SnookerPlayer."No.");
    end;
}

