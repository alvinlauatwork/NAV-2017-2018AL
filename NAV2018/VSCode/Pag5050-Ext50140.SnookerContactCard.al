pageextension 50140 "Snooker Contact Card" extends "Contact Card" 
{
    // <Type><BaseId>-Ext<ObjectId>.<ObjectName>.al
    // page 1234 "MyPag" extends "Customer Card"Pag21-Ext1234.MyPag.al
    // Pag5050-Ext50140.SnookerContactCard.al
    // version NAVW110.00.00.21440,Snooker

    actions
    {
        addafter(CreateAsCustomer)
        {
            action("Snooker Player")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Snooker Player';
                Image = Customer;

                trigger OnAction();
                var
                    SnookerManagement : Codeunit "Snooker Management";
                begin
                    SnookerManagement."Create Snooker Player From Contact"(Rec);
                end;
            }
        }
    }

}

