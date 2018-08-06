page 50108 "Snooker Frame Score Listpart"
{
    // version Snooker

    PageType = ListPart;
    SourceTable = "Snooker Frame Score";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Snooker Match No.";"Snooker Match No.")
                {
                }
                field("Snooker Frame No.";"Snooker Frame No.")
                {
                }
                field("Snooker Break No.";"Snooker Break No.")
                {
                }
                field("Shot No.";"Shot No.")
                {
                }
                field("Snooker Player No.";"Snooker Player No.")
                {
                }
                field(Score;Score)
                {

                    trigger OnValidate();
                    begin
                        CurrPage.UPDATE();
                    end;
                }
            }
        }
    }

    actions
    {
    }
}

