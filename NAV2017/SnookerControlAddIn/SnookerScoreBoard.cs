using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Dynamics.Framework.UI.Extensibility;

namespace SnookerControlAddIn
{

    /// <summary>
    /// request parameter for function score
    /// </summary>
    /// <param name="playerNo">As name suggested</param>
    /// <param name="score">As name suggested</param>
    /// <param name="isNewBreak">As name suggested</param>
    public delegate void ScoreEventHandler(string playerNo, int score, bool isNewBreak);

    /// <summary>
    /// For checking
    /// Helper:
    /// 1) cmd
    /// 2) "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\Tools\VsDevCmd.bat"
    /// 3) sn -T "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\Add-ins\SnookerControlAddIn.dll"
    /// 4) key: c5539a3df0b8ecd1
    /// 5) AL:-> Dutch page name is Desturingsel.invoegtoep.
    /// SnookerControlAddIn;PublicKeyToken=c5539a3df0b8ecd1
    /// External links
    /// https://docs.microsoft.com/en-us/dynamics-nav/walkthrough--creating-and-using-a-client-control-add-in
    /// https://docs.microsoft.com/en-us/previous-versions/dynamicsnav-2013r2/dn182584(v=nav.71)
    /// </summary>
    [ControlAddInExport(name: "SnookerControlAddIn")]
    public interface ISnookerScoreBoard
    {

        /// <summary>
        /// Call back to NAV Server when the control is ready
        /// </summary>
        [ApplicationVisible]
        event ApplicationEventHandler ControlAddInReady;

        /// <summary>
        /// Client requests server to send update
        /// </summary>
        [ApplicationVisible]
        event ApplicationEventHandler RequestUpdate;

        /// <summary>
        /// Client update score on the service
        /// </summary>
        [ApplicationVisible]
        event ScoreEventHandler Score;

        /// <summary>
        /// NAV server update client client
        /// </summary>
        /// <param name="player1No">As name suggested</param>
        /// <param name="player1FullName">As name suggested</param>
        /// <param name="player1Score">As name suggested</param>
        /// <param name="player2No">As name suggested</param>
        /// <param name="player2FullName">As name suggested</param>
        /// <param name="player2Score">As name suggested</param>
        [ApplicationVisible]
        void UpdateScreen(string player1No, string player1FullName, int player1Score, string player2No, string player2FullName, int player2Score);

        /// <summary>
        /// To verify the internal is loaded correct
        /// </summary>
        [ApplicationVisible]
        void Test1();

    }
}
