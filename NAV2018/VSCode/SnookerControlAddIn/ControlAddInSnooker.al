/**
see https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-control-addin-object
see https://community.dynamics.com/nav/b/dynamicsnavcloudfronts/archive/2018/02/09/creating-a-control-add-in-using-javascript-and-calling-it-in-al
**/
controladdin SnookerControlAddIn
{
    RequestedHeight = 500;
    MinimumHeight = 500;
    MaximumHeight = 500;
    RequestedWidth = 800;
    MinimumWidth = 800;
    MaximumWidth = 800;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 
        'SnookerControlAddIn/Script/jquery.min.js',
        'SnookerControlAddIn/Script/Snooker.js';
    StyleSheets=
        'SnookerControlAddIn/StyleSheet/Snooker.css';
    StartupScript = 'SnookerControlAddIn/Script/Startup.js';
    RecreateScript = 'SnookerControlAddIn/Script/Startup.js';
    RefreshScript = 'SnookerControlAddIn/Script/Startup.js';
    
    ///
    ///Call back to NAV Server when the control is ready
    ///    
    event ControlAddInReady()
    
    ///
    ///Client requests server to send update
    ////
    event  RequestUpdate()

    ///Client update score on the service    
    event Score(playerNo:Text; score:Integer; isNewBreak:Boolean);


    /// <summary>
    /// NAV server update client client
    /// </summary>
    /// <param name="player1No">As name suggested</param>
    /// <param name="player1FullName">As name suggested</param>
    /// <param name="player1Score">As name suggested</param>
    /// <param name="player2No">As name suggested</param>
    /// <param name="player2FullName">As name suggested</param>
    /// <param name="player2Score">As name suggested</param>
    procedure UpdateScreen(player1No:Text; player1FullName:Text; player1Score:integer;
                        player2No:Text; player2FullName:Text; player2Score:integer);


    /// <summary>
    /// To verify the internal is loaded correct
    /// </summary>
    procedure Test1()

}

