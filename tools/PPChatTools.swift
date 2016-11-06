//
//  PPChatTools.swift
//  rongChatDemo1
//
//  Created by vd on 2016/10/30.
//  Copyright © 2016年 vd. All rights reserved.
//

import UIKit
typealias success = (_ string:String?)->Void
typealias error = (_ status:RCConnectErrorCode)->Void
typealias tokenIncorrect = (Void) ->Void

class PPChatTools: NSObject,RCIMConnectionStatusDelegate,RCIMReceiveMessageDelegate
{
    private var client:RCIM? = nil;
    

    class var shared: PPChatTools {
        let instance:PPChatTools = Inner.instance;
        instance.client = RCIM.shared();

        instance.client?.receiveMessageDelegate=instance;
        
        return instance;
        
    }
    
    struct Inner {
        static let instance = PPChatTools()
    }
    func onRCIMConnectionStatusChanged(_ status: RCConnectionStatus)
    {
        switch status {
        case RCConnectionStatus.ConnectionStatus_UNKNOWN:
            break;
        case RCConnectionStatus.ConnectionStatus_Connected:
            break;
        case RCConnectionStatus.ConnectionStatus_NETWORK_UNAVAILABLE:
            break;
        case RCConnectionStatus.ConnectionStatus_AIRPLANE_MODE:
            break;
        case RCConnectionStatus.ConnectionStatus_Cellular_2G:
            break;
        case RCConnectionStatus.ConnectionStatus_Cellular_3G_4G:
            break;
        case RCConnectionStatus.ConnectionStatus_WIFI:
            break;
        case RCConnectionStatus.ConnectionStatus_KICKED_OFFLINE_BY_OTHER_CLIENT:
            break;
        case RCConnectionStatus.ConnectionStatus_LOGIN_ON_WEB:
            break;
        case RCConnectionStatus.ConnectionStatus_SERVER_INVALID:
            break;
        case RCConnectionStatus.ConnectionStatus_VALIDATE_INVALID:
            break;
        case RCConnectionStatus.ConnectionStatus_Connecting:
            break;
        case RCConnectionStatus.ConnectionStatus_Unconnected:
            break;
        case RCConnectionStatus.ConnectionStatus_SignUp:
            break;
        case RCConnectionStatus.ConnectionStatus_TOKEN_INCORRECT:
            break;
        case RCConnectionStatus.ConnectionStatus_DISCONN_EXCEPTION:
            break;
        }
    }
    func setAppKey(key:String) -> Void
    {
        self.client?.initWithAppKey(key);
    }
    func setDeviceToken(token:String) -> Void
    {
        
        
    }
    /*
     - (void)connectWithToken:(NSString *)token
     success:(void (^)(NSString *userId))successBlock
     error:(void (^)(RCConnectErrorCode status))errorBlock
     tokenIncorrect:(void (^)())tokenIncorrectBlock;
     */
   public func connectWithToken(token:String,sucessBlock:@escaping success,errorBlock: @escaping error,tokenIncorrectBlock:@escaping tokenIncorrect) -> Void
    {

        self.client?.connect(withToken: token, success:
            sucessBlock, error: errorBlock, tokenIncorrect: tokenIncorrectBlock);
        
    }
    //- (void)disconnect:(BOOL)isReceivePush;
    
    
    func disconnect()->Void
    {
        self.client?.disconnect();
    }
    func disconnectConnection(isReceivePush:Bool) -> Void
    {
        self.client?.disconnect(isReceivePush);
    }
    func logout()->Void
    {
        self.client?.logout();
        
    }
    
    
    /*!
     接收消息的回调方法
     
     @param message     当前接收到的消息
     @param nLeft       还剩余的未接收的消息数，left>=0
     @param object      消息监听设置的key值
     
     @discussion 如果您设置了IMlib消息监听之后，SDK在接收到消息时候会执行此方法。
     其中，left为还剩余的、还未接收的消息数量。比如刚上线一口气收到多条消息时，通过此方法，您可以获取到每条消息，left会依次递减直到0。
     您可以根据left数量来优化您的App体验和性能，比如收到大量消息时等待left为0再刷新UI。
     object为您在设置消息接收监听时的key值。
     */
    //- (void)onRCIMReceiveMessage:(RCMessage *)message
    func onRCIMReceive(_ message: RCMessage!, left: Int32) {
        
        
    }
    func initRCIM() -> Void {
        //#define RONGCLOUD_IM_APPKEY @"n19jmcy59f1q9"
        
        RCIM.shared().initWithAppKey("n19jmcy59f1q9");
        
    }
   

}
