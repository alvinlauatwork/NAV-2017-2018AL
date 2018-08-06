pageextension 70000001 pageextension70000001 extends "Contact Card" 
{
    // version NAVW110.00.00.21440,Snooker

    actions
    {
        addafter("Action 108")
        {
            action("Snooker Player")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Snooker Player';
                Image = Customer;

                trigger OnAction();
                var
                    SnookerManagement : Codeunit "50101";
                begin
                    SnookerManagement."Create Snooker Player From Contact"(Rec);
                end;
            }
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

