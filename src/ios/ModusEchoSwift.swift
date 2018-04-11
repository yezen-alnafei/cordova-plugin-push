@objc(ModusEchoSwift) class ModusEchoSwift : CDVPlugin {


    func appDelegatePushNotificationToken() -> Data? {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            return delegate.pnToken
        }
        
        return nil
    }


    func echo(command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )

     if let pushToken = appDelegatePushNotificationToken() {
            
             pluginResult = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAsString: pushToken
            )
        } else{

               pluginResult = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAsString: nill
            )
            
        } 

        self.commandDelegate!.sendPluginResult(
            pluginResult, 
            callbackId: command.callbackId
        )
    }
}