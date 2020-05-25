package top.huic.xiao_mi_push_plugin

import android.content.Context
import com.alibaba.fastjson.JSON
import com.xiaomi.mipush.sdk.MiPushCommandMessage
import com.xiaomi.mipush.sdk.MiPushMessage
import com.xiaomi.mipush.sdk.PushMessageReceiver
import top.huic.xiao_mi_push_plugin.enums.XiaoMiListenerTypeEnum
import top.huic.xiao_mi_push_plugin.util.CommonUtil


/**
 * 小米广播接收器
 */
class XiaoMiMessageReceiver : PushMessageReceiver() {
    override fun onNotificationMessageClicked(context: Context?, message: MiPushMessage?) {
        super.onNotificationMessageClicked(context, message)
        this.invokeListener(XiaoMiListenerTypeEnum.NotificationMessageClicked, message)
    }

    override fun onRequirePermissions(context: Context?, p1: Array<out String>?) {
        super.onRequirePermissions(context, p1)
        this.invokeListener(XiaoMiListenerTypeEnum.RequirePermissions, p1)
    }

    override fun onReceivePassThroughMessage(context: Context?, message: MiPushMessage?) {
        super.onReceivePassThroughMessage(context, message)
        this.invokeListener(XiaoMiListenerTypeEnum.ReceivePassThroughMessage, message)
    }

    override fun onCommandResult(context: Context?, message: MiPushCommandMessage?) {
        super.onCommandResult(context, message)
        this.invokeListener(XiaoMiListenerTypeEnum.CommandResult, message)
    }

    override fun onReceiveRegisterResult(context: Context?, message: MiPushCommandMessage?) {
        super.onReceiveRegisterResult(context, message)
        this.invokeListener(XiaoMiListenerTypeEnum.ReceiveRegisterResult, message)
    }

    override fun onNotificationMessageArrived(context: Context?, message: MiPushMessage?) {
        super.onNotificationMessageArrived(context, message)
        this.invokeListener(XiaoMiListenerTypeEnum.NotificationMessageArrived, message)
    }

    /**
     * 调用监听器
     *
     * @param type   类型
     * @param params 参数
     */
    private fun invokeListener(type: XiaoMiListenerTypeEnum, params: Any?) {
        val p: String = if (params != null) JSON.toJSONString(params) else ""
        CommonUtil.runMainThread {
            XiaoMiPushPlugin.channel.invokeMethod("onListener", mapOf(
                    "type" to type.name,
                    "params" to p
            ))
        }
    }
}