var _player1No='';
var _player2No='';
var _currentPlayerNo='';

var isNewBreak=true;
var isDebug=false;

function score()
{
    var score = $("#SnookerRemoateHead-ScoreColor").text();
    if(isDebug){
        alert('Send to NAV '+_currentPlayerNo+' '+score+' '+isNewBreak);
    }
    
    //NAV: void Score(String playerNo, int score, bool isNewBreak);
    var arguments = [_currentPlayerNo,score,isNewBreak];  
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Score', arguments);  
    isNewBreak=false;
}
function fout()
{
    var score = $("#SnookerRemoateHead-ScoreColor").text();
    score=score*-1;
    if(isDebug){
        alert('Send to NAV '+_currentPlayerNo+' '+score);
    }
    //NAV: void Score(String playerNo, int score, bool isNewBreak);
    var arguments = [_currentPlayerNo,score,isNewBreak];  
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Score', arguments);  
    isNewBreak=false;
}            
function requestUpdate()
{
    if(isDebug){
        alert('Ask NAV to call UpdateScreen');
    }    
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('RequestUpdate', null);  
}
function UpdateScreen(player1No, player1FullName, player1Score,player2No, player2FullName, player2Score)
{
    if(isDebug){
        alert('Called back updateScreen');
    }

    //updateScreen('ct0001', 'Alvin Lau', 10,'ct0002', "ronnie o'sullivan", 147)
    _player1No = player1No;
    _player2No = player2No;
    if (_currentPlayerNo=='')
    {
        _currentPlayerNo=_player1No;
        $("#SnookerRemoateHead-Player1").addClass("ActivePlayer")
        $("#SnookerRemoateHead-Player2").removeClass("ActivePlayer")
    }
    $("#SnookerRemoateHead-Player1").text(player1FullName+' ('+player1Score+')');
    $("#SnookerRemoateHead-Player2").text(player2FullName+' ('+player2Score+')');
}
function nextPlayer()
{
    isNewBreak=true;

}

function initializeSnookerBoard(controlId)
{
    var htmlText =''
    htmlText=htmlText+'<div class="SnookerRemote">';
    htmlText=htmlText+'<div class="SnookerRemoateHead">';
    htmlText=htmlText+'    <div class="RemoteCommand" id="SnookerRemoateHead-Player1">Player1</div>';
    htmlText=htmlText+'    <div class="RemoteCommand" id="SnookerRemoateHead-Player2">Player2</div>';                
    htmlText=htmlText+'    <div class="RemoteCommand" id="SnookerRemoateHead-ScoreColor">-</div>';
    htmlText=htmlText+'    <div class="RemoteCommand" id="SnookerRemoateHead-Score">Score</div>';
    htmlText=htmlText+'    <div class="RemoteCommand" id="SnookerRemoateHead-Fout">Fout</div>';
    htmlText=htmlText+'    <div class="RemoteCommand" id="SnookerRemoateHead-NextPlayer">Next-Player</div>';
    htmlText=htmlText+'</div>';
    htmlText=htmlText+'<div class="SnookerBalls"> ';
    htmlText=htmlText+'    <div class="RedBall SnookerBall" data-score="1" data-color="Red">Red</div>';
    htmlText=htmlText+'    <div class="YellowBall SnookerBall" data-score="2"  data-color="Yellow">Yellow</div>';
    htmlText=htmlText+'    <div class="GreenBall SnookerBall" data-score="3"  data-color="Green">Green</div>';
    htmlText=htmlText+'    <div class="BrownBall SnookerBall" data-score="4" data-color="Brown" >Brown</div>';
    htmlText=htmlText+'    <div class="BlueBall SnookerBall" data-score="5"  data-color="Blue">Blue</div>';
    htmlText=htmlText+'    <div class="PinkBall SnookerBall" data-score="6" data-color="Pink" >Pink</div>';
    htmlText=htmlText+'    <div class="BlackBall SnookerBall" data-score="7"  data-color="Black">Black</div>';
    htmlText=htmlText+'</div>           ';
    htmlText=htmlText+'<div class="SnookerRemoteBottom">';
    htmlText=htmlText+'    <div class="RemoteCommand" id="SnookerRemoateBottom-NextFrame">Next Frame</div>';
    htmlText=htmlText+'    <div class="RemoteCommand" id="SnookerRemoateBottom-ForceNextFrame">Force Next Frame</div>';
    htmlText=htmlText+'    <div class="RemoteCommand" id="SnookerRemoateBottom-CorrectLast">Correct Last</div>';
    htmlText=htmlText+'    <div class="RemoteCommand" id="SnookerRemoateBottom-UpdateScreen">UpdateScreen</div>';
    htmlText=htmlText+'</div>';
    htmlText=htmlText+'</div>';  
    $("#"+controlId).append(htmlText);
}

function initHTMLEventAfterDOMInitialization()
{    

    $(".SnookerBall").each(function(){
                
        var score=$(this).data("score");
        var color=$(this).data("color");
        var divWidth = $(this).width();
        var divHeight = $(this).height();
        //$(this).text(divWidth);
        //$(this).css("background-color", "Light"+Blus);
        $(this).append("<canvas id='SnookerBallCanvas_"+color+"' width='"+divWidth+"' height='300'></canvas>");

        var c = document.getElementById("SnookerBallCanvas_"+color);
        var ctx = c.getContext("2d");
        var grd=ctx.createLinearGradient(0,0,divWidth,0);
        grd.addColorStop(0,color);
        grd.addColorStop(1,"white");
        //ctx.fillStyle = color; //blue
        ctx.fillStyle = grd
        ctx.beginPath();
        ctx.arc(divWidth/2, divHeight/2.2, divHeight/3, 0, 2 * Math.PI);
        //ctx.stroke();
        ctx.fill();

    });

    $(".SnookerBall").click(function(){
        var score=$(this).data("score");
        var color=$(this).data("color");
        $("#SnookerRemoateHead-ScoreColor").text(score);
        $("#SnookerRemoateHead-ScoreColor").css("background-color",color);                            
    });

    $("#SnookerRemoateHead-NextPlayer").click(function(){
        if(_currentPlayerNo==_player1No)
        {
            _currentPlayerNo=_player2No;
            isNewBreak=true;
            $("#SnookerRemoateHead-Player2").addClass("ActivePlayer")
            $("#SnookerRemoateHead-Player1").removeClass("ActivePlayer")
        }else
        {
            _currentPlayerNo=_player1No;
            isNewBreak=true;
            $("#SnookerRemoateHead-Player1").addClass("ActivePlayer")
            $("#SnookerRemoateHead-Player2").removeClass("ActivePlayer")
        }
    });

    $("#SnookerRemoateHead-Score").click(function(){
        score();
    });
    $("#SnookerRemoateHead-Fout").click(function(){
        fout();
    });                
    $("#SnookerRemoateBottom-NextFrame").click(function(){
        alert('todo');
    });                
    $("#SnookerRemoateBottom-ForceNextFrame").click(function(){
        alert('todo');
    });                
    $("#SnookerRemoateBottom-CorrectLast").click(function(){
        alert('todo');
    });                
    $("#SnookerRemoateBottom-UpdateScreen").click(function(){
        requestUpdate();
    });                
};    



