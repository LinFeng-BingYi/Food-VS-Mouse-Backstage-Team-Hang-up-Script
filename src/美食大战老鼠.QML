[General]
SyntaxVersion=2
MacroID=cf9e1fd5-2959-419f-8298-19a74a9e5bf0
[Comment]

[Script]
//请在下面写上您的子程序或函数
//写完保存后，在任一命令库上点击右键并选择“刷新”即可
Function 获取360句柄()
    Dim hwnd, hwndex
    hwnd = Plugin.Window.Find("DUIWindow", "美食大战老鼠")
    hwndex = Plugin.Window.FindEx(hwnd, 0, 0, 0)
    hwndex = Plugin.Window.FindEx(hwndex, 0, 0, 0)
    hwndex = Plugin.Window.FindEx(hwndex, 0, 0, 0)
    hwndex = Plugin.Window.FindEx(hwndex, 0, "WrapperNativeWindowClass", 0)
    hwndex = Plugin.Window.FindEx(hwndex, 0, 0, 0)
    TracePrint "360游戏大厅窗口句柄"&hwndex
    'Call Plugin.Bkgnd.LeftClick(hwndex, 367, 512)
    If hwndex = 0 Then 
        MessageBox "360游戏大厅窗口句柄获取失败"
    End If
    获取360句柄 = hwndex
End Function

Function 获取微端句柄()
    Dim hwnd, hwndex
    hwnd = Plugin.Window.Find("ApolloRuntimeContentWindow", 0)
    'TracePrint hwnd
    hwndex = Plugin.Window.FindEx(hwnd, 0, "WebPluginView", 0)
    TracePrint "微端窗口句柄" & hwndex
    If hwndex = 0 Then 
        MessageBox "微端窗口句柄获取失败"
    End If
    获取微端句柄 = hwndex
End Function

Function 获取枫叶内置flash句柄()
    Dim hwnd, hwndex
    hwnd = Plugin.Window.Find("WTWindow", 0)
    'TracePrint hwnd
    hwndex = Plugin.Window.FindEx(hwnd, 0, "CPageControl", 0)
    'TracePrint hwndex
    hwndex = Plugin.Window.FindEx(hwndex, 0, "WTWindow", 0)
    'TracePrint hwndex
    hwndex = Plugin.Window.FindEx(hwndex, 0, 0, 0)
    'TracePrint hwndex
    hwndex = Plugin.Window.FindEx(hwndex, 0, "MacromediaFlashPlayerActiveX", 0)
    TracePrint "枫叶内置flash窗口句柄"&hwndex
    'Call Plugin.Bkgnd.LeftClick(hwndex, 367, 512)
    If hwndex = 0 Then 
        MessageBox "枫叶内置flash窗口句柄获取失败"
    End If
    获取枫叶句柄 = hwndex
End Function

Function 获取枫叶普通模式句柄()
    Dim hwnd, hwndex, hwndex1, hwndex2
    hwnd = Plugin.Window.Find("WTWindow", 0)
    TracePrint hwnd
    hwndex = Plugin.Window.FindEx(hwnd, 0, "CPageControl", 0)
    TracePrint hwndex
    hwndex = Plugin.Window.FindEx(hwndex, 0, "WTWindow", 0)
    TracePrint hwndex
    hwndex = Plugin.Window.FindEx(hwndex, 0, "_EL_DrawPanel", 0)
    TracePrint hwndex
    hwndex = Plugin.Window.FindEx(hwndex, 0, 0, 0)
    TracePrint hwndex
    hwndex = Plugin.Window.FindEx(hwndex, 0, 0, 0)
    TracePrint hwndex
    hwndex = Plugin.Window.FindEx(hwndex, 0, 0, 0)
    TracePrint hwndex
    hwndex = Plugin.Window.FindEx(hwndex, 0, 0, 0)
    TracePrint hwndex
    hwndex1 = Plugin.Window.FindEx(hwndex, 0, "MacromediaFlashPlayerActiveX", 0)
	
    Dim 检测窗口大小, 客户区大小
    客户区大小 = Plugin.Window.GetClientRect(hwndex1)
    TracePrint hwndex1 & "客户区大小为：" & 客户区大小
    检测窗口大小 = Split(客户区大小, "|")
    If (CInt(检测窗口大小(2)) - CInt(检测窗口大小(0))) > 50 Then 
        hwndex2 = Plugin.Window.FindEx(hwndex, hwndex1, "MacromediaFlashPlayerActiveX", 0)
        TracePrint "枫叶普通模式窗口句柄"&hwndex2
        'Call Plugin.Bkgnd.LeftClick(hwndex, 367, 512)
        If hwndex2 = 0 Then 
            MessageBox "枫叶普通模式窗口句柄获取失败"
        End If
        获取枫叶句柄 = hwndex2
    Else 
        TracePrint "枫叶普通模式窗口句柄"&hwndex1
        'Call Plugin.Bkgnd.LeftClick(hwndex, 367, 512)
        If hwndex1 = 0 Then 
            MessageBox "枫叶普通模式窗口句柄获取失败"
        End If
        获取枫叶句柄 = hwndex1
    End If
	
End Function

Function 切换地图(窗口句柄, 地图名称, 缩放倍率)
    Dim 地图x坐标, 地图y坐标, 地图内美味岛x坐标, 地图内美味岛y坐标, 地图内火山岛x坐标, 地图内火山岛y坐标, 地图内浮空岛x坐标, 地图内浮空岛y坐标, 地图内遗迹x坐标, 地图内遗迹y坐标
    地图x坐标 = 860
    地图y坐标 = 50
    地图内美味岛x坐标 = 280
    地图内美味岛y坐标 = 270
    地图内火山岛x坐标 = 680
    地图内火山岛y坐标 = 460
    地图内浮空岛x坐标 = 700
    地图内浮空岛y坐标 = 200
    地图内遗迹x坐标 = 750
    地图内遗迹y坐标 = 460
    地图内海底x坐标 = 700
    地图内海底y坐标 = 270
    地图内魔塔x坐标 = 318
    地图内魔塔y坐标 = 452
	
    Call Plugin.Bkgnd.LeftClick(窗口句柄, 地图x坐标 * 缩放倍率, 地图y坐标 * 缩放倍率)
    Delay 2000
    Select Case 地图名称
    Case "美味岛"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 地图内美味岛x坐标 * 缩放倍率, 地图内美味岛y坐标 * 缩放倍率)
        Delay 2000
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 820 * 缩放倍率, 85 * 缩放倍率)//换线
        Delay 700
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 750 * 缩放倍率, 255 * 缩放倍率)//选择美味八区
    Case "火山岛"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 地图内火山岛x坐标 * 缩放倍率, 地图内火山岛y坐标 * 缩放倍率)
        Delay 2000
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 820 * 缩放倍率, 85 * 缩放倍率)//换线
        Delay 700
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 750 * 缩放倍率, 110 * 缩放倍率)//选择火山二区
    Case "浮空岛"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 地图内浮空岛x坐标 * 缩放倍率, 地图内浮空岛y坐标 * 缩放倍率)
        Delay 2000
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 820 * 缩放倍率, 85 * 缩放倍率)//换线
        Delay 700
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 750 * 缩放倍率, 110 * 缩放倍率)//选择浮空二区
    Case "火山遗迹"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 地图内遗迹x坐标 * 缩放倍率, 地图内遗迹y坐标 * 缩放倍率)
    Case "海底漩涡"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 地图内海底x坐标 * 缩放倍率, 地图内海底y坐标 * 缩放倍率)
        Delay 2000
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 820 * 缩放倍率, 85 * 缩放倍率)//换线
        Delay 700
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 750 * 缩放倍率, 110 * 缩放倍率)//选择海洋二区
    Case "魔塔蛋糕"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 地图内魔塔x坐标 * 缩放倍率, 地图内魔塔y坐标 * 缩放倍率)
        Delay 2000
    End Select
    Delay 2000
	
End Function

Function 美味岛选择关卡(窗口句柄, 关卡名称, 缩放倍率)
    Select Case 关卡名称
    Case "曲奇岛"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 666 * 缩放倍率, 166 * 缩放倍率)
    Case "色拉岛陆"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 706 * 缩放倍率, 263 * 缩放倍率)
    Case "色拉岛水"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 720 * 缩放倍率, 350 * 缩放倍率)
    Case "慕斯岛"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 669 * 缩放倍率, 410 * 缩放倍率)
    Case "香槟岛陆"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 538 * 缩放倍率, 470 * 缩放倍率)
    Case "香槟岛水"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 433 * 缩放倍率, 432 * 缩放倍率)
    Case "神殿"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 295 * 缩放倍率, 406 * 缩放倍率)
    Case "布丁岛日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 164 * 缩放倍率, 406 * 缩放倍率)
    Case "布丁岛夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 97 * 缩放倍率, 330 * 缩放倍率)
    Case "可可岛日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 129 * 缩放倍率, 277 * 缩放倍率)
    Case "可可岛夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 154 * 缩放倍率, 209 * 缩放倍率)
    Case "咖喱岛日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 194 * 缩放倍率, 142 * 缩放倍率)
    Case "咖喱岛夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 261 * 缩放倍率, 125 * 缩放倍率)
    Case "深渊岛"
        XY = Plugin.Bkgnd.FindColorEx(窗口句柄, 254, 56, 778, 105, "B827FF", 0, 0.9)
        If Split(XY, "|")(0) > 0 Then 
            Call Plugin.Bkgnd.LeftClick(窗口句柄, 790 * 缩放倍率, 27 * 缩放倍率)
            Delay 500
        End If
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 356 * 缩放倍率, 76 * 缩放倍率)
    Case Else
        MessageBox "无法识别的关卡名！请严格填写地图上的关卡名称，同时去掉括号。皇冠关卡名称不含日夜"
    End Select
    Delay 1000
End Function

Function 火山岛选择关卡(窗口句柄, 关卡名称, 缩放倍率)
    Select Case 关卡名称
    Case "芥末小屋日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 730 * 缩放倍率, 257 * 缩放倍率)
    Case "芥末小屋夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 652 * 缩放倍率, 302 * 缩放倍率)
    Case "薄荷海滩日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 713 * 缩放倍率, 368 * 缩放倍率)
    Case "薄荷海滩夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 647 * 缩放倍率, 413 * 缩放倍率)
    Case "芝士城堡"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 539 * 缩放倍率, 419 * 缩放倍率)
    Case "炭烧雨林日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 368 * 缩放倍率, 408 * 缩放倍率)
    Case "炭烧雨林夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 292 * 缩放倍率, 380 * 缩放倍率)
    Case "抹茶庄园日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 231 * 缩放倍率, 267 * 缩放倍率)
    Case "抹茶庄园夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 299 * 缩放倍率, 244 * 缩放倍率)
    Case "玛奇朵港"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 473 * 缩放倍率, 181 * 缩放倍率)
    Case "棉花糖天空日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 383 * 缩放倍率, 162 * 缩放倍率)
    Case "棉花糖天空夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 305 * 缩放倍率, 156 * 缩放倍率)
    Case "果酱部落日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 220 * 缩放倍率, 137 * 缩放倍率)
    Case "果酱部落夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 266 * 缩放倍率, 118 * 缩放倍率)
    Case "雪顶火山"
        XY = Plugin.Bkgnd.FindColorEx(窗口句柄, 254, 56, 778, 105, "B827FF", 0, 0.9)
        If Split(XY, "|")(0) > 0 Then 
            Call Plugin.Bkgnd.LeftClick(窗口句柄, 790 * 缩放倍率, 27 * 缩放倍率)
            Delay 500
        End If
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 350 * 缩放倍率, 72 * 缩放倍率)
    Case Else
        MessageBox "无法识别的关卡名！请严格填写地图上的关卡名称，同时去掉括号。皇冠关卡名称不含日夜"
    End Select
    Delay 1000
End Function

Function 浮空岛选择关卡(窗口句柄, 关卡名称, 缩放倍率)
    Select Case 关卡名称
    Case "茴香竹筏日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 446 * 缩放倍率, 430 * 缩放倍率)
    Case "茴香竹筏夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 565 * 缩放倍率, 424 * 缩放倍率)
    Case "孜然断桥日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 737 * 缩放倍率, 337 * 缩放倍率)
    Case "孜然断桥夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 644 * 缩放倍率, 334 * 缩放倍率)
    Case "卤料花园"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 511 * 缩放倍率, 295 * 缩放倍率)
    Case "月桂天空日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 410 * 缩放倍率, 293 * 缩放倍率)
    Case "月桂天空夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 332 * 缩放倍率, 280 * 缩放倍率)
    Case "香叶空港日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 262 * 缩放倍率, 257 * 缩放倍率)
    Case "香叶空港夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 171 * 缩放倍率, 223 * 缩放倍率)
    Case "香料飞船"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 97 * 缩放倍率, 168 * 缩放倍率)
    Case "花椒浮岛日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 213 * 缩放倍率, 138 * 缩放倍率)
    Case "花椒浮岛夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 309 * 缩放倍率, 177 * 缩放倍率)
    Case "丁香彩虹日"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 539 * 缩放倍率, 164 * 缩放倍率)
    Case "丁香彩虹夜"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 458 * 缩放倍率, 203 * 缩放倍率)
    Case "十三香中心岛"
        XY = Plugin.Bkgnd.FindColorEx(窗口句柄, 254, 56, 778, 105, "B827FF", 0, 0.9)
        If Split(XY, "|")(0) > 0 Then 
            Call Plugin.Bkgnd.LeftClick(窗口句柄, 790 * 缩放倍率, 27 * 缩放倍率)
            Delay 500
        End If
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 477 * 缩放倍率, 97 * 缩放倍率)
    Case Else
        MessageBox "无法识别的关卡名！请严格填写地图上的关卡名称，同时去掉括号。皇冠关卡名称不含日夜"
    End Select
    Delay 1000
End Function

Function 火山遗迹选择关卡(窗口句柄, 关卡名称, 缩放倍率)
    Select Case 关卡名称
    Case "果仁瀑布"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 657 * 缩放倍率, 355 * 缩放倍率)
    Case "榛子瀑布"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 569 * 缩放倍率, 385 * 缩放倍率)
    Case "黑提丛林"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 314 * 缩放倍率, 376 * 缩放倍率)
    Case "蓝莓丛林"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 241 * 缩放倍率, 371 * 缩放倍率)
    Case "奶昔基地"
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 347 * 缩放倍率, 128 * 缩放倍率)
    Case "圣代基地"
        XY = Plugin.Bkgnd.FindColorEx(窗口句柄, 254, 56, 778, 105, "B827FF", 0, 0.9)
        If Split(XY, "|")(0) > 0 Then 
            Call Plugin.Bkgnd.LeftClick(窗口句柄, 790 * 缩放倍率, 27 * 缩放倍率)
            Delay 500
        End If
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 444 * 缩放倍率, 91 * 缩放倍率)
    Case Else
        MessageBox "无法识别的关卡名！请严格填写地图上的关卡名称，同时去掉括号。重名关卡加上日/夜"
    End Select
    Delay 1000
End Function

Function 进入跨服(窗口句柄, 跨服远征图标路径, 缩放倍率)
    activity_icon = Plugin.Bkgnd.FindPic(窗口句柄, 255, 4, 780, 110, 跨服远征图标路径, 0, 0.9)
    activity_icon_X = CLng(Split(activity_icon, "|")(0))
    activity_icon_Y = CLng(Split(activity_icon, "|")(1))
    TracePrint activity_icon_X & ", " & activity_icon_Y

    If activity_icon_X < 0 And activity_icon_Y < 0 Then 
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 790 * 缩放倍率, 27 * 缩放倍率)//若图标被隐藏，则先显示出来
        Delay 500
        activity_icon = Plugin.Bkgnd.FindPic(窗口句柄, 255, 4, 780, 110, 跨服远征图标路径, 0, 0.9)
        activity_icon_X = CLng(Split(activity_icon, "|")(0))
        activity_icon_Y = CLng(Split(activity_icon, "|")(1))
        TracePrint activity_icon_X & ", " & activity_icon_Y
    End If
    
    Call Plugin.Bkgnd.LeftClick(窗口句柄, (activity_icon_X + 13) * 缩放倍率, activity_icon_Y * 缩放倍率)//打开跨服
    Delay 1000
End Function

Function 创建密码房(窗口句柄, 默认密码, 缩放倍率)
    Call Plugin.Bkgnd.LeftClick(窗口句柄, 490 * 缩放倍率, 450 * 缩放倍率)//选择使用密码
    Delay 500
    Call Plugin.Bkgnd.LeftClick(窗口句柄, 620 * 缩放倍率, 450 * 缩放倍率)
    Delay 500
    Call Plugin.Bkgnd.LeftClick(窗口句柄, 620 * 缩放倍率, 450 * 缩放倍率)
    Delay 500
    Call Plugin.Bkgnd.KeyPress(窗口句柄, 46)
    Delay 800
    Call Plugin.Bkgnd.SendString(窗口句柄, 默认密码)
    Delay 800
    Call Plugin.Bkgnd.LeftClick(窗口句柄, 580 * 缩放倍率, 500 * 缩放倍率)//点击创建房间
    Delay 2000
End Function

Function 组队好友邀请(房主窗口句柄, 房客窗口句柄, 房客昵称截图路径, 缩放倍率)
    Call Plugin.Bkgnd.LeftClick(房主窗口句柄, 410 * 缩放倍率, 550 * 缩放倍率)//点击邀请
    Delay 300
    Call Plugin.Bkgnd.LeftClick(房主窗口句柄, 530 * 缩放倍率, 130 * 缩放倍率)//选择好友
    Delay 1000
	
    XY = Plugin.Bkgnd.FindPic(房主窗口句柄, 450, 140, 557, 446, 房客昵称截图路径, 0, 0.9)
    X = CLng(Split(XY, "|")(0))
    Y = CLng(Split(XY, "|")(1))
    TracePrint X & ", " & Y
    If X > 0 And Y > 0 Then 
        Call Plugin.Bkgnd.LeftClick(房客窗口句柄, 610 * 缩放倍率, 400 * 缩放倍率)
        Delay 50
        Call Plugin.Bkgnd.LeftClick(房主窗口句柄, 600 * 缩放倍率, (Y + 14) * 缩放倍率)
        Delay 1000
        Call Plugin.Bkgnd.LeftClick(房客窗口句柄, 450 * 缩放倍率, 400 * 缩放倍率)
        Delay 100
        Call Plugin.Bkgnd.LeftClick(房主窗口句柄, 590 * 缩放倍率, 490 * 缩放倍率)
        Delay 1000
        组队好友邀请 = 1
    Else 
        MessageBox "未能找到2P"
        组队好友邀请 = 0
    End If
	
End Function

Function 房间内选择卡片组(窗口句柄, 卡片组编号, 缩放倍率)
    Dim 卡片组x坐标, 卡片组y坐标
    卡片组x坐标 = Array(420, 500, 580, 660, 740, 820)
    卡片组y坐标 = 120
	
    Call Plugin.Bkgnd.LeftClick(窗口句柄, 卡片组x坐标(卡片组编号 - 1) * 缩放倍率, 卡片组y坐标 * 缩放倍率)//选择卡片组
    Delay 1000
End Function

Function 循环检测进入关卡(房主窗口句柄, 房客窗口句柄, 缩放倍率)
    flage_start_game = True
    time_sum = 0
    While flage_start_game
        Delay 50
        XY = Plugin.BkgndColor.FindColorEx(房主窗口句柄, 15, 10, 64, 45, "CAF3FC", 0, 0.85)
        Dim XY_array_start
        XY_array_start = Split(XY, "|")
        If CInt(XY_array_start(0)) > 0 And CInt(XY_array_start(1)) > 0 Then 
            flage_start_game = False
            TracePrint CInt(XY_array_start(0)) & ", " & CInt(XY_array_start(1))
        End If
        If (time_sum Mod 1500) = 0 Then 
            Call Plugin.Bkgnd.LeftClick(房主窗口句柄, 872 * 缩放倍率, 480 * 缩放倍率)
        ElseIf (time_sum Mod 1500) = 750 Then
            Call Plugin.Bkgnd.LeftClick(房客窗口句柄, 872 * 缩放倍率, 480 * 缩放倍率)
        End If
        time_sum = time_sum + 50
        If time_sum = 120000 Then 
            MessageBox "已超过两分钟仍未检测到进入游戏"
        End If
    Wend
    TracePrint "检测到进入游戏"
End Function

Function 循环检测继续挑战(窗口句柄, 提醒延时)
    flage_continue_game = True
    time_sum = 0
    While flage_continue_game
        Delay 2500
        XY = Plugin.BkgndColor.FindColorEx(窗口句柄, 187, 236, 210, 317, "DEBC7D", 0, 1)
        Dim XY_array_continue1
        XY_array_continue1 = Split(XY, "|")
        If CInt(XY_array_continue1(0)) > 0 And CInt(XY_array_continue1(1)) > 0 Then 
            TracePrint "继续要素1:" & CInt(XY_array_continue1(0)) & ", " & CInt(XY_array_continue1(1))
			
            XY = Plugin.BkgndColor.FindColorEx(窗口句柄, 205, 229, 302, 293, "0000A5", 0, 0.9)
            'TracePrint XY
            Dim XY_array_continue2
            XY_array_continue2 = Split(XY, "|")
            If Clng(XY_array_continue2(0)) > 0 And Clng(XY_array_continue2(1)) > 0 Then
                TracePrint "继续要素2:" & Clng(XY_array_continue2(0)) & ", " & Clng(XY_array_continue2(1))
                flage_continue_game = False
            End If
        End If
        time_sum = time_sum + 2500
        If time_sum >= 提醒延时 And time_sum < 提醒延时 + 2500 Then 
            MessageBox "已超过" & CLng(提醒延时/60000) & "分钟仍未检测到继续挑战"
        End If
    Wend
    TracePrint "检测到打完先锋鼠"
End Function

Function 循环检测结算翻牌(窗口句柄, 提醒延时)
    flage_end_game = True
    time_sum = 0
    While flage_end_game
        Delay 2000
        XY = Plugin.BkgndColor.FindColorEx(窗口句柄, 100, 415, 129, 493, "A8B83B", 0, 1)
        Dim XY_array_end
        XY_array_end = Split(XY, "|")
        If CInt(XY_array_end(0)) > 0 And CInt(XY_array_end(1)) > 0 Then 
            TracePrint "结算要素1:"&CInt(XY_array_end(0))&", "&CInt(XY_array_end(1))
            XY = Plugin.BkgndColor.FindColorEx(窗口句柄, 118, 255, 146, 346, "5081EE", 0, 1)
            If CInt(Split(XY, "|")(0)) > 0 And CInt(Split(XY, "|")(1)) > 0 Then
                flage_end_game = False
                TracePrint "结算要素2:"&CInt(Split(XY, "|")(0))&", "&CInt(Split(XY, "|")(1))
            End If
        End If
        time_sum = time_sum + 2000
        /*If time_sum = 600000 Then 
            MessageBox "已超过十分钟仍未检测到结算翻牌"
        End If*/
        If time_sum >= 提醒延时 And time_sum < 提醒延时 + 2000 Then 
            MessageBox "已超过" & CLng(提醒延时/60000) & "分钟仍未检测到结算翻牌"
        End If
    Wend
    TracePrint "检测到结算完成"
End Function

Function 结算翻牌(窗口句柄, 牌位置编号, 缩放倍率)
    Dim 翻牌x坐标, 翻牌y坐标							//结算翻牌坐标
    翻牌x坐标 = Array(550, 707, 856, 550, 707, 856)
    翻牌y坐标 = Array(267, 267, 267, 469, 469, 469)
	
    TracePrint "翻牌编号：" & 牌位置编号
	
    Dim card_position
    card_position = Split(牌位置编号, ";")
    Dim 当前循环次数
    当前循环次数 = 0
    While 当前循环次数 <= UBound(card_position)
        current_card = card_position(当前循环次数)
        Call Plugin.Bkgnd.LeftClick(窗口句柄, 翻牌x坐标(current_card - 1) * 缩放倍率, 翻牌y坐标(current_card - 1) * 缩放倍率)
        Delay 50
        当前循环次数 = 当前循环次数 + 1
    Wend
    '返回房间
    Delay 200
    Call Plugin.Bkgnd.LeftClick(窗口句柄, 708 * 缩放倍率, 505 * 缩放倍率)
    Delay 200
    Call Plugin.Bkgnd.LeftClick(窗口句柄, 708 * 缩放倍率, 505 * 缩放倍率)
    Delay 200
End Function

Function 关卡内放置(窗口句柄, 格子坐标, 缩放倍率)
    Dim 初始x坐标, 初始y坐标, 格子长度, 格子高度		//关卡内卡片放置位置坐标
    初始x坐标 = 332
    初始y坐标 = 144
    格子长度 = 60
    格子高度 = 64
	
    Dim card_pos
    card_pos = Split(格子坐标, ",")
    'TracePrint "放置坐标:"&初始x坐标 + (CInt(player1_pos(1)) - 1) * 格子长度&", "&初始y坐标 + (CInt(player1_pos(0)) - 1) * 格子高度
    Call Plugin.Bkgnd.LeftClick(窗口句柄, (初始x坐标 + (CInt(card_pos(1)) - 1) * 格子长度) * 缩放倍率, (初始y坐标 + (CInt(card_pos(0)) - 1) * 格子高度) * 缩放倍率)
    Delay 100
    Call Plugin.Bkgnd.LeftClick(窗口句柄, (初始x坐标 + (CInt(card_pos(1)) - 1) * 格子长度) * 缩放倍率, (初始y坐标 + (CInt(card_pos(0)) - 1) * 格子高度) * 缩放倍率)
End Function

Function 关卡内循环放卡(窗口句柄, 卡槽位置, 卡片放置序列, 卡片CD, 缩放倍率)
    //卡槽位置整数型
    //卡片放置序列字符串型，格式为：各位置用英文分号分隔，每个位置的x坐标和y坐标用英文逗号分隔
    //卡片CD编号为整数型
    Dim 卡槽x坐标, 卡槽y坐标
    卡槽x坐标 = Array(193, 245, 298, 351, 405, 458, 510, 563, 617, 670, 722, 775, 829, 882, 882, 882, 882, 882, 882, 882, 882)
    卡槽y坐标 = Array(11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 79, 147, 215, 283, 351, 419, 487)
	
    Dim 初始x坐标, 初始y坐标, 格子长度, 格子高度		//关卡内卡片放置位置坐标
    初始x坐标 = 332
    初始y坐标 = 144
    格子长度 = 60
    格子高度 = 64
	
    'Dim 卡片CD数组
    '卡片CD数组 = Array(7050, 3050, 4050, 9050, 15050, 25050, 30050, 40050, 50050)
	/*
	7s(普通卡:海星等;上取整有技能木盘子等)
	3s(7技能棉花糖;8技能木盘子)
	4s(7技能木盘子)
	15s(7技能瓜皮)
	25s(扑克牌罩等)
	30s(0技能瓜皮,6技能章鱼烧;上取整扑克牌罩等)
	40s(狮子座等)
	50s(0技能章鱼烧)
	*/
	
    Dim card_slot, card_position, card_cd
    card_slot = 卡槽位置-1
    card_position = Split(卡片放置序列, ";")
    'card_cd = 卡片CD数组(卡片CD编号)
    card_cd = 卡片CD
    TracePrint "卡片信息: 卡槽位置:" & 卡槽位置 & "  循环次数: " & UBound(card_position) + 1 & "最后一次坐标: " & card_position(UBound(card_position))
	
    'ReDim card_pos_original_color(0)//卡片放置位置格子的初始颜色
	
    For 当前循环次数 = 0 To UBound(card_position)
        XY = card_position(当前循环次数)

        If XY = "-" Then 
            Delay card_cd
        ElseIf XY = "1" Then 
            Delay 1000
        ElseIf XY = "10" Then 
            Delay 10000
        Else 
        
            If UBound(Split(XY, ",")) = 2 Then
                Delay Split(XY, ",")(2)
            Else
                Delay card_cd
            End If
            
            'ReDim Preserve card_pos_original_color(当前循环次数)
            'card_pos_original_color(当前循环次数) = Plugin.Bkgnd.GetPixelColor(窗口句柄, 初始x坐标 + (Split(XY, ",")(1) - 1) * 格子长度, 初始y坐标 + 6 + (Split(XY, ",")(0) - 1) * 格子高度)
			
            TracePrint "卡槽" & 卡槽位置 & "第" & 当前循环次数 + 1 & "次放置坐标:"&Split(XY, ",")(0)&", "&Split(XY, ",")(1)
            Call Plugin.Bkgnd.LeftClick(窗口句柄, (卡槽x坐标(card_slot) + 32) * 缩放倍率, (卡槽y坐标(card_slot) + 34) * 缩放倍率)
            Delay 1
            Call Plugin.Bkgnd.LeftClick(窗口句柄, (初始x坐标 + (Split(XY, ",")(1) - 1) * 格子长度) * 缩放倍率, (初始y坐标 + (Split(XY, ",")(0) - 1) * 格子高度) * 缩放倍率)
            Delay 1
            Call Plugin.Bkgnd.LeftClick(窗口句柄, 80 * 缩放倍率, 130 * 缩放倍率)
			
            'Else 
            '	ReDim Preserve card_pos_original_color(当前循环次数)
            '	card_pos_original_color(当前循环次数) = "-"
        End If
    Next
        /*
        Dim 当前检测位置编号
        当前检测位置编号 = 0
        While 当前检测位置编号 <= UBound(card_position)
		
            If card_pos_original_color(当前检测位置编号) <> "-" Then 
                XY2 = card_position(当前检测位置编号)
			
                If Plugin.Bkgnd.GetPixelColor(窗口句柄, 初始x坐标 + (Split(XY2, ",")(1) - 1) * 格子长度, 初始y坐标 + 6 + (Split(XY2, ",")(0) - 1) * 格子高度) = card_pos_original_color(当前检测位置编号) Then
			
                    TracePrint "卡槽" & 卡槽位置 & "补充阵容放置坐标:" & Split(XY2, ",")(0) & ", " & Split(XY2, ",")(1)
				
                    Call Plugin.Bkgnd.LeftClick(窗口句柄, (卡槽x坐标(card_slot) + 32) * 缩放倍率, (卡槽y坐标(card_slot) + 34) * 缩放倍率)
                    Delay 5
                    Call Plugin.Bkgnd.LeftClick(窗口句柄, (初始x坐标 + (Split(XY2, ",")(1) - 1) * 格子长度) * 缩放倍率, (初始y坐标 + (Split(XY2, ",")(0) - 1) * 格子高度) * 缩放倍率)
                    Delay 5
                    Call Plugin.Bkgnd.LeftClick(窗口句柄, 80 * 缩放倍率, 130 * 缩放倍率)
                    Delay card_cd
                Else 
                    Delay 200
                End If
            Else 
                Delay 200
            End If
		
            If 当前检测位置编号 = UBound(card_position) Then 
                当前检测位置编号 = 0
            Else 
                当前检测位置编号 = 当前检测位置编号 + 1
            End If
		
        Wend
        */

End Function
