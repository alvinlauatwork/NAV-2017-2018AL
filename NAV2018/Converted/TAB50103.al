table 50103 "Snooker Player"
{
    // version Snooker

    DrillDownPageID = 50106;
    LookupPageID = 50105;

    fields
    {
        field(1;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(2;Name;Text[100])
        {
            CalcFormula = Lookup(Contact.Name WHERE (No.=FIELD(No.)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4;"First Name";Text[30])
        {
            CalcFormula = Lookup(Contact."First Name" WHERE (No.=FIELD(No.)));
            CaptionML = ENU='First Name',
                        NLD='Voornaam';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;"Middle Name";Text[30])
        {
            CalcFormula = Lookup(Contact."Middle Name" WHERE (No.=FIELD(No.)));
            CaptionML = ENU='Middle Name',
                        NLD='Overige namen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;Surname;Text[30])
        {
            CalcFormula = Lookup(Contact."Search Name" WHERE (No.=FIELD(No.)));
            CaptionML = ENU='Surname',
                        NLD='Achternaam';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;Initials;Text[30])
        {
            CalcFormula = Lookup(Contact.Initials WHERE (No.=FIELD(No.)));
            CaptionML = ENU='Initials',
                        NLD='Initialen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Mobile Phone No.";Text[30])
        {
            CalcFormula = Lookup(Contact."Mobile Phone No." WHERE (No.=FIELD(No.)));
            CaptionML = ENU='Mobile Phone No.',
                        NLD='Telefoon (Mobiel)';
            Editable = false;
            ExtendedDatatype = PhoneNo;
            FieldClass = FlowField;
        }
        field(9;"E-Mail";Text[80])
        {
            CalcFormula = Lookup(Contact.E-Mail WHERE (No.=FIELD(No.)));
            CaptionML = ENU='Email',
                        NLD='E-mail';
            Editable = false;
            ExtendedDatatype = EMail;
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
        TextNameTooLong : TextConst ENU='The total length of first name, middle name and surname is %1 character(s)longer than the maximum length allowed for the Name field.',NLD='De totale lengte van voornaam, overige namen en achternaam overschrijdt de maximale lengte van het veld Naam met %1 teken(s).';
        TextInputTooLong : TextConst ENU='The length of %1 is %2 character(s)longer than the maximum length allowed for the %1 field.',NLD='De lengte van %1 overschrijdt de maximaal toegelaten lengte voor het veld %1 met %2 teken(s).';
}

