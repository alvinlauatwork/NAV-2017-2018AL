$(document).ready(function() 
{ 
    initializeSnookerBoard('controlAddIn');
    initHTMLEventAfterDOMInitialization();
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('RequestUpdate', null);
});