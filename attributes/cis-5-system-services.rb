# CIS 5 - System Services

# Level 1 services to disable
default['cb_cis_windows_10']['cis_level_1']['services'] = %w(Browser HomeGroupListener HomeGroupProvider IISADMIN irmon SharedAccess LxssManager FTPSVC RpcLocator RemoteAccess simptcp SSDPSRV upnphost WMSvc WMPNetworkSvc icssvc WinHttpAutoProxySvc W3SVC XboxGipSvc xbgm XblAuthManager XblGameSave XboxNetApiSvc)

# Level 2 services to disable
default['cb_cis_windows_10']['cis_level_2']['services'] = %w(BthHFSrv bthserv MapsBroker lfsvc lltdsvc MSiSCSI PNRPsvc p2psvc p2pimsvc PNRPAutoReg wercplsupport RasAuto SessionEnv TermService UmRdpService RemoteRegistry LanmanServer SNMP WerSvc Wecsvc WpnService WinRM)
