﻿# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

. $PSScriptRoot\..\ExchangeServerInfo\Get-ServerObjects.ps1
Function Get-ArgumentList {
    param(
        [Parameter(Mandatory = $true)][array]$Servers
    )

    #First we need to verify if the local computer is in the list or not. If it isn't we need to pick a master server to store
    #the additional information vs having a small amount of data dumped into the local directory.
    $localServerInList = $false
    $Script:MasterServer = $env:COMPUTERNAME
    foreach ($server in $Servers) {

        if ($server.ToUpper().Contains($env:COMPUTERNAME.ToUpper())) {
            $localServerInList = $true
            break
        }
    }

    if (!$localServerInList) {
        $Script:MasterServer = $Servers[0]
    }

    return [PSCustomObject]@{
        ADDriverLogs                   = $ADDriverLogs
        AnyTransportSwitchesEnabled    = $Script:AnyTransportSwitchesEnabled
        AppSysLogs                     = $AppSysLogs
        AppSysLogsToXml                = $AppSysLogsToXml
        AutoDLogs                      = $AutoDLogs
        CollectAllLogsBasedOnLogAge    = $CollectAllLogsBasedOnLogAge
        DAGInformation                 = $DAGInformation
        DailyPerformanceLogs           = $DailyPerformanceLogs
        DefaultTransportLogging        = $DefaultTransportLogging
        EASLogs                        = $EASLogs
        ECPLogs                        = $ECPLogs
        EWSLogs                        = $EWSLogs
        ExchangeServerInformation      = $ExchangeServerInformation
        Exmon                          = $Exmon
        ExmonLogmanName                = $ExmonLogmanName
        Experfwiz                      = $Experfwiz
        ExperfwizLogmanName            = $ExperfwizLogmanName
        FilePath                       = $FilePath
        FrontEndConnectivityLogs       = $FrontEndConnectivityLogs
        FrontEndProtocolLogs           = $FrontEndProtocolLogs
        GetVdirs                       = $GetVdirs
        HighAvailabilityLogs           = $HighAvailabilityLogs
        HostExeServerName              = $env:COMPUTERNAME
        HubConnectivityLogs            = $HubConnectivityLogs
        HubProtocolLogs                = $HubProtocolLogs
        IISLogs                        = $IISLogs
        ImapLogs                       = $ImapLogs
        TimeSpan                       = $LogAge
        MailboxConnectivityLogs        = $MailboxConnectivityLogs
        MailboxDeliveryThrottlingLogs  = $MailboxDeliveryThrottlingLogs
        MailboxProtocolLogs            = $MailboxProtocolLogs
        ManagedAvailabilityLogs        = $ManagedAvailabilityLogs
        MapiLogs                       = $MapiLogs
        MasterServer                   = $Script:MasterServer
        MessageTrackingLogs            = $MessageTrackingLogs
        MitigationService              = $MitigationService
        OABLogs                        = $OABLogs
        OWALogs                        = $OWALogs
        PopLogs                        = $PopLogs
        PowerShellLogs                 = $PowerShellLogs
        QueueInformation               = $QueueInformation
        RootFilePath                   = $Script:RootFilePath
        RPCLogs                        = $RPCLogs
        SearchLogs                     = $SearchLogs
        SendConnectors                 = $SendConnectors
        ServerInformation              = $ServerInformation
        ServerObjects                  = (Get-ServerObjects -ValidServers $Servers)
        ScriptDebug                    = $ScriptDebug
        StandardFreeSpaceInGBCheckSize = $Script:StandardFreeSpaceInGBCheckSize
        TransportAgentLogs             = $TransportAgentLogs
        TransportConfig                = $TransportConfig
        TransportRoutingTableLogs      = $TransportRoutingTableLogs
        WindowsSecurityLogs            = $WindowsSecurityLogs
    }
}
